# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.17.2
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %% [markdown]
# # Reactor models

# %%
# %load_ext autoreload
# %autoreload 2

# %%
from majordome.common import RelaxUpdate
from majordome.common import standard_plot
from majordome.plug import PlugFlowChainCantera
from majordome.plug import get_reactor_data
from tabulate import tabulate
import cantera as ct
import numpy as np


# %% [markdown]
# ## Single plug-flow reactor

# %%
class ReactorModel:
    """ Wrapper model for creation of a plug flow reactor. """
    def __init__(self, z, V):       
        self.solution = sol = ct.Solution("airish.yaml", "air")
        self.reactor  = PlugFlowChainCantera(sol.source, sol.name, z, V)
        self.source   = get_reactor_data(self.reactor)


# %%
def add_source(model, *, where, m, T, X):
    """ Set axial source terms along reactor. """
    model.solution.TPX = T, None, X
    model.source.m[where] = m
    model.source.h[where] = model.solution.h
    model.source.Y[where, :] = model.solution.Y


# %%
def solve_reactor(model, report=True):
    """ Solve reactor model with provided source terms. """
    model.reactor.update(model.source)

    if report:
        print(tabulate([
            ("Total mass flow rate", "g/s", 1000*model.source.m.sum()),
            ("Total external power", "W",   model.source.Q.sum()),
            ("Final temperature ",   "K",   model.reactor.states.T[-1]),
        ], tablefmt="github"))


# %%
l = 0.001
z = np.arange(l/2, 1.0-l/2+0.1*l, l)
V = np.full_like(z, np.pi * 0.05**2 * l)

dilute = slice(np.argmax(z > 0.15), np.argmax(z > 0.40))

Q = 100_000 * l * (1 - np.exp(-z / 0.3))
Q[z > z[-1]/2] = 0

model = ReactorModel(z, V)
model.source.Q[:] = Q

add_source(model, where=0,      m=0.05,  T=300, X="N2: 0.79, O2: 0.21")
add_source(model, where=dilute, m=1.0*l, T=300, X="AR: 1")

solve_reactor(model)

# %%
model.reactor.states.to_pandas().head().T

# %%
model.reactor.quick_plot().resize(8, 6)

# %%
solve_reactor(model)
model.reactor.quick_plot().resize(8, 6)


# %% [markdown]
# ## Counter-current freeboard reactors

# %%
class CounterCurrentHeatExchange:
    """ Wrap a pair of reactors and exchange heat between them. """
    def __init__(self, z, V1, V2, S, alpha=0.8):
        self.z = z
        self.S = S
        
        self.r1 = ReactorModel(z, V1)
        self.r2 = ReactorModel(z, V2)

        self.Q = np.zeros_like(z)
        self.relax = RelaxUpdate(self.Q, alpha)


# %%
def initialize(model):
    """ First solution for *initial guess*. """
    solve_reactor(model.r1, report=False)
    solve_reactor(model.r2, report=False)


# %%
def iter_direct(model, T1, T2):
    """ Strategy 1: compute flux, update both reactors. """
    model.Q[:] = model.relax(model.S * (T1 - T2[::-1]))
    
    model.r1.source.Q[:] = -1 * model.Q
    model.r2.source.Q[:] = +1 * model.Q[::-1]

    solve_reactor(model.r1, report=False)
    solve_reactor(model.r2, report=False)


# %%
def iter_alternate(model, T1, T2):
    """ Strategy 2: sequentally compute flux and update a reactor. """
    # Step 1:
    model.Q[:] = model.relax(model.S * (T1 - T2[::-1]))
    model.r1.source.Q[:] = -1 * model.Q
    solve_reactor(model.r1, report=False)
    T1 = model.r1.reactor.states.T

    # Step 2:
    model.Q[:] = model.relax(model.S * (T1 - T2[::-1]))
    model.r2.source.Q[:] = +1 * model.Q[::-1]
    solve_reactor(model.r2, report=False)


