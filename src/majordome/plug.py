# -*- coding: utf-8 -*-
import cantera as ct
import numpy as np


class PlugFlowChainCantera:
    """ Plug-flow reactor as a chain of 0-D reactors with Cantera. """
    def __init__(self, mechanism: str, K: float = 1.0) -> None:
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
        conf = dict(A=1.0, K=None, U=None, Q=0.0, velocity=0.0)
        self._w_world = ct.Wall(self._r_content, self._r_outflow, **conf)

        # Connect chain of reactors:
        self._mfc = ct.MassFlowController(self._r_sources, self._r_content)
        self._vlv = ct.Valve(self._r_content, self._r_outflow, K=K)

        # Setup reactor network:
        self._net = ct.ReactorNet([self._r_content])
        self._net.initialize()

        # Create array of states for results:
        extra = ["z", "V"]
        thermo = self._r_content.thermo
        self._states = ct.SolutionArray(thermo, extra=extra)

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

    def _store(self, n_slice, z, V):
        """ Store current state of tracked reactor. """
        if n_slice >= self._states.shape[0]:
            self._states.append(T = self._r_content.thermo.T,
                                P = self._r_content.thermo.P,
                                Y = self._r_content.thermo.Y,
                                z = z, V = V)
        else:
            self._states[n_slice].HPY = self._r_content.thermo.HPY

    def _guess(self, n_slice, qty_next) -> ct.Quantity:
        """ Guess next state based on previous one. """
        if n_slice < self._states.shape[0]:
            return self._states[n_slice].HPY

        return qty_next.HPY

    def _step(self, hpy_reac, qty_next, V, Q, **opts):
        """ Advance reactor to steady state with given inflow. """
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

        # Reinitialize reactor network and advance to steady state:
        self._net.reinitialize()
        self._net.advance_to_steady_state(**opts)

        # Return new quantity for next iteration:
        return ct.Quantity(self._r_content.thermo, mass=qty_next.mass)

    def loop(self, zc, Vc, m1, mh, mY, Q=None, **opts):
        """ Loop over the slices of the plug-flow reactor. """
        qty_prev = None
        Qs = np.zeros_like(Vc) if Q is None else Q

        for n_slice in range(zc.shape[0]):
            z = zc[n_slice]
            V = Vc[n_slice]
            q = Qs[n_slice]

            m, h, Y = -1.0, None, None

            # TODO these should be provided already as m, h, Y!
            if (m := m1[n_slice]) > 0:
                m = m1[n_slice]
                h = mh[n_slice] / m
                Y = mY[n_slice] / m

            try:
                qty_next = self._inflow(m, h, Y, qty_prev)
                hpy_reac = self._guess(n_slice, qty_next)
                qty_prev = self._step(hpy_reac, qty_next, V, q, **opts)
                self._store(n_slice, z, V)
            except Exception as err:
                # TODO: make equilibrate solution? Find a fallback!
                raise RuntimeError(f"While in slice {n_slice}:\n{err}")
