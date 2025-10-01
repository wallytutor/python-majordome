# -*- coding: utf-8 -*-
from pathlib import Path
from typing import Any
from numpy.typing import NDArray
from tabulate import tabulate
import cantera as ct
import numpy as np
import warnings

from .common import CompositionType, T_NORMAL, P_NORMAL

WARN_CANTERA_NON_KEY_VALUE = True
""" If true, warns about compostion not compliant with Cantera format. """

WARN_MISSING_SPECIES_NAME = True
""" If true, warns about missing species name found in composition. """

WARN_UNKNOWN_SPECIES = True
""" If true, warns about unknown species found in composition. """


def toggle_reactor_warnings(*,
        toggle_non_key_value: bool = True,
        toggle_missing_species_name: bool = True,
        toggle_unknown_species: bool = True,
        **kwargs
    ) -> None:
    """ Reverse truth value of warning flags. """
    if toggle_non_key_value:
        global WARN_CANTERA_NON_KEY_VALUE 
        WARN_CANTERA_NON_KEY_VALUE = not WARN_CANTERA_NON_KEY_VALUE

    if toggle_missing_species_name:
        global WARN_MISSING_SPECIES_NAME
        WARN_MISSING_SPECIES_NAME = not WARN_MISSING_SPECIES_NAME

    if toggle_unknown_species:
        global WARN_UNKNOWN_SPECIES
        WARN_UNKNOWN_SPECIES = not WARN_UNKNOWN_SPECIES


def _split_composition(species):
    """ Helper to split name of species. """
    species = species.strip()

    if not species:
        if WARN_MISSING_SPECIES_NAME:
            warnings.warn("Missing species name, returning `None`!")
        return None, 0

    if ":" not in species:
        if WARN_CANTERA_NON_KEY_VALUE:
            warnings.warn(f"Possibly malformed species '{species}', "
                          f"setting composition to unit '{species}:1'")
        return species, 1.0

    # TODO also support things as "2 * species" ?

    name, value = species.split(":")
    return name.strip(), float(value.strip())


def composition_to_dict(Y: str, species_names: list[str] = None
                       ) -> dict[str, float]:
    """ Convert a Cantera composition string to dictionary. """
    Y_dict = dict()

    for species in Y.split(","):
        name, value = _split_composition(species)

        if not name:
            continue

        if species_names:
            if name in species_names:
                Y_dict[name] = value
            elif WARN_UNKNOWN_SPECIES:
                warnings.warn(f"Unknown species '{name}', skipping...")
        else:
            Y_dict[name] = value

    return Y_dict


def composition_to_array(Y: str, species_names: list[str]
                         ) -> NDArray[np.float64]:
    """ Convert a Cantera composition string to array. """
    data = Y.split(",")
    Y = np.zeros(len(species_names), dtype=np.float64)

    for species in data:
        name, value = _split_composition(species)

        if not name:
            continue

        if name in species_names:
            Y[species_names.index(name)] = value
        elif WARN_UNKNOWN_SPECIES:
            warnings.warn(f"Unknown species {name}, skipping...")

    return Y


def solution_report(sol: ct.Solution | ct.Quantity,
                    specific_props: bool = True,
                    composition_spec: str = "mass",
                    selected_species: list[str] = [],
                    **kwargs,
                    ) -> list[tuple[str, str, Any]]:
    """ Generate a solution report for tabulation.

    Parameters
    ----------
    sol: ct.Solution
        Cantera solution object for report generation.
    specific_props: bool = True
        If true, add specific heat capacity and enthalpy.
    composition_spec: str = "mass"
        Composition units specification, `mass` or `mole`.
    selected_species: list[str] = []
        Selected species to display; return all if a composition
        specification was provided.

    Raises
    ------
    ValueError
        If in invalid composition specification is provided.
        If species filtering lead to an empty set of compositions.

    Returns
    -------
    list[tuple[str, str, Any]]
        A list of data entries intended to be displayed externally,
        *e.g.* with `tabulate.tabulate` or appended.
    """
    report = [("Temperature", "K", sol.T), ("Pressure", "Pa",sol.P),
              ("Density", "kg/m³", sol.density_mass)]

    if specific_props:
        report.extend([
            ("Specific enthalpy", "J/(kg.K)", sol.enthalpy_mass),
            ("Specific heat capacity", "J/(kg.K)", sol.cp_mass),
        ])

    if composition_spec is not None:
        if composition_spec not in ["mass", "mole"]:
            raise ValueError(f"Unknown composition type {composition_spec}")

        comp = getattr(sol, f"{composition_spec}_fraction_dict")()

        if selected_species:
            comp = {s: v for s, v in comp.items() if s in selected_species}

        if not comp:
            raise ValueError("No species left in mixture for display!")

        for species, X in comp.items():
            report.append((f"{composition_spec}: {species}", "-", X))

    if isinstance(sol, ct.Quantity) and kwargs.get("show_mass", False):
        report.append(("Mass", "kg", sol.mass))

    return report


class NormalFlowRate:
    """ Compute normal flow rate for a given composition.

    This class makes use of the user defined state to create a function
    object that converts industrial scale flow rates in normal cubic
    meters per hour to kilograms per second. Nothing more, nothing less,
    it aims at helping the process engineer in daily life for this quite
    repetitive need when performing mass balances.

    Parameters
    ----------
    mech: str | Path
        Path to Cantera mechanism used to compute mixture properties.
    X: CompositionType = None
        Composition specification in mole fractions. Notice that both
        `X` and `Y` are mutally exclusive keyword arguments.
    Y: CompositionType = None
        Composition specification in mass fractions. Notice that both
        `X` and `Y` are mutally exclusive keyword arguments.
    T_ref: float = T_NORMAL
        Reference temperature of the system. If your industry does not
        use the same standard as the default values, and only in that
        case, please consider updating this keyword.
    P_ref: float = P_NORMAL
        Reference pressure of the system. If your industry does not
        use the same standard as the default values, and only in that
        case, please consider updating this keyword.
    name: str = None
        Name of phase in mechanism, if more than one are specified
        within the same Cantera YAML database file.
    """
    def __init__(self, mech: str | Path, *, X: CompositionType = None,
                 Y: CompositionType = None, T_ref: float = T_NORMAL,
                 P_ref: float = P_NORMAL, name: str = None) -> None:
        if X is not None and Y is not None:
            raise ValueError("You can provide either X or Y, not both!")

        self._sol = ct.Solution(mech, name)
        self._sol.TP = T_ref, P_ref

        if X is not None:
            self._sol.TPX = None, None, X

        if Y is not None:
            self._sol.TPY = None, None, Y

        self._rho = self._sol.density_mass

    def __call__(self, qdot: float) -> float:
        """ Convert flow rate [Nm³/h] to mass units [kg/s]. """
        return self._rho * qdot / 3600

    @property
    def density(self) -> float:
        """ Provides access to the density of internal solution [kg/m³]. """
        return self._rho

    @property
    def TPX(self) -> tuple[float, float, dict[str, float]]:
        """ Provides access to the state of internal solution. """
        return (*self._sol.TP, self._sol.mole_fraction_dict())

    def report(self, **kwargs) -> str:
        """ Provides a report of the mixture state. """
        data = solution_report(self._sol, **kwargs)

        if (qdot := kwargs.get("qdot", None)):
            data.extend([
                ("Volume flow rate", "Nm³/h", qdot),
                ("Mass flow rate", "kg/s", self(qdot))
            ])
 
        return tabulate(data, tablefmt="github")
