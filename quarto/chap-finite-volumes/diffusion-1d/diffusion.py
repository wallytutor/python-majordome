# -*- coding: utf-8 -*-
from pandas import DataFrame
from sympy import Add, Eq, Symbol
from sympy import (
    collect,
    expand,
    factor,
    solve,
    symbols,
    simplify,
    init_printing,
)

class FvmVars:
    delta = symbols("delta")
    tau = symbols("tau")


class CellVars:
    c_0 = symbols("c_0")
    c_E = symbols("c_E")
    c_P = symbols("c_P")
    c_W = symbols("c_W")


class FaceVars:
    D_e = symbols("D_e")
    D_w = symbols("D_w")
    Fo_e = symbols("alpha_e")
    Fo_w = symbols("alpha_w")


SUBS_FOURIER = [
    (FaceVars.D_e * FvmVars.tau / FvmVars.delta**2, FaceVars.Fo_e),
    (FaceVars.D_w * FvmVars.tau / FvmVars.delta**2, FaceVars.Fo_w),
]


def diffusion_flux(D, c1, c2, delta=FvmVars.delta):
    """ Compute the (forward difference) diffusion flux between two points. """
    return -D * (c2 - c1) / delta


def get_fv_coefficients(expr, variables, op=lambda x: x):
    """ Extract coefficients for the specified variables. """
    expanded = expand(expr)
    return {var: op(expanded.coeff(var)) for var in variables}


def tabulate_fv_coefs(eq, variables):
    """ Helper to display a table of coefficients for the problem. """
    coefs = get_fv_coefficients(eq, variables).items()
    return DataFrame(coefs, columns=["Variable", "Coefficient"])
