# -*- coding: utf-8 -*-
from abc import ABC
from abc import abstractmethod
from collections import deque
from functools import wraps
from importlib import resources
from io import StringIO
from numbers import Number
from pathlib import Path
from textwrap import dedent
from typing import Any, NamedTuple
from IPython import embed
from matplotlib import pyplot as plt
from tabulate import tabulate
import functools
import logging
import re
import shutil
import sys
import unicodedata
import warnings
import cantera as ct
import numpy as np
import pandas as pd

from . import constants

DATA = Path(str(resources.files("majordome").joinpath("data")))
""" Path to project data folder. """

# XXX: add globally to Cantera path:
ct.add_directory(DATA)


CompositionType = str | dict[str, float]
""" Input type for Cantera composition dictionaries. """

SolutionLikeType = ct.composite.Solution | ct.composite.Quantity
""" Input type for Cantera solution objects. """

PathLike = str | Path
""" Input type for file system paths. """

MaybePath = PathLike | None
""" Input type for optional file system paths. """


class StateType(NamedTuple):
    """ Input type for Cantera TPX state dictionaries. """
    X: CompositionType
    T: int | float | Number = constants.T_NORMAL
    P: int | float | Number = constants.P_NORMAL


class AbstractReportable(ABC):
    """ Abstract base class for reportable objects. """
    def __init__(self, *args, **kwargs) -> None:
        super().__init__()

    @abstractmethod
    def report_data(self, *args, **kwargs) -> list[tuple[Any, ...]]:
        """ Provides data for assemblying the object report. """
        pass

    def report(self, *args, **kwargs) -> str:
        """ Provides a report of the object. """
        data = self.report_data(*args, **kwargs)
        tablefmt = kwargs.pop("tablefmt", "github")
        return tabulate(data, tablefmt=tablefmt, **kwargs)


class ReadTextData:
    """ Utilities for reading common text data formats. """
    @staticmethod
    def read_nlines(fp, nlines):
        """ Read at most `n` lines from text file. """
        return "".join(list(deque(fp, maxlen=nlines)))

    @staticmethod
    def read_data(fname, nlines=None):
        """ Read raw text data file with optional number of lines at end. """
        with open(fname) as fp:
            if not nlines or nlines <= 0:
                return fp.read()

            return ReadTextData.read_nlines(fp, nlines)

    @staticmethod
    def read_sep(fname, nlines=None, sep=r"\s+", **kwargs):
        """ Read raw text data file as a pandas.DataFrame object. """
        text = StringIO(ReadTextData.read_data(fname, nlines=nlines))
        data = pd.read_csv(text, sep=sep, **kwargs)
        return data


class InteractiveSession:
    """ Produce interactive sessions with a copy of function locals. """
    def __init__(self, debug: bool = False, **opts):
        self._debug = debug
        self._opts = dict(colors="LightBG", **opts)

    def _embed(self, func, tracer):
        """ Standard embed configuration. """
        header = f"Running: {func.__name__}"
        user_ns = {**tracer.locals, **globals()}
        embed(header=header, user_ns=user_ns, **self._opts)

    def __call__(self, func):
        """ Decorate function with configured session. """
        def tracer(frame, event, _arg):
            if event == "return":
                tracer.locals = frame.f_locals.copy()
            return tracer

        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            """ Wrapper for interactive session in a given context. """
            if "embed" not in globals() or not self._debug:
                return func(*args, **kwargs)

            sys.settrace(tracer)
            results = func(*args, **kwargs)
            sys.settrace(None)

            self._embed(func, tracer)

            return results
        return wrapper


class Capturing(list):
    """ Helper to capture excessive solver output.

    In some cases, specially when running from a notebook, it might
    be desirable to capture solver (here Ipopt specifically) output
    to later check, thus avoiding a overly long notebook.  For this
    end this context manager is to be used and redirect to a list.
    """
    def __enter__(self):
        self._stdout = sys.stdout
        self._stderr = sys.stderr

        sys.stdout = self._tmpout = StringIO()
        sys.stderr = self._tmperr = StringIO()

        return self

    def __exit__(self, *args):
        self.extend(self._tmpout.getvalue().splitlines())
        self.extend(self._tmperr.getvalue().splitlines())

        del self._tmpout
        del self._tmperr

        sys.stdout = self._stdout
        sys.stderr = self._stderr


class RelaxUpdate:
    """ Relax solution for updating new iteration.

    Parameters
    ----------
    v_ini: np.ndarray
        Initial guess of solution.
    alpha: float = 0.5
        Fraction of old solution to use at updates.
    """
    def __init__(self, v_ini: np.ndarray, alpha: float = 0.5) -> None:
        self._c_old = alpha
        self._c_new = 1.0 - alpha

        self._v_old = np.copy(alpha * v_ini)
        self._v_new = np.empty_like(v_ini)

    def update(self, alpha: float) -> None:
        """ Update relaxation coefficients. """
        self._c_old = alpha
        self._c_new = 1.0 - alpha

    def __call__(self, v_new: np.ndarray) -> np.ndarray:
        """ Evaluate new relaxed solution estimate. """
        self._v_new[:] = self._c_new * v_new + self._v_old
        self._v_old[:] = self._c_old * self._v_new
        return self._v_new


