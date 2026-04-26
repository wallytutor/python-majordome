# -*- coding: utf-8 -*-
from importlib import import_module
from textwrap import dedent
from tabulate import tabulate
import builtins
import inspect
import os

from .logger import WALANG_LOGGER, runtime_arguments

WALANG_STOCK = []
WALANG_MATH_SUPPORTED = ["numpy", "casadi", "sympy", "math"]


def get_fully_qualified_name(obj) -> str:
    """ Get the fully qualified name of an object. """
    try:
        if inspect.ismodule(obj):
            return obj.__name__

        return f"{obj.__module__}.{obj.__qualname__}"
    except AttributeError:
        return repr(obj)


def stockpile(name: str, value) -> None:
    """ Store a variable in the builtins to be used in the language."""
    WALANG_STOCK.append((name, get_fully_qualified_name(value)))
    setattr(builtins, name, value)


def about(display=True) -> str | None:
    """ Return a help string with all the stocked variables."""
    text = dedent("""\
        Environment Variables
        ---------------------
        WALANG_VERBOSE
            Control the verbosity of the Walang startup.
            0: No output (default)
            1: Info about the environment
            2: Full stockpile listing

        WALANG_MATH
            Select the math module to be used.
            Supported modules are: numpy (default), casadi, sympy, math.

        """)

    # Handle ENV display:
    stock = list(filter(lambda p: p[0] != "ENV", WALANG_STOCK))
    stock.append(("ENV", "os.environ"))

    text += tabulate(stock, headers=["Alias", "Type/Value"],
                     tablefmt="github-raw")

    if display:
        print(text)
        return

    return text


def setup_math() -> None:
    """ Setup the basic math to be used in the language."""
    module = os.environ.get("WALANG_MATH", "numpy")

    if module not in WALANG_MATH_SUPPORTED:
        raise ValueError(f"Unsupported math module `{module}` while "
                         f"starting `walang`. Supported modules are: "
                         f"{WALANG_MATH_SUPPORTED}")

    math = import_module(module)

    stockpile("math", math)
    stockpile("pi",   math.pi)
    stockpile("e",    math.e)

    if hasattr(math, "inf"):
        stockpile("inf",  math.inf)

    if hasattr(math, "nan"):
        stockpile("nan", math.nan)

    stockpile("sin",   math.sin)
    stockpile("cos",   math.cos)
    stockpile("tan",   math.tan)
    stockpile("asin",  math.asin)
    stockpile("acos",  math.acos)
    stockpile("atan",  math.atan)
    stockpile("atan2", math.atan2)
    stockpile("sinh",  math.sinh)
    stockpile("cosh",  math.cosh)
    stockpile("tanh",  math.tanh)
    stockpile("exp",   math.exp)
    stockpile("log",   math.log)
    stockpile("sqrt",  math.sqrt)
    stockpile("dot",   math.dot)

    if hasattr(math, "radians"):
        stockpile("radians", math.radians)

    if hasattr(math, "degrees"):
        stockpile("degrees", math.degrees)

    if hasattr(math, "diff"):
        stockpile("diff", math.diff)

    if module == "casadi":
        stockpile("SX", math.SX)
        stockpile("MX", math.MX)
        stockpile("DM", math.DM)


def setup_scipy() -> None:
    """ Setup the SciPy modules to be used in the language. """
    integrate = import_module("scipy.integrate")
    stockpile("integrate",   integrate)
    stockpile("solve_bvp",   integrate.solve_bvp)
    stockpile("solve_ivp",   integrate.solve_ivp)
    stockpile("cum_simpson", integrate.cumulative_simpson)

    interpolate = import_module("scipy.interpolate")
    stockpile("interpolate", interpolate)
    stockpile("CubicSpline", interpolate.CubicSpline)

    optimize  = import_module("scipy.optimize")
    stockpile("optimize", optimize)
    stockpile("root",     optimize.root)
    stockpile("minimize", optimize.minimize)


def setup_physics() -> None:
    """ Setup the physics modules to be used in the language. """
    physics = import_module("cantera")
    stockpile("cantera", physics)
    stockpile("R_GAS",   physics.gas_constant / 1000.0)
    stockpile("N_AVG",   physics.avogadro)
    stockpile("SIGMA",   physics.stefan_boltzmann)


def setup_logging() -> None:
    """ Setup a simple logger to be used in the language. """
    stockpile("info",     WALANG_LOGGER.info)
    stockpile("debug",    WALANG_LOGGER.debug)
    stockpile("warning",  WALANG_LOGGER.warning)
    stockpile("error",    WALANG_LOGGER.error)
    stockpile("critical", WALANG_LOGGER.critical)
    stockpile("runtime_arguments", runtime_arguments)


def expose():
    """ Expose the Walang modules and functions. """
    setup_math()
    setup_scipy()
    setup_physics()
    setup_logging()

    stockpile("about", about)
    stockpile("ENV", os.environ)

    match os.environ.get("WALANG_VERBOSE", "0"):
        case "1":
            WALANG_LOGGER.info("Call `about()` to know its contents.")
        case "2":
            WALANG_LOGGER.info(f"\n{about()}")
