# -*- coding: utf-8 -*-

import pandas as pd

from typing import Sequence

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
        self._phases_names: list[str] = list(self._phases.keys())

    @property
    def phases(self):
        return self._phases

    @property
    def phases_names(self):
        return self._phases_names

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

    def get_mass(self, eq):
        """ Compute mass of equilibrated entity from its mole amounts. """
        return sum(
            x * self._phases[n].molar_mass for n, x in eq.amounts.items()
        )

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

    def phases_amounts(self, eq) -> list[float]:
        """ Return amounts of phases in system in a consistent order. """
        return [eq.amounts.get(n, 0.0) for n in self._phases_names]

    def scan_temperature(
            self,
            T_arr: Sequence[float],
            X_mol: dict[str, float],
            T_ref: float = 298.15,
            p_eval: float = 101325.0,
            shift: bool = True,
            amounts_unit: str = "mole_fractions",
            base: str = "mass",
        ) -> pd.DataFrame:
        """ Evaluate equilibria of system over temperature points.

        Parameters
        ----------
        T_arr: Sequence[float]
            Sequence of temperatures to evaluate the system [K].
        X_mol: dict[str, float]
            Amounts of components (moles of phases) in system.
        T_ref: float = 298.15
            Reference temperature (always included) [K].
        p_eval: float = 101325.0
            Pressure for equilibria evaluation [Pa].
        shift: bool = True
            If true, make enthalpy at `T_ref` equal to zero.
        base: str = "mass"
            Base units for enthalpy/specific heat (mass or mole).
        """
        # TODO support other methods of specification.
        comp = self.moles_to_atomic_proportions(X_mol)

        headers: list[str] = ["T", "H", "Cp"] + self._phases_names
        results: list[float] = []

        for t in sorted(set(T_arr + [T_ref])):
            eq  = self.equilibrate_stoichiometric(comp, t, p_eval)

            match base:
                case "mass":
                    h = self.enthalpy_mass(eq)
                    c = self.cp_mass(eq)
                case "mole":
                    h = self.enthalpy_mole(eq)
                    c = self.cp_mole(eq)
                case _:
                    raise KeyError(
                        f"Unknown enthalpy base: {base}"
                    )

            results.append([t, h, c] + self.phases_amounts(eq))

        # Normalize phase amounts to unity:
        df = pd.DataFrame(results, columns=headers)

        match amounts_unit:
            case "moles":
                pass
            case "mole_fractions":
                phases = df.columns[3:]
                amount = df[phases].sum(axis=1)
                df.loc[:, phases] = df[phases].div(amount, axis=0)
            case _:
                raise KeyError(
                    f"Unknown amount specification {amounts_unit}"
                )

        if shift:
            # Find the index closest to T_ref:
            idx = int((df["T"] - T_ref).abs().argmin())
            df["H"] -= df.iloc[idx]["H"]

        return df
