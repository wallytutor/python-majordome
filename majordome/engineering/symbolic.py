# -*- coding: utf-8 -*-
from abc import ABC, abstractmethod
from typing import Any, Self

import cantera as ct
from casadi import Function, SX
from casadi import heaviside, log as ln

from .._core import constants


class PiecewiseSymbolicFunction:
    """ Compose a symbolic piecewise function with CasADi.

    Parameters
    ----------
    breakpoints : list[float]
        List of breakpoints where the function changes.
    functions : list[Any]
        List of functions to apply between breakpoints. The number of
        functions must be one less than the number of breakpoints.
    """
    def __init__(self, breakpoints: list[float],
                 functions: list[Any]) -> None:
        if len(functions) <= 1:
            raise ValueError("At least two functions are required")

        if len(breakpoints) != len(functions) + 1:
            raise ValueError("Number of breakpoints must be one more "
                             "than number of functions")

        self._b = breakpoints
        self._f = functions

    def __call__(self, x, *args, **kwargs):
        """ Evaluate the piecewise function at a given point. """
        result = 0

        for i in range(len(self._b) - 1):
            a = heaviside(x - self._b[i])
            b = heaviside(x - self._b[i + 1])

            if callable(self._f[i]):
                val = self._f[i](x, *args, **kwargs)
            else:
                val = self._f[i]

            result += a * (1 - b) * val

        return result


class AbstractSymbolicThermo(ABC):
    @property
    @abstractmethod
    def breakpoints(self) -> list[float]:
        """ Return the breakpoints of the piecewise functions. """
        pass

    @property
    @abstractmethod
    def cp(self) -> Function:
        """ Return the specific heat function. """
        pass

    @property
    @abstractmethod
    def h(self) -> Function:
        """ Return the enthalpy function. """
        pass

    @property
    @abstractmethod
    def s(self) -> Function:
        """ Return the entropy function. """
        pass

    @classmethod
    @abstractmethod
    def from_species(cls, species: ct.thermo.Species, T: SX) -> Self:
        """ Create a `Nasa7Thermo` object from a Cantera species. """
        pass


class AbstractSymbolicTransport(ABC):
    pass


class AbstractSymbolicKinetics(ABC):
    pass


