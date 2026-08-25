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

    # Python
    "CalphadStoichiometricSystem",
]


def __dir__():
    return list(globals().keys()) + __all__


class CalphadStoichiometricSystem:
    """ Handles equilibrium and properties of stoichiometric systems. """

    __slots__ = (
        "_db",
        "_phases",
        "_phases_names",
    )

    def __init__(self, database, phases=None):
        self._db = CalphadDatabaseLoader(database, phases=phases)
        self._phases = self._db.get_data()
        self._phases_names = list(self._phases.keys())

    @property
    def phases(self):
        return self._phases

    @property
    def phases_names(self):
        return self._phases_names

    def get_mass(self, eq):
        """ Compute mass of equilibrated entity from its mole amounts. """
        return sum(
            x * self._phases[n].molar_mass for n, x in eq.amounts.items()
        )

    def _enthalpy_sum(self, eq):
        T = eq.temperature

        def calc(x, n):
            return x * self._phases[n].enthalpy(T)

        return sum(calc(x, n) for n, x in eq.amounts.items())

    def _cp_sum(self, eq):
        T = eq.temperature

        def calc(x, n):
            return x * self._phases[n].cp(T)

        return sum(calc(x, n) for n, x in eq.amounts.items())

    def get_moles(self, eq):
        """ Compute total moles of the system. """
        return sum(eq.amounts.values())

    def mean_molar_mass(self, eq):
        """ Compute mean molar mass of the system. """
        return self.get_mass(eq) / self.get_moles(eq)

    def enthalpy_mole(self, eq):
        """ Compute enthalpy of the system in mole units. """
        return self._enthalpy_sum(eq) / self.get_moles(eq)

    def enthalpy_mass(self, eq):
        """ Compute enthalpy of the system in mass units. """
        return self._enthalpy_sum(eq) / (self.get_mass(eq) / 1000.0)

    def cp_mole(self, eq):
        """ Compute specific heat of the system in mole units. """
        return self._cp_sum(eq) / self.get_moles(eq)

    def cp_mass(self, eq):
        """ Compute specific heat of the system in mass units. """
        return self._cp_sum(eq) / (self.get_mass(eq) / 1000.0)

    def moles_to_atomic_proportions(self, X):
        """ Convert dictionary of compound moles to atomic proportions."""
        return CalphadSystemComposition.from_compound_moles(self._phases, X)

    def equilibrate_stoichiometric(self, X, T, P=101325.0):
        """ Equilibrate the system with stoichiometric proportions."""
        return equilibrate_stoichiometric(self._phases, X, T, P)
