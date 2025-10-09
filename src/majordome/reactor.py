# -*- coding: utf-8 -*-
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Callable
from numpy.typing import NDArray
from tabulate import tabulate
import cantera as ct
import numpy as np
import pandas as pd
import warnings

from .common import T_NORMAL, P_NORMAL
from .common import CompositionType, SolutionLikeType
from .common import safe_remove, standard_plot


WARN_CANTERA_NON_KEY_VALUE = True
""" If true, warns about compostion not compliant with Cantera format. """

WARN_MISSING_SPECIES_NAME = True
""" If true, warns about missing species name found in composition. """

WARN_UNKNOWN_SPECIES = True
""" If true, warns about unknown species found in composition. """


def toggle_reactor_warnings(*,
        toggle_non_key_value: bool = True,
        toggle_missing_species_name: bool = True,
        toggle_unknown_species: bool = True,
        **kwargs
    ) -> None:
    """ Reverse truth value of warning flags. """
    if toggle_non_key_value:
        global WARN_CANTERA_NON_KEY_VALUE 
        WARN_CANTERA_NON_KEY_VALUE = not WARN_CANTERA_NON_KEY_VALUE

    if toggle_missing_species_name:
        global WARN_MISSING_SPECIES_NAME
        WARN_MISSING_SPECIES_NAME = not WARN_MISSING_SPECIES_NAME

    if toggle_unknown_species:
        global WARN_UNKNOWN_SPECIES
        WARN_UNKNOWN_SPECIES = not WARN_UNKNOWN_SPECIES


def _split_composition(species):
    """ Helper to split name of species. """
    species = species.strip()

    if not species:
        if WARN_MISSING_SPECIES_NAME:
            warnings.warn("Missing species name, returning `None`!")
        return None, 0

    if ":" not in species:
        if WARN_CANTERA_NON_KEY_VALUE:
            warnings.warn(f"Possibly malformed species '{species}', "
                          f"setting composition to unit '{species}:1'")
        return species, 1.0

    # TODO also support things as "2 * species" ?

    name, value = species.split(":")
    return name.strip(), float(value.strip())


def composition_to_dict(Y: str, species_names: list[str] = []
                        ) -> dict[str, float]:
    """ Convert a Cantera composition string to dictionary. """
    Y_dict = dict()

    for species in Y.split(","):
        name, value = _split_composition(species)

        if not name:
            continue

        if species_names:
            if name in species_names:
                Y_dict[name] = value
            elif WARN_UNKNOWN_SPECIES:
                warnings.warn(f"Unknown species '{name}', skipping...")
        else:
            Y_dict[name] = value

    return Y_dict


def composition_to_array(Y: str, species_names: list[str]
                         ) -> NDArray[np.float64]:
    """ Convert a Cantera composition string to array. """
    data = Y.split(",")
    Y_new = np.zeros(len(species_names), dtype=np.float64)

    for species in data:
        name, value = _split_composition(species)

        if not name:
            continue

        if name in species_names:
            Y_new[species_names.index(name)] = value
        elif WARN_UNKNOWN_SPECIES:
            warnings.warn(f"Unknown species {name}, skipping...")

    return Y_new


