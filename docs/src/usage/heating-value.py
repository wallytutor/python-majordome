# -*- coding: utf-8 -*-
from majordome.combustion.analysis import CombustionAtmosphereCHON

gas = CombustionAtmosphereCHON("gri30.yaml")
lhv = gas.solution_heating_value("CH4: 1", "O2: 1")
print(f"Solution heating value: {lhv:.2f} MJ/kg")

# Output:
# Solution heating value: 50.03 MJ/kg