# %%
def solve_once(model, T1, T2):
    """ Run a single iteration of the model. """
    match method:
        case "alternate":
            iter_alternate(model, T1, T2)
        case _:
            iter_direct(model, T1, T2)


# %%
class ConvergenceCheck:
    """ A simple convergence check to manage model solution. """
    def __init__(self, max_iter, patience):
        self._max_iter = max_iter
        self._patience = patience
        self._niter = 0
        self._count = 0
    
        self.T1_last = np.inf
        self.T2_last = np.inf
    
    def __call__(self, T1, T2):
        self._niter += 1
        
        c1 = np.isclose(T1, self.T1_last)
        c2 = np.isclose(T2, self.T2_last)
        
        if c1 and c2:
            self._count += 1
            
        if c1 and c2 and self._count >= self._patience:
            print(f"Converged after {self._niter} iterations")
            return True

        if self._niter >= self._max_iter:
            print(f"Leaving after `max_iter` without convergence")
            return True

        self.T1_last = T1
        self.T2_last = T2
        
        return False


# %%
def solve_pair(model, method, max_iter=50, patience=3):
    """ Iterativelly solve pair of reactors with method. """
    converged = ConvergenceCheck(max_iter, patience)

    T1 = model.r1.reactor.states.T
    T2 = model.r2.reactor.states.T

    while True:
        if converged(T1[-1], T2[-1]):
            break

        solve_once(model, T1, T2)

        T1 = model.r1.reactor.states.T
        T2 = model.r2.reactor.states.T


# %%
@standard_plot(shape=(3, 1), resized=(10, 8))
def plot_pair(pair, ax):
    """ Plot pair of reactors in counter-current. """
    T1 = pair.r1.reactor.states.T
    T2 = pair.r2.reactor.states.T[::-1]
    
    cp1 = pair.r1.reactor.states.cp_mass
    cp2 = pair.r2.reactor.states.cp_mass[::-1]

    ax[0].plot(pair.z, T1, label="Cold fluid")
    ax[0].plot(pair.z, T2, label="Hot fluid")
    ax[1].plot(pair.z, cp1, label="Cold fluid")
    ax[1].plot(pair.z, cp2, label="Hot fluid")
    ax[2].plot(pair.z, -pair.Q)

    ax[0].set_xlabel("z [m]")
    ax[1].set_xlabel("z [m]")
    ax[2].set_xlabel("z [m]")
    
    ax[0].set_ylabel("$T$ [K]")
    ax[1].set_ylabel("$c_p$ [J/(kg.K)]")
    ax[2].set_ylabel("$Q$ [W]")
    
    ax[0].legend(loc=4)
    ax[1].legend(loc=2)


# %%
m = 0.1
L = 0.02
R = 0.05

h = 100.0
S = 2.0 * np.pi * R * L
V = 1.0 * np.pi * R**2 * L
X = "N2: 0.79, O2: 0.21"

method = "alternate"

z = np.arange(L/2, 1.0-0.99*L/2, L)
V = np.full_like(z, V)
S = np.full_like(z, h * S)

dilute = slice(np.argmax(z > 0.15), np.argmax(z > 0.20) + 1)

pair = CounterCurrentHeatExchange(z, V, V, S, alpha=0.8)

add_source(pair.r1, where=0, m=m*0.1,  X=X, T=300)
add_source(pair.r2, where=0, m=m*1.0,  X=X, T=600)
add_source(pair.r2, where=dilute, m=0.01,  X="AR: 1", T=450)
initialize(pair)

solve_pair(pair, method, max_iter=50, patience=3)

# %%
plot = plot_pair(pair)
plot.figure.suptitle("Hot flow from right to left, cold flow left to right")
plot.figure.tight_layout()

# %%
solve_reactor(pair.r1, report=True)

# %%
solve_reactor(pair.r2, report=True)
