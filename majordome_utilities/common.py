# -*- coding: utf-8 -*-
from abc import ABC
from abc import abstractmethod
from collections import deque
from io import StringIO
from pathlib import Path
from textwrap import dedent
from typing import Any
from IPython import embed
from tabulate import tabulate
import functools
import re
import shutil
import sys
import unicodedata
import numpy as np
import pandas as pd


PathLike = str | Path
""" Input type for file system paths. """

MaybePath = PathLike | None
""" Input type for optional file system paths. """


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


class ColorPrint:
    """ Helper to print colored text in terminal. """
    R = "\033[31m"
    G = "\033[32m"
    B = "\033[34m"
    Y = "\033[33m"
    C = "\033[36m"
    K = "\033[0m"

    @staticmethod
    def _print(text, color_code):
        """ Print text in given color. """
        print(f"{color_code}{text}{ColorPrint.K}")

    @staticmethod
    def red(text):
        """ Print text in red color. """
        ColorPrint._print(text, ColorPrint.R)

    @staticmethod
    def green(text):
        """ Print text in green color. """
        ColorPrint._print(text, ColorPrint.G)

    @staticmethod
    def blue(text):
        """ Print text in blue color. """
        ColorPrint._print(text, ColorPrint.B)

    @staticmethod
    def yellow(text):
        """ Print text in yellow color. """
        ColorPrint._print(text, ColorPrint.Y)

    @staticmethod
    def cyan(text):
        """ Print text in cyan color. """
        ColorPrint._print(text, ColorPrint.C)


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
    s = unicodedata.normalize("NFKD", s)\
        .encode("ASCII", "ignore")\
        .decode("ASCII")

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
