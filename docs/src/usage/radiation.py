# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.17.2
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %load_ext autoreload
# %autoreload 2

from majordome.radiation import WSGGRadlibBordbar2020

# +
L    = 1.0
T    = 1500
P    = 101325
xH2O = 0.18
xCO2 = 0.08
fvsoot = 0.0

model = WSGGRadlibBordbar2020()
model(L, T, P, xH2O, xCO2)
# -

kappa = model.absorption_coefs
awts = model.gases_weights
kappa, awts




