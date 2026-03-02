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

# # Energy models

# This module is concerned with providing classes for computation of energy sources; these are mostly related to estimation of fuel consumption or integration to another simulation modules. Hereafter we illustrate the in cascading complexity the available energy sources. Some of these are simple wrapper around features provided by the combustion utilities.

# %load_ext autoreload
# %autoreload 2

from majordome import (
    StateType,
    NormalFlowRate,
    CombustionPowerOp,
    CombustionFlowOp,
    CombustionAtmosphereCHON,
    CombustionPowerSupply,
    HeatedGasEnergySource,
    CombustionEnergySource,
)

# +
# import majordome.walang
# ct = __builtins__.cantera
# -

# ## Combustion setup utilities

# A common need in industry is to evaluate the real heating value from a gas composition reported by the supplier. This is the main goal of `CombustionAtmosphereCHON`, which has a very simple API provided below:

gas = CombustionAtmosphereCHON("gri30.yaml")
lhv = gas.solution_heating_value("CH4: 1", "O2: 1")
print(f"Solution heating value: {lhv:.2f} MJ/kg")

# Built upon it, `CombustionPowerSupply` performs the basic calculations for retrieving required flow rates from a given power specification; this proves very handy for the CFD engineer.

supply = CombustionPowerSupply(500.0, 1.0, "CH4: 1", "O2: 1", "gri30.yaml")
print(supply.report())

# **TODO:** missing a sample with `CombustionAtmosphereMixer`!

# ## Energy sources

source = HeatedGasEnergySource("airish.yaml", 500.0, mass_flow_rate=1.0)
print(source.report())

source = HeatedGasEnergySource("airish.yaml", 500.0, mass_flow_rate=1.0,
                               cross_area=0.1, Y="N2: 0.79, O2: 0.21")
print(source.report())

fuel_state = StateType("CH4: 1",             300, 101325)
oxid_state = StateType("N2: 0.79, O2: 0.21", 300, 101325)

# +
ops = CombustionPowerOp(500.0, 1.0, fuel_state, oxid_state)
source = CombustionEnergySource("ch4/bfer.yaml", operation=ops, cross_area=0.1)

# Recover values for other tests that follow
# TODO wrap these in properties for clean API:
mdot_fuel = source._qty_fuel.mass
mdot_oxid = source._qty_oxid.mass

nfr_fuel = NormalFlowRate.new_from_solution(source._qty_fuel)
nfr_oxid = NormalFlowRate.new_from_solution(source._qty_oxid)

qdot_fuel = 3600 * mdot_fuel / nfr_fuel.density
qdot_oxid = 3600 * mdot_oxid / nfr_oxid.density

print(source.report())
# -

ops = CombustionFlowOp("mass", mdot_fuel, mdot_oxid, fuel_state, oxid_state)
source = CombustionEnergySource("ch4/bfer.yaml", operation=ops, cross_area=0.1)
print(source.report())

ops = CombustionFlowOp("volume", qdot_fuel, qdot_oxid, fuel_state, oxid_state)
source = CombustionEnergySource("ch4/bfer.yaml", operation=ops, cross_area=0.1)
print(source.report())
