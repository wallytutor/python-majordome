# -*- coding: utf-8 -*-
from functools import wraps
from importlib import import_module
from tabulate import tabulate
import builtins
import inspect
import logging
import os

STOCK = []


def stockpile(name: str, value) -> None:
    """ Store a variable in the builtins to be used in the language."""
    name_value = repr(value)

    if inspect.ismodule(value):
        name_value = value.__name__

    # The test below is simpler than `isclass(value) or isfunction(value)`
    # and also covers other types as well (e.g., numpy.ufunc).
    if hasattr(value, "__module__") and hasattr(value, "__name__"):
        mname = value.__module__
        cname = value.__name__
        name_value = f"{mname}.{cname}"

    if inspect.ismethod(value):
        cname = value.__self__.__class__.__name__
        mname = value.__func__.__name__
        name_value = f"{cname}.{mname}()"

    STOCK.append((name, name_value))
    setattr(builtins, name, value)


def help() -> str:
    """ Return a help string with all the stocked variables."""
    return tabulate(STOCK, headers=["Alias", "Type/Value"],
                    tablefmt="github-raw")


def setup_math() -> None:
    """ Setup the basic math to be used in the language."""
    supported_math = ["numpy", "casadi", "sympy", "math"]
    module = os.environ.get("WALANG_MATH", "numpy")

    if module not in supported_math:
        raise ValueError(f"Unsupported math module `{module}` while starting "
                         f"`walang`. Supported modules are: {supported_math}")

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

    class ColorFormatter(logging.Formatter):
        RESET = "\033[0m"
        COLORS = {"DEBUG":    "\033[94m",  # Blue
                  "INFO":     "\033[92m",  # Green
                  "WARNING":  "\033[93m",  # Yellow
                  "ERROR":    "\033[91m",  # Red
                  "CRITICAL": "\033[95m"}  # Magenta

        def format(self, record):
            color = self.COLORS.get(record.levelname, self.RESET)
            return f"{color}{super().format(record)}{self.RESET}"

    handler = logging.StreamHandler()
    handler.setFormatter(ColorFormatter("%(levelname)s: %(message)s"))

    logger = logging.getLogger("majordome.walang")
    logger.setLevel(logging.DEBUG)
    logger.addHandler(handler)

    # XXX: Not sure this is needed...
    stockpile("w_logger",   logger)

    stockpile("w_info",     logger.info)
    stockpile("w_debug",    logger.debug)
    stockpile("w_warning",  logger.warning)
    stockpile("w_error",    logger.error)
    stockpile("w_critical", logger.critical)

    def runtime_arguments(func):
        """Decorator to add runtime arguments to the main function."""
        @wraps(func)
        def wrapper(*args, **kwargs):
            logger.info(f"{func.__name__.upper()}...")
            logger.info(f"\targs   = {args}")
            logger.info(f"\tkwargs = {kwargs}")
            return func(*args, **kwargs)
        return wrapper

    stockpile("runtime_arguments", runtime_arguments)


def _load_module(name: str):
    """ Try to import a module by its name. """
    try:
        return import_module(name)
    except ModuleNotFoundError:
        w_warning(f"Module `{name}` not found.")
        return None


def _from_globals(name: str):
    """ Try to get a variable from the global scope. """
    return globals()[name] if name in globals() else None


def _from_path(name: str, path: str):
    """ Try to get a variable from a module path. """
    if path is None:
        return None

    if (module := _load_module(f"{path}.{name}")) is None:
        return None

    try:
        return getattr(module, name)
    except AttributeError:
        w_warning(f"Function `{name}` not found in `{path}.{name}`.")
        return None


def _from_module(name: str):
    """ Try to get a variable from a module with the same name. """
    if (module := _load_module(name)) is None:
        return None

    try:
        return getattr(module, name)
    except AttributeError:
        w_warning(f"Function `{name}` not found in module `{name}`.")
        return None


def _homonym_function(name: str, path: str = None):
    """ Dynamically import a function by its name. """
    # Give preference to current scope, it overrides any module import:
    if (func := _from_globals(name)) is not None:
        return func

    # If a path is explicitly provided, import from that module:
    if (func := _from_path(name, path)) is not None:
        return func

    # Otherwise, try to import from the module named `name`:
    if (func := _from_module(name)) is not None:
        return func

    return None


def walab_module(class_name, requires: list[str], module: str = None,
                 call_logging: bool = False):
    """ Create a model by dynamically importing required functions. """
    methods = {}

    for name in requires:
        if (func := _homonym_function(name, path=module)) is None:
            raise ImportError(f"Required function `{name}` not found.")
        else:
            if call_logging:
                func = runtime_arguments(func)

            methods[name] = func

    return type(class_name, (object,), methods)


@(run_on_import := lambda f: f())
def walang():
    """ Initialize the walang environment. """
    print("Initializing `walang` environment...")
    print("Call `majordome.walang.help()` to know its contents.")

    setup_math()
    setup_scipy()
    setup_physics()
    setup_logging()

    stockpile("walab_module", walab_module)

    if os.environ.get("WALANG_VERBOSE", "0") == "1":
        print(help())
