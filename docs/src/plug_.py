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
def sample_single():
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

    return model


# %%
model = sample_single()
model.reactor.states.to_pandas().head().T

# %%
model.reactor.quick_plot().resize(8, 6)

# %%
solve_reactor(model)
model.reactor.quick_plot().resize(8, 6)


# %% [markdown]
# ## Counter-current flow reactors

# %%
class CounterCurrentHeatExchange:
    """ Wrap a pair of reactors and exchange heat between them. """
    def __init__(self, z, V1, V2, U, alpha=0.8):
        self.z = z
        self.U = U

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
    model.Q[:] = model.relax(model.U * (T1 - T2[::-1]))

    model.r1.source.Q[:] = -1 * model.Q
    model.r2.source.Q[:] = +1 * model.Q[::-1]

    solve_reactor(model.r1, report=False)
    solve_reactor(model.r2, report=False)


# %%
def iter_alternate(model, T1, T2):
    """ Strategy 2: sequentally compute flux and update a reactor. """
    # Step 1:
    model.Q[:] = model.relax(model.U * (T1 - T2[::-1]))
    model.r1.source.Q[:] = -1 * model.Q
    solve_reactor(model.r1, report=False)
    T1 = model.r1.reactor.states.T

    # Step 2:
    model.Q[:] = model.relax(model.U * (T1 - T2[::-1]))
    model.r2.source.Q[:] = +1 * model.Q[::-1]
    solve_reactor(model.r2, report=False)


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

        if self._count >= self._patience:
            print(f"Converged after {self._niter} iterations")
            return True

        if self._niter >= self._max_iter:
            print(f"Leaving after `max_iter` without convergence")
            return True

        if c1 and c2:
            self._count += 1
        else:
            self._count = 0

        self.T1_last = T1
        self.T2_last = T2

        return False


# %%
def solve_pair(model, method="alternate", *, max_iter=50, patience=3):
    """ Iterativelly solve pair of reactors with method. """
    converged = ConvergenceCheck(max_iter, patience)

    T1 = model.r1.reactor.states.T
    T2 = model.r2.reactor.states.T

    while True:
        if converged(T1[-1], T2[-1]):
            break

        match method:
            case "alternate":
                iter_alternate(model, T1, T2)
            case _:
                iter_direct(model, T1, T2)

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
def sample_countercurrent():
    m = 0.1
    L = 0.02
    R = 0.05

    h = 100.0
    V = 1.0 * np.pi * R**2 * L
    X = "N2: 0.79, O2: 0.21"

    method = "alternate"

    z = np.arange(L/2, 1.0-0.99*L/2, L)
    V = np.full_like(z, V)
    S = np.full_like(z, h * 2 * R * L)

    dilute = slice(np.argmax(z > 0.15), np.argmax(z > 0.20) + 1)

    pair = CounterCurrentHeatExchange(z, V, V, S, alpha=0.75)
    add_source(pair.r1, where=0, m=m*0.1,  X=X, T=300)
    add_source(pair.r2, where=0, m=m*1.0,  X=X, T=600)
    add_source(pair.r2, where=dilute, m=0.01,  X="AR: 1", T=450)
    initialize(pair)

    solve_pair(pair, method, max_iter=50, patience=3)
    return pair


# %%
pair = sample_countercurrent()

plot = plot_pair(pair)
plot.figure.suptitle("Hot flow from right to left, cold flow left to right")
plot.figure.tight_layout()

# %%
solve_reactor(pair.r1, report=True)

# %%
solve_reactor(pair.r2, report=True)


# %% [markdown]
# ## Adding losses to the environment

# %%
class CounterCurrentReactors:
    def __init__(self, z, V1, V2, U_inner, U_reac1, U_reac2, R_wall,
                 alpha_inner=0.8, alpha_wall=0.9, Te=300):
        self.inner =  CounterCurrentHeatExchange(z, V1, V2, U_inner, alpha_inner)

        self.U1  = U_reac1
        self.U2  = U_reac2
        self.Rw  = R_wall
        self.Te  = Te
        self.Tw  = np.full_like(z, Te)
        self.Qw  = np.zeros_like(z)
        self.qw1 = np.zeros_like(z)
        self.qw2 = np.zeros_like(z)

        self.relax1 = RelaxUpdate(self.qw1, alpha_wall)
        self.relax2 = RelaxUpdate(self.qw2, alpha_wall)


