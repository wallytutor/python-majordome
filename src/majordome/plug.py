# -*- coding: utf-8 -*-
import warnings
import cantera as ct
import numpy as np
import pandas as pd


class PlugFlowChainCantera:
    """ Plug-flow reactor as a chain of 0-D reactors with Cantera. """
    def __init__(self, mechanism: str, z: np.ndarray, V: np.ndarray,
                 K: float = 1.0) -> None:
        # Store coordinates and volume of slices:
        self._z = z
        self._V = V
        self._Q = np.zeros_like(self._z)

        # Create solutions from compatible mechanism:
        self._f_sources = ct.Solution(mechanism, basis="mass")
        self._f_content = ct.Solution(mechanism, basis="mass")
        self._f_outflow = ct.Solution(mechanism, basis="mass")

        # Create reactors and reservoirs for system:
        self._r_sources = ct.Reservoir(self._f_sources)
        self._r_content = ct.IdealGasReactor(self._f_content)
        self._r_outflow = ct.Reservoir(self._f_outflow)

        # Connect the reactor to the *world* (unit area wall). Notice
        # that imposing `A=1.0` means that when setting up the heat flux
        # that value is identical to the absolute integral exchange.
        conf = dict(A=1.0, K=0.0, U=0.0, Q=0.0, velocity=0.0)
        self._w_world = ct.Wall(self._r_content, self._r_outflow, **conf)

        # Connect chain of reactors:
        self._mfc = ct.MassFlowController(self._r_sources, self._r_content)
        self._vlv = ct.Valve(self._r_content, self._r_outflow, K=K)

        # Setup reactor network:
        self._net = ct.ReactorNet([self._r_content])
        self._net.max_time_step = 0.1
        self._net.initialize()

        # Create array of states for results:
        extra = {"z_cell": z, "V_cell": V, "Q_cell": self._Q, "m_cell": 0.0}
        self._states = ct.SolutionArray(self._r_content.thermo,
                                        shape = (z.shape[0],),
                                        extra = extra)

        # Flag if (previous) solution is available:
        self._has_solution = False

    def _source(self, m, h, Y) -> ct.Quantity | None:
        """ Update source if any flow is available. """
        if m <= 0.0:
            return None

        self._f_sources.HPY = h, None, Y
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

    def _guess(self, n_slice, qty_next) -> ct.Quantity:
        """ Guess next state based on previous one. """
        if self._has_solution:
            return self._states[n_slice].HPY
        return qty_next.HPY

    def _prepare(self, hpy_reac, qty_next, V, Q) -> None:
        """ Prepare reactor for next iteration. """
        # Modify volume of reactor:
        self._r_content.volume = V

        # Prepare source for next injection:
        self._f_sources.HPY = qty_next.HPY
        self._r_sources.syncState()

        # Apply total external external exchanges:
        self._w_world.heat_flux = Q

        # State current reactor close to inlet or previous state:
        self._f_content.HPY = hpy_reac
        self._r_content.syncState()

        # Update injection mass flow:
        self._mfc.mass_flow_rate = qty_next.mass

    def _fallback(self,  hpy_reac, qty_next, V, Q, **opts):
        """ Alternative approach to advance reactor to steady state. """
        self._prepare(hpy_reac, qty_next, V, Q)

        # Get time scale for approaching steady-state:
        tau = opts.get("t_mult", 100) * self._r_content.mass / qty_next.mass
        warnings.warn(f"Fall-back solution with tau={tau:.2f} s")

        self._net.reinitialize()
        self._net.advance(self._net.time + tau)

    def _step(self, hpy_reac, qty_next, V, Q, **opts):
        """ Advance reactor to steady state with given inflow. """
        self._prepare(hpy_reac, qty_next, V, Q)

        # Reinitialize reactor network and advance to steady state:
        self._net.reinitialize()
        self._net.advance_to_steady_state(
            max_steps = opts.get("max_step", 10000),
            residual_threshold = opts.get("residual_threshold", 0),
            atol = opts.get("atol", 0.0),
            return_residuals = False
        )

    def _next_quantity(self, mass) -> ct.Quantity:
        """ Compute quantity to be used as source in next step. """
        return ct.Quantity(self._r_content.thermo, mass=mass)

    def _ensure_solution(self):
        """ Ensure that a solution is available. """
        if not self._has_solution:
            raise RuntimeError("No solution available, run `loop` first!")

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

        for n_slice in range(self._z.shape[0]):
            V = self._V[n_slice]
            q = self._Q[n_slice]

            m = m_source[n_slice]
            h = h_source[n_slice]
            Y = Y_source[n_slice]

            qty_next = self._inflow(m, h, Y, qty_prev)
            hpy_reac = self._guess(n_slice, qty_next)

            try:
                self._step(hpy_reac, qty_next, V, q, **opts)
            except Exception as err:
                # TODO: if fail, force equilibrium? Find another fallback!
                warnings.warn(f"While in slice {n_slice}:\n{err}")
                self._fallback(hpy_reac, qty_next, V, q, **opts)

            qty_prev = self._next_quantity(qty_next.mass)
            self._store(n_slice)

            if save_history:
                stats.append(self._net.solver_stats)

        self._has_solution = True
        return None if not save_history else pd.DataFrame(stats)

    @property
    def n_species(self) -> int:
        """ Number of species in mechanism. """
        return self._f_content.n_species
    
    @property
    def states(self) -> ct.SolutionArray:
        """ Provides access to the states of the reactor. """
        self._ensure_solution()
        return self._states

    @property
    def network(self) -> ct.ReactorNet:
        """ Provides access to the reactor network. """
        return self._net
