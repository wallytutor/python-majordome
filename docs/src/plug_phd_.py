# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.17.3
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# # Acetylene pyrolysis

# %load_ext autoreload
# %autoreload 2

# +
from majordome import (
    StabilizeNvarsConvergenceCheck,
    NormalFlowRate,
    PlugFlowChainCantera,
    get_reactor_data,
)

from tabulate import tabulate
import logging
import cantera as ct
import numpy as np


# -

# ## Toolbox

# +
class AcetylenePyrolysisReactor:
    """ Simulate a plug-flow reactor for acetylene pyrolysis. """
    def __init__(self, L = 0.60, D = 0.028, d = 0.002):
        self._D = D
        self._A_cell = d * np.pi * D
        self._V_cell = d * np.pi * (D/2)**2
        
        self._z = self._dicretize_length(L, d)
        self._V = np.full_like(self._z, self._V_cell)
    
    @staticmethod
    def _mass_flow(mechanism, X, qdot, verbose=True):
        """ Evaluate mass flow rate from mechanism. """
        nfr = NormalFlowRate(mechanism, X=X)
        qdot *= 1.0e-06 * 60  # SCCM to Nm³/h

        if verbose:
            print(nfr.report(qdot=qdot))

        return nfr(qdot)

    @staticmethod
    def _mixture(sol, fraction):
        """ Compute mixture accounting for imputiries. """
        if "CH3COCH3" in sol.species_names:
            X = {"C2H2"     : 0.980 * fraction,
                 "CH4"      : 0.002 * fraction,
                 "CH3COCH3" : 0.018 * fraction}
        else:
            X = {"C2H2"     : 0.998 * fraction,
                 "CH4"      : 0.002 * fraction}
            
        X["N2"] = 1.0 - sum(X.values())
        return X
    
    @staticmethod
    def _dicretize_length(L, dL):
        """ Discretize length L in cells of length `dL`. """
        return np.arange(dL/2, L-dL/2+0.1*dL, dL)

    def _global_htc(self, k, Nu):
        """ Evaluate global heat transfer coefficient. """
        return self._A_cell * Nu * k / self._D

    def solve(self, mechanism, fraction, qdot, P, T_wall,
              T_env=298.15, K=0.01, Nu=3.66):
        """ Integrate reactor model with given operating conditions. """
        sol = ct.Solution(mechanism)
        sol.TPX = T_env, P, self._mixture(sol, fraction)

        reactor = PlugFlowChainCantera(sol.source, sol.name, self._z,
                                       self._V, P=P, K=K)
        
        sources = get_reactor_data(reactor)
        sources.m[0] = self._mass_flow(mechanism, sol.X, qdot)
        sources.h[0] = sol.h
        sources.Y[0, :] = sol.Y
        sources.Q[:] = 0
        
        def heat_flow(i, T):
            # Select cold/hot zones.
            Tw = T_wall if 0.1 < self._z[i] < 0.5 else 300
            k = reactor.contents.thermal_conductivity
            return -self._global_htc(k, Nu) * (T - Tw)
    
        reactor.register_heat_flow(heat_flow)
        reactor.update(sources)
        return reactor

def plot_reactor(reactor):
    config = dict(composition_variable="X", y_label="Mole fraction")
    plot = reactor.quick_plot(selected=["C2H2"], **config)
    plot.axes[0].legend(loc=3)

def tabulate(reactor, cols=["z_cell", "Q_cell", "T", "X"]):
    """ Retrieve solution as a pandas.DataFrame. """
    return reactor.states.to_pandas(cols=cols)


# -

# ## Reference case

def solve_case(mech, T_wall = 1173.15, P = 5000, qdot = 222, f = 0.36):
    sim = AcetylenePyrolysisReactor(L, D, d)
    return sim.solve(mech, f, qdot, P, T_wall)


mechs = ["c2h2/dalmazsi-2017.yaml", "c2h2/graf-2007.yaml"]

# %%time
reactor = solve_case(mechs[0], T_wall = 1173.15, P = 5000, qdot = 222, f = 0.36)

plot_reactor(reactor)

# %%time
reactor = solve_case(mechs[1], T_wall = 1173.15, P = 5000, qdot = 222, f = 0.36)

plot_reactor(reactor)

df = tabulate(reactor)
df.head().T

df["X_C2H2"].iloc[-1]