class Nasa7Thermo(AbstractSymbolicThermo):
    """ NASA7 thermodynamic parameterization.

    Parameters
    ----------
    T : SX
        Temperature variable (symbolic).
    input_data : dict
        NASA7 thermodynamic data, as provided by Cantera's
        `SpeciesThermo` property `input_data`.
    """
    __slots__ = ("_T", "_input_data", "_cp", "_h", "_s")

    def __init__(self, T: SX, input_data: dict[str, Any]) -> None:
        super().__init__()

        self._T = T
        self._input_data = input_data

        if self._input_data["model"] != "NASA7":
            raise ValueError("Only NASA7 thermodynamic model is supported")

        data = input_data["data"]
        breakpoints = input_data["temperature-ranges"]

        names = ["specific_heat", "enthalpy", "entropy"]
        c_func = Nasa7Thermo.compose(names[0], T, data, symbolic=True)
        h_func = Nasa7Thermo.compose(names[1], T, data, symbolic=True)
        s_func = Nasa7Thermo.compose(names[2], T, data, symbolic=True)

        cp = PiecewiseSymbolicFunction(breakpoints, c_func)
        h  = PiecewiseSymbolicFunction(breakpoints, h_func)
        s  = PiecewiseSymbolicFunction(breakpoints, s_func)

        self._cp = Function("cp", [T], [cp(T)])
        self._h  = Function("h", [T], [h(T)])
        self._s  = Function("s", [T], [s(T)])

    @property
    def breakpoints(self) -> list[float]:
        """ Return the breakpoints of the piecewise functions. """
        return self._input_data["temperature-ranges"]

    @property
    def cp(self) -> Function:
        """ Return the specific heat function. """
        return self._cp

    @property
    def h(self) -> Function:
        """ Return the enthalpy function. """
        return self._h

    @property
    def s(self) -> Function:
        """ Return the entropy function. """
        return self._s

    @staticmethod
    def specific_heat(T: Any, a: list[float],
                      symbolic: bool = False) -> Function | SX:
        """ Compose NASA7 specific heat parameterization. """
        p = a[0] + a[1] * T + a[2] * T**2 + a[3] * T**3 + a[4] * T**4
        p *= constants.GAS_CONSTANT
        return p if symbolic else Function("cp", [T], [p])

    @staticmethod
    def enthalpy(T: Any, a: list[float],
                 symbolic: bool = False) -> Function | SX:
        """ Compose NASA7 specific enthalpy parameterization. """
        p = a[0] + a[1]/2 * T + a[2]/3 * T**2 + a[3]/4 * T**3 + \
            a[4]/5 * T**4 + a[5] / T
        p *= T * constants.GAS_CONSTANT
        return p if symbolic else Function("h", [T], [p])

    @staticmethod
    def entropy(T: Any, a: list[float],
                symbolic: bool = False) -> Function | SX:
        """ Compose NASA7 specific entropy parameterization. """
        p = a[0] * ln(T) + a[1] * T + a[2]/2 * T**2 +\
            a[3]/3 * T**3 + a[4]/4 * T**4 + a[6]
        p *= constants.GAS_CONSTANT
        return p if symbolic else Function("s", [T], [p])

    @classmethod
    def compose(cls, name: str, T: SX | NDArray[np.float64] | float,
                data: list[list[float]], symbolic: bool = False
                ) -> list[Function | SX | NDArray[np.float64] | float]:
        """ Compose a list of NASA7 functions for given data. """
        if not isinstance(T, SX):
            symbolic = True

        def evaluator(a, func=getattr(cls, name.lower())):
            return func(T, a, symbolic=symbolic)

        return [evaluator(a) for a in data]

    @classmethod
    def from_species(cls, species: ct.thermo.Species, T: SX) -> Self:
        """ Create a `Nasa7Thermo` object from a Cantera species. """
        return cls(T, dict(species.thermo.input_data))


class ChapmanEnskogTransport(AbstractSymbolicTransport):
    def __init__(self, T: SX, input_data: dict[str, Any]) -> None:
        super().__init__()

        self.T = T
        self.input_data = input_data

        if self.input_data["model"] != "gas":
            raise ValueError("Only gas transport model is supported")


def symbolic_thermo_factory(species: ct.thermo.Species, T: SX
                            ) -> AbstractSymbolicThermo:
    """ Create an `AbstractSymbolicThermo` object. """
    input_data = dict(species.thermo.input_data)

    match (model := input_data["model"]):
        case "NASA7":
            return Nasa7Thermo(T, input_data)
        case _:
            raise ValueError(f"Unsupported model: {model}")


def symbolic_transport_factory(species: ct.thermo.Species,
                               T: SX) -> AbstractSymbolicTransport:
    """ Create an `AbstractSymbolicTransport` object. """
    input_data = dict(species.transport.input_data)

    match (model := input_data["model"]):
        case "gas":
            return ChapmanEnskogTransport(T, input_data)
        case _:
            raise ValueError(f"Unsupported transport model: {model}")


def symbolic_kinetics_factory(reaction: ct.Reaction,
                              T: SX) -> AbstractSymbolicKinetics:
    """ Create an `AbstractSymbolicKinetics` object. """
    pass


class SymbolicSpecies:
    def __init__(self, name: str,
                 thermo: AbstractSymbolicThermo,
                 transport: AbstractSymbolicTransport,
                 kinetics: AbstractSymbolicKinetics
                 ) -> None:
        self.name = name
        self.thermo = thermo
        self.transport = transport
        self.kinetics = kinetics


class SymbolicIdealGasSolution:
    pass
