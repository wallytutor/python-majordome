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

from majordome import (
    toggle_warnings,
    toggle_reactor_warnings,
    composition_to_dict,
    composition_to_array,
    solution_report,
    NormalFlowRate,
)
from tabulate import tabulate
import cantera as ct

# ## Warnings

# Module warnings can be controlled throught the following attributes:

help(toggle_reactor_warnings)

# They can also be provided to the global `toggle_warnings`, which handles the equivalent function all `majordome` modules. Here we call it with no arguments so all warnings are toggled (and thus this example will be less polluted with warnings intentionaly promoted).

toggle_warnings()

# ## Utilities

# Let's start by creating a standard Cantera solution:

solution = ct.Solution("airish.yaml")
solution.TPY = 273.15, ct.one_atm, "N2: 0.78 O2: 0.21, AR: 0.01"

# Conversion of composition strings with name filtering is available:

composition_to_dict("O2: 1, teste: 1", solution.species_names)

# It is also possible to set unit composition with species names; if you do not provide a validation list, all are are kept:

composition_to_dict("O2, N2, hello")

# When working with arrays, take care not to end up in the following situation:

composition_to_array(", teste: 1", solution.species_names)

# There is also a helper for generating inputs for use with `tabulate.tabulate`:

data = solution_report(solution, specific_props=True,
                       composition_spec="mass", selected_species=[])
print(tabulate(data))

# ## *NormalFlowRate*

# Common daily work activity for the process engineer is to perform mass balances, but wait, ..., gas flow rates are generally provided under normal conditions, and compositions may vary, so you need to compute normal densities first... whatever. This class provides a calculator wrapping a Cantera solution object so that your life gets easier.
#
# Its simples use case is as follows:

nfr = NormalFlowRate("airish.yaml")
print(f"Convert 1000 Nm³/h to {nfr(1000.0):.5f} kg/s")

# If the database file default composition does not suit you, no problems:

nfr = NormalFlowRate("airish.yaml", X="N2: 1")
print(f"Convert 1000 Nm³/h to {nfr(1000.0):.5f} kg/s")

# You can also print a nice report to inspect the details of internal state. For more, please check its documentation at the [API page](reactor.md).

print(nfr.report())
