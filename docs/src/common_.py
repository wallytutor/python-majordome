# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.11.2
#   kernelspec:
#     display_name: venv
#     language: python
#     name: python3
# ---

# %% [markdown]
# # Common utilities

# %%
# %load_ext autoreload
# %autoreload 2

# %%
import majordome.common as mc
import numpy as np

# %% [markdown]
# ## *RelaxUpdate*

# %%
alpha = 0.9
niter = 80

single = np.ones(1)
relaxer = mc.RelaxUpdate(single, alpha)

history = np.zeros(niter+1)
history[0] = single[0]

for n in range(niter):
    single[:] = relaxer(np.asarray([10]))
    history[n+1] = single[0]

@mc.standard_plot()
def plot_history(history, ax):
    ax[0].plot(history)
    ax[0].set_title("Verification of relaxation progress")
    ax[0].set_xlabel("Iteration")
    ax[0].set_ylabel("Updated value")

plot_history(history)
# %%
