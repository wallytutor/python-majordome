# -*- coding: utf-8 -*-

import ctypes
import ctypes.wintypes
import functools
import os
import re
import sys
import unicodedata

from abc import ABC, abstractmethod
from collections import deque
from decimal import Decimal, getcontext
from io import StringIO, UnsupportedOperation
from numbers import Number
from pathlib import Path
from tempfile import TemporaryFile
from textwrap import dedent
from typing import Any, Callable, Iterator

import numpy as np
import pandas as pd
import requests
import shutil

from IPython import embed
from IPython.display import Markdown, display
from tabulate import tabulate

from ..data import DATA


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

        notebook = kwargs.pop("notebook", False)
        tablefmt = kwargs.pop("tablefmt", "github")

        table = tabulate(data, tablefmt=tablefmt, **kwargs)

        if notebook:
            display(Markdown(table))

        return table

    def display(self, *args, **kwargs) -> None:
        """ Displays a report of the object. """
        notebook = kwargs.pop("notebook", True)
        self.report(*args, notebook=notebook, **kwargs)


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


class InteractiveSessionTracer:
    def __call__(self, frame, event, _arg):
        if event == "return":
            self.locals = frame.f_locals.copy()
        return self


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
        tracer = InteractiveSessionTracer()

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
    """ Capture Python streams and OS file descriptor output.

    This context manager captures stdout and stderr outputs into a list.
    It supports two redirection mechanisms controlled by the `mode`
    parameter:

    - Standard mode (`_standard`): Redirects Python-level streams
      (`sys.stdout` and `sys.stderr`) to Python `StringIO` buffers.

    - Low-level mode (`_low_level`): Redirects low-level OS file
      descriptors 1 (`stdout`) and 2 (`stderr`) via a temporary file,
      allowing capture of output produced directly by native C/C++/
      Fortran libraries and embedded runtimes (such as Ipopt or
      Julia via `juliacall`).

    If `mode` is `None`, low-level redirection is attempted first,
    falling back to standard mode if an exception occurs.

    Parameters
    ----------
    mode : str | None = None
        Capture mode (`'standard'`, `'low_level'`, or `None` for
        automatic low-level with fallback to standard).
    """

    __slots__ = (
        "_mode",
        "_active_mode",
        "_stdout",
        "_stderr",
        "_tmpout",
        "_tmperr",
        "_stdout_fd",
        "_stderr_fd",
        "_dup_stdout_fd",
        "_dup_stderr_fd",
        "_win32_hstdout",
        "_win32_hstderr",
        "_win32_dup_hstdout",
        "_win32_dup_hstderr",
        "_temp_file",
    )

    def __init__(self, mode: str | None = None) -> None:
        super().__init__()
        self._mode = mode
        self._active_mode = None
        self._stdout = None
        self._stderr = None
        self._tmpout = None
        self._tmperr = None
        self._stdout_fd = None
        self._stderr_fd = None
        self._dup_stdout_fd = None
        self._dup_stderr_fd = None
        self._win32_hstdout = None
        self._win32_hstderr = None
        self._win32_dup_hstdout = None
        self._win32_dup_hstderr = None
        self._temp_file = None

    def _standard(self):
        sys.stdout.flush()
        sys.stderr.flush()

        self._stdout = sys.stdout
        self._stderr = sys.stderr

        sys.stdout = self._tmpout = StringIO()
        sys.stderr = self._tmperr = StringIO()

        self._active_mode = "standard"

    def _standard_exit(self):
        sys.stdout.flush()
        sys.stderr.flush()

        py_stdout = self._tmpout.getvalue()
        py_stderr = self._tmperr.getvalue()

        del self._tmpout
        del self._tmperr

        sys.stdout = self._stdout
        sys.stderr = self._stderr

        if py_stdout:
            self.extend(py_stdout.splitlines())
        if py_stderr:
            self.extend(py_stderr.splitlines())

    def _low_level(self):
        sys.stdout.flush()
        sys.stderr.flush()

        self._stdout = sys.stdout
        self._stderr = sys.stderr

        sys.stdout = self._tmpout = StringIO()
        sys.stderr = self._tmperr = StringIO()

        self._temp_file = TemporaryFile(mode="w+b")
        temp_fd = self._temp_file.fileno()

        try:
            self._stdout_fd = self._stdout.fileno()
        except (AttributeError, UnsupportedOperation):
            self._stdout_fd = 1

        try:
            self._stderr_fd = self._stderr.fileno()
        except (AttributeError, UnsupportedOperation):
            self._stderr_fd = 2

        self._dup_stdout_fd = None
        self._dup_stderr_fd = None
        self._win32_dup_hstdout = None
        self._win32_dup_hstderr = None
        self._win32_hstdout = None
        self._win32_hstderr = None

        if sys.platform == "win32":
            try:
                kernel32 = ctypes.windll.kernel32
                kernel32.GetStdHandle.restype = ctypes.wintypes.HANDLE
                kernel32.GetCurrentProcess.restype = (
                    ctypes.wintypes.HANDLE
                )
                kernel32.DuplicateHandle.argtypes = [
                    ctypes.wintypes.HANDLE,
                    ctypes.wintypes.HANDLE,
                    ctypes.wintypes.HANDLE,
                    ctypes.POINTER(ctypes.wintypes.HANDLE),
                    ctypes.wintypes.DWORD,
                    ctypes.wintypes.BOOL,
                    ctypes.wintypes.DWORD,
                ]
                kernel32.DuplicateHandle.restype = ctypes.wintypes.BOOL

                proc = kernel32.GetCurrentProcess()
                self._win32_hstdout = kernel32.GetStdHandle(-11)
                self._win32_hstderr = kernel32.GetStdHandle(-12)

                if self._win32_hstdout:
                    dup = ctypes.wintypes.HANDLE()
                    if kernel32.DuplicateHandle(
                        proc,
                        self._win32_hstdout,
                        proc,
                        ctypes.byref(dup),
                        0,
                        False,
                        2,
                    ):
                        self._win32_dup_hstdout = dup

                if self._win32_hstderr:
                    dup = ctypes.wintypes.HANDLE()
                    if kernel32.DuplicateHandle(
                        proc,
                        self._win32_hstderr,
                        proc,
                        ctypes.byref(dup),
                        0,
                        False,
                        2,
                    ):
                        self._win32_dup_hstderr = dup
            except Exception:
                pass

        try:
            self._dup_stdout_fd = os.dup(self._stdout_fd)
            os.dup2(temp_fd, self._stdout_fd)
            if sys.platform == "win32" and self._win32_hstdout:
                ctypes.windll.kernel32.SetStdHandle(
                    -11, self._win32_hstdout
                )
        except Exception:
            pass

        try:
            self._dup_stderr_fd = os.dup(self._stderr_fd)
            os.dup2(temp_fd, self._stderr_fd)
            if sys.platform == "win32" and self._win32_hstderr:
                ctypes.windll.kernel32.SetStdHandle(
                    -12, self._win32_hstderr
                )
        except Exception:
            pass

        self._active_mode = "low_level"

    def _low_level_exit(self):
        sys.stdout.flush()
        sys.stderr.flush()

        if self._dup_stdout_fd is not None:
            try:
                os.dup2(self._dup_stdout_fd, self._stdout_fd)
                os.close(self._dup_stdout_fd)
                if sys.platform == "win32" and self._win32_hstdout:
                    ctypes.windll.kernel32.SetStdHandle(
                        -11, self._win32_hstdout
                    )
            except Exception:
                pass

        if self._dup_stderr_fd is not None:
            try:
                os.dup2(self._dup_stderr_fd, self._stderr_fd)
                os.close(self._dup_stderr_fd)
                if sys.platform == "win32" and self._win32_hstderr:
                    ctypes.windll.kernel32.SetStdHandle(
                        -12, self._win32_hstderr
                    )
            except Exception:
                pass

        if sys.platform == "win32":
            try:
                kernel32 = ctypes.windll.kernel32
                if self._win32_dup_hstdout:
                    kernel32.CloseHandle(self._win32_dup_hstdout)
                if self._win32_dup_hstderr:
                    kernel32.CloseHandle(self._win32_dup_hstderr)
            except Exception:
                pass

        py_stdout = self._tmpout.getvalue()
        py_stderr = self._tmperr.getvalue()

        del self._tmpout
        del self._tmperr

        sys.stdout = self._stdout
        sys.stderr = self._stderr

        os_output = ""
        if self._temp_file is not None:
            try:
                self._temp_file.seek(0)
                os_output = self._temp_file.read().decode(
                    "utf-8", errors="replace"
                )
                self._temp_file.close()
            except Exception:
                pass

        if py_stdout:
            self.extend(py_stdout.splitlines())
        if py_stderr:
            self.extend(py_stderr.splitlines())
        if os_output:
            self.extend(os_output.splitlines())

    def __enter__(self):
        if self._mode in ("standard", "python"):
            self._standard()
        elif self._mode in ("low_level", "lowlevel", "os"):
            self._low_level()
        else:
            try:
                self._low_level()
            except Exception:
                self._standard()

        return self

    def __exit__(self, *args):
        if self._active_mode == "low_level":
            self._low_level_exit()
        elif self._active_mode == "standard":
            self._standard_exit()

    def __str__(self) -> str:
        return "\n".join(self)


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
    def red(text: Any) -> None:
        """ Print text in red color.

        Parameters
        ----------
        text: Any
            Text (or object with text conversion) to print.
        """
        ColorPrint._print(text, ColorPrint.R)

    @staticmethod
    def green(text: Any) -> None:
        """ Print text in green color.

        Parameters
        ----------
        text: Any
            Text (or object with text conversion) to print.
        """
        ColorPrint._print(text, ColorPrint.G)

    @staticmethod
    def blue(text: Any) -> None:
        """ Print text in blue color.

        Parameters
        ----------
        text: Any
            Text (or object with text conversion) to print.
        """
        ColorPrint._print(text, ColorPrint.B)

    @staticmethod
    def yellow(text: Any) -> None:
        """ Print text in yellow color.

        Parameters
        ----------
        text: Any
            Text (or object with text conversion) to print.
        """
        ColorPrint._print(text, ColorPrint.Y)

    @staticmethod
    def cyan(text: Any) -> None:
        """ Print text in cyan color.

        Parameters
        ----------
        text: Any
            Text (or object with text conversion) to print.
        """
        ColorPrint._print(text, ColorPrint.C)


