# -*- coding: utf-8 -*-
import cantera as ct
import exifread
import logging
import numpy as np
import pandas as pd
import warnings
import yaml

from abc import ABC, abstractmethod
from cantera.composite import Solution
from casadi import Function, SX
from casadi import heaviside, log as ln
from dataclasses import dataclass
from enum import Enum, StrEnum, auto
from functools import wraps, update_wrapper
from matplotlib.figure import Figure
from matplotlib import pyplot as plt
from numbers import Number
from numpy.polynomial import Polynomial
from numpy.typing import NDArray
from pathlib import Path
from PIL import Image, ImageDraw, ExifTags
from skimage import (
    io as skio,
    util as skutil,
    color,
    exposure,
    filters,
    measure,
    morphology,
    segmentation,
)
from scipy.integrate import simpson, cumulative_simpson
from scipy.optimize import curve_fit
from typing import Any, Callable, NamedTuple, Self
from tabulate import tabulate
from textwrap import dedent

with warnings.catch_warnings():
    warnings.simplefilter("ignore")
    from hyperspy.api import load as hs_load
    from hyperspy.signals import Signal2D

from ._majordome import constants
from .data import DATA
from .utilities import (
    MajordomePlot,
    PowerFormatter,
    bounds,
    safe_remove,
    AbstractReportable,
    FuncArguments,
)

__all__ = [
    "DATA",

    # numerical:
    "ComposedStabilizedConvergence",
    "StabilizeNvarsConvergenceCheck",
    "RelaxUpdate",

    # reactor:
    "StateType",
    "toggle_reactor_warnings",
    "composition_to_dict",
    "composition_to_array",
    "solution_report",
    "copy_solution",
    "copy_quantity",
    "NormalFlowRate",
    "PlugFlowAxialSources",
    "PlugFlowChainCantera",
    "get_reactor_data",

    # energy:
    "CombustionPowerOp",
    "CombustionFlowOp",
    "CombustionAtmosphereCHON",
    "CombustionPowerSupply",
    "HeatedGasEnergySource",
    "CombustionEnergySource",

    # numerical:
    "RelaxUpdate",
    "StabilizeNvarsConvergenceCheck",
    "ComposedStabilizedConvergence",

    # symbolic:
    "PiecewiseSymbolicFunction",
    "Nasa7Thermo",
    "symbolic_thermo_factory",
    "symbolic_transport_factory",

    # transport:
    "EffectiveThermalConductivity",
    "SolutionDimless",
    "SkinFrictionFactor",
    "WallGradingCalculator",
    "SutherlandFitting",
    "WSGGRadlibBordbar2020",
]

ct.add_directory(DATA / "thermo")

#region: reactor
WARN_CANTERA_NON_KEY_VALUE = True
""" If true, warns about compostion not compliant with Cantera format. """

WARN_MISSING_SPECIES_NAME = True
""" If true, warns about missing species name found in composition. """

WARN_UNKNOWN_SPECIES = True
""" If true, warns about unknown species found in composition. """


CompositionType = str | dict[str, float]
""" Input type for Cantera composition dictionaries. """

SolutionLikeType = ct.composite.Solution | ct.composite.Quantity
""" Input type for Cantera solution objects. """


class StateType(NamedTuple):
    """ Input type for Cantera TPX state dictionaries. """
    X: CompositionType
    T: int | float | Number = constants.T_NORMAL
    P: int | float | Number = constants.P_NORMAL


def toggle_reactor_warnings(**kwargs) -> None:
    """ Reverse truth value of warning flags.

    Parameters
    ----------
    toggle_non_key_value: bool | None
        If true, reverse truth value of warning about non key-value composition.
    toggle_missing_species_name: bool | None
        If true, reverse truth value of warning about missing species name.
    toggle_unknown_species: bool | None
        If true, reverse truth value of warning about unknown species.
    """
    if kwargs.get("toggle_non_key_value", None) is not None:
        global WARN_CANTERA_NON_KEY_VALUE
        WARN_CANTERA_NON_KEY_VALUE = not WARN_CANTERA_NON_KEY_VALUE

    if kwargs.get("toggle_missing_species_name", None) is not None:
        global WARN_MISSING_SPECIES_NAME
        WARN_MISSING_SPECIES_NAME = not WARN_MISSING_SPECIES_NAME

    if kwargs.get("toggle_unknown_species", None) is not None:
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
    """ Convert a Cantera composition string to dictionary.

    Parameters
    ----------
    Y: str
        Composition specification string, *e.g.* "O2: 1, N2: 3".
    species_names: list[str], optional
        List of valid species names for validation. If provided, only
        species in this list will be included in the output dictionary.
        If not provided, all species will be included.
    """
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


def _solution_report(sol: ct.composite.Solution,
                     qty: ct.composite.Quantity | None = None,
                     specific_props: bool = True,
                     composition_spec: str = "mass",
                     selected_species: list[str] = [],
                     **kwargs,
                     ) -> list[tuple[str, str, Any]]:
    """ Generate a solution report for tabulation, see `solution_report`. """
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

    if qty is not None and kwargs.get("show_mass", False):
        report.append(("Mass", "kg", qty.mass))

    return report


