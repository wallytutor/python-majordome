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

from majordome import (
    NormalFlowRate,
    PlugFlowChainCantera,
    get_reactor_data,
)
import cantera as ct
import numpy as np
import pandas as pd


# ## Toolbox

class AcetylenePyrolysisReactor:
    """ Simulate a plug-flow reactor for acetylene pyrolysis. """
    def __init__(self, L = 0.60, D = 0.028, d = 0.002):
        self._D = D
        self._A_cell = d * np.pi * D
        self._V_cell = d * np.pi * (D/2)**2
        
        self._z = self._dicretize_length(L, d)
        self._V = np.full_like(self._z, self._V_cell)
    
    @staticmethod
    def _mass_flow(mechanism, X, qdot, verbose):
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
              T_env=298.15, K=0.01, Nu=3.66, verbose=False):
        """ Integrate reactor model with given operating conditions. """
        sol = ct.Solution(mechanism)
        sol.TPX = T_env, 100*P, self._mixture(sol, fraction)

        mdot = self._mass_flow(mechanism, sol.X, qdot, verbose)
        reactor = PlugFlowChainCantera(sol.source, sol.name, self._z,
                                       self._V, P=sol.P, K=K)

        sources = get_reactor_data(reactor)
        sources.m[0] = mdot
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


# +
MECHS = ["c2h2/dalmazsi-2017.yaml",
         "c2h2/graf-2007.yaml"]

TABLE5_9 = [
    dict(N= 1, P= 50, Q=222, T= 773),
    dict(N= 2, P= 50, Q=222, T= 873),
    dict(N= 3, P= 50, Q=222, T= 973),
    dict(N= 4, P= 50, Q=222, T=1073),
    dict(N= 5, P= 50, Q=222, T=1123),
    dict(N= 6, P= 50, Q=222, T=1173),
    dict(N= 7, P= 50, Q=222, T=1273),
    dict(N= 8, P= 30, Q=222, T=1173),
    dict(N= 9, P= 30, Q=222, T=1223),
    dict(N=10, P=100, Q=222, T=1173),
    dict(N=11, P=100, Q=222, T=1223),
    dict(N=12, P=100, Q=222, T=1273),
    dict(N=13, P=100, Q=378, T=1023),
    dict(N=14, P=100, Q=378, T=1123),
]

def solve_case(mech, P=50, Q=222, T=1173.15, f=0.36, **kwargs):
    reactor = AcetylenePyrolysisReactor()
    results = reactor.solve(mech, f, Q, P, T)

    cols = kwargs.get("cols", ["z_cell", "Q_cell", "T", "X"])
    return results, results.states.to_pandas(cols=cols)
    
def plot_reactor(reactor):
    config = dict(composition_variable="X", y_label="Mole fraction")
    plot = reactor.quick_plot(selected=["C2H2"], **config)
    plot.axes[0].legend(loc=3)

def scan_with_mech(mech):
    table = TABLE5_9.copy()
    for k, row in enumerate(TABLE5_9):
        print(f"Working on case no. {k+1}")
        reactor, df = solve_case(mech, **row)
        table[k]["X"] = float(df["X_C2H2"].iloc[-1])
    
    return pd.DataFrame(table)


# -

# ## Reference case

# %%time
results, df = solve_case(MECHS[0], P=50, Q=222, T=1173.15, f=0.36)
plot_reactor(results)

# %%time
results, df = solve_case(MECHS[1], P=50, Q=222, T=1173.15, f=0.36)
plot_reactor(results)

# ## Scan table

# %%time
scan_mech0 = scan_with_mech(MECHS[0])

scan_mech0

# %%time
scan_mech1 = scan_with_mech(MECHS[1])

scan_mech1