class ArchitecturalFormatUSParser:
    """ Parse US architectural format to float. """

    @staticmethod
    def _split_foot_from_inches(text: str) -> tuple[float, str]:
        text = text.strip()

        if "-" not in text:
            return 0.0, text

        result = text.split("-")
        # print(result)
        if len(result) != 2:
            raise ValueError(
                "Only one `-` can be used in `F-I a/b` format"
            )

        foot = result[0] or "0"
        inch = result[1] or "0"

        return float(foot), inch

    @staticmethod
    def _parse_fraction(text: str) -> float:
        """ Parse a fraction string 'a/b' to a float. """
        parts = text.split("/")

        if len(parts) != 2:
            raise ValueError(f"Invalid fraction format: {text}")

        return float(parts[0]) / float(parts[1])

    @classmethod
    def _split_inches_from_fraction(cls, text: str) -> tuple[float, float]:
        text = text.strip()

        # This is just a fraction with no integer part:
        if " " not in text and "/" in text:
            return 0.0, cls._parse_fraction(text)

        # On the other hand this is just the integer part:
        if "/" not in text:
            return float(text), 0.0

        result = text.split()

        if len(result) != 2:
            raise ValueError(
                "Only one ` ` can be used in `I a/b` format"
            )

        return float(result[0]), cls._parse_fraction(result[1])

    def __call__(self, text: str, to_meters: bool = True) -> float:
        foot, inch = self._split_foot_from_inches(text)
        inch_int, inch_frac = self._split_inches_from_fraction(inch)

        inches = 12 * foot + inch_int + inch_frac
        return inches * 0.0254 if to_meters else inches