def solution_report(sol: ct.composite.Solution | ct.Quantity,
                    specific_props: bool = True,
                    composition_spec: str = "mass",
                    selected_species: list[str] = [],
                    **kwargs,
                    ) -> list[tuple[str, str, Any]]:
    """ Generate a solution report for tabulation.

    Parameters
    ----------
    sol: ct.Solution
        Cantera solution object for report generation.
    specific_props: bool = True
        If true, add specific heat capacity and enthalpy.
    composition_spec: str = "mass"
        Composition units specification, `mass` or `mole`.
    selected_species: list[str] = []
        Selected species to display; return all if a composition
        specification was provided.

    Raises
    ------
    ValueError
        If in invalid composition specification is provided.
        If species filtering lead to an empty set of compositions.

    Returns
    -------
    list[tuple[str, str, Any]]
        A list of data entries intended to be displayed externally,
        *e.g.* with `tabulate.tabulate` or appended.
    """
    report = [("Temperature", "K", sol.T), ("Pressure", "Pa",sol.P),
              ("Density", "kg/m³", sol.density_mass)]

    if specific_props:
        report.extend([
            ("Specific enthalpy", "J/(kg.K)", sol.enthalpy_mass),
            ("Specific heat capacity", "J/(kg.K)", sol.cp_mass),
        ])

    if composition_spec is not None:
        if composition_spec not in ["mass", "mole"]:
            raise ValueError(f"Unknown composition type {composition_spec}")

        comp = getattr(sol, f"{composition_spec}_fraction_dict")()

        if selected_species:
            comp = {s: v for s, v in comp.items() if s in selected_species}

        if not comp:
            raise ValueError("No species left in mixture for display!")

        for species, X in comp.items():
            report.append((f"{composition_spec}: {species}", "-", X))

    if isinstance(sol, ct.Quantity) and kwargs.get("show_mass", False):
        report.append(("Mass", "kg", sol.mass))

    return report


def copy_solution(sol: ct.composite.Solution) -> ct.composite.Solution:
    """ Makes a hard copy of a ct.Solution object. """
    new_sol = ct.composite.Solution(sol.source, sol.name)
    new_sol.TPY = sol.TPY
    return new_sol


def copy_quantity(qty: ct.composite.Quantity) -> ct.composite.Quantity:
    """ Makes a hard copy of a ct.Quantity object. """
    sol = copy_solution(qty.phase)
    return ct.Quantity(sol, mass=qty.mass, constant=qty.constant)


class NormalFlowRate:
    """ Compute normal flow rate for a given composition.

    This class makes use of the user defined state to create a function
    object that converts industrial scale flow rates in normal cubic
    meters per hour to kilograms per second. Nothing more, nothing less,
    it aims at helping the process engineer in daily life for this quite
    repetitive need when performing mass balances.

    Parameters
    ----------
    mech: str | Path
        Path to Cantera mechanism used to compute mixture properties.
    X: CompositionType = None
        Composition specification in mole fractions. Notice that both
        `X` and `Y` are mutally exclusive keyword arguments.
    Y: CompositionType = None
        Composition specification in mass fractions. Notice that both
        `X` and `Y` are mutally exclusive keyword arguments.
    T_ref: float = T_NORMAL
        Reference temperature of the system. If your industry does not
        use the same standard as the default values, and only in that
        case, please consider updating this keyword.
    P_ref: float = P_NORMAL
        Reference pressure of the system. If your industry does not
        use the same standard as the default values, and only in that
        case, please consider updating this keyword.
    name: str = None
        Name of phase in mechanism, if more than one are specified
        within the same Cantera YAML database file.
    """
    def __init__(self, mech: str | Path, *, X: CompositionType = None,
                 Y: CompositionType = None, T_ref: float = T_NORMAL,
                 P_ref: float = P_NORMAL, name: str = None) -> None:
        if X is not None and Y is not None:
            raise ValueError("You can provide either X or Y, not both!")

        self._sol = ct.Solution(mech, name)
        self._sol.TP = T_ref, P_ref

        if X is not None:
            self._sol.TPX = None, None, X

        if Y is not None:
            self._sol.TPY = None, None, Y

        self._rho = self._sol.density_mass

    def __call__(self, qdot: float) -> float:
        """ Convert flow rate [Nm³/h] to mass units [kg/s]. """
        return self._rho * qdot / 3600

    @property
    def density(self) -> float:
        """ Provides access to the density of internal solution [kg/m³]. """
        return self._rho

    @property
    def TPX(self) -> tuple[float, float, dict[str, float]]:
        """ Provides access to the state of internal solution. """
        return (*self._sol.TP, self._sol.mole_fraction_dict())

    def report(self, **kwargs) -> str:
        """ Provides a report of the mixture state. """
        data = solution_report(self._sol, **kwargs)

        if (qdot := kwargs.get("qdot", None)):
            data.extend([
                ("Volume flow rate", "Nm³/h", qdot),
                ("Mass flow rate", "kg/s", self(qdot))
            ])
 
        return tabulate(data, tablefmt="github")

    @classmethod
    def new_from_solution(cls, sol: SolutionLikeType, **kwargs
                          ) -> "NormalFlowRate":
        """ Creates a new NormalFlowRate from a Cantera solution. """
        if isinstance(sol, ct.Quantity):
            source = sol.phase.source
            name = sol.phase.name
            X = sol.phase.mole_fraction_dict()
        else:
            source = sol.source
            name = sol.name
            X = sol.mole_fraction_dict()

        return cls(source, X=X, name=name, **kwargs)


