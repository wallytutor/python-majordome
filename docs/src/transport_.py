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

# # Transport properties

# %load_ext autoreload
# %autoreload 2

from majordome.common import standard_plot
import majordome.common as mc
import majordome.transport as mt
import cantera as ct
import numpy as np

# ## *EffectiveThermalConductivity*

# Class `EffectiveThermalConductivity` implements static methods for the evaluation of properties; its name is quite long, let's start by getting an alias before evaluating the desired models:

etc = mt.EffectiveThermalConductivity()

# Using [Maxwell](https://en.wikipedia.org/wiki/Effective_medium_approximations) approximation, we could estimate the the effective thermal conductivity of a packed bed of particles in a *matrix* of air; assume particles loosly embeded in air and the following properties; the computed effective thermal conductivity is shown to approach the air limit:

# +
phi = 0.30   # Loosely packed solids [30%v]
k_g = 0.025  # Air thermal conductivity [W/(m.K)]
k_s = 1.000  # Solids thermal conductivity [W/(m.K)]

etc.maxwell_garnett(phi, k_g, k_s)


# -

# For the limit of high temperatures, it is usually important to account for particle-particle radiation heat transfer; this introduces a $T^3$ dependence on temperature, as one should expect by linearizing Stefan-Boltzmann law.
#
# Please notice that these models compute different things; while Maxwell approximation computes the medium properties (to approximate matrix-inclusion as a single domain), Singh's model accounts only for solids properties. One might wish to combine them (warning: unverified validity!) to evaluate overall medium thermal conductivity. See the references in the class documentation for further discussion, specially the extension proposed by Kiradjiev (2019), which leads to a result similar to the assymptotic behavior displayed below.

# +
@standard_plot(shape=(1, 2))
def plot_etc(data, ax):
    T, k_s, k_m =  data
    
    ax[0].plot(T, k_s)
    ax[1].plot(T, k_m)
    
    ax[0].set_xlim(mc.bounds(T))
    ax[1].set_xlim(mc.bounds(T))

    ax[0].set_title("Solids property")
    ax[1].set_title("Medium property")
    ax[0].set_xlabel("Temperature [K]")
    ax[1].set_xlabel("Temperature [K]")
    ax[0].set_ylabel("Thermal conductivity [W/(m.K)]")
    ax[1].set_ylabel("Thermal conductivity [W/(m.K)]")


d_p = 0.005
eps = 0.9

T = np.linspace(300, 1500, 50)
k_eff_s = etc.singh1994(T, phi, d_p, k_s, eps)
k_eff_m = etc.maxwell_garnett(phi, k_g, k_eff_s)

plot_etc((T, k_eff_s, k_eff_m)).resize(10, 5)


# -

# Due to kinetic theory implications, gas thermal conductivity tend to have a positive slope in temperature; the following illustrates how this can be accounted for and the roughly linear behaviour introduced when computing medium properties within air.

# +
@standard_plot(shape=(1, 2))
def plot_etc(data, ax):
    T, k_g, k_m =  data
    
    ax[0].plot(T, k_g)
    ax[1].plot(T, k_m)
    
    ax[0].set_xlim(mc.bounds(T))
    ax[1].set_xlim(mc.bounds(T))

    ax[0].set_title("Fluid property")
    ax[1].set_title("Medium property")
    ax[0].set_xlabel("Temperature [K]")
    ax[1].set_xlabel("Temperature [K]")
    ax[0].set_ylabel("Thermal conductivity [W/(m.K)]")
    ax[1].set_ylabel("Thermal conductivity [W/(m.K)]")
    

gas = ct.Solution("airish.yaml")
sol = ct.SolutionArray(gas, (T.shape[0],))
sol.TP = T, None

k_gas = sol.thermal_conductivity
k_eff_m = etc.maxwell_garnett(phi, k_gas, k_eff_s)

plot_etc((T, k_gas, k_eff_m)).resize(10, 5)
# -

# ## Dimensionless numbers


