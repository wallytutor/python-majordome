# -*- coding: utf-8 -*-
from numbers import Number
from textwrap import dedent
from typing import NamedTuple
import cantera as ct

T_REFERENCE = 298.15
""" Thermodynamic reference temperature [K]. """

T_NORMAL = 273.15
""" Normal state reference temperature [K]. """

P_NORMAL = 101325.0
""" Normal state reference temperature [K]. """

CompositionType = str | dict[str, float]
""" Input type for Cantera composition dictionaries. """


class StateType(NamedTuple):
    """ Input type for Cantera TPX state dictionaries. """
    X: CompositionType
    T: Number = T_NORMAL
    P: Number = P_NORMAL


class NormalFlowRate:
    """ Compute normal flow rate for a given composition. """
    def __init__(self, mech, X=None, Y=None, T_ref=T_NORMAL):
        if sum((x is not None for x in (X, Y))) != 1:
            raise ValueError("Must provide either X or Y, not both.")

        self._sol = ct.Solution(mech)

        if X is not None:
            self._sol.TPX = T_ref, ct.one_atm, X

        if Y is not None:
            self._sol.TPY = T_ref, ct.one_atm, Y

        self._rho = self._sol.density_mass

    def __call__(self, qdot: float) -> float:
        """ Convert flow rate [Nm³/h] to mass units [kg/s]. """
        return self._rho * qdot / 3600


def report_title(title: str, report: str) -> str:
    """ Generate a text report with a underscored title. """
    return dedent(f"""\n{title}\n{len(title) * "-"}\n""") + report
