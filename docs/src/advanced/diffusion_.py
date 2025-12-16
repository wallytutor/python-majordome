# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     formats: py:percent
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
# # Diffusion in Solids

# %%
# %load_ext autoreload
# %autoreload 2

# %%
from majordome import diffusion as md
from majordome import constants
import numpy as np

# %% [markdown]
# ## Carburizing of steel

# %%
R = constants.GAS_CONSTANT

# %%
def composition_dependence(x):
    return x[0]

def pre_exponential(x, _T):
    b = 320 / constants.GAS_CONSTANT
    F = 1 / (1 - 5 * x[0])
    return 4.84e-05 * F * np.exp(-b * composition_dependence(x))

def activation_energy(x, _T):
    return 155_000 - 570_000 * composition_dependence(x)

# %%
A = md.PreExponentialFactor(pre_exponential)
E = md.ActivationEnergy(activation_energy)

D1 = md.ArrheniusModifiedDiffusivity(
    pre_exponential_factor = A,
    activation_energy      = E
)
D2 = md.ArrheniusModifiedDiffusivity(
    pre_exponential_func   = pre_exponential,
    activation_energy_func = activation_energy,
)
D3 = md.ArrheniusModifiedDiffusivity(
    pre_exponential_factor = A,
    activation_energy_func = activation_energy,
)
D4 = md.ArrheniusModifiedDiffusivity(
    pre_exponential_func   = pre_exponential,
    activation_energy      = E,
)

callers = [D1, D2, D3, D4]

# %%
x = [0.01]
T = 1000

for i, D in enumerate(callers, start=1):
    diff = D.__call__(x, T)
    print(f"D{i}: {diff:.6e} m^2/s")

# %% [markdown]
# ## Carboiitriding of steel

# %%
def composition_dependence_cn(x):
    return x[0] + 0.72 * x[1]

def pre_exponential_cn(x):
    b = 320 / constants.GAS_CONSTANT
    r = 1 - 5 * sum(x)
    return np.exp(-b * composition_dependence_cn(x)) / r

def activation_energy_cn(x):
    return 570_000 * composition_dependence_cn(x)

def pre_exponential_c(x, _T):
    return 4.84e-05 * (1 - 5 * x[1]) * pre_exponential_cn(x)

def pre_exponential_n(x, _T):
    return 9.10e-05 * (1 - 5 * x[0]) * pre_exponential_cn(x)

def activation_energy_c(x, _T):
    return 155_000 - activation_energy_cn(x)

def activation_energy_n(x, _T):
    return 168_600 - activation_energy_cn(x)

Dc = md.ArrheniusModifiedDiffusivity(
    pre_exponential_func   = pre_exponential_c,
    activation_energy_func = activation_energy_c,
)
Dn = md.ArrheniusModifiedDiffusivity(
    pre_exponential_func   = pre_exponential_n,
    activation_energy_func = activation_energy_n,
)

Dc_rust = md.slycke.create_carbon_diffusivity()
Dn_rust = md.slycke.create_nitrogen_diffusivity()

# Y = [0.01, 0.01, 0.01]
# m = [12.01, 14.01, 15.0]
Y = [0.01, 0.01]
m = [12.01, 14.01]

M = 1 / ((1-sum(Y)) / 55.85 + sum(y / mi for y, mi in zip(Y, m)))
X = [y * M / mi for y, mi in zip(Y, m)]

T = 1173

print(f"D_C: {Dc(X, T):.6e} | {Dc_rust(X, T):.6e} m²/s")
print(f"D_N: {Dn(X, T):.6e} | {Dn_rust(X, T):.6e} m²/s")

# %%
