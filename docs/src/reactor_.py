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

# # Reactor models

# %load_ext autoreload
# %autoreload 2

from majordome import (toggle_warnings,
                       composition_to_dict,
                       composition_to_array,
                       solution_report)
from tabulate import tabulate
import cantera as ct

toggle_warnings()

# ## Utilities

solution = ct.Solution("airish.yaml")
solution.TPY = None, None, "O2: 1"

composition_to_dict("O2: 1, teste: 1", solution.species_names)

composition_to_dict("O2")

composition_to_dict("O2, N2")

composition_to_dict("O2, N2, hello")

composition_to_array(", teste: 1", solution.species_names)

data = solution_report(solution, specific_props=True,
                       composition_spec="mass", selected_species=[])
print(tabulate(data))