@dataclass
class PlugFlowAxialSources:
    """ Provides a data structure for use with `PlugFlowChainCantera`.

    Helper data class for use with the solution method `loop` of the
    plug-flow reactor implementation. It provides the required memory
    for storage of source terms distributed along the reactor.

    Parameters
    ----------
    n_reactors: int
        Number of reactors in chain.
    n_species: int
        Number of species in mechanism.

    Attributes
    ----------
    Q: NDArray[np.float64]
        Array of external heat source [W].
    m: NDArray[np.float64]
        Array of axial mass source terms [kg/s].
    h: NDArray[np.float64]
        Array of enthalpy of axial mass source terms [J/kg].
    Y: NDArray[np.float64, np.float64]
        Array of mass fractions of axial mass source terms [-].
    """
    Q: NDArray[np.float64]
    m: NDArray[np.float64]
    h: NDArray[np.float64]
    Y: NDArray[np.float64]

    def __init__(self, n_reactors: int, n_species: int) -> None:
        self.Q = np.zeros(n_reactors, np.float64)
        self.m = np.zeros(n_reactors, np.float64)
        self.h = np.zeros(n_reactors, np.float64)
        self.Y = np.zeros((n_reactors, n_species), np.float64)

    def reset(self) -> None:
        """ Reset values of all arrays to zero. """
        self.Q[:] = 0.0
        self.m[:] = 0.0
        self.h[:] = 0.0
        self.Y[:] = 0.0