def solution_report(sol: SolutionLikeType,
                    specific_props: bool = True,
                    composition_spec: str = "mass",
                    selected_species: list[str] = [],
                    **kwargs,
                    ) -> list[tuple[str, str, Any]]:
    """ Generate a solution report for tabulation.

    Parameters
    ----------
    sol: SolutionLikeType
        Cantera solution object for report generation.
    specific_props: bool = True
        If true, add specific heat capacity and enthalpy.
    composition_spec: str = "mass"
        Composition units specification, `mass` or `mole`.
    selected_species: list[str] = []
        Selected species to display; return all if a composition
        specification was provided.
    show_mass: bool = False
        If true, add mass of quantity to report if `sol` is a
        `ct.composite.Quantity`.

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
    if isinstance(sol, ct.composite.Quantity):
        qty = sol
        sol = qty.phase
    else:
        qty = sol

    return _solution_report(sol, qty, specific_props, composition_spec,
                            selected_species, **kwargs)


def copy_solution(sol: ct.composite.Solution) -> ct.composite.Solution:
    """ Makes a hard copy of a Solution object.

    Parameters
    ----------
    sol: ct.composite.Solution
        Solution to be copied.
    """
    new_sol = ct.composite.Solution(sol.source, sol.name)
    new_sol.TPY = sol.TPY
    return new_sol


def copy_quantity(qty: ct.composite.Quantity) -> ct.composite.Quantity:
    """ Makes a hard copy of a ct.composite.Quantity object.

    Parameters
    ----------
    qty: ct.composite.Quantity
        Quantity to be copied.
    """
    sol = copy_solution(qty.phase)
    return ct.composite.Quantity(sol, mass=qty.mass, constant=qty.constant)


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
    X: CompositionType | None = None
        Composition specification in mole fractions. Notice that both
        `X` and `Y` are mutally exclusive keyword arguments.
    Y: CompositionType | None = None
        Composition specification in mass fractions. Notice that both
        `X` and `Y` are mutally exclusive keyword arguments.
    T_ref: float = constants.T_NORMAL
        Reference temperature of the system. If your industry does not
        use the same standard as the default values, and only in that
        case, please consider updating this keyword.
    P_ref: float = constants.P_NORMAL
        Reference pressure of the system. If your industry does not
        use the same standard as the default values, and only in that
        case, please consider updating this keyword.
    name: str | None = None
        Name of phase in mechanism, if more than one are specified
        within the same Cantera YAML database file.
    """
    def __init__(self, mech: str | Path, *,
            X: CompositionType | None = None,
            Y: CompositionType | None = None,
            T_ref: float = constants.T_NORMAL,
            P_ref: float = constants.P_NORMAL,
            name: str | None = None
        ) -> None:
        if X is not None and Y is not None:
            raise ValueError("You can provide either X or Y, not both!")

        self._sol = ct.composite.Solution(mech, name)
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
        if isinstance(sol, ct.composite.Quantity):
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
        self._f_sources = ct.composite.Solution(mechanism, phase, basis="mass")
        self._f_content = ct.composite.Solution(mechanism, phase, basis="mass")
        self._f_outflow = ct.composite.Solution(mechanism, phase, basis="mass")

        # Enforce operating pressure:
        self._f_sources.TP = None, self._P
        self._f_content.TP = None, self._P
        self._f_outflow.TP = None, self._P

        # Create reactors and reservoirs for system:
        self._r_sources = ct.Reservoir(self._f_sources,       clone=False)
        self._r_content = ct.IdealGasReactor(self._f_content, clone=False)
        self._r_outflow = ct.Reservoir(self._f_outflow,       clone=False)

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
        self._states = ct.SolutionArray(self._r_content.phase,
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

    def _source(self, m, h, Y) -> ct.composite.Quantity | None:
        """ Update source if any flow is available. """
        if m <= 0.0:
            return None

        self._f_sources.HPY = h, self._P, Y
        self._r_sources.syncState()
        return ct.composite.Quantity(self._f_sources, mass=m)

    def _inflow(self, m, h, Y, qty_prev) -> ct.composite.Quantity | None:
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

    def _guess(self, n_slice, qty_next) -> ct.composite.Quantity:
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
            self._net.initial_time = 0.0

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
        self._net.initial_time = 0.0
        self._net.advance_to_steady_state(
            max_steps          = opts.get("max_step", 10000),
            residual_threshold = opts.get("residual_threshold", 0),
            atol               = opts.get("atol", 0.0),
            return_residuals   = False
        )

    def _next_quantity(self, mass) -> ct.composite.Quantity:
        """ Compute quantity to be used as source in next step. """
        return ct.composite.Quantity(self._r_content.thermo, mass=mass)

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

    def loop(self,
             m_source: NDArray[np.float64],
             h_source: NDArray[np.float64],
             Y_source: NDArray[np.float64],
             Q: NDArray[np.float64] | None = None,
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

    def get_reactor_data(self) -> PlugFlowAxialSources:
        """ Provides properly dimensioned data structure for sources. """
        return get_reactor_data(self)

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

    @MajordomePlot.new(shape=(2, 1), sharex=True, grid=True, size=(8, 8))
    def quick_plot(self, *, plot: MajordomePlot, selected=None,
                   but=None, **kwargs):
        fig, ax = plot.subplots()

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
    """ Wrapper to allocate properly dimensioned solver data.

    Parameters
    ----------
    pfr: PlugFlowChainCantera
        Reactor for which data is to be allocated.
    """
    return PlugFlowAxialSources(pfr.n_reactors, pfr.n_species)
#endregion: reactor

#region: energy
class CombustionPowerOp(NamedTuple):
    """ Combustion power operation parameters. """
    power: float
    equivalence: float
    fuel_state: StateType
    oxid_state: StateType


class CombustionFlowOp(NamedTuple):
    """ Combustion flow operation parameters. """
    mode: str
    fuel_xdot: float
    oxid_xdot: float
    fuel_state: StateType
    oxid_state: StateType


class CombustionAtmosphereCHON:
    """ Combustion atmosphere calculations for CHON system.

    Parameters
    ----------
    mechanism: str
        Kinetics mechanism/database to use in computations.
    basis: str = "mass"
        Basis on which to compute equivalence ratio.
    """
    def __init__(self, mechanism: str, basis: str = "mass") -> None:
        self._solution = Solution(mechanism)
        self._basis = basis

    def _state_standard(self, X):
        """ Set internal solution to standard state / composition. """
        self._solution.TPX = 273.15, constants.P_NORMAL, X

    def _state_premix(self, phi, Y_c, Y_o, basis):
        """ Set internal solution to combustion premix composition. """
        self._solution.set_equivalence_ratio(phi, Y_c, Y_o, basis=basis)

    def _state_initial(self, species, oxidizer):
        """ Before combustion: reference state, stoichiometric. """
        self._solution.TP = 298.15, constants.P_NORMAL
        self._solution.set_equivalence_ratio(1.0, species, oxidizer)
        return self._solution.enthalpy_mass, self._solution[species].Y[0]

    def _state_final(self):
        """ After combustion: complete combustion products. """
        self._solution.TPX = None, None, {
            "CO2": 1.0 * self._solution.elemental_mole_fraction("C"),
            "H2O": 0.5 * self._solution.elemental_mole_fraction("H"),
            "N2":  0.5 * self._solution.elemental_mole_fraction("N")
        }
        return self._solution.enthalpy_mass

    def _species_heating_value(self, species, oxidizer):
        """ Lower heating value of a single species [MJ/kg]. """
        h1, Y_fuel = self._state_initial(species, oxidizer)
        return (self._state_final() - h1) / Y_fuel

    def solution_heating_value(self,
            fuel: CompositionType,
            oxidizer: CompositionType
        ) -> float:
        """ Evaluate lower heating value of mixture.

        Parameters
        ----------
        fuel: CompositionType
            Composition of fuel in species mole fractions.
        oxidizer: CompositionType
            Composition of oxidizer in species mole fractions.

        Returns
        -------
        float
            Lower heating value of provided mixture [MJ/kg].
        """
        self._solution.TPX = None, None, fuel
        Y_fuel = self._solution.mass_fraction_dict()

        hv = sum(Y * self._species_heating_value(species, oxidizer)
                 for species, Y in Y_fuel.items())

        return -1.0e-06 * float(hv)

    def combustion_setup(self,
            power: float,
            phi: float,
            fuel: CompositionType,
            oxidizer: CompositionType,
            species: str = "O2"
        ) -> tuple[float, float, float]:
        """ Evaluates combustion setup for given quantities.

        Parameters
        ----------
        power: float
            Total supplied power [kW]
        phi: float
            Oxidizer-fuel equivalence ratio.
        fuel: CompositionType
            Composition of fuel in species mole fractions.
        oxidizer: CompositionType
            Composition of oxidizer in species mole fractions.
        species: str = "O2"
            Reference species for oxidizer mass balance.
        """
        lhv = self.solution_heating_value(fuel, oxidizer)
        mdot_c = 0.001 * power / lhv

        self._state_standard(fuel)
        Y_c = self._solution.mass_fraction_dict()
        X_c = self._solution.mole_fraction_dict()

        self._state_standard(oxidizer)
        Y_o = self._solution.mass_fraction_dict()
        X_o = self._solution.mole_fraction_dict()

        if self._basis == "mole":
            self._state_premix(phi, X_c, X_o, self._basis)
        else:
            self._state_premix(phi, Y_c, Y_o, self._basis)

        Y_m = self._solution.mass_fraction_dict()

        y_c = Y_c.get(species, 0.0)
        y_o = Y_o.get(species, 0.0)
        y_m = Y_m.get(species, 0.0)

        mdot_t = mdot_c * (y_c - y_o) / (y_m - y_o)
        mdot_o = mdot_t - mdot_c

        return (lhv, mdot_c, mdot_o)

    def normal_density(self, X: CompositionType) -> float:
        """ Compute solution normal density.

        Parameters
        ----------
        X: CompositionType
            Composition of solution in species mole fractions.

        Returns
        -------
        float
            Solution density under standard state [kg/Nm³].
        """
        self._state_standard(X)
        return self._solution.density_mass

    def normal_flow(self, mdot: float, X: CompositionType) -> float:
        """ Computes volume flow rate from mass flow and composition.

        Parameters
        ----------
        mdot: float
            Solution mass flow rate [kg/s].
        X: CompositionType
            Composition of solution in species mole fractions.

        Returns
        -------
        float
            Volume flow rate under standard state [Nm³/h].
        """
        return 3600 * mdot / self.normal_density(X)


def _init_combustion_power_supply(cls):
    """ Decorator to enhance CombustionPowerSupply with argument parsing. """
    orig_init = cls.__init__

    parser = FuncArguments(greedy_args=False, pop_kw=True)
    parser.add("power", 0)
    parser.add("equivalence", 1)
    parser.add("fuel", 2)
    parser.add("oxidizer", 3)
    parser.add("mechanism", 4)
    parser.add("species", default="O2")
    parser.add("emissions", default=True)
    parser.add("basis", default="mass")
    # TODO support phase name

    @wraps(orig_init)
    def new_init(self, *args, **kwargs):
        parser.update(*args, **kwargs)
        power       = parser.get("power")
        equivalence = parser.get("equivalence")
        fuel        = parser.get("fuel")
        oxidizer    = parser.get("oxidizer")
        mechanism   = parser.get("mechanism")
        species     = parser.get("species")
        emissions   = parser.get("emissions")
        basis       = parser.get("basis")

        orig_init(self, *parser.args, **parser.kwargs)
        parser.close()

        self._ca = CombustionAtmosphereCHON(mechanism, basis=basis)
        self._lhv, self._mdot_c, self._mdot_o = self._ca.combustion_setup(
            power, equivalence, fuel, oxidizer, species=species)

        self._power = power
        self._Xc    = fuel
        self._Xo    = oxidizer

        if emissions:
            self._m_h2o, self._m_co2 = self._emissions(mechanism)

        return None

    cls.__init__ = update_wrapper(new_init, orig_init)
    return cls


@_init_combustion_power_supply
class CombustionPowerSupply(AbstractReportable):
    """ Provides combustion calculations for given power supply.

    Parameters
    ----------
    power: float
        Total supplied power [kW]
    equivalence: float
        Oxidizer-fuel equivalence ratio.
    fuel: CompositionType
        Composition of fuel in species mole fractions.
    oxidizer: CompositionType
        Composition of oxidizer in species mole fractions.
    mechanism: str
        Kinetics mechanism/database to use in computations.
    species: str = "O2"
        Reference species for oxidizer mass balance.
    emissions: bool = True
        If true, compute emissions of water and carbon dioxide.
    basis: str = "mass"
        Basis on which to compute equivalence ratio.
    """
    __slots__ = ("_mechanism", "_power", "_lhv", "_mdot_c", "_mdot_o",
                 "_Xc", "_Xo", "_ca", "_m_h2o", "_m_co2",
                 "_rho_c", "_rho_o", "_qdot_c", "_qdot_o")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

    def _emissions(self, mechanism, h2o="H2O", co2="CO2"):
        """ Evaluate complete combustion products for a gas. """
        mixer = CombustionAtmosphereMixer(mechanism)

        if self._mdot_o > 0.0:
            mixer.add_quantity(self._mdot_o, self._Xo)

        if self._mdot_c > 0.0:
            mixer.add_quantity(self._mdot_c, self._Xc)

        qty = mixer.solution
        qty.phase.TP = 298.15, constants.P_NORMAL
        qty.equilibrate("TP")

        Y = qty.phase.mass_fraction_dict()
        m_1 = qty.mass * Y.get(h2o, 0.0)
        m_2 = qty.mass * Y.get(co2, 0.0)

        return m_1, m_2

    @property
    def power(self) -> float:
        """ Access to combustion power [kW]. """
        return self._power

    @property
    def fuel_mass(self) -> float:
        """ Access to fuel mass flow rate. """
        return self._mdot_c

    @property
    def oxidizer_mass(self) -> float:
        """ Access to oxidizer mass flow rate. """
        return self._mdot_o

    @property
    def fuel_volume(self) -> float:
        """ Access to fuel volume flow rate. """
        if not hasattr(self, "_qdot_c"):
            self._qdot_c = self._ca.normal_flow(self._mdot_c, self._Xc)
        return self._qdot_c

    @property
    def oxidizer_volume(self) -> float:
        """ Access to oxidizer volume flow rate. """
        if not hasattr(self, "_qdot_o"):
            self._qdot_o = self._ca.normal_flow(self._mdot_o, self._Xo)
        return self._qdot_o

    @property
    def fuel(self) -> CompositionType:
        """ Access to fuel mole fractions. """
        return self._Xc

    @property
    def oxidizer(self) -> CompositionType:
        """ Access to oxidizer mole fractions. """
        return self._Xo

    @property
    def fuel_normal_density(self) -> float:
        """ Fuel normal density. """
        if not hasattr(self, "_rho_c"):
            self._rho_c = self._ca.normal_density(self._Xc)
        return self._rho_c

    @property
    def oxidizer_normal_density(self) -> float:
        """ Oxidizer normal density. """
        if not hasattr(self, "_rho_o"):
            self._rho_o = self._ca.normal_density(self._Xo)
        return self._rho_o

    @property
    def production_water(self) -> float:
        """ Access to complete combustion H2O mass flow rate. """
        if not hasattr(self, "_m_h2o"):
            raise RuntimeError("Emissions not computed")
        return self._m_h2o

    @property
    def production_carbon_dioxide(self) -> float:
        """ Access to complete combustion CO2 mass flow rate. """
        if not hasattr(self, "_m_co2"):
            raise RuntimeError("Emissions not computed")
        return self._m_co2

    def __repr__(self) -> str:
        """ Standard representation of class instance. """
        args = f"P={self._power:.4e} kW LHV={self._lhv:.4e} MJ/kg"
        return f"<CombustionPowerSupply {args} />"

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        """ Provides data for assemblying the object report. """
        mdot = self._mdot_c + self._mdot_o
        qdot = self.fuel_volume + self.oxidizer_volume

        data = [
            ("Required power", "kW", self._power),
            ("Lower heating value", "MJ/kg", self._lhv),

            ("Fuel mass flow rate", "kg/h", 3600*self._mdot_c),
            ("Oxidizer mass flow rate", "kg/h", 3600*self._mdot_o),
            ("Total mass flow rate", "kg/h", 3600*mdot),

            ("Fuel volume flow rate", "Nm³/h", self.fuel_volume),
            ("Oxidizer volume flow rate", "Nm³/h", self.oxidizer_volume),
            ("Total volume flow rate", "Nm³/h", qdot),
        ]

        if hasattr(self, "_m_h2o"):
            mdot = self._m_h2o + self._m_co2

            data.extend([
                ("Water production", "kg/h", 3600*self._m_h2o),
                ("Carbon dioxide production", "kg/h", 3600*self._m_co2),
                ("Total emissions", "kg/h", 3600*mdot),
            ])
        return data

    def report(self, *args, **kwargs) -> str:
        """ Provides a report of the energy source. """
        kwargs.setdefault("headers", ["Property", "Unit", "Value"])
        return super().report(*args, **kwargs)


class CombustionAtmosphereMixer:
    """ Provides addition of thermochemical quantities.

    Parameters
    ----------
    mechanism: str
        Kinetics mechanism/database to use in computations.
    """
    def __init__(self, mechanism: str, basis: str = "mole") -> None:
        self._mechanism = mechanism
        self._quantity = None
        self._basis = basis

    def _new_quantity(self, mass, T, P, X):
        """ Create a new quantity with provided state. """
        solution = Solution(self._mechanism, basis=self._basis)
        solution.TPX = T, P, X
        return ct.Quantity(solution, mass=mass)

    def add_quantity(self,
            mass: float,
            X: CompositionType,
            T: float = 273.15,
            P: float = constants.P_NORMAL
        ) -> ct.Quantity:
        """ Add quantity at given state to global mixture.

        Parameters
        ----------
        mass: float
            Amount of matter in kilograms.
        X: CompositionType
            Composition of quantity in mole fractions.
        T: float = 273.15
            Solution temperature in kelvin.
        P: float = ct.one_atm
            Solution pressure in pascal.
        """
        # XXX: maybe consider this and add warning!
        # SMALL_MASS = 1.0e-12
        # mass = mass if mass > 0 else SMALL_MASS
        quantity = self._new_quantity(mass, T, P, X)

        if self._quantity is None:
            self._quantity = quantity
        else:
            self._quantity += quantity

        return copy_quantity(quantity)

    @property
    def solution(self) -> ct.Quantity:
        """ Provides access to computed solution, if any. """
        if self._quantity is None:
            raise RuntimeError("First add some quantities")
        return self._quantity


def _init_abstract_energy_source(cls):
    """ Decorator to enhance AbstractEnergySource with argument parsing. """
    return cls


@_init_abstract_energy_source
class AbstractEnergySource(AbstractReportable):
    """ Abstract base class for energy sources. """
    __slots__ = ()

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

    @property
    @abstractmethod
    def power(self) -> float:
        """ Energy source provided power [W]. """
        pass

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        """ Provides data for assemblying the object report. """
        data = [("Source kind", "", self.__class__.__name__),
                ("Provided power", "kW", self.power / 1000)]
        return data

    def report(self, *args, **kwargs) -> str:
        """ Provides a report of the energy source. """
        kwargs.setdefault("headers", ["Property", "Unit", "Value"])
        return super().report(*args, **kwargs)


def _init_cantera_energy_source(cls):
    """ Decorator to enhance CanteraEnergySource with argument parsing. """
    orig_init = cls.__init__

    parser = FuncArguments(greedy_args=False, pop_kw=True)
    parser.add("source", 0)
    parser.add("power", 1, default=0.0)
    parser.add("phase", default="")

    @wraps(orig_init)
    def new_init(self, *args, **kwargs):
        parser.update(*args, **kwargs)
        self._source = parser.get("source")
        self._power  = parser.get("power") * 1000.0
        self._phase  = parser.get("phase")

        # XXX to be set by derived classes:
        self._fluid = None

        orig_init(self, *parser.args, **parser.kwargs)
        parser.close()
        return None

    cls.__init__ = update_wrapper(new_init, orig_init)
    return cls


@_init_cantera_energy_source
class CanteraEnergySource(AbstractEnergySource):
    """ An abstract Cantera based energy source. """
    __slots__ = ("_power", "_source", "_phase", "_fluid")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

    # -----------------------------------------------------------------------
    # Internal API
    # -----------------------------------------------------------------------

    def _new_solution(self) -> Solution:
        """ Creates a new Cantera solution object. """
        return Solution(self._source, self._phase)

    # -----------------------------------------------------------------------
    # From AbstractEnergySource
    # -----------------------------------------------------------------------

    @property
    def power(self) -> float:
        """ Energy source provided power [W]. """
        return self._power

    @property
    def source(self) -> str:
        """ Access to the source object. """
        return self._source

    @property
    def phase(self) -> str:
        """ Access to the phase object. """
        return self._phase

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        data = super().report_data(*args, **kwargs)
        data.extend([("Source", "", self.source),
                      ("Phase", "", self.phase)])
        return data

    # -----------------------------------------------------------------------
    # Extension API
    # -----------------------------------------------------------------------

    @property
    def fluid(self) -> SolutionLikeType:
        """ Provides access to the internal Cantera solution object. """
        if self._fluid is None:
            self._fluid = self._new_solution()
        return self._fluid

    @property
    def solution(self) -> Solution:
        """ Provides access to a new Cantera solution object. """
        return self._new_solution()


def _init_gas_flow_energy_source(cls):
    """ Decorator to enhance GasFlowEnergySource with argument parsing. """
    orig_init = cls.__init__

    parser = FuncArguments(greedy_args=False, pop_kw=True)
    parser.add("mass_flow_rate", default=-1.0)
    parser.add("cross_area", default=1.0)

    @wraps(orig_init)
    def new_init(self, *args, **kwargs):
        parser.update(*args, **kwargs)
        self._mdot = parser.get("mass_flow_rate")
        self._area = parser.get("cross_area")

        orig_init(self, *parser.args, **parser.kwargs)
        parser.close()

        self._rho  = -1.0
        return None

    cls.__init__ = update_wrapper(new_init, orig_init)
    return cls


@_init_gas_flow_energy_source
class GasFlowEnergySource(CanteraEnergySource):
    """ An abstract gas flow energy source. """
    __slots__ = ("_mdot", "_area", "_rho")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

    # -----------------------------------------------------------------------
    # From AbstractEnergySource
    # -----------------------------------------------------------------------

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        """ Provides data for assemblying the object report. """
        data = super().report_data(*args, **kwargs)
        data.extend([
            ("Reference area", "m²", self._area),
            ("Mass flow rate", "kg/s", self.mass_flow_rate),
            ("Volume flow rate", "m³/s", self.volume_flow_rate),
            ("Momentum flux", "kg.m/s²", self.momentum_flux),
        ])
        return data

    # -----------------------------------------------------------------------
    # Extension API
    # -----------------------------------------------------------------------

    @property
    def momentum_flux(self) -> float:
        """ Provides access to momentum flux in burner [kg.m/s²]. """
        return self._mdot**2 / (self._area * self._rho)

    @property
    def volume_flow_rate(self) -> float:
        """ Provides access to volume flow rate [m³/s]. """
        return self._mdot / self._rho

    @property
    def mass_flow_rate(self) -> float:
        """ Provides access to mass flow rate [kg/s]. """
        return self._mdot

    @property
    def flue(self) -> SolutionLikeType:
        """ Provides access to flue gas. """
        return self._fluid


def _init_heated_gas_energy_source(cls):
    """ Decorator to enhance HeatedGasEnergySource with argument parsing. """
    orig_init = cls.__init__

    parser = FuncArguments(greedy_args=False, pop_kw=True)
    parser.add("temperature_ref", default=constants.T_REFERENCE)
    parser.add("pressure_ref", default=constants.P_NORMAL)
    parser.add("Y", default={})

    @wraps(orig_init)
    def new_init(self, *args, **kwargs):
        parser.update(*args, **kwargs)
        self._temp_ref = parser.get("temperature_ref")
        self._pres_ref = parser.get("pressure_ref")
        self._comp_ref = parser.get("Y")

        orig_init(self, *parser.args, **parser.kwargs)
        parser.close()

        self._compute_operation()
        return None

    cls.__init__ = update_wrapper(new_init, orig_init)
    return cls


@_init_heated_gas_energy_source
class HeatedGasEnergySource(GasFlowEnergySource):
    """ Non-reacting heated gas flow energy source. """
    __slots__ = ("_temp_ref", "_pres_ref", "_temp_ops", "_comp_ref")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

    # -----------------------------------------------------------------------
    # Internal API
    # -----------------------------------------------------------------------

    def _compute_operation(self) -> None:
        """ Computes the operating temperature [K] and density [kg/m³]. """
        sol = self._new_solution()

        self._comp_ref = self._comp_ref if self._comp_ref else sol.Y
        sol.TPY = self._temp_ref, self._pres_ref, self._comp_ref

        h = sol.enthalpy_mass + self._power / self._mdot
        sol.HP = h, self._pres_ref

        self._rho = sol.density
        self._temp_ops = sol.T
        self._phase = sol.name
        self._fluid = ct.Quantity(sol, mass=self._mdot)

    # -----------------------------------------------------------------------
    # From AbstractEnergySource
    # -----------------------------------------------------------------------

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        data = super().report_data(*args, **kwargs)
        data.extend([
            ("Reference temperature", "K", self._temp_ref),
            ("Reference pressure", "Pa", self._pres_ref),
            *solution_report(self.solution, **kwargs),
        ])
        return data

    # -----------------------------------------------------------------------
    # From CanteraEnergySource
    # -----------------------------------------------------------------------

    @property
    def solution(self) -> Solution:
        """ Provides access to a new Cantera solution object. """
        sol = self._new_solution()
        sol.TPY = self._temp_ops, self._pres_ref, self._comp_ref
        return sol


def _init_combustion_energy_source(cls):
    """ Decorator to enhance CombustionEnergySource with argument parsing. """
    orig_init = cls.__init__

    parser = FuncArguments(greedy_args=False, pop_kw=True)
    parser.add("operation", default=None)

    @wraps(orig_init)
    def new_init(self, *args, **kwargs):
        # Temporary to get the mechanism (improve this!)....
        tmp = CanteraEnergySource(*(*args, -1), **kwargs)

        parser.update(*args, **kwargs)
        operation = parser.get("operation")

        if operation is None:
            raise ValueError("Operation parameters must be provided")

        # XXX: do not write to _power, let base class handle it!
        power = self._compute_power(operation, tmp)
        args = (*parser.args, power)
        orig_init(self, *args, **parser.kwargs)
        parser.close()

        # Override base class (negative up to this point!)
        self._mdot  = self._qty_flue.mass
        self._rho   = self._qty_flue.density_mass
        self._phase = self._qty_flue.phase.name
        self._fluid = self._qty_flue
        return None

    cls.__init__ = update_wrapper(new_init, orig_init)
    return cls


@_init_combustion_energy_source
class CombustionEnergySource(GasFlowEnergySource):
    """ Combustion based energy source. """
    __slots__ = ("_fuel", "_oxid", "_qty_flue", "_qty_fuel", "_qty_oxid")

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

    # -----------------------------------------------------------------------
    # Internal API
    # -----------------------------------------------------------------------

    def _compute_power(self, operation, tmp) -> float:
        """ Computes the power output of the energy source. """
        self._fuel = operation.fuel_state.X
        self._oxid = operation.oxid_state.X

        if isinstance(operation, CombustionFlowOp):
            if operation.fuel_xdot <= 0.0 or operation.oxid_xdot <= 0.0:
                raise ValueError("Flow rates must be positive")

            match operation.mode:
                case "mass":
                    mdot_fuel = operation.fuel_xdot
                    mdot_oxid = operation.oxid_xdot
                case "volume":
                    opts = dict(X=self._oxid, name=tmp.phase)
                    calc_oxid = NormalFlowRate(tmp.source, **opts)
                    mdot_oxid = calc_oxid(operation.oxid_xdot)

                    opts = dict(X=self._fuel, name=tmp.phase)
                    calc_fuel = NormalFlowRate(tmp.source, **opts)
                    mdot_fuel = calc_fuel(operation.fuel_xdot)
                case _:
                    raise ValueError("Flow mode must be 'mass' or 'volume'")

            # XXX: the hard-coded "O2: 1" is here by definition! The heating
            # value is always computed with respect to pure oxidizer. Notice
            # that the oxidizer must be parametrized in the future!
            ca = CombustionAtmosphereCHON(tmp.source, basis="mole")
            lhv = ca.solution_heating_value(self._fuel, "O2: 1")
            power = lhv * mdot_fuel * 1000.0
        elif isinstance(operation, CombustionPowerOp):
            supply = CombustionPowerSupply(
                operation.power, operation.equivalence, self._fuel,
                self._oxid, tmp.source, emissions=False, basis="mole")

            mdot_fuel = supply.fuel_mass
            mdot_oxid = supply.oxidizer_mass
            power = operation.power
        else:
            raise RuntimeError("Unknown operation type")

        T_fuel = operation.fuel_state.T
        T_oxid = operation.oxid_state.T

        mixture = CombustionAtmosphereMixer(tmp.source, basis="mass")
        self._qty_fuel = mixture.add_quantity(mdot_fuel, self._fuel, T_fuel)
        self._qty_oxid = mixture.add_quantity(mdot_oxid, self._oxid, T_oxid)
        self._qty_flue = mixture.solution
        self._qty_flue.equilibrate("HP")
        return power

    # -----------------------------------------------------------------------
    # From AbstractEnergySource
    # -----------------------------------------------------------------------

    def report_data(self, *args, **kwargs) -> list[tuple[str, str, Any]]:
        data = super().report_data(*args, **kwargs)
        data.extend([
            ("******* FLUE:", "", ""),
            *solution_report(self._qty_flue, **kwargs),
            ("******* FUEL:", "", ""),
            *solution_report(self._qty_fuel, **kwargs),
            ("******* OXIDIZER:", "", ""),
            *solution_report(self._qty_oxid, **kwargs),
        ])
        return data

    # -----------------------------------------------------------------------
    # From CanteraEnergySource
    # -----------------------------------------------------------------------

    @property
    def solution(self) -> Solution:
        """ Provides access to a new Cantera solution object. """
        sol = self._new_solution()
        sol.TPY = self._qty_flue.phase.TPY
        return sol

    # -----------------------------------------------------------------------
    # Extension API
    # -----------------------------------------------------------------------

    @property
    def fuel(self) -> CompositionType:
        """ Provides access to used fuel. """
        return self._fuel

    @property
    def oxidizer(self) -> CompositionType:
        """ Provides access to used oxidizer. """
        return self._oxid
#endregion: energy

#region: numerical
class RelaxUpdate:
    """ Relax solution for updating new iteration.

    Parameters
    ----------
    v_ini: np.ndarray
        Initial guess of solution.
    alpha: float = 0.5
        Fraction of old solution to use at updates.
    """
    def __init__(self, v_ini: NDArray[np.float64],
                 alpha: float = 0.5) -> None:
        self._c_old = alpha
        self._c_new = 1.0 - alpha

        self._v_old = np.copy(alpha * v_ini)
        self._v_new = np.empty_like(v_ini)

    def update(self, alpha: float) -> None:
        """ Update relaxation coefficients.

        Parameters
        ----------
        alpha: float
            Fraction of old solution to use at updates.
        """
        self._c_old = alpha
        self._c_new = 1.0 - alpha

    def __call__(self, v_new: NDArray[np.float64]) -> NDArray[np.float64]:
        """ Evaluate new relaxed solution estimate.

        Parameters
        ----------
        v_new: np.ndarray
            New solution estimate to be relaxed.
        """
        self._v_new[:] = self._c_new * v_new + self._v_old
        self._v_old[:] = self._c_old * self._v_new
        return self._v_new


class StabilizeNvarsConvergenceCheck:
    """ Check stabilization towards a constant value along iterations.

    Parameters
    ----------
    n_vars: int
        Number of variables to be checked in problem.
    min_iter: int = 1
        Minimum number of iterations before considering converged.
    max_iter: int = 1_000_000
        Maximum number of iterations before considering failure.
    patience: int = 10
        Number of consecutive convergences before declaring convergence.
    rtol: float = 1.0e-06
        See `numpy.isclose` for details.
    atol: float = 1.0e-12
        See `numpy.isclose` for details.
    equal_nan: bool = False
        See `numpy.isclose` for details.
    log_iter: bool = False
        If true, log convergence message when achieved.
    """
    def __init__(self, *, n_vars: int, min_iter: int = 1,
                 max_iter: int = 1_000_000, patience: int = 10,
                 rtol: float = 1.0e-10,  atol: float = 1.0e-20,
                 equal_nan: bool = False, log_iter: bool = False,
                 ) -> None:
        # TODO add some validation here.
        self._min_iter = min_iter
        self._max_iter = max_iter
        self._patience = patience

        self._last = np.full(n_vars, np.inf)
        self._niter = 0
        self._count = 0
        self._log_iter = log_iter

        def is_close(A, B):
            return np.isclose(A, B, rtol=rtol, atol=atol,
                              equal_nan=equal_nan)

        self._close = is_close

    def _compare(self, A, B):
        """ Compare two arrays for convergence. """
        return self._close(A, B)

    def __call__(self, state: NDArray[np.float64]) -> bool:
        """ Check if all variables have stabilized at current iteration.

        Parameters
        ----------
        state: NDArray[np.float64]
            Current solution state to be checked for convergence.
        """
        # Increase counter:
        self._niter += 1

        # Logical checks for leaving:
        converge_enough_times  = self._count >= self._patience
        reached_min_iterations = self._niter >= self._min_iter

        # If converging for a while, good, but for a minimum iterations!
        if converge_enough_times and reached_min_iterations:
            if self._log_iter:
                logging.info(f"Converged after {self._niter} iterations")
            return True

        # If reached each, we are *good* here...
        if self._niter >= self._max_iter:
            warnings.warn(f"Leaving after `max_iter` without convergence")
            return True

        # Converge once, count it, otherwise reset counter:
        if np.all(self._compare(self._last, state)):
            self._count += 1
        else:
            self._count = 0

        # TODO report variables lacking convergence?
        # capture results of self._compare.

        # Swap solution states for next call:
        self._last[:] = state

        # Not good, call me back later, folks!
        return False

    @property
    def n_iterations(self) -> int:
        """ Provides access to number of iterations performed. """
        return self._niter


class ComposedStabilizedConvergence:
    """ Wrapper for checking stabilization of several arrays.

    See `StabilizeNvarsConvergenceCheck` for keyword arguments;
    these are shared by all tested arrays. It is always possible to
    compose your own convergence checker using individual instances
    for more control over setup.

    Parameters
    ----------
    n_arrs: int
        Number of arrays to be checked for convergence.
    kwargs:
        See `StabilizeNvarsConvergenceCheck` for details.
    """
    def __init__(self, n_arrs: int, **kwargs):
        conv = [StabilizeNvarsConvergenceCheck(**kwargs)
                for _ in range(n_arrs)]
        self._conv = np.array(conv, dtype=object)
        self._niter = 0

    def __call__(self, *arrs: tuple[NDArray[np.float64], ...]) -> bool:
        """ Check if all arrays have stabilized at current iteration.

        Parameters
        ----------
        arrs: tuple[NDArray[np.float64], ...]
            Arrays to be checked for convergence.
        """
        self._niter += 1

        if len(arrs) != self._conv.shape[0]:
            raise RuntimeError("Bad number of arrays to verify")

        # XXX: run until a first failure only (lazy evaluation).
        for data, conv in zip(arrs, self._conv):
            if not conv(data):
                return False

        return True

    @property
    def n_iterations(self) -> int:
        """ Provides access to number of iterations performed. """
        return self._niter
#endregion: numerical

#region: symbolic
class PiecewiseSymbolicFunction:
    """ Compose a symbolic piecewise function with CasADi.

    Parameters
    ----------
    breakpoints : list[float]
        List of breakpoints where the function changes.
    functions : list[Any]
        List of functions to apply between breakpoints. The number of
        functions must be one less than the number of breakpoints.
    """
    def __init__(self, breakpoints: list[float],
                 functions: list[Any]) -> None:
        if len(functions) <= 1:
            raise ValueError("At least two functions are required")

        if len(breakpoints) != len(functions) + 1:
            raise ValueError("Number of breakpoints must be one more "
                             "than number of functions")

        self._b = breakpoints
        self._f = functions

    def __call__(self, x, *args, **kwargs):
        """ Evaluate the piecewise function at a given point. """
        result = 0

        for i in range(len(self._b) - 1):
            a = heaviside(x - self._b[i])
            b = heaviside(x - self._b[i + 1])

            # Handle symbolic expressions and functions:
            if callable(self._f[i]):
                val = self._f[i](x, *args, **kwargs)
            else:
                # Generally an SX expression, to be debugged!
                val = self._f[i]

            result += a * (1 - b) * val

        return result


class AbstractSymbolicThermo(ABC):
    @property
    @abstractmethod
    def breakpoints(self) -> list[float]:
        """ Return the breakpoints of the piecewise functions. """
        pass

    @property
    @abstractmethod
    def cp(self) -> Function:
        """ Return the specific heat function. """
        pass

    @property
    @abstractmethod
    def h(self) -> Function:
        """ Return the enthalpy function. """
        pass

    @property
    @abstractmethod
    def s(self) -> Function:
        """ Return the entropy function. """
        pass

    @classmethod
    @abstractmethod
    def from_species(cls, species: ct.thermo.Species, T: SX) -> Self:
        """ Create a `Nasa7Thermo` object from a Cantera species.

        Parameters
        ----------
        species : ct.thermo.Species
            Cantera species object, with NASA7 thermodynamic data.
        T : SX
            Temperature variable (symbolic).
        """
        pass


class AbstractSymbolicTransport(ABC):
    pass


class AbstractSymbolicKinetics(ABC):
    pass


class Nasa7Thermo(AbstractSymbolicThermo):
    """ NASA7 thermodynamic parameterization.

    This class does not implement Horner polynomial evaluation, as
    the main use case is to create symbolic expressions that are
    then evaluated by CasADi, which can handle polynomial evaluation
    efficiently. This is intentional and allows for easy verification.

    It aims at providing a similar interface as `SpeciesThermo` from
    Cantera, from which it retrieves the data. That means, molar
    properties are provided through `cp`, `h`, and `s` properties.

    Parameters
    ----------
    T : SX
        Temperature variable (symbolic).
    input_data : dict
        NASA7 thermodynamic data, as provided by Cantera's
        `SpeciesThermo` property `input_data`.
    """
    __slots__ = ("_T", "_input_data", "_cp", "_h", "_s")

    def __init__(self, T: SX, input_data: dict[str, Any]) -> None:
        super().__init__()

        self._T = T
        self._input_data = input_data

        if self._input_data["model"] != "NASA7":
            raise ValueError("Only NASA7 thermodynamic model is supported")

        data = input_data["data"]
        breakpoints = input_data["temperature-ranges"]

        # When using this constructor, use symbolic expressions for the
        # composition of functions, convert to Function objects later.
        names = ["specific_heat", "enthalpy", "entropy"]
        c_func = Nasa7Thermo.compose(names[0], T, data, symbolic=True)
        h_func = Nasa7Thermo.compose(names[1], T, data, symbolic=True)
        s_func = Nasa7Thermo.compose(names[2], T, data, symbolic=True)

        cp = PiecewiseSymbolicFunction(breakpoints, c_func)
        h  = PiecewiseSymbolicFunction(breakpoints, h_func)
        s  = PiecewiseSymbolicFunction(breakpoints, s_func)

        self._cp = Function("cp", [T], [cp(T)])
        self._h  = Function("h", [T], [h(T)])
        self._s  = Function("s", [T], [s(T)])

    @property
    def breakpoints(self) -> list[float]:
        """ Return the breakpoints of the piecewise functions. """
        return self._input_data["temperature-ranges"]

    @property
    def cp(self) -> Function:
        """ Return the specific heat function. """
        return self._cp

    @property
    def h(self) -> Function:
        """ Return the enthalpy function. """
        return self._h

    @property
    def s(self) -> Function:
        """ Return the entropy function. """
        return self._s

    @staticmethod
    def specific_heat(T: Any, a: list[float],
                      symbolic: bool = False) -> Function | SX:
        """ Compose NASA7 specific heat parameterization.

        Parameters
        ----------
        T : Any
            Temperature variable (symbolic or numeric).
        a : list[float]
            List of 7 NASA7 coefficients.
        symbolic : bool
            Whether to return a symbolic expression.
        """
        p = a[0] + a[1] * T + a[2] * T**2 + a[3] * T**3 + a[4] * T**4
        p *= constants.GAS_CONSTANT
        return p if symbolic else Function("cp", [T], [p])

    @staticmethod
    def enthalpy(T: Any, a: list[float],
                 symbolic: bool = False) -> Function | SX:
        """ Compose NASA7 specific enthalpy parameterization.

        Parameters
        ----------
        T : Any
            Temperature variable (symbolic or numeric).
        a : list[float]
            List of 7 NASA7 coefficients.
        symbolic : bool
            Whether to return a symbolic expression.
        """
        p = a[0] + a[1]/2 * T + a[2]/3 * T**2 + a[3]/4 * T**3 + \
            a[4]/5 * T**4 + a[5] / T
        p *= T * constants.GAS_CONSTANT
        return p if symbolic else Function("h", [T], [p])

    @staticmethod
    def entropy(T: Any, a: list[float],
                symbolic: bool = False) -> Function | SX:
        """ Compose NASA7 specific entropy parameterization.

        Parameters
        ----------
        T : Any
            Temperature variable (symbolic or numeric).
        a : list[float]
            List of 7 NASA7 coefficients.
        symbolic : bool
            Whether to return a symbolic expression.
        """
        p = a[0] * ln(T) + a[1] * T + a[2]/2 * T**2 +\
            a[3]/3 * T**3 + a[4]/4 * T**4 + a[6]
        p *= constants.GAS_CONSTANT
        return p if symbolic else Function("s", [T], [p])

    @classmethod
    def compose(cls, name: str, T: SX | NDArray[np.float64] | float,
                data: list[list[float]], symbolic: bool = False
                ) -> list[Function | SX | NDArray[np.float64] | float]:
        """ Compose a list of NASA7 functions for given data.

        Parameters
        ----------
        name : str
            Name of the function ("specific_heat", "enthalpy", or
            "entropy", *i.e* the static methods of this class).
        T : SX | NDArray[np.float64] | float
            Temperature variable (symbolic).
        data : list[list[float]]
            List of NASA7 coefficient sets for each temperature range.
        symbolic : bool
            Whether to return symbolic expressions or CasADi functions.
            Only relevant if `T` is symbolic.
        """
        # Numeric evaluation needs *symbolic* to be true!
        if not isinstance(T, SX):
            symbolic = True

        def evaluator(a, func=getattr(cls, name.lower())):
            return func(T, a, symbolic=symbolic)

        return [evaluator(a) for a in data]

    @classmethod
    def from_species(cls, species: ct.thermo.Species, T: SX) -> Self:
        """ Create a `Nasa7Thermo` object from a Cantera species.

        Parameters
        ----------
        species : ct.thermo.Species
            Cantera species object, with NASA7 thermodynamic data.
        T : SX
            Temperature variable (symbolic).
        """
        return cls(T, dict(species.thermo.input_data))


class ChapmanEnskogTransport(AbstractSymbolicTransport):
    def __init__(self, T: SX, input_data: dict[str, Any]) -> None:
        super().__init__()

        self.T = T
        self.input_data = input_data

        if self.input_data["model"] != "gas":
            raise ValueError("Only gas transport model is supported")


def symbolic_thermo_factory(species: ct.thermo.Species, T: SX
                            ) -> AbstractSymbolicThermo:
    """ Create an `AbstractSymbolicThermo` object.

    Parameters
    ----------
    species : ct.thermo.Species
        Cantera species object, with NASA7 thermodynamic data.
    T : SX
        Temperature variable (symbolic).
    """
    input_data = dict(species.thermo.input_data)

    match (model := input_data["model"]):
        case "NASA7":
            return Nasa7Thermo(T, input_data)
        case _:
            raise ValueError(f"Unsupported model: {model}")


def symbolic_transport_factory(species: ct.thermo.Species,
                               T: SX) -> AbstractSymbolicTransport:
    """ Create an `AbstractSymbolicTransport` object.

    Parameters
    ----------
    species : ct.thermo.Species
        Cantera species object, with transport data.
    T : SX
        Temperature variable (symbolic).
    """
    input_data = dict(species.transport.input_data)

    match (model := input_data["model"]):
        case "gas":
            return ChapmanEnskogTransport(T, input_data)
        case _:
            raise ValueError(f"Unsupported transport model: {model}")


def symbolic_kinetics_factory(reaction: ct.Reaction,
                              T: SX) -> AbstractSymbolicKinetics:
    """ Create an `AbstractSymbolicKinetics` object. """
    pass


class SymbolicSpecies:
    def __init__(self, name: str,
                 thermo: AbstractSymbolicThermo,
                 transport: AbstractSymbolicTransport,
                 kinetics: AbstractSymbolicKinetics
                 ) -> None:
        self.name = name
        self.thermo = thermo
        self.transport = transport
        self.kinetics = kinetics


class SymbolicIdealGasSolution:
    pass
#endregion: symbolic

#region: transport
class EffectiveThermalConductivity:
    """ Models for effective thermal conductivity of granular media. """
    @staticmethod
    def maxwell_garnett(phi: float, k_g: float, k_s: float) -> float:
        """ Maxwell-Garnett effective medium theory approximation.

        Parameters
        ----------
        phi: float
            Solids packing fraction in packed bed [-].
        k_g: float
            Thermal conductivity of gas [W/(m.K)]
        k_s: float
            Thermal conductivity of solids [W/(m.K)]

        Returns
        -------
        float
            Effective domain thermal conductivity [W/(m.K)].
        """
        f_sum = 2 * k_g + k_s
        f_dif = k_s - k_g

        num = f_sum + 2 * phi * f_dif
        den = f_sum - 1 * phi * f_dif

        return k_g * num / den

    @staticmethod
    def singh1994(T: float, phi: float, d_p: float, k_s: float,
                  epsilon: float) -> float:
        """ Singh (1994) model for effective thermal conductivity.

        Parameters
        ----------
        T: float
            Temperature of solids [K].
        phi: float
            Solids packing fraction in packed bed [-].
        d_p: float
            Solids characteristic particle size [m].
        k_s: float
            Thermal conductivity of solids [W/(m.K)]
        epsilon: float
            Average emissivity of solids [-]. For solids with temperature
            dependent emissivity, it is worth estimating the right value
            for the temperature range being studied.

        Returns
        -------
        float
            Effective domain thermal conductivity [W/(m.K)].
        """
        a = 4.0 * d_p * ct.stefan_boltzmann * T**3
        b = (1.5353 / epsilon) * (k_s / a)**0.8011

        k_p = phi * k_s
        k_r = a * (0.5756 * epsilon * np.arctan(b) + 0.1843)

        return k_p + k_r


class SolutionDimless:
    """ Provides evaluation of dimensionless numbers for a solution.

    For keeping the API simple (as are the main use cases of this class),
    after accessing `solution` to setting its state, it is up to the user
    to call `update` as there is no pre-defined hook. It is not possible
    to implement such behavior of automatic call because you may simply
    retrieve the solution object and set the state later, after a hook
    has been called. The recommended way of setting state of the mixture
    is through `set_state` (see below).

    Parameters
    ----------
    mech: str
        Name or path to Cantera YAML solution mechanism.
    name = None
        Name of phase in mechanism if not a single one is present.
    """
    def __init__(self, mech: str, *, name = None) -> None:
        supported = ["mixture-averaged"]
        self._sol = ct.composite.Solution(mech, name)

        if (model := self._sol.transport_model) not in supported:
            raise ValueError(f"Unsupported transport model {model}")

        # XXX: this alsow will create all the symbols on first call
        self._reset_memory()

    def _reset_memory(self):
        """ Reset all previously computed numbers. """
        self._re, self._re_data = None, None
        self._pr, self._pr_data = None, None
        self._sc, self._sc_data = None, None
        self._pe_mass, self._pe_mass_data = None, None
        self._pe_heat, self._pe_heat_data = None, None
        self._gr, self._gr_data = None, None
        self._ra, self._ra_data = None, None

    def _add(self, data, name, val, args):
        """ Add a number to the list if it has been evaluated. """
        if val is not None:
            data.append((name, val, args))

    def _diff_coefs(self, vname) -> NDArray[np.float64]:
        """ Return required diffusion coefficients. """
        D = getattr(self._sol, vname)
        return D[D > 0]

    # -----------------------------------------------------------------
    # BY DEFINITION
    # -----------------------------------------------------------------

    @staticmethod
    def bydef_reynolds(rho, mu, U, L):
        """ Reynolds number by definition. """
        return rho * U * L / mu

    @staticmethod
    def bydef_prandtl(cp, mu, k):
        """ Prandtl number by definition. """
        return cp * mu / k

    @staticmethod
    def bydef_schmidt(rho, mu, D):
        """ Schmidt number by definition. """
        return mu / (rho * D)

    @staticmethod
    def bydef_peclet(U, L, D):
        """ Péclet number by definition. """
        return L * U / D

    @staticmethod
    def bydef_grashof(Tw, T, beta, nu, g, H):
        """ Grashof number by definition. """
        return beta * g * (Tw - T) * H**3 / nu**2

    @staticmethod
    def bydef_rayleigh(Tw, T, alpha, beta, nu, g, H):
        """ Rayleigh number by definition. """
        return beta * g * (Tw - T) * H**3 / (nu * alpha)

    # -----------------------------------------------------------------
    # WRAPPERS
    # -----------------------------------------------------------------

    def reynolds(self, U: float, L: float) -> float:
        """ Evaluates Reynolds number for solution.

        Parameters
        ----------
        U : float
            Flow characteristic velocity [m/s].
        L : float
            Problem characteristic length [m].
        """
        self._re = self.bydef_reynolds(self._rho, self._mu, U, L)
        self._re_data = f"U={U}, L={L}"
        return self._re

    def prandtl(self) -> float:
        """ Evaluates Prandtl number for solution. """
        self._pr = self.bydef_prandtl(self._cp, self._mu, self._k)
        self._pr_data = ""
        return self._pr

    def schmidt(self, vname: str = "mix_diff_coeffs") -> float:
        """ Evaluates Schmidt number for solution.

        Parameters
        ----------
        vname: str = "mix_diff_coeffs"
            Name of diffusion coefficient attribute to use, depending on
            the mass/mole units needs in your calculations. For more details
            please consult `cantera.Solution` documentation.
        """
        D = max(self._diff_coefs(vname))
        self._sc = self.bydef_schmidt(self._rho, self._mu, D)
        self._sc_data = vname
        return self._sc

    def peclet_mass(self, U: float, L: float,
                    vname: str = "mix_diff_coeffs") -> float:
        """ Evaluates the mass Péclet number for solution.

        Parameters
        ----------
        U : float
            Flow characteristic velocity [m/s].
        L : float
            Problem characteristic axial length [m].
        vname: str = "mix_diff_coeffs"
            Name of diffusion coefficient attribute to use, depending on
            the mass/mole units needs in your calculations. For more details
            please consult `cantera.Solution` documentation.
        """
        D = max(self._diff_coefs(vname))
        self._pe_mass = self.bydef_peclet(U, L, D)
        self._pe_mass_data = f"U={U}, L={L}, {vname}"
        return self._pe_mass

    def peclet_heat(self, U: float, L: float) -> float:
        """ Evaluates the heat Péclet number for solution.

        Parameters
        ----------
        U : float
            Flow characteristic velocity [m/s].
        L : float
            Problem characteristic axial length [m].
        """
        self._pe_heat = self.bydef_peclet(U, L, self._alpha)
        self._pe_heat_data = f"U={U}, L={L}"
        return self._pe_heat

    def grashof(self, Tw: float, H: float,
                g: float = constants.GRAVITY) -> float:
        """ Evaluates the Grashof number for solution.

        Parameters
        ----------
        Tw : float
            Reactor characteristic wall temperature [K].
        H : float
            Problem characteristic (often vertical) length [m].
        g: float = constants.GRAVITY
            Acceleration of gravity at location [m/s²].
        """
        self._gr = self.bydef_grashof(Tw, self._sol.T, self._beta,
                                      self._nu, g, H)
        self._gr_data = f"Tw={Tw}, H={H}, g={g}"
        return self._gr

    def rayleigh(self, Tw: float, H: float,
                 g: float = constants.GRAVITY) -> float:
        """ Evaluates the Rayleigh number for solution.

        Parameters
        ----------
        Tw : float
            Reactor characteristic wall temperature [K].
        H : float
            Problem characteristic (often vertical) length [m].
        g: float = constants.GRAVITY
            Acceleration of gravity at location [m/s²].
        """
        self._ra = self.bydef_rayleigh(Tw, self._sol.T, self._alpha,
                                       self._beta, self._nu, g, H)
        self._ra_data = f"Tw={Tw}, H={H}, g={g}"
        return self._ra

    # -----------------------------------------------------------------
    # UTILITIES
    # -----------------------------------------------------------------

    def update(self):
        """ Retrieve all required properties from solution. """
        self._rho  = self._sol.density_mass
        self._mu   = self._sol.viscosity
        self._cp   = self._sol.cp_mass
        self._k    = self._sol.thermal_conductivity
        self._beta = self._sol.thermal_expansion_coeff

        self._nu = self._mu / self._rho
        self._alpha = self._k / (self._rho * self._cp)

    @property
    def solution(self) -> ct.composite.Solution:
        """ Provides handle for setting state of solution. """
        self._reset_memory()
        return self._sol

    def set_state(self, *args, tuple_name="TPX"):
        """ Set state of system with given arguments. """
        setattr(self.solution, tuple_name, args)
        self.update()

    def report(self, show_fitting_errors: bool = False,
               tablefmt: str = "simple") -> str:
        """ Produces a table for inspecting all computed values. """
        data = []
        self._add(data, "Reynolds", self._re, self._re_data)
        self._add(data, "Prandtl",  self._pr, self._pr_data)
        self._add(data, "Schmidt",  self._sc, self._sc_data)
        self._add(data, "Péclet (mass)", self._pe_mass, self._pe_mass_data)
        self._add(data, "Péclet (heat)", self._pe_heat, self._pe_heat_data)
        self._add(data, "Grashof", self._gr, self._gr_data)
        self._add(data, "Rayleigh", self._ra, self._ra_data)

        if show_fitting_errors:
            self._add(data, " ",  " ", " ")
            fitting_errors = self._sol.transport_fitting_errors
            data.extend([(k, v, "") for k, v in fitting_errors.items()])

        return tabulate(data)


# XXX WIP
class SkinFrictionFactor:
    """ Skin friction factors for y+ calculations.

    To-do: implement some from the following (after review);
    https://www.cfd-online.com/Wiki/Skin_friction_coefficient
    """
    @staticmethod
    def laminar(Re) -> float:
        """ Laminar limit theoretical value. """
        return 64 / Re

    @staticmethod
    def smooth_wall(Re, check: bool = True) -> float:
        """ Blasius smooth wall approximation.

        https://doi.org/10.1007/978-3-662-02239-9_1
        """
        if check and not (4_000 < Re < 100_000):
            print(f"WARNING: out-of-range Re = {Re:.2e} not in [4e3; 1e5]")

        return 0.3164 * Re**(-1/4)


# XXX WIP
class WallGradingCalculator:
    """ Helper class for estimating first cell thickness given y+. """
    def __init__(self, *,
            L: float,
            U: float,
            rho: float,
            mu: float,
            skin_factor: Callable | None = None
        ) -> None:
        self._rho = rho
        self._U   = U
        self._nu  = mu / rho
        self._Re  = U * L / self._nu

        if skin_factor is not None:
            self.set_skin_factor(skin_factor)

    @classmethod
    def from_solution(cls, obj, L: float, U: float,
                      skin_factor: Callable | None = None) -> Self:
        """ Alternative constructor from dimensionless solution. """
        sol = obj.solution
        return cls(L=L, U=U, rho=sol.density_mass, mu=sol.viscosity,
                   skin_factor=skin_factor)

    def set_skin_factor(self, skin_factor: Callable) -> None:
        self._Cf = skin_factor(self._Re)
        self._tw = self.wall_shear_stress(self._rho, self._U, self._Cf)
        self._ut = self.friction_velocity(self._tw, self._rho)
        # print(f"Skin coefficient .... {self._Cf}")
        # print(f"Wall shear stress ... {self._tw}")
        # print(f"Friction velocity ... {self._ut}")

    @staticmethod
    def wall_shear_stress(rho, U, Cf) -> float:
        """ Wall shear stress estimater from friction factor [Pa]. """
        return Cf * rho * U**2

    @staticmethod
    def friction_velocity(tw, rho) -> float:
        """ Dimensionless friction velocity. """
        return (tw / rho)**(1/2)

    def first_layer(self, y_plus, skin_factor: Callable | None = None) -> float:
        """ Height of first cell for given y+ value [m]. """
        if skin_factor is not None:
            self.set_skin_factor(skin_factor)

        if not hasattr(self, "_ut"):
            raise ValueError("Please call `set_skin_factor` first")

        return y_plus * self._nu / self._ut


class SutherlandFitting:
    """ Helper for fitting Sutherland parameters for all species in solution.

    Parameters
    ----------
    mech: str
        Name or path to Cantera YAML solution mechanism.
    name = None
        Name of phase in mechanism if not a single one is present.
    """
    def __init__(self, mech: str, *, name: str | None = None) -> None:
        self._sol = ct.composite.Solution(mech, name)
        self._data = None
        self._visc = None

    def _get_species(self, species_names: list[str]):
        """ Return array of selected species for fitting. """
        allowed_species = self._sol.species_names

        if species_names is not None:
            # TODO add some warnings here for unknown species
            return [n for n in species_names if n in allowed_species]

        return allowed_species

    def fit(self, T: NDArray[np.float64], P: float = ct.one_atm,
            species_names: list[str] = None,
            p0: tuple[float, float] = (1.0, 1000)) -> None:
        """ Manage fitting of selected species from mechanism.

        Parameters
        ----------
        T: NDArray[float]
            Array of temperatures over which fit model [K].
        P: float = ct.one_atm
            Operating pressure for fitting [Pa].
        species_names: list[str] = None
            Names of species to be fitted; if none is provided, then
            all species in database are processed.
        p0: tuple[float, float] = (1.0, 1000)
            Initial guess for fitting; values are provided in (uPa.s, K)
            units (not the usual Pa.s values for readability of values).

        Returns
        -------
        pd.DataFrame
            Table with evaluated proper
        """
        data = []
        visc = pd.DataFrame({"T": T})
        arr = ct.composite.SolutionArray(self._sol, shape=(T.shape[0],))

        for name in self._get_species(species_names):
            arr.TPY = T, P, {name: 1}
            visc[name] = mu = 1e6 * arr.viscosity
            popt = curve_fit(SutherlandFitting.bydef, T, mu, p0=p0)[0]

            mu_fit = SutherlandFitting.bydef(T, *popt)
            err = np.sqrt(np.mean((mu_fit - mu) ** 2))

            data.append((name, popt[0], popt[1], err))

        names = ["species", "As [uPa.s]", "Ts [K]", "RMSE [uPa.s]"]
        self._data = pd.DataFrame(data, columns=names)
        self._visc = visc
        return self._data

    @staticmethod
    def bydef(T: NDArray[np.float64], As: float, Ts: float) -> NDArray[np.float64]:
        """ Sutherland transport parametric model as used in OpenFOAM.

        Function provided to be used in curve fitting to establish Sutherland
        coefficients from data computed by Cantera using Lennard-Jones model.
        Reference: https://cfd.direct/openfoam/user-guide/thermophysical.

        Parameters
        ----------
        T : NDArray[np.float64]
            Temperature array given in kelvin.
        As : float
            Sutherland coefficient.
        Ts : float
            Sutherland temperature.

        Returns
        -------
        NDArray[np.float64]
            The viscosity in terms of temperature.
        """
        return As * np.sqrt(T) / (1 + Ts / T)

    @MajordomePlot.new(shape=(1, 2), size=(10, 5))
    def plot_species(self, name=None, loc=2, *, plot=None, **kwargs):
        """ Generate verification plot for a given species. """
        fig, ax = plot.subplots()

        where = (self._data["species"] == name)
        As, Ts = self._data.loc[where].iloc[0, 1:-1].to_numpy()

        T = self._visc["T"].to_numpy()
        Y = self._visc[name].to_numpy()
        Z = self.bydef(T, As, Ts)

        err = 100 * (Z - Y) / Y
        ax[0].plot(T, Y, label="Cantera")
        ax[0].plot(T, Z, label="Sutherland")
        ax[1].plot(T, err)

        ax[0].set_xlabel("Temperature [$K$]")
        ax[1].set_xlabel("Temperature [$K$]")
        ax[0].set_ylabel("Viscosity [$\\mu{}Pa\\,s$]")
        ax[1].set_ylabel("Fitting error [%]")
        ax[0].legend(loc=loc)

    @property
    def coefs_table(self) -> pd.DataFrame:
        """ Retrieve table of fitted model for all species. """
        if self._data is None:
            raise ValueError("First call `fit` for generating data.")
        return self._data

    @property
    def viscosity(self) -> pd.DataFrame:
        """ Retrieve viscosity of species used in fitting. """
        if self._visc is None:
            raise ValueError("First call `fit` for generating data.")
        return self._visc

    def to_openfoam(self) -> str:
        """ Convert fitting to OpenFOAM format. """
        if self._data is None:
            raise ValueError("First call `fit` for generating data.")

        fmt = dedent("""
            /* --- RMSE {3} ---*/
            "{0}"
            {{
                transport
                {{
                    As  {1:.10e};
                    Ts  {2:.10e};
                }}
            }}\
            """)

        data = pd.DataFrame(self._data.copy())
        data["As [uPa.s]"] *= 1.0e-06

        return "".join(fmt.format(*row) for _, row in data.iterrows())


class AbstractRadiationModel(ABC):
    @staticmethod
    def load_raw_data(name: str) -> Any:
        """ Load raw data for feeding an implementation. """
        with open(DATA / "wsgg.yaml") as fp:
            data = yaml.safe_load(fp)

        for dataset in data["database"]:
            if dataset["name"] == name:
                return dataset

        raise ValueError(f"Dataset {name} not found!")

    @staticmethod
    def relax(alpha, a, b):
        """ Compute a fractional mixture of values. """
        return alpha * a + (1 - alpha) * b


class AbstractWSGG(AbstractRadiationModel):
    """ Abstract weighted sum of gray gases (WSGG) model. """
    def __init__(self, num_gases):
        super().__init__()
        self._kabs = np.zeros(num_gases)
        self._awts = np.zeros(num_gases)

    @property
    def absorption_coefs(self) -> NDArray[np.float64]:
        """ Component gases absorption coefficients [1/m]. """
        return self._kabs

    @property
    def gases_weights(self) -> NDArray[np.float64]:
        """ Fractional weight of model component gases [-]. """
        return self._awts

    @staticmethod
    def eval_emissivity(a: NDArray[np.float64],
                        k: NDArray[np.float64],
                        pL: float) -> NDArray[np.float64]:
        """ Compute integral emissivity over optical path. """
        return a * (1 - np.exp(-k * pL))

    def emissivity(self, pl: float) -> float:
        """ Compute integral emissivity over optical path. """
        return np.sum(self.eval_emissivity(self._awts, self._kabs, pl))


class WSGGRadlibBordbar2020(AbstractWSGG):
    """ Weighted sum of gray gases radiation properties model.

    Pure Python implementation of Radlib model from Bordbar (2020).

    Attributes
    ----------
    NUM_COEFS = 5
        Number of coefficients in polynomials (order + 1).
    NUM_GRAYS = 4
        Number of gray gases accounted for without clear gas.
    T_MIN = 300.0
        Minimum temperature accepted by the model [K].
    T_MAX = 2400.0
        Maximum temperature accepted by the model [K].
    T_RED = 1200.0
        Temperature used for computing dimensionless temperature [K].
    P_TOL = 1.0e-10
        Tolerance of carbon dioxide partial pressure [atm].
    MR_LIM_CO2 = 0.01
        Limit of `Mr` corresponding to CO2-rich mixtures.
    MR_LIM_H2O = 4.0
        Limit of `Mr` corresponding to H2O-rich mixtures.
    MR_LIM_INF = 1.0e+08
        Maximum allowed value of `Mr`.
    """
    NUM_COEFS = 5
    NUM_GRAYS = 4
    T_MIN = 300.0
    T_MAX = 2400.0
    T_RED = 1200.0
    P_TOL = 1.0e-10
    MR_LIM_CO2 = 0.01
    MR_LIM_H2O = 4.0
    MR_LIM_INF = 1.0e+08

    def __init__(self) -> None:
        super().__init__(self.NUM_GRAYS + 1)

        data = self.load_raw_data(self.__class__.__name__)
        data = np.asarray(data["data"]).reshape((-1, self.NUM_COEFS))

        self._parse_coefs(data)
        self._build_polynomials()

    # -----------------------------------------------------------------
    # Construction
    # -----------------------------------------------------------------

    def _parse_coefs(self, data):
        """ Retrieve coefficients from ranges of database. """
        self._cCoef = data[0:20]
        self._dCoef = data[20:24]
        self._bco2  = data[24:28]
        self._bh2o  = data[28:32]
        self._kco2  = data[32]
        self._kh2o  = data[33]

        shape = (self.NUM_GRAYS, self.NUM_COEFS, -1)
        self._cCoef = self._cCoef.reshape(shape)

    def _build_polynomials(self):
        # Parse `cCoef` and balance clear band.
        self._p_ccoefs = list(map(lambda c: list(map(Polynomial, c)), self._cCoef))
        self._p_ccoefs.insert(0, (1.0 - np.sum(self._p_ccoefs, axis=0)).tolist())

        # Parse `dCoef` and add zero-valued clear band.
        self._p_dcoefs = list(map(Polynomial, self._dCoef))
        self._p_dcoefs.insert(0, Polynomial([0]))

        def get_poly_spec(b):
            """ Parse species coefficients and balance clear band. """
            p = list(map(Polynomial, b))
            p.insert(0, 1.0 - sum(p))
            return p

        self._p_bco2 = get_poly_spec(self._bco2)
        self._p_bh2o = get_poly_spec(self._bh2o)

    # -----------------------------------------------------------------
    # Models
    # -----------------------------------------------------------------

    def _domain_h2o(self, iband, Mr, Tr, pfac, kabs, awts):
        """ Add modified contribution to H2O-rich mixtures. """
        f = (self.MR_LIM_INF - Mr) / (self.MR_LIM_INF - self.MR_LIM_H2O)
        kabs = self.relax(f, kabs, self._kh2o[iband] * pfac)
        awts = self.relax(f, awts, self._p_bh2o[iband](Tr))
        return kabs, awts

    def _domain_co2(self, iband, Mr, Tr, pfac, kabs, awts):
        """ Add modified contribution to CO2-rich mixtures. """
        f = (self.MR_LIM_CO2 - Mr) / self.MR_LIM_CO2
        kabs = self.relax(f, self._kco2[iband] * pfac, kabs)
        awts = self.relax(f, self._p_bco2[iband](Tr),  awts)
        return kabs, awts

    @staticmethod
    def _soot_contrib(T, fv):
        """ Evaluate contribution of soot volume fraction. """
        return 1817 * fv * T if fv > 0.0 else 0.0

    def _eval_band(self, iband, Ml, Mr, Tr, P_h2o, P_co2, fvsoot):
        """ Evaluate coefficients for a specific gray gas band. """
        kabs = self._p_dcoefs[iband](Mr) * (P_co2 + P_h2o)
        awts = Polynomial([p(Mr) for p in self._p_ccoefs[iband]])(Tr)

        if Ml < self.MR_LIM_CO2:
            kabs, awts = self._domain_co2(iband, Ml, Tr, P_co2, kabs, awts)

        if Ml > self.MR_LIM_H2O:
            kabs, awts = self._domain_h2o(iband, Ml, Tr, P_h2o, kabs, awts)

        kabs += self._soot_contrib(Tr * self.T_RED, fvsoot)

        self._kabs[iband] = kabs
        self._awts[iband] = awts

    def _eval_coefs(self, T, P_h2o, P_co2, fvsoot):
        """ Evaluate coefficients for the whole mixture. """
        Mr = P_h2o / (P_co2 + self.P_TOL)
        Ml = min(Mr, self.MR_LIM_INF)
        Mr = np.clip(Mr, self.MR_LIM_CO2, self.MR_LIM_H2O)
        Tr = np.clip(T, self.T_MIN, self.T_MAX) / self.T_RED

        for iband in range(self.NUM_GRAYS + 1):
            self._eval_band(iband, Ml, Mr, Tr, P_h2o, P_co2, fvsoot)

    # -----------------------------------------------------------------
    # API
    # -----------------------------------------------------------------

    def __call__(self, L: float, T: float, P: float, x_h2o: float,
                 x_co2: float, fvsoot: float = 0.0) -> float:
        """ Evaluate total emissivity of gas over path.

        Parameters
        ----------
        L: float
            Optical path for emissivity calculation [m].
        T: float
            Gas temperature [K].
        P: float
            Gas total pressure [Pa].
        x_h2o: float
            Mole fraction of water [-].
        x_co2: float
            Mole fraction of carbon dioxide [-]
        fvsoot: float
            Volume fraction soot [-].

        Returns
        -------
        float
            Total emissivity integrated over optical path.
        """
        P_atm = P / 101325
        P_h2o = P_atm * x_h2o
        P_co2 = P_atm * x_co2

        self._eval_coefs(T, P_h2o, P_co2, fvsoot)
        return self.emissivity((P_h2o + P_co2) * L)
#endregion: transport

#region: vision
CropTuple = tuple[Number, Number, Number, Number]


class ImageCrop:
    """ Defines a region of interest (ROI) for image cropping.

    Parameters
    ----------
    percentages : bool
        If True, the crop values are interpreted as percentages of image
        dimensions. If False, they are interpreted as pixel counts.
    left : int
        Number of pixels to crop from the left edge.
    bottom : int
        Number of pixels to crop from the bottom edge.
    right : int
        Number of pixels to crop from the right edge.
    top : int
        Number of pixels to crop from the top edge.
    """
    __slots__ = ("_percentages", "_left", "_bottom", "_right", "_top")

    def __init__(self, *, percentages: bool = False, left: int = 0,
                 bottom: int = 0, right: int = 0, top: int = 0) -> None:
        self._percentages = percentages
        self._left = left
        self._bottom = bottom
        self._right = right
        self._top = top

        if self._percentages:
            self._validate_percentages()

    def _validate_percentages(self):
        """ Validate the cropping parameters. """
        for side in (self._left, self._bottom, self._right, self._top):
            if not (0 <= side <= 50):
                raise ValueError("When using percentages, crop values "
                                 "must be between 0 and 50.")

    def get_coords(self, img: NDArray) -> tuple[int, int, int, int]:
        """ Get the cropping coordinates for the input image. """
        h, w = img.shape[0], img.shape[1]

        if self._percentages:
            y0 = int(h * self._top / 100)
            x0 = int(w * self._left / 100)
            y1 = h - int(h * self._bottom / 100)
            x1 = w - int(w * self._right / 100)
        else:
            y0 = self._top
            x0 = self._left
            y1 = h - self._bottom
            x1 = w - self._right

        if np.any(np.array([x0, x1, y0, y1]) < 0):
            raise ValueError("Negative index cropping not allowed")

        if x0 >= x1 or y0 >= y1:
            raise ValueError("Invalid cropping dimensions")

        return x0, y0, x1, y1

    def apply(self, img: NDArray) -> NDArray:
        """ Crop the input image according to the defined ROI. """
        x0, y0, x1, y1 = self.get_coords(img)
        return img[y0:y1, x0:x1]

    def to_dict(self) -> dict:
        """ Convert the cropping parameters to a dictionary. """
        return {
            "percentages": self._percentages,
            "left": self._left,
            "bottom": self._bottom,
            "right": self._right,
            "top": self._top
        }


class CropGuidesDisplay:
    """ Class to display crop guides on an image.

    Processing is performed in a copy of the original image to avoid
    modifying it. It is converted to uint8 and RGB if needed.

    Parameters
    ----------
    image : ndarray
        Input image on which to draw the guides.
    """
    __slots__ = ("_image", "_h", "_w")

    def __init__(self, image: NDArray) -> None:
        self._image = image.copy()

        if self._image.dtype in (np.float32, np.float64):
            self._image = (self._image * 255).astype(np.uint8)

        if len(self._image.shape) == 2:
            self._image = np.stack([self._image] * 3, axis=-1)

        self._h = self._image.shape[0]
        self._w = self._image.shape[1]

    def add_guides(self, **kwargs) -> NDArray:
        """ Draw guide lines at relevant coordinates of the image.

        Parameters
        ----------
        positions : list, optional
            List of percentages (0-100) indicating where to draw the guide
            lines. Default is [20, 40, 60, 80].
        depth_guide : int, optional
            Depth of the guide lines as a percentage of the image size.
            Default is 5.
        guide_thickness : int, optional
            Thickness of the guide lines. Default is 4.
        guide_color : tuple, optional
            Color of the guide lines in RGB format. Default is (0, 255, 0).
        """
        positions = kwargs.get("positions", [20, 40, 60, 80])
        depth     = kwargs.get("depth", 5)
        thick     = kwargs.get("thickness", 4)
        color     = kwargs.get("color", (0, 255, 0))

        tl = int(max(self._h, self._w) * depth / 100)

        for pct in positions:
            x_pos = int(self._w * pct / 100)
            y_pos = int(self._h * pct / 100)

            if 0 <= x_pos < self._w:
                slice_x = slice(x_pos, x_pos+thick)
                slice_t = slice(0, tl)
                slice_b = slice(self._h-tl, self._h)

                self._image[slice_t, slice_x] = color
                self._image[slice_b, slice_x] = color

            if 0 <= y_pos < self._h:
                slice_y = slice(y_pos, y_pos+thick)
                slice_l = slice(0, tl)
                slice_r = slice(self._w-tl, self._w)

                self._image[slice_y, slice_l] = color
                self._image[slice_y, slice_r] = color

        return self._image

    def add_crop_lines(self, sides: CropTuple, **kwargs) -> NDArray:
        """ Draw crop lines on the image for visualization.

        Parameters
        ----------
        sides : tuple
            Tuple of four numbers indicating the percentage to crop
            from each side in the order (top, bottom, left, right).
        crop_thickness : int, optional
            Thickness of the crop rectangle border. Default is 5.
        crop_color : tuple, optional
            Color of the crop rectangle border in RGB format.
            Default is (255, 0, 0).
        """
        thick = kwargs.get("thickness", 5)
        color = kwargs.get("color", (255, 0, 0))

        t, b, l, r = np.array(list(sides)) / 100

        t = int(self._h * (0 + t))
        b = int(self._h * (1 - b))

        l = int(self._w * (0 + l))
        r = int(self._w * (1 - r))

        self._image[t:t+thick, :] = color
        self._image[b-thick:b, :] = color
        self._image[:, l:l+thick] = color
        self._image[:, r-thick:r] = color

        return self._image

    @property
    def image(self) -> NDArray:
        """ Get the processed image with guides. """
        return self._image


class ChannelSelector(Enum):
    """ Enumeration for selecting image channels. """
    RED   = 0
    GREEN = 1
    BLUE  = 2
    GRAY  = -1

    def select(self, img: NDArray) -> NDArray:
        """ Select the appropriate channel from the input image. """
        match self:
            case ChannelSelector.GRAY:
                return color.rgb2gray(img)
            case _:
                return img[:, :, self.value]

    def load(self, fname: str | Path) -> NDArray:
        """ Load image from file selecting the appropriate channel. """
        match self:
            case ChannelSelector.GRAY:
                return skio.imread(fname, as_gray=True)
            case _:
                return skio.imread(fname)[:, :, self.value]

    def to_dict(self) -> dict:
        """ Convert the channel selector to a dictionary. """
        return {"channel": self.name, "index": self.value}

    @classmethod
    def names(cls) -> list[str]:
        """ Get the list of enumeration names. """
        return [entry.name for entry in cls]


class ContrastEnhancement(StrEnum):
    """ Enumeration for contrast enhancement methods. """
    NONE       = auto()
    ADAPTIVE   = auto()
    STRETCHING = auto()

    def _adaptive(self, img, *, nbins=256, **kw):
        return exposure.equalize_adapthist(img, nbins=nbins)

    def _stretching(self, img, *, percentiles=(2, 98), **kw) -> NDArray:
        in_range = tuple(np.percentile(img, percentiles))
        return exposure.rescale_intensity(img, in_range=in_range)

    def apply(self, img: NDArray, **kw) -> NDArray:
        """ Apply contrast enhancement to the input image. """
        match self:
            case ContrastEnhancement.NONE:
                pass
            case ContrastEnhancement.ADAPTIVE:
                img = self._adaptive(img, **kw)
            case ContrastEnhancement.STRETCHING:
                img = self._stretching(img, **kw)

        return img

    @classmethod
    def names(cls) -> list[str]:
        """ Get the list of enumeration names. """
        return [entry.name for entry in cls]


class ThresholdImage(StrEnum):
    """ Enumeration for image thresholding methods. """
    MANUAL = auto()
    OTSU   = auto()

    # NOTE: we intentionally don't define a `verbose` attribute here because
    # attributes in Enum bodies become enum members. Instead we provide a
    # class-controlled verbosity flag `_verbose` (set after the class
    # definition) with accessors below. This keeps verbosity out of the
    # enumeration members while allowing run-time control.

    @classmethod
    def get_verbose(cls) -> bool:
        """ Return the class-level verbosity flag for ThresholdImage. """
        return bool(getattr(cls, "_verbose", False))

    @classmethod
    def set_verbose(cls, value: bool) -> None:
        """ Set the class-level verbosity flag for ThresholdImage. """
        cls._verbose = bool(value)

    def _manual(self, img: NDArray, threshold: float) -> NDArray:
        mask = np.ones_like(img, dtype=np.uint8)
        mask[img < threshold] = 0
        return mask

    def _otsu(self, img: NDArray) -> NDArray:
        threshold = filters.threshold_otsu(img)

        if type(self).get_verbose():
            print(f"OTSU threshold: {threshold:.4f}")

        return img > threshold

    def apply(self, img: NDArray, **kw) -> NDArray:
        """ Apply thresholding to the input image. """
        match self:
            case ThresholdImage.MANUAL:
                img = self._manual(img, kw.get("threshold", 0.0))
            case ThresholdImage.OTSU:
                img = self._otsu(img)

        return img

    @classmethod
    def names(cls) -> list[str]:
        """ Get the list of enumeration names. """
        return [entry.name for entry in cls]


class LabelizeRegions:
    """ Label connected regions in a binary mask and extract contours.

    Parameters
    ----------
    mask : ndarray
        Binary mask where regions of interest are marked as 1.
    clean_border : bool, optional
        Whether to remove objects touching the border, by default True.
    max_size : int | None, optional
        Remove objects whose contiguous area (or volume, in N-D) contains
        this number of pixels or fewer. See `remove_small_objects` in
        `skimage.morphology` for details.
    max_ratio : float | None, optional
        Remove elongated objects based on their eccentricity. Objects with
        eccentricity above the threshold corresponding to this ratio will
        be removed. For example, a max_ratio of 10 corresponds to an
        eccentricity threshold of sqrt(1 - (1/10)^2) ≈ 0.995.
    """
    __slots__ = ("_mask", "_labels", "_contours", "_regions", "_table")

    def __init__(self,
            mask: NDArray,
            clean_border: bool = True,
            max_size: int | None = None,
            max_ratio: float | None = None,
            properties: list[str] | None = None
        ) -> None:
        labels = measure.label((1 - mask).astype(np.uint8))

        if clean_border:
            labels = segmentation.clear_border(labels)

        if max_size is not None and max_size > 0:
            labels = morphology.remove_small_objects(labels, max_size)

        self._mask = mask.copy()
        self._labels = labels
        self._regions = measure.regionprops(labels)

        if max_ratio is not None and max_ratio > 1.0:
            self._remove_elongated(max_ratio)
            labels = self._labels

        self._contours = measure.find_contours(labels, level=0.5)

        if properties is not None:
            table = measure.regionprops_table(labels, properties=properties)
            self._table = pd.DataFrame(table)

    def _remove_elongated(self, max_ratio: float) -> None:
        """ Remove elongated objects based on their eccentricity. """
        eccentricity = np.sqrt(1 - (1/max_ratio)**2)

        for region in self._regions:
            if region.eccentricity > eccentricity:
                self._labels[self._labels == region.label] = 0

    @property
    def table(self) -> pd.DataFrame:
        """ Get the table of region properties. """
        if not hasattr(self, "_table"):
            raise AttributeError("No properties table available. "
                                 "Specify 'properties' parameter "
                                 "when instantiating the class.")
        return self._table

    def overlay_contours(self,
            image: NDArray | None = None,
            *,
            color: tuple[int, int, int] = (255, 0, 0),
            width: int = 2
        ) -> Image.Image:
        """ Overlay contours on the input image.

        Parameters
        ----------
        image : ndarray | None, optional
            Image on which to overlay the contours. If None, uses the
            internal mask, by default None.
        color : tuple, optional
            Color of the contour lines, by default (255, 0, 0).
        width : int, optional
            Width of the contour lines, by default 2.
        """
        if image is None:
            image = self._mask

        tmp = skutil.img_as_ubyte(image)
        tmp = Image.fromarray(tmp)
        tmp = tmp.convert("RGB")

        draw = ImageDraw.Draw(tmp)

        for contour in self._contours:
            # Convert (row, col) to (x, y) and to tuples
            points = [tuple(point[::-1]) for point in contour]
            draw.line(points, fill=color, width=width)

        return tmp


class HelpersFFT:
    """ Helper methods for FFT-based analysis. """
    @staticmethod
    def wavenumber_axis(N, L):
        """ Compute the cycles per unit length wavenumber axis. """
        return np.fft.fftshift(np.fft.fftfreq(N, d=L/N))

    @staticmethod
    def wavenumber_axes(Nx, Ny, Lx, Ly):
        """ Compute the cycles per unit length wavenumber axes. """
        kx = HelpersFFT.wavenumber_axis(Nx, Lx)
        ky = HelpersFFT.wavenumber_axis(Ny, Ly)
        return kx, ky

    @staticmethod
    def wavenumber_grid(Nx, Ny, Lx, Ly):
        """ Compute the cycles per unit length wavenumber grid. """
        kx, ky = HelpersFFT.wavenumber_axes(Nx, Ny, Lx, Ly)
        KX, KY = np.meshgrid(kx, ky)
        return np.sqrt(KX**2 + KY**2)

    @MajordomePlot.new(grid=False)
    @staticmethod
    def plot_spectrum2d(P: NDArray, Nx: int, Ny: int, Lx: float, Ly: float,
                        vstep: int = 2, *, plot: MajordomePlot):
        """ Plot a 2D power spectrum with proper calibration. """
        vmin, vmax = bounds(P)
        wx, wy = HelpersFFT.wavenumber_axes(Nx, Ny, Lx, Ly)

        ticks = np.round(np.arange(vmin, vmax + vstep / 2, vstep))
        extent = (wx.min(), wx.max(), wy.min(), wy.max())

        fig, ax = plot.subplots()
        im = ax[0].imshow(P, cmap="gray", extent=extent)

        ax[0].set_title("FFT Spectrum")
        ax[0].set_xlabel("Horizontal spatial frequency (1 / µm)")
        ax[0].set_ylabel("Vertical spatial frequency (1 / µm)")

        cbar = fig.colorbar(im, ax=ax[0], shrink=0.95)
        cbar.set_label("Power spectral density", rotation=270, labelpad=15)
        cbar.set_ticks(ticks)
        cbar.ax.yaxis.set_major_formatter(PowerFormatter())


class AbstractSEMImageLoader(ABC):
    @property
    def dimensions(self) -> NDArray:
        """ Get the image dimensions in micrometers. """
        return self.pixel_size * np.array(self.shape)

    @property
    @abstractmethod
    def shape(self) -> tuple[int, int]:
        """ Get the image shape as (height, width). """
        pass

    @property
    @abstractmethod
    def pixel_size(self) -> float:
        """ Pixel size in micrometers. """
        pass

    @property
    @abstractmethod
    def data(self) -> NDArray:
        """ Get the image data as a NumPy array. """
        pass

    @data.setter
    @abstractmethod
    def data(self, value: NDArray) -> None:
        """ Set the image data from a NumPy array. """
        pass

    @abstractmethod
    def view(self, **kwargs):
        """ Plot the image with optional scalebar and title. """
        pass


class HyperSpySEMImageLoaderStub(AbstractSEMImageLoader):
    """ Base SEM image loader using HyperSpy."""
    __slots__ = ("__original", "_image", "_pixel_size", "_title")

    def __init__(self, filepath: Path) -> None:
        super().__init__()

        # Load image that will remain unmodified:
        self.__original = hs_load(filepath)

        # Create empty slots for inheritors:
        self._image = Signal2D([[], []])
        self._pixel_size = -1.0
        self._title = ""

    @property
    def original(self):
        """ Original unmodified image. """
        return self.__original

    @property
    def handle(self) -> Signal2D:
        """ Access to internal image. """
        return self._image

    @property
    def shape(self) -> tuple[int, int]:
        """ Get the image shape as (height, width). """
        return self._image.data.shape[:2]

    @property
    def pixel_size(self) -> float:
        """ Pixel size (in micrometers). """
        return self._pixel_size

    @property
    def data(self) -> NDArray:
        """ Get the image data as a NumPy array. """
        return np.array(self._image.data)

    @data.setter
    def data(self, value: NDArray) -> None:
        """ Set the image data from a NumPy array. """
        self._image.data = value

    def view(self, **kwargs) -> Figure:
        """ Plot the image with optional scalebar and title. """
        kwargs.setdefault("backend", "matplotlib")
        kwargs.setdefault("title", self._title)

        kwargs.setdefault("scalebar", False)
        kwargs.setdefault("scalebar_color", "#0000ff")
        kwargs.setdefault("axes_off", True)
        kwargs.setdefault("colorbar", False)

        plt.close("all")

        if kwargs.pop("backend") == "matplotlib":
            fig, ax = plt.subplots(
                figsize=kwargs.pop("figsize", (8, 6)),
                facecolor=kwargs.pop("facecolor", "white")
            )
            ax.imshow(self._image.data, cmap="gray")
            ax.set_title(kwargs.pop("title", ""))
            ax.axis("off")
        else:
            self._image.plot(**kwargs)
            fig = plt.gcf()
            fig.patch.set_facecolor("white")

        if kwargs.pop("show", False):
            plt.show()

        return fig

    def fft(self, window=True) -> NDArray:
        """ Perform FFT of internal image instance. """
        return self._image.fft(shift=True, apodization=window).data

    def spectrum_plot(self, window=True, vstep=2):
        """ Plot the power spectrum of the internal image. """
        """ Plot the FFT spectrum with proper calibration. """
        (Nx, Ny), (Lx, Ly) = self.shape, self.dimensions
        F = self._image.fft(shift=True, apodization=window)
        P = np.log10(np.abs(F.data)**2)
        return HelpersFFT.plot_spectrum2d(P, Nx, Ny, Lx, Ly, vstep=vstep)


class CharacteristicLengthSEMImage:
    """" Compute the characteristic length of a 2D field through FFT. """
    __slots__ = ("_k_centers", "_spectrum", "_length", "_table")

    def __init__(self, f: AbstractSEMImageLoader, **kwargs) -> None:
        nbins = kwargs.pop("nbins", 200)
        window = kwargs.pop("window", True)

        Lx, Ly = f.dimensions
        Ny, Nx = f.shape

        P = self.power_spectrum(f, Nx, Ny, window)
        K = HelpersFFT.wavenumber_grid(Nx, Ny, Lx, Ly)
        k, E = self.radial_binarization(P, K, nbins)

        self._k_centers = k
        self._spectrum  = E

    @staticmethod
    def fft(f, Nx, Ny, window):
        """ Compute the FFT of the field with possible apodization. """
        if hasattr(f, "fft"):
            return f.fft(window)

        if window:
            # Apply a 2D (cosine) Hann window to the field f.
            wx = 0.5 * (1 - np.cos(2 * np.pi * np.arange(Nx) / Nx))
            wy = 0.5 * (1 - np.cos(2 * np.pi * np.arange(Ny) / Ny))
            f = f * np.outer(wy, wx)

        return np.fft.fftshift(np.fft.fft2(f))

    def power_spectrum(self, f, Nx, Ny, window):
        """ Compute the power spectrum of the field f. """
        return np.abs(self.fft(f, Nx, Ny, window))**2

    def wavenumber_grid(self, Nx, Ny, Lx, Ly):
        """ Compute the cycles per unit length wavenumber grid. """
        kx = np.fft.fftshift(np.fft.fftfreq(Nx, d=Lx/Nx))
        ky = np.fft.fftshift(np.fft.fftfreq(Ny, d=Ly/Ny))

        KX, KY = np.meshgrid(kx, ky)
        return np.sqrt(KX**2 + KY**2)

    def radial_binarization(self, P, K, nbins):
        """ Digitize the wavenumber grid into radial bins. """
        k_bins = np.linspace(0, K.max(), nbins+1)
        k = 0.5 * (k_bins[:-1] + k_bins[1:])

        # Digitize all points at once
        idx = np.digitize(K.ravel(), k_bins)

        # Vectorized radial average
        E = np.zeros(nbins, dtype=P.dtype)

        for i in range(1, nbins+1):
            mask = (idx == i)
            if np.any(mask):
                E[i-1] = P.ravel()[mask].mean()

        return k, E

    @property
    def characteristic_length(self):
        """ Retrieve characteristic length from the spectrum. """
        if not hasattr(self, "_length"):
            # Skip zero-frequency bin:
            i_peak = np.argmax(self._spectrum[1:]) + 1
            k_peak = self._k_centers[i_peak]
            self._length = 1.0 / k_peak

        return self._length

    @property
    def table(self) -> pd.DataFrame:
        """ Retrieve the computed spectrum as a pandas DataFrame. """
        if not hasattr(self, "_table"):
            # Retrieve the data:
            x = self._k_centers.copy()
            y = self._spectrum.copy()

            # Normalize y to have area = 1 under the curve (PDF) and compute the
            # cumulative distribution function (CDF); notice that we actually
            # evaluate 1-CDF because of plotting in physical (length) space:
            pdf = y / simpson(y, x=x)
            cdf = 1 - cumulative_simpson(pdf, x=x, initial=0)
            z = 1 / x

            self._table = pd.DataFrame({
                "Wavenumber (1/µm)": x,
                "Power Spectrum": y,
                "Length (µm)": z,
                "PDF": pdf,
                "CDF": cdf
            })

        return self._table

    @MajordomePlot.new(shape=(2, 1), size=(6, 9))
    def _plot_spectrum_full(self, *, plot, cutoff=None):
        """ Plot the power spectrum and indicate characteristic length. """
        table = self.table
        z = table["Length (µm)"].to_numpy()
        cdf = table["CDF"].to_numpy()
        pdf = table["PDF"].to_numpy()

        mean = self.characteristic_length
        label = f"Characteristic length: {mean:.2f} µm"

        fig, ax = plot.subplots()

        ax[0].plot(z, cdf)
        ax[1].plot(z, pdf)

        if cutoff is not None and cutoff > 0 and cutoff < z.max():
            ax[0].set_xlim(0, cutoff)

        ax[0].set_ylabel("CDF")
        ax[1].set_ylabel("PDF")
        ax[0].set_xlabel("Length [µm]")
        ax[1].set_xlabel("Length [µm]")

        conf = dict(color="red", linestyle="--", label=label)
        ax[0].axvline(mean, **conf)
        ax[1].axvline(mean, **conf)

        ax[0].legend(loc="best", fontsize=9)
        ax[1].legend(loc="best", fontsize=9)

    @MajordomePlot.new(shape=(1, 1), size=(6, 5))
    def _plot_spectrum_density(self, *, plot, cutoff=None):
        """ Plot the power spectrum and indicate characteristic length. """
        table = self.table
        z = table["Length (µm)"].to_numpy()
        pdf = table["PDF"].to_numpy()

        mean = self.characteristic_length
        label = f"Characteristic length: {mean:.2f} µm"

        fig, ax = plot.subplots()

        ax[0].plot(z, pdf)

        if cutoff is not None and cutoff > 0 and cutoff < z.max():
            ax[0].set_xlim(0, cutoff)

        ax[0].set_ylabel("PDF")
        ax[0].set_xlabel("Length [µm]")

        conf = dict(color="red", linestyle="--", label=label)
        ax[0].axvline(mean, **conf)

        ax[0].legend(loc="best", fontsize=9)

    def plot_spectrum(self, full: bool = False, cutoff: float | None = None):
        """ Plot the characteristic length spectrum.

        Parameters
        ----------
        full : bool = True
            If True, plot both PDF and CDF. If False, plot only PDF.
        cutoff : float | None = None
            If provided, limit the x-axis to [0, cutoff].
        """
        if full:
            return self._plot_spectrum_full(cutoff=cutoff)

        return self._plot_spectrum_density(cutoff=cutoff)


def load_metadata(fname: Path, backend: str = "HS"):
    """ Wrap metadata loading for readability of constructor.

    Parameters
    ----------
    fname: Path
        Path to the file to be parsed.
    backend: str = "HS"
        Data extraction backend. Supports "HS" for HyperSpy, "PIL" for
        PIL, and "EXIFREAD" for exifread packages.
    """
    match backend.upper():
        case "HS":
            return hs_load(fname).original_metadata
        case "PIL":
            return metadata_pil(fname)
        case "EXIFREAD":
            return metadata_exifread(fname)
        case _:
            raise ValueError(f"Unknown backend '{backend}', currently"
                             f"available: HS, PIL, EXIFREAD")


def metadata_exifread(fname: Path) -> dict:
    """ Extract metadata using exifread package. """
    with open(fname, "rb") as reader:
        exif_data = {k:v for k, v in exifread.process_file(reader).items()}

    return exif_data


def metadata_pil(fname: Path) -> dict:
    """ Extract metadata using PIL.Image package. """
    with Image.open(fname) as img:
        # XXX: using more complete private method!
        data = img._getexif()
        exif_data = {}

        for tag_id, value in data.items():
            exif_data[ExifTags.TAGS.get(tag_id, tag_id)] = value

    if "GPSInfo" in exif_data:
        data = exif_data["GPSInfo"]
        gps = {ExifTags.GPSTAGS.get(k, k): v for k, v in data.items()}
        exif_data["GPSInfo"] = gps

    return exif_data


def hyperspy_rgb_to_numpy(image: Signal2D, dtype=np.float32) -> NDArray:
    """ Handle conversion of image into a plain NumPy array. """
    if not image.data.dtype.names:
        return image.data.astype(np.float32)

    r = image.data["R"].astype(np.float32)
    g = image.data["G"].astype(np.float32)
    b = image.data["B"].astype(np.float32)

    return np.stack([r, g, b], axis=-1)
#endregion: vision
