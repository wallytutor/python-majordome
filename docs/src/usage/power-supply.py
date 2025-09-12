# -*- coding: utf-8 -*-
from majordome.combustion import CombustionPowerSupply

supply = CombustionPowerSupply(500.0, 1.0, "CH4: 1", "O2: 1", "gri30.yaml")
print(supply.report())

# Output:
# General
# -------
# - Required power                500.0 kW
# - Lower heating value            50.0 MJ/kg

# Mass flow
# ---------
# - Total mass flow rate        179.514 kg/h
# - Fuel mass flow rate          35.982 kg/h
# - Oxidizer mass flow rate     143.532 kg/h

# Volume flow
# -----------
# - Total volume flow rate      150.812 Nm³/h
# - Fuel volume flow rate        50.271 Nm³/h
# - Oxidizer volume flow rate   100.541 Nm³/h

# Emissions
# ---------
# - Total emissions             179.514 kg/h
# - Water production             80.809 kg/h
# - Carbon dioxide production    98.705 kg/h