def has_program(name: str) -> bool:
    """ Test if a program is available in system path. """
    return True if shutil.which(name) else False


def program_path(name: str, throw: bool = True) -> Path | None:
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


def download_file(url: str, saveas: str | Path):
    """ Download file from given URL and destination path.

    Reference
    ---------
    https://stackoverflow.com/questions/34692009

    Parameters
    ----------
    url : str
        URL of file to download.
    saveas : path-like
        Path to save downloaded file.
    """
    r = requests.get(url, stream=True)
    status = r.status_code

    match status:
        case 200:
            with open(saveas, "wb") as fp:
                r.raw.decode_content = True
                shutil.copyfileobj(r.raw, fp)
        case _:
            Exception(f"Download of {url} failed with status {status}")


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


def sci_to_latex_decimal(x: Number, sig: int = 3):
    """ Convert a number to LaTeX scientific notation.

    Parameters
    ----------
    x: Number
        The number to convert.
    sig: int
        Number of significative digits after the dot.
    """
    d = Decimal(str(x))

    # Handle zero explicitly
    if d == 0:
        return "0"

    # Compute scientific exponent: floor(log10(|x|))
    exponent = d.adjusted()

    # Compute mantissa: x / 10^exponent
    getcontext().prec = sig
    mantissa = d.scaleb(-exponent)

    # Format mantissa with sig significant digits
    mantissa_str = f"{mantissa:.{sig}g}"

    return fr"{mantissa_str}\times 10^{{{exponent}}}"


def sympy_symbols_factory(*args: str | tuple, scope: dict):
    """ Adds the given names to the global namespace as SymPy symbols. """
    if "sp" not in scope:
        import sympy as sp
        scope["sp"] = sp

    for symbol in args:
        try:
            latex_name = symbol

            if isinstance(symbol, tuple):
                symbol, latex_name = symbol

            exec(f"{symbol} = sp.symbols('{latex_name}')", scope)

        except Exception as e:
            print(f"Error creating symbol {symbol}: {e}")


def validate_input(msg: str) -> bool:
    """ Case-insensitive greedy prompt user for a Yes/No answer.

    Parameters
    ----------
    msg : str
        Message text to display.

    Returns
    -------
    bool
        True if user answers 'y', False if 'n'.
    """
    while True:
        match (ans := input(f"{msg} (y/N): ").lower().strip()):
            case "y":
                return True
            case "n":
                return False
            case _:
                print(f"Invalid input {ans}; please, answer (y/N)")
                continue