class PlugFlowChainCantera:
    """ Plug-flow reactor as a chain of 0-D reactors with Cantera.

    Parameters
    ----------
    mechanism: str
        Name or path to Cantera mechanism to be used.
    phase: str
        Name of phase to simulate (not inferred, even if a single is present!).
    z: NDArray[np.float64]
        Spatial coordinates of reactor cells [m].
    V: NDArray[np.float64]
        Volumes of reactor cells [m³].
    P: float = ct.one_atm
        Reactor operating pressure [Pa].
    K: float = 1.0
        Valve response constant (do not use unless simulation fails).
    smoot_flux: bool = False
        Apply a smoot transition function when internal stepping is performed;
        this is intended to avoid unphysical steady state approximations.
    cantera_steady: bool = True
        If true, use Cantera' s `advance_to_steady_state` to solve problem;
        otherwise advance over meaninful time-scale of the problem.
    """
    def __init__(self, mechanism: str, phase: str, z: NDArray[np.float64],
                 V: NDArray[np.float64], P: float = ct.one_atm, K: float = 1.0,
                 smoot_flux: bool = False, cantera_steady: bool = True) -> None:
        # Store coordinates and volume of slices:
        self._z = z
        self._V = V
        self._P = P
        self._Q = np.zeros_like(self._z)
        self._smoot_flux = smoot_flux
        self._advance_steady_cantera = cantera_steady

        # Create solutions from compatible mechanism:
        self._f_sources = ct.Solution(mechanism, phase, basis="mass")
        self._f_content = ct.Solution(mechanism, phase, basis="mass")
        self._f_outflow = ct.Solution(mechanism, phase, basis="mass")

        # Enforce operating pressure:
        self._f_sources.TP = None, self._P
        self._f_content.TP = None, self._P
        self._f_outflow.TP = None, self._P

        # Create reactors and reservoirs for system:
        self._r_sources = ct.Reservoir(self._f_sources)
        self._r_content = ct.IdealGasReactor(self._f_content)
        self._r_outflow = ct.Reservoir(self._f_outflow)

        # Connect the reactor to the *world* (unit area wall). Notice
        # that imposing `A=1.0` means that when setting up the heat flux
        # that value is identical to the absolute integral exchange. The
        # contents of the system are set as the right reactor so that a
        # positive flux means energy being supplied to the system.
        conf = dict(A=1.0, K=0.0, U=0.0, Q=0.0, velocity=0.0)
        self._w_world = ct.Wall(self._r_outflow, self._r_content, **conf)
        self._w_world.emissivity = 0.0

        # Connect chain of reactors:
        self._mfc = ct.MassFlowController(self._r_sources, self._r_content)
        self._vlv = ct.Valve(self._r_content, self._r_outflow, K=K)

        # Setup reactor network:
        self._net = ct.ReactorNet([self._r_content])
        self._net.max_time_step = 0.1
        self._net.initialize()

        # Create array of states for results:
        extra = {"z_cell": z, "V_cell": V, "Q_cell": self._Q,
                 "m_cell": 0.0, "mdot_cell": 0.0}
        self._states = ct.SolutionArray(self._r_content.thermo,
                                        shape = (z.shape[0],),
                                        extra = extra)

        # TODO allocate own external sources object to be able to
        # eliminate `loop`, changing the API to update with the
        # built-in sources object!

        # Flag if (previous) solution is available:
        self._has_solution = False

        # Store failures encountered during last `loop`:
        self._failures = []

        # Characteristic time of reactor:
        self._tau = None

        # Registered heat flow:
        self._ext_index = None
        self._ext_flow = None

    def _source(self, m, h, Y) -> ct.Quantity | None:
        """ Update source if any flow is available. """
        if m <= 0.0:
            return None

        self._f_sources.HPY = h, self._P, Y
        self._r_sources.syncState()
        return ct.Quantity(self._f_sources, mass=m)

    def _inflow(self, m, h, Y, qty_prev) -> ct.Quantity:
        """ Select next quantity ensuring at least one is specified. """
        qty_srcs = self._source(m, h, Y)

        if qty_prev is None and qty_srcs is None:
            raise RuntimeError("Impossible situation, cannot solve!")

        if qty_prev is not None and qty_srcs is not None:
            return qty_prev + qty_srcs

        if qty_prev is not None:
            return qty_prev

        return qty_srcs

    def _store(self, n_slice) -> None:
        """ Store current state of tracked reactor. """
        self._states[n_slice].HPY = self._r_content.thermo.HPY
        self._states[n_slice].Q_cell = self._Q[n_slice]
        self._states[n_slice].m_cell = self._r_content.mass
        self._states[n_slice].mdot_cell = self._vlv.mass_flow_rate

    def _guess(self, n_slice, qty_next) -> ct.Quantity:
        """ Guess next state based on previous one. """
        if self._has_solution:
            return self._states[n_slice].HPY
        return qty_next.HPY

    def _heat_flow_func(self) -> ct.Func1:
        """ Generate heat flow function for external coupling. """
        def heat_flow(_t):
            idx = self._ext_index
            self._Q[idx] = self._ext_flow(idx, self._r_content.thermo.T)
            return self._Q[idx]

        if not self._smoot_flux:
            return ct.Func1(heat_flow)

        def smoothed_flow(t):
            return heat_flow(t) * (1.0 - np.exp(-t / self._tau))

        return ct.Func1(smoothed_flow)

    def _heat_flux(self, Q) -> ct.Func1 | float:
        """ Create smoothed heat flux as function of time. """
        if self._ext_flow is not None:
            return self._heat_flow_func()

        if not self._smoot_flux:
            return Q

        return ct.Func1(lambda t: Q * (1.0 - np.exp(-t / self._tau)))

    def _prepare(self, hpy_reac, qty_next, V, Q, **opts) -> None:
        """ Prepare reactor for next iteration. """
        # Get time scale for approaching steady-state:
        self._tau = self._r_content.mass / qty_next.mass
        self._tau *= opts.get("t_mult", 10)

        # Modify volume of reactor:
        self._r_content.volume = V

        # Prepare source for next injection:
        self._f_sources.HPY = qty_next.HPY
        self._r_sources.syncState()

        # Apply total external external exchanges:
        self._w_world.heat_flux = self._heat_flux(Q)

        # State current reactor close to inlet or previous state:
        self._f_content.HPY = hpy_reac
        self._r_content.syncState()

        # Update injection mass flow:
        self._mfc.mass_flow_rate = qty_next.mass

    def _fallback(self, hpy_reac, qty_next, V, Q, **opts):
        """ Alternative approach to advance reactor to steady state. """
        self._prepare(hpy_reac, qty_next, V, Q, **opts)
        self._failures.append(f"Fall-back solution with tau={self._tau:.2f} s")

        try:
            self._net.reinitialize()

            # TODO maybe consider this stepping instead?
            # t_now = 0
            # t_end = self._net.time + self._tau
            #
            # while t_now < t_end:
            #     t_now = self._net.step()

            self._net.advance(self._net.time + self._tau)
        except Exception as err:
            # TODO: if fail, force equilibrium? Find another fallback!
            self._failures.append(f"Fall-back also failed:\n{err}")

    def _step(self, hpy_reac, qty_next, V, Q, **opts):
        """ Advance reactor to steady state with given inflow. """
        self._prepare(hpy_reac, qty_next, V, Q, **opts)

        # Reinitialize reactor network and advance to steady state:
        self._net.reinitialize()
        self._net.advance_to_steady_state(
            max_steps          = opts.get("max_step", 10000),
            residual_threshold = opts.get("residual_threshold", 0),
            atol               = opts.get("atol", 0.0),
            return_residuals   = False
        )

    def _next_quantity(self, mass) -> ct.Quantity:
        """ Compute quantity to be used as source in next step. """
        return ct.Quantity(self._r_content.thermo, mass=mass)

    def _ensure_solution(self):
        """ Ensure that a solution is available. """
        if not self._has_solution:
            raise RuntimeError("No solution available, run `loop` first!")

    # -----------------------------------------------------------------
    # API (methods)
    # -----------------------------------------------------------------

    def use_smooth_flux(self, state: bool) -> None:
        """ Select if smoothed heat flux is to be used. """
        self._smoot_flux = state

    def use_cantera_steady_solver(self, state: bool) -> None:
        """ Select method to approach steady-state solution. """
        self._advance_steady_cantera = state

    def register_heat_flow(self, func: Callable[[int, float], float]) -> None:
        """ Provides registration of heat flux function. """
        self._ext_flow = func

    def loop(self, m_source: np.ndarray, h_source: np.ndarray,
             Y_source: np.ndarray, Q: np.ndarray = None,
             save_history: bool = False, **opts) -> pd.DataFrame | None:
        """ Loop over the slices of the plug-flow reactor.

        In case of solver failure, one might try the following configurations;
        it is recommended to start by reducing `max_time_step` before tweaking
        other parameters.

        ```python
        pfc.network.atol = 1.0e-12
        pfc.network.rtol = 1.0e-06
        pfc.network.max_time_step = 0.1
        pfc.network.linear_solver_type = "GMRES"
        pfc.network.max_err_test_fails = 10
        pfc.network.max_order = 5
        pfc.network.max_steps = 2000
        ```
        """
        stats = []
        qty_prev = None

        self._Q[:] = 0 if Q is None else Q

        self._failures = []

        for n_slice in range(self._z.shape[0]):
            # Track the current slice for external communication with
            # registered heat flow function, if any.
            self._ext_index = n_slice

            V = self._V[n_slice]
            q = self._Q[n_slice]

            m = m_source[n_slice]
            h = h_source[n_slice]
            Y = Y_source[n_slice]

            qty_next = self._inflow(m, h, Y, qty_prev)
            hpy_reac = self._guess(n_slice, qty_next)

            try:
                if self._advance_steady_cantera:
                    self._step(hpy_reac, qty_next, V, q, **opts)
                else:
                    self._fallback(hpy_reac, qty_next, V, q, **opts)
            except Exception as err:
                self._failures.append(f"While in slice {n_slice}:\n{err}")
                self._fallback(hpy_reac, qty_next, V, q, **opts)

            qty_prev = self._next_quantity(qty_next.mass)
            self._store(n_slice)

            if save_history:
                stats.append(self._net.solver_stats)

        if self._failures:
            warnings.warn("Some failures were encountered during the loop! "
                          "Check `failures` property for details.")

        self._has_solution = True
        return None if not save_history else pd.DataFrame(stats)

    def update(self, source: PlugFlowAxialSources, **kwargs
               ) -> pd.DataFrame | None:
        """ Wraps call to `loop` when using a data structure. """
        return self.loop(source.m, source.h, source.Y, Q=source.Q, **kwargs)

    # -----------------------------------------------------------------
    # API (properties)
    # -----------------------------------------------------------------

    @property
    def failures(self) -> list[str]:
        """ List of failures encountered during last `loop`. """
        return self._failures

    @property
    def n_reactors(self) -> int:
        """ Number of reactors in mechanism. """
        return self._z.shape[0]

    @property
    def n_species(self) -> int:
        """ Number of species in mechanism. """
        return self._f_content.n_species

    @property
    def contents(self) -> ct.composite.Solution:
        """ Provides direct access to reactor contents. """
        return self._f_content

    @property
    def states(self) -> ct.SolutionArray:
        """ Provides access to the states of the reactor. """
        self._ensure_solution()
        return self._states

    @property
    def network(self) -> ct.ReactorNet:
        """ Provides access to the reactor network. """
        return self._net

    # -----------------------------------------------------------------
    # API (other)
    # -----------------------------------------------------------------

    @standard_plot(shape=(2, 1), sharex=True, grid=True, resized=(8, 8))
    def quick_plot(self, fig, ax, selected=None, but=None, **kwargs):
        if selected and but:
            but = []
            warnings.warn(("Keywords `selected` and `but` are mutually "
                           "exclusive, ignoring `but`..."))

        if not selected:
            selected = self._states.species_names

        z = self._states.z_cell
        T = self._states.T
        Y = getattr(self._states, kwargs.get("composition_variable", "Y"))

        for label in safe_remove(selected, but):
            Yk = Y[:, self._states.species_index(label)]
            ax[0].plot(z, Yk, label=label)

        ax[0].set_xlabel("Coordinate [m]")
        ax[0].set_ylabel(kwargs.get("y_label", "Mass fraction"))
        ax[0].set_xlim(kwargs.get("xlim", None))
        ax[0].set_ylim(kwargs.get("ylim_Y", None))
        ax[0].legend(loc=kwargs.get("loc_Y", 1))

        ax[1].plot(z, T, label="T")
        ax[1].set_xlabel("Coordinate [m]")
        ax[1].set_ylabel("Temperature [K]")
        ax[1].set_xlim(kwargs.get("xlim", None))
        ax[1].set_ylim(kwargs.get("ylim_T", None))
        ax[1].legend(loc=kwargs.get("loc_T", 1))


def get_reactor_data(pfr: PlugFlowChainCantera) -> PlugFlowAxialSources:
    """ Wrapper to allocate properly dimensioned solver data. """
    return PlugFlowAxialSources(pfr.n_reactors, pfr.n_species)
