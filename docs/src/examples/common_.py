# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.17.3
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %% [markdown]
# # Common utilities

# %% [markdown]
# Module [majordome.common](../modules/common.md) provides a set of utilities that are whether too general purpose for integrating another module or still waiting to find their definitive home. These include constants, type aliases, and functionalities of different kinds. Regarding this last kind of components, this tutorial aims at illustrating their use for practical documentation.

# %%
# %load_ext autoreload
# %autoreload 2

# %%
from majordome import (
    Constants,
    RelaxUpdate,
    StabilizeNvarsConvergenceCheck,
    MajordomePlot,
)
import numpy as np

# %% [markdown]
# ## *Constants*

# %% [markdown]
# Singleton class for storing real constants.

# %%
Constants() is Constants()

# %%
print(Constants.report())

# %% [markdown]
# ## *ReadTextData*
#
# WIP, sorry for the inconvenience...

# %% [markdown]
# ## *MajordomePlot*
#
# WIP, sorry for the inconvenience...

# %% [markdown]
# ## *InteractiveSession*
#
# WIP, sorry for the inconvenience...

# %% [markdown]
# ## *RelaxUpdate* and *StabilizeNvarsConvergenceCheck*

# %% [markdown]
# Simplest of relaxation methods; assume you have a new updated solution $A_{new}^{\star}$ for a problem whose past state was $A_{old}$, then the manager will ensure the following relaxation will be applied to compute the next solution state $A_{new}$ to be used in whatever you are computing:
#
# $$
# \begin{align}
# A_{new} &= \alpha{}A_{old} + (1-\alpha)A_{new}^{\star}\\
# A_{old} &= A_{new}
# \end{align}
# $$
#
# Notice that in this formulation, $\alpha$ (or `alpha` in the API) represents the fraction of old solution to be used in the *smearing* process. Below we illustrate the effect of a step function $H$ valued at `10` from the begining over consecutive updates (here we do not test for convergence, as that is problem specific and for this simple case the required number of steps could be evaluated by hand, take some time to try!).

# %%
alpha = 0.76
niter = 50

single = np.ones(1)
relaxer = RelaxUpdate(single, alpha)

opts = dict(n_vars=1, max_iter=niter, patience=3, rtol=0.001)
converged = StabilizeNvarsConvergenceCheck(**opts)

history = np.zeros(niter+1)
history[0] = single[0]

H = np.asarray([10])

for n in range(niter):
    single[:] = relaxer(H)
    history[n+1] = single[0]

    if converged(single[0]):
        history = history[:n+2]
        break

@MajordomePlot.new(size=(8, 5))
def plot_history(history, plot=None):
    """ Plot relaxation history. """
    fig, ax = plot.subplots()

    ax[0].plot(history)
    ax[0].set_title("Verification of relaxation progress")
    ax[0].set_xlabel("Update iteration")
    ax[0].set_ylabel("Updated value")

_ = plot_history(history)
