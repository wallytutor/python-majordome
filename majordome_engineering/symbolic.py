# -*- coding: utf-8 -*-
from typing import Callable
from casadi import heaviside


class PiecewiseSymbolicFunction:
    """ Compose a symbolic piecewise function with CasADi.

    Parameters
    ----------
    breakpoints : list[float]
        List of breakpoints where the function changes.
    functions : list[Callable]
        List of functions to apply between breakpoints. The number of
        functions must be one less than the number of breakpoints.
    """
    def __init__(self, breakpoints: list[float],
                 functions: list[Callable]) -> None:
        if len(functions) <= 1:
            raise ValueError("At least two functions are required")

        if len(breakpoints) != len(functions) + 1:
            raise ValueError("Number of breakpoints must be one more "
                             "than number of functions")

        self._b = breakpoints
        self._f = functions

    def __call__(self, x, *args, **kwargs):
        result = 0

        for i in range(len(self._b) - 1):
            a = heaviside(x - self._b[i])
            b = heaviside(x - self._b[i + 1])
            f = self._f[i](x, *args, **kwargs)
            result += a * (1 - b) * f

        return result