# %%
def update_full(reactor, T1, T2):
    # Step 0: wall
    reactor.qw1[:] = reactor.relax1(-reactor.U1 * (T1 - reactor.Tw))
    reactor.qw2[:] = reactor.relax2(-reactor.U2 * (T2 - reactor.Tw))

    reactor.Qw[:] = -1 * (reactor.qw1 + reactor.qw2)
    reactor.Tw[:] = reactor.Qw * reactor.Rw + reactor.Te

    model = reactor.inner

    # Step 1: reactor 1
    model.Q[:] = model.relax(model.U * (T1 - T2[::-1]))
    model.r1.source.Q[:] = -1 * model.Q + reactor.qw1
    solve_reactor(model.r1, report=False)
    T1 = model.r1.reactor.states.T

    # Step 2: reactor 2
    model.Q[:] = model.relax(model.U * (T1 - T2[::-1]))
    model.r2.source.Q[:] = +1 * model.Q[::-1]
    solve_reactor(model.r2, report=False)


# %%
def solve_full(reactor, *, max_iter=50, patience=3):
    """ Iterativelly solve pair of reactors with wall loss. """
    converged = ConvergenceCheck(max_iter, patience)

    T1 = reactor.inner.r1.reactor.states.T
    T2 = reactor.inner.r2.reactor.states.T

    while True:
        if converged(T1[-1], T2[-1]):
            break

        update_full(reactor, T1, T2)

        T1 = reactor.inner.r1.reactor.states.T
        T2 = reactor.inner.r2.reactor.states.T


# %%
def plot_full(reactor):
    """ Plot fully integrated system. """
    plot = plot_pair(reactor.inner)
    plot.axes[0].plot(reactor.inner.z, reactor.Tw, label="Wall")
    plot.axes[0].legend(loc=4)
    plot.figure.suptitle("Hot flow from right to left, cold flow left to right")
    plot.figure.tight_layout()
    return plot


# %%
def sample_full():
    """ Sample case with a pair of coupled reactor and wall losses. """
    # - PARAMETERS
    h_inner = 100.0  # HTC r1-r2 [W/(m².K)]
    h_reac1 = 10.0   # HTC r1-wall [W/(m².K)]
    h_reac2 = 20.0   # HTC r2-wall [W/(m².K)]
    h_shell = 10.0   # HTC shell-env [W/(m².K)]
    k_shell = 1.0    # Conductivity [W/(m.K)]

    # - PROCESS
    Te = 298         # Environment temperature [K]
    T1 = 300         # Temperature in channel 1 [K]
    T2 = 600         # Temperature in channel 2 [K]
    m1 = 0.005       # Mass flow in channel 1 [kg/s]
    m2 = 0.10        # Mass flow in channel 2 [kg/s]

    # - GEOMETRY
    r = 0.05         # Internal radius [m]
    R = 0.07         # External radius [m]
    l = 0.02         # Length of a cell [m]
    L = 1.00         # Length of reactor [m]

    # Exchange areas [m²]
    S_inner = 2 * r * l
    S_reacn = np.pi * r * l
    S_shell = 2 * np.pi * R * l

    # Semi-reactor volumes [m³]
    V_half = 0.5 * np.pi * r**2 * l

    # Inlet composition [molar fractions]
    X = "N2: 0.79, O2: 0.21"

    # Discretize space and prepare inputs
    z = np.arange(l/2, L-0.99*l/2, l)
    V1 = V2 = np.full_like(z, V_half)
    U_inner = np.full_like(z, h_inner * S_inner)
    U_reac1 = np.full_like(z, h_reac1 * S_reacn)
    U_reac2 = np.full_like(z, h_reac2 * S_reacn)
    S_shell = np.full_like(z, h_shell * S_shell)

    R_shell = np.log(R / r) / (2 * np.pi * l * k_shell)
    R_env   = 1 / (S_shell * h_shell)
    R_total = R_shell + R_env

    reactor = CounterCurrentReactors(z, V1, V2, U_inner, U_reac1, U_reac2, R_total, Te=Te)

    pair = reactor.inner
    add_source(pair.r1, where=0, m=m1,  X=X, T=T1)
    add_source(pair.r2, where=0, m=m2,  X=X, T=T2)
    initialize(pair)

    solve_full(reactor, max_iter=50, patience=3)
    return reactor


# %%
reactor = sample_full()
plot = plot_full(reactor)