class StabilizeNvarsConvergenceCheck:
    """ Check stabilization towards a constant value along iterations.

    Parameters
    ----------
    n_vars: int
        Number of variables to be checked in problem.
    min_iter: int
        Minimum number of iterations before considering converged.
    max_iter: int
        Maximum number of iterations before considering failure.
    patience: int
        Number of consecutive convergences before declaring convergence.
    rtol: float = 1.0e-06
        See `numpy.isclose` for details.
    atol: float = 1.0e-12
        See `numpy.isclose` for details.
    equal_nan: bool = False
        See `numpy.isclose` for details.
    log_iter: bool = False
        If true, log convergence message when achieved.
    """
    def __init__(self, *, n_vars: int, min_iter: int = 1,
                 max_iter: int = np.inf, patience: int = 10,
                 rtol: float = 1.0e-10,  atol: float = 1.0e-20,
                 equal_nan: bool = False, log_iter: bool = False,
                 ) -> None:
        # TODO add some validation here.
        self._min_iter = min_iter
        self._max_iter = max_iter
        self._patience = patience

        self._last = np.full(n_vars, np.inf)
        self._niter = 0
        self._count = 0
        self._log_iter = log_iter

        self._opts = dict(rtol=rtol, atol=atol, equal_nan=equal_nan)

    def _compare(self, A, B):
        """ Compare two arrays for convergence. """
        return np.isclose(A, B, **self._opts)

    def __call__(self, state: np.ndarray) -> bool:
        """ Check if all variables have stabilized at current iteration. """
        # Increase counter:
        self._niter += 1

        # Logical checks for leaving:
        converge_enough_times  = self._count >= self._patience
        reached_min_iterations = self._niter >= self._min_iter

        # If converging for a while, good, but for a minimum iterations!
        if converge_enough_times and reached_min_iterations:
            if self._log_iter:
                logging.info(f"Converged after {self._niter} iterations")
            return True

        # If reached each, we are *good* here...
        if self._niter >= self._max_iter:
            warnings.warn(f"Leaving after `max_iter` without convergence")
            return True

        # Converge once, count it, otherwise reset counter:
        if np.all(self._compare(self._last, state)):
            self._count += 1
        else:
            self._count = 0

        # TODO report variables lacking convergence?
        # capture results of self._compare.

        # Swap solution states for next call:
        self._last[:] = state

        # Not good, call me back later, folks!
        return False

    @property
    def n_iterations(self) -> int:
        """ Provides access to number of iterations performed. """
        return self._niter


class ComposedStabilizedConvergence:
    """ Wrapper for checking stabilization of several arrays.

    See `StabilizeNvarsConvergenceCheck` for key-word arguments;
    these are shared by all tested arrays. It is always possible to
    compose your own convergence checker using individual instances
    for more control over setup.
    """
    def __init__(self, n_arrs, **kwargs):
        self._conv = np.repeat(self.make_one(**kwargs), n_arrs)
        self._niter = 0

    @staticmethod
    def make_one(**opts):
        """ Create a single instance of convergence checker. """
        return StabilizeNvarsConvergenceCheck(**opts)

    def __call__(self, *arrs):
        """ Check if all arrays have stabilized at current iteration. """
        self._niter += 1

        if len(arrs) != self._conv.shape[0]:
            raise RuntimeError("Bad number of arrays to verify")

        # XXX: run until a first failure only (lazy evaluation).
        for data, conv in zip(arrs, self._conv):
            if not conv(data):
                return False

        return True

    @property
    def n_iterations(self) -> int:
        """ Provides access to number of iterations performed. """
        return self._niter


def has_program(name: str) -> bool:
    """ Test if a program is available in system path. """
    return True if shutil.which(name) else False


def program_path(name: str, throw: bool = True) -> MaybePath:
    """ Returns a program path if it exists. """
    if not has_program(name):
        if throw:
            raise FileNotFoundError(name)
        return None
    return Path(str(shutil.which(name)))


def first_in_path(path_list: list[str | Path]) -> Path | None:
    """ Find first existing path in `path_list`. """
    for p in path_list:
        if (candidate := Path(p)).exists():
            return candidate
    return None


def normalize_string(s: str) -> str:
    """ Normalize strings to be used as valid Python code. """
    # Normalize accented characters (e.g. é → e):
    s = unicodedata.normalize("NFKD", s).encode("ASCII", "ignore").decode("ASCII")

    # Replace non-alphanumeric characters with underscores:
    s = re.sub(r"[^a-zA-Z0-9]+", "_", s)

    # Remove final underscore and make lowercase:
    return s.strip("_").lower()


def report_title(title: str, report: str) -> str:
    """ Generate a text report with a underscored title. """
    return dedent(f"""\n{title}\n{len(title) * "-"}\n""") + report


def safe_remove(target_list: list[Any], to_remove: list[Any] | None,
                inplace: bool = False) -> list:
    """ Safely remove elements from a list and return it. """
    if not isinstance(target_list, list):
        raise TypeError("`target_list` must be a list")

    the_clist = target_list if inplace else target_list.copy()

    # XXX not really necessary but avoids some checks later.
    to_remove = to_remove if to_remove is not None else []

    # Support an empty/None to_remove list.
    if not to_remove:
        return the_clist

    for remove in filter(lambda n: n in the_clist, to_remove):
        the_clist.remove(remove)

    return the_clist


def bounds(arr):
    """ Returns minimum and maximum values of array `arr`. """
    return np.min(arr), np.max(arr)


def within(x, arr):
    """ Check if value `x` is between extrema of array `arr`. """
    return np.min(arr) <= x <= np.max(arr)


def apply(f, iterable):
    """ Apply unit operation over iterable items. """
    return list(map(f, iterable))
