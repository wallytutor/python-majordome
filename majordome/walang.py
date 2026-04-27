# -*- coding: utf-8 -*-
import builtins
import functools
import inspect
import logging
import os

from contextlib import contextmanager
from importlib import import_module
from pathlib import Path
from textwrap import dedent
from tabulate import tabulate
from types import FunctionType

WALANG_STOCK = []
WALANG_MATH_SUPPORTED = ["numpy", "casadi", "sympy", "math"]

#region: logger
class ColorFormatter(logging.Formatter):
    """ Simple colored formatter for logging. """
    RESET = "\033[0m"
    COLORS = {"DEBUG":    "\033[94m",  # Blue
              "INFO":     "\033[92m",  # Green
              "WARNING":  "\033[93m",  # Yellow
              "ERROR":    "\033[91m",  # Red
              "CRITICAL": "\033[95m"}  # Magenta

    def format(self, record):
        color = self.COLORS.get(record.levelname, self.RESET)
        return f"{color}{super().format(record)}{self.RESET}"


class WalangLogger:
    """ A simple logger for Walang with colored output. """
    __slots__ = ("logger",)

    def __init__(self) -> None:
        handler = logging.StreamHandler()
        handler.setFormatter(ColorFormatter("%(levelname)s: %(message)s"))

        self.logger = logging.getLogger("walang")
        self.logger.setLevel(logging.DEBUG)
        self.logger.addHandler(handler)

    def info(self, message: str) -> None:
        self.logger.info(message)

    def debug(self, message: str) -> None:
        self.logger.debug(message)

    def warning(self, message: str) -> None:
        self.logger.warning(message)

    def error(self, message: str) -> None:
        self.logger.error(message)

    def critical(self, message: str) -> None:
        self.logger.critical(message)


def runtime_arguments(func):
    """ Decorator to add runtime arguments to the main function. """
    global WALANG_LOGGER

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        WALANG_LOGGER.info(f"{func.__name__.upper()}...")
        WALANG_LOGGER.info(f"\targs   = {args}")
        WALANG_LOGGER.info(f"\tkwargs = {kwargs}")
        return func(*args, **kwargs)

    return wrapper


WALANG_LOGGER = WalangLogger()
#endregion: logger

#region: core
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


def expose_core():
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
#endregion: core

#region: modules

def _load_module(name: str):
    """ Try to import a module by its name. """
    try:
        return import_module(name)
    except ModuleNotFoundError:
        WALANG_LOGGER.warning(f"Module `{name}` not found.")
        return None


def _from_globals(name: str):
    """ Try to get a variable from the global scope. """
    globals_ = _get_globals_n_levels_up(4)
    return globals_[name] if name in globals_ else None


def _from_path(name: str, path: str):
    """ Try to get a variable from a module path. """
    if path is None:
        return None

    if (module := _load_module(f"{path}.{name}")) is None:
        return None

    try:
        return getattr(module, name)
    except AttributeError:
        WALANG_LOGGER.warning(f"Function `{name}` not found "
                              f"in `{path}.{name}`.")
        return None


def _from_module(name: str):
    """ Try to get a variable from a module with the same name. """
    if (module := _load_module(name)) is None:
        return None

    try:
        return getattr(module, name)
    except AttributeError:
        WALANG_LOGGER.warning(f"Function `{name}` not found "
                              f"in module `{name}`.")
        return None


def _homonym_function(name: str, path: str | None = None):
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


def _get_globals_n_levels_up(level=3):
    frame = inspect.currentframe()
    for _ in range(level):
        frame = frame.f_back
    return frame.f_globals


@contextmanager
def _walab_module_directory(level=3):
    """ Runs code in the context of the caller's caller directory.

    Notice that the `level` argument indicates how many levels up
    the stack to go to find the caller's caller. The default value
    is 3, which gets the called of `walab_module`, which is usually
    what we want.
    """
    origin = Path.cwd()
    module = Path(inspect.stack()[level].filename).resolve().parent
    os.chdir(module)
    try:
        yield
    finally:
        os.chdir(origin)


def walab_module(class_name, requires: list[tuple[str, dict]], *,
                 module: str | None = None, call_logging: bool = False,
                 properties: dict = {}) -> type:
    """ Create an WaLab model by dynamically importing functions. """
    methods = {}

    with _walab_module_directory():
        for (name, f_namespace) in requires:
            if name in methods:
                raise KeyError(f"Duplicate function `{name}` found.")

            if (func := _homonym_function(name, path=module)) is None:
                raise ImportError(f"Required function `{name}` not found.")
            else:
                f_namespace = {**func.__globals__, **f_namespace}
                func = FunctionType(func.__code__, f_namespace)

                if call_logging:
                    func = runtime_arguments(func)

                methods[name] = func

    if (overlap := set(methods) & set(properties)):
        raise KeyError(f"Overlapping keys found in methods and "
                       f"properties: {overlap}.")

    return type(class_name, (object,), {**methods, **properties})


def walab_import(module, class_name: str) -> type:
    """ Import a class from a WaLab module. """
    try:
        return getattr(import_module(module), class_name)
    except Exception as e:
        WALANG_LOGGER.error(f"Failed to import {class_name} "
                            f"from {module}: {e}")
        raise


def walab_instance(module, class_name: str, *args, **kwargs) -> object:
    """ Import and instantiate a class from a WaLab module. """
    return walab_import(module, class_name)(*args, **kwargs)


def expose_modules():
    """ Expose the module functions to the walang environment. """
    stockpile("wmodule",   walab_module)
    stockpile("wimport",   walab_import)
    stockpile("winstance", walab_instance)
#endregion: modules

@(run_on_import := lambda f: f())
def walang():
    """ Initialize the walang environment. """
    expose_core()
    # expose_modules()
