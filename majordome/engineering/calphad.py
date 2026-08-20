# -*- coding: utf-8 -*-

from .. import _core
from ..data import DATA

_mod = _core.calphad
_mod.add_data_directory(str(DATA / "calphad"))

# Core
CalphadSubstance              = _mod.Substance
CalphadSystemComposition      = _mod.SystemComposition

# Data
CalphadDatabaseLoader         = _mod.DatabaseLoader
add_calphad_data_directory    = _mod.add_data_directory
list_calphad_data_directories = _mod.list_data_directories

# Equilibrium
CalphadEquilibrium            = _mod.Equilibrium
equilibrate_stoichiometric    = _mod.equilibrate_stoichiometric

__all__ = [
    # Core
    "CalphadSubstance",
    "CalphadSystemComposition",

    # Data
    "CalphadDatabaseLoader",
    "add_calphad_data_directory",
    "list_calphad_data_directories",

    # Equilibrium
    "CalphadEquilibrium",
    "equilibrate_stoichiometric",
]


def __dir__():
    return list(globals().keys()) + __all__
