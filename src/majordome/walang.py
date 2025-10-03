# -*- coding: utf-8 -*-
from functools import wraps
from importlib import import_module
import builtins
import logging
import os


def setup_math() -> None:
    """ Setup the basic math to be used in the language."""
    supported_math = ["numpy", "casadi", "sympy", "math"]
    module = os.environ.get("WALANG_MATH", "numpy")

    if module not in supported_math:
        raise ValueError(f"Unsupported math module `{module}` while starting "
                         f"`walang`. Supported modules are: {supported_math}")

    math = import_module(module)

    setattr(builtins, "math", math)
    setattr(builtins, "pi",   math.pi)
    setattr(builtins, "sin",  math.sin)
    setattr(builtins, "cos",  math.cos)
    setattr(builtins, "tan",  math.tan)
    setattr(builtins, "exp",  math.exp)
    setattr(builtins, "log",  math.log)
    setattr(builtins, "sqrt", math.sqrt)
    setattr(builtins, "dot",  math.dot)

    if hasattr(math, "diff"):
        setattr(builtins, "diff", math.diff)

    if module == "casadi":
        setattr(builtins, "SX", math.SX)
        setattr(builtins, "MX", math.MX)
        setattr(builtins, "DM", math.DM)


def setup_scipy() -> None:
    """ Setup the SciPy modules to be used in the language. """
    integrate = import_module("scipy.integrate")
    setattr(builtins, "integrate",   integrate)
    setattr(builtins, "solve_bvp",   integrate.solve_bvp)
    setattr(builtins, "solve_ivp",   integrate.solve_ivp)
    setattr(builtins, "cum_simpson", integrate.cumulative_simpson)

    interpolate = import_module("scipy.interpolate")
    setattr(builtins, "interpolate", interpolate)
    setattr(builtins, "CubicSpline", interpolate.CubicSpline)

    optimize  = import_module("scipy.optimize")
    setattr(builtins, "optimize", optimize)
    setattr(builtins, "root",     optimize.root)
    setattr(builtins, "minimize", optimize.minimize)


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

    logger = logging.getLogger("walang")
    logger.setLevel(logging.DEBUG)
    logger.addHandler(handler)

    setattr(builtins, "w_logger",   logger)
    setattr(builtins, "w_info",     logger.info)
    setattr(builtins, "w_debug",    logger.debug)
    setattr(builtins, "w_warning",  logger.warning)
    setattr(builtins, "w_error",    logger.error)
    setattr(builtins, "w_critical", logger.critical)

    def runtime_arguments(func):
        """Decorator to add runtime arguments to the main function."""
        @wraps(func)
        def wrapper(*args, **kwargs):
            logger.info(f"{func.__name__.upper()}...")
            logger.info(f"\targs   = {args}")
            logger.info(f"\tkwargs = {kwargs}")
            return func(*args, **kwargs)
        return wrapper

    setattr(builtins, "runtime_arguments", runtime_arguments)


@(run_on_import := lambda f: f())
def walang():
    """ Initialize the walang environment. """
    setup_math()
    setup_scipy()
    setup_logging()
