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

    D_E = symbols("D_E")
    D_P = symbols("D_P")
    D_W = symbols("D_W")

    c_G = symbols("c_G")
    c_B = symbols("c_B")

    D_G = symbols("D_G")
    D_B = symbols("D_B")

    @staticmethod
    def composition():
        """ Return all cell compositions as a list. """
        return [
            CellVars.c_0,
            CellVars.c_E,
            CellVars.c_P,
            CellVars.c_W,
            CellVars.c_G,
            CellVars.c_B,
        ]


class FaceVars:
    D_e = symbols("D_e")
    D_w = symbols("D_w")
    D_g = symbols("D_g")
    D_b = symbols("D_b")

    Fo_e = symbols("alpha_e")
    Fo_w = symbols("alpha_w")
    Fo_g = symbols("alpha_g")
    Fo_b = symbols("alpha_b")


class StandardProblem:
    @staticmethod
    def get_lhs(**kw):
        """ Standard format of inner LHS of problem. """
        return (CellVars.c_P - CellVars.c_0) * FvmVars.delta / FvmVars.tau

    @staticmethod
    def get_rhs(**kw):
        """ Standard format of inner RHS of problem. """
        args_e = (FaceVars.D_e, CellVars.c_E, CellVars.c_P)
        args_w = (FaceVars.D_w, CellVars.c_P, CellVars.c_W)

        J_e = kw.get("J_e", diffusion_flux(*args_e))
        J_w = kw.get("J_w", diffusion_flux(*args_w))

        return J_e - J_w

    @staticmethod
    def full_expression(subs_lhs=[], subs_rhs=[], subs_fourier=False, **kw):
        """ Canonical form of problem set as `f(c)=0`. """
        lhs = StandardProblem.get_lhs(**kw).subs(subs_lhs)
        rhs = StandardProblem.get_rhs(**kw).subs(subs_rhs)
        eq = Eq(expand((lhs - rhs) * FvmVars.tau / FvmVars.delta), 0)

        if subs_fourier:
            eq = eq.subs(SUBS_FOURIER)

        return eq

SUBS_FOURIER = [
    (FaceVars.D_e * FvmVars.tau / FvmVars.delta**2, FaceVars.Fo_e),
    (FaceVars.D_w * FvmVars.tau / FvmVars.delta**2, FaceVars.Fo_w),
    (FaceVars.D_g * FvmVars.tau / FvmVars.delta**2, FaceVars.Fo_g),
    (FaceVars.D_b * FvmVars.tau / FvmVars.delta**2, FaceVars.Fo_b),
]


def harmonic_mean(a, b):
    """ Compute the harmonic mean of two values. """
    return 2 * a * b / (a + b)


def diffusion_flux(D, c1, c2, delta=FvmVars.delta):
    """ Compute the (forward difference) diffusion flux between two points. """
    return -D * (c2 - c1) / delta


def get_fv_coefficients(expr, variables=None, op=lambda x: x):
    """ Extract coefficients for the specified variables. """
    expanded = expand(expr)
    variables = CellVars.composition() if variables is None else variables
    variables = [v for v in variables if v in expanded.free_symbols]
    return {var: op(expanded.coeff(var)) for var in variables}


def tabulate_fv_coefs(expr, variables=None):
    """ Helper to display a table of coefficients for the problem. """
    coefs = get_fv_coefficients(expr, variables).items()
    return DataFrame(coefs, columns=["Variable", "Coefficient"])
