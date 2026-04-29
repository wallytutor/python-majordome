# -*- coding: utf-8 -*-
import functools
import numpy as np
import os
import pandas as pd
import re
import requests
import shutil
import subprocess
import sys
import unicodedata
import warnings

from abc import ABC, abstractmethod
from collections import OrderedDict, deque
from dataclasses import dataclass
from decimal import Decimal, getcontext
from matplotlib import pyplot as plt
from matplotlib import colormaps
from matplotlib.axes import Axes
from matplotlib.figure import Figure
from matplotlib.cm import ScalarMappable
from matplotlib.colors import ListedColormap, TwoSlopeNorm
from matplotlib.ticker import FuncFormatter
from pyvista import LookupTable
from numbers import Number
from io import StringIO
from pathlib import Path
from pdf2image import convert_from_path
from pypdf import PdfReader
from pytesseract import pytesseract, image_to_string
from string import Template
from tabulate import tabulate
from textwrap import dedent
from time import perf_counter
from typing import Any, Callable, Iterator, ParamSpec
from IPython import embed

from .data import DATA

#region: common
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
#endregion: common

#region: progress
class ProgressBar:
    """ Simple progress bar with duration estimation for simulation tracking.

    This basic progress bar display process status advance on the screen and
    also total run-time and e.t.a (estimated time of arrival). It is extremely
    minimalist and cannot handle overflow, thus it is up to the user to ensure
    terminal will be at least 79 characters wide.

    Parameters
    ----------
    ncols: int | None = 40
        Number of columns used for bar tracing.
    marker: str | None = "█"
        Single character used for filling up the bar.
    """
    def __init__(self,
            ncols: int = 40,
            marker: str = "█"
        ) -> None:
        self._nc = ncols + 1.0e-06
        self._mk = marker[:1]
        self._t0 = perf_counter()
        self._duration = None

        base = ("\r|{{0:{ncols}s}}| {{1:3.0f}}% "
                "[run {{2:.2e}}s | eta {{3:.2e}}s]")
        self._txt = base.format(ncols=ncols)

    def update(self, frac: float) -> None:
        """ Update fraction of bar filling.

        Parameters
        ----------
        frac: float
            Current status of filling to apply to the bar.
        """
        stat = int(self._nc * frac)

        mark = self._mk * stat
        fill = 100 * stat / self._nc

        run = perf_counter() - self._t0
        eta = float("nan") if fill <= 0.0 else 100 * run / fill - run

        sys.stdout.write(self._txt.format(mark, fill, run, eta))
        sys.stdout.flush()

        self._duration = run

    @property
    def duration(self):
        """ Return total wall time of process. """
        if self._duration is None:
            raise ValueError("Progress not yet measured.")
        return self._duration


def progress_bar(
        array: list[object] | Iterator,
        ncols: int = 40,
        marker: str = "█",
        size: int | None = None,
        enum: bool = False
    ):
    """ Wrapper to use progress bar as iterator.

    Parameters
    ----------
    array: list[object] | Iterator
        List of iterator of objects to track progression.
    ncols: int = 40
        Number of columns used for bar tracing.
    marker: str = "█"
        Single character used for filling up the bar.
    size: int | None = None
        If `array` does not have a length, *i.e*, it is an iterator,
        the size of the provided object is mandatory and provided
        through this parameters.
    enum: Optional[bool] = False
        If true, return the zero based object counter.
    """
    if size is None and isinstance(array, list):
        size = len(array)
    else:
        raise ValueError("Size must be provided if 'array' it is an iterator.")

    pbar = ProgressBar(ncols=ncols, marker=marker)

    for count, value in enumerate(array, 1):
        pbar.update(count / size)
        yield value if not enum else (count - 1, value)

    print(f"\nTook {pbar.duration}s")
#endregion: progress

#region: plotting
Params = ParamSpec("Params")
SigIn  = Callable[Params, Any]
SigOut = Callable[Params, object]


class MajordomePlot:
    """ Handles the creation and management of plots.

    Provides a handle for creating and managing plots using Matplotlib.
    It is aimed at standardizing the plot creation process across the
    Majordome framework.

    Parameters
    ----------
    shape : tuple[int, int]
        Shape of the plot as (n_rows, n_cols).
    style : str
        Matplotlib style to use for the plot.
    size : tuple[float, float] | None
        Size of the plot in inches as (width, height). If None, the
        default size will be used.
    xlabel : str | list[str] | None
        Label(s) for the x-axis. If a list is provided, each subplot
        will get its own label.
    ylabel : str | list[str] | None
        Label(s) for the y-axis. If a list is provided, each subplot
        will get its own label.
    opts : dict[str, Any]
        Additional options to pass to `plt.subplots()`.
    """
    __slots__ = ("_fig", "_ax", "_xlabel", "_ylabel")

    def __init__(self,
                 shape: tuple[int, int] = (1, 1),
                 style: str = "classic",
                 *,
                 size: tuple[float, float] | None = None,
                 xlabel: str | list[str] | None = None,
                 ylabel: str | list[str] | None = None,
                 opts: dict[str, Any] = {"facecolor": "white"},
                 ) -> None:
        n_rows, n_cols = shape

        plt.close("all")
        plt.style.use(style)

        self._fig, ax = plt.subplots(n_rows, n_cols, **opts)
        self._ax = list(np.ravel(ax))

        self._xlabel = xlabel
        self._ylabel = ylabel

        if size is not None:
            self.resize(*size)

    def _get_label(self, name: str, k: int) -> str:
        """ Get label for axis at the k-th subplot, if any.

        Parameters
        ----------
        name : str
            Name of the axis, either "x" or "y".
        k : int
            Index of the subplot for which to get the label.
        """
        match name:
            case "x":
                label = self._xlabel or "X-axis"
            case "y":
                label = self._ylabel or "Y-axis"
            case _:
                raise ValueError(f"Unknown label name `{name}`.")

        return label if isinstance(label, str) else label[k]

    def resize(self, w: float, h: float) -> None:
        """ Resize a plot with width and height in inches.

        Parameters
        ----------
        w : float
            Width of the plot in inches.
        h : float
            Height of the plot in inches.
        """
        self._fig.set_size_inches(w, h)
        self._fig.tight_layout()

    def savefig(self, filename: str | Path, **kwargs) -> None:
        """ Wrapper for saving a figure to file.

        Parameters
        ----------
        filename : str | Path
            Path to save the figure to.
        kwargs
            Additional keyword arguments to pass to `Figure.savefig()`.
        """
        self._fig.savefig(Path(filename).as_posix(), **kwargs)

    def subplots(self) -> tuple[Figure, list[Axes]]:
        """ Provides access to underlying figure and axes. """
        return self._fig, self._ax

    def show(self) -> None:
        """ Display the plot. """
        plt.show()

    @property
    def figure(self) -> Figure:
        """ Provides access to underlying figure. """
        return self._fig

    @property
    def axes(self) -> list[Axes]:
        """ Provides access to underlying axes. """
        return self._ax

    @classmethod
    def new(cls,
            _func: SigIn | None = None, *,
            shape: tuple[int, int] = (1, 1),
            style: str = "classic",
            sharex: bool = True,
            facecolor: str = "white",
            grid: bool = True,
            size: tuple[float, float] | None = None,
            xlabel: str | list[str] | None = None,
            ylabel: str | list[str] | None = None
        ) -> Callable[[SigIn], Any]:
        """ Wraps a function for ensuring a standardized plot.

        Parameters
        ----------
        _func : SigIn | None
            Function to wrap, if any.
        shape : tuple[int, int]
            Shape of the plot as (n_rows, n_cols).
        style : str, optional
            Matplotlib style to use for the plot. By default "classic".
        sharex : bool
            Whether to share x-axis among subplots.
        size : tuple[float, float] | None, optional
            Size of the plot in inches as (width, height). If None, the
            default size will be used. By default None.
        xlabel : str | list[str] | None, optional
            Label(s) for the x-axis. If a list is provided, each subplot
            will get its own label. By default None.
        ylabel : str | list[str] | None, optional
            Label(s) for the y-axis. If a list is provided, each subplot
            will get its own label. By default None.
        facecolor : str
            Face color of the figure.
        grid : bool
            Whether to display grid lines.

        Returns
        -------
        Callable[[SigIn], Any]
            Decorated function.
        """
        opts = dict(sharex=sharex, facecolor=facecolor)

        def decorator(func: SigIn) -> SigOut:
            @functools.wraps(func)
            def wrapper(*args: Params.args, **kwargs: Params.kwargs) -> object:
                if "plot" in kwargs and kwargs.get("plot") is not None:
                    raise ValueError("The `plot` keyword argument is reserved "
                                     "for `MajordomePlot.new` decorator.")

                kwargs["plot"] = obj = cls(shape, style, size=size,
                                           xlabel=xlabel, ylabel=ylabel,
                                           opts=opts)

                for k, ax in enumerate(obj.axes):
                    ax.set_xlabel(obj._get_label("x", k))
                    ax.set_ylabel(obj._get_label("y", k))

                    if grid:
                        ax.grid(linestyle=":")

                func(*args, **kwargs)
                obj.figure.tight_layout()
                return obj
            return wrapper
        return decorator if _func is None else decorator(_func)


class PowerFormatter(FuncFormatter):
    """ Formatter for power of ten in numerical axes.

    Parameters
    ----------
    values : str
        String of characters to be replaced by their superscript
        counterparts. By default "0123456789-".
    supers : str
        String of superscript characters corresponding to `values`. By
        default "⁰¹²³⁴⁵⁶⁷⁸⁹⁻".
    """
    __slots__ = ("_superscripts",)

    def __init__(self, **kwargs) -> None:
        values = kwargs.get("values", "0123456789-")
        supers = kwargs.get("supers", "⁰¹²³⁴⁵⁶⁷⁸⁹⁻")
        self._superscripts = str.maketrans(values, supers)

        super().__init__(self._format_power)

    def _format_power(self, x, pos) -> str:
        """ Format a power of ten using current font. """
        exp = f"{int(x)}".translate(self._superscripts)
        return f"10{exp}"


def centered_colormap(name: str, vmin: float, vmax: float,
                      vcenter: float = 0.0) -> LookupTable:
    """ Ensure the center of a colormap is at zero.

    Parameters
    ----------
    name : str
        Name of the colormap to use.
    vmin : float
        Minimum value of the data range.
    vmax : float
        Maximum value of the data range.
    vcenter : float
        Center value of the colormap, by default 0.

    Returns
    -------
    LookupTable
        A PyVista LookupTable with the centered colormap.
    """
    space = np.linspace(vmin, vmax, 256)

    norm = TwoSlopeNorm(vmin=vmin, vcenter=vcenter, vmax=vmax)
    sm = ScalarMappable(norm=norm, cmap=colormaps[name])
    cm = np.array(sm.to_rgba(space, bytes=True)) / 255

    lut = LookupTable(ListedColormap(cm))
    lut.scalar_range = (vmin, vmax)

    return lut


@MajordomePlot.new(size=(5, 4))
def plot_xy(x=None, y=None, *,
           plot: MajordomePlot | None = None,
           **kwargs) -> MajordomePlot:
    """ Quick plot 2D data using a standardized plot."""
    if plot is None:
        raise ValueError("`plot` keyword argument is required.")

    _, ax = plot.subplots()
    if x is not None and y is not None:
        ax[0].plot(x, y, **kwargs)
    return plot


# Alias for backward compatibility.
def plot2d(*args, **kwargs):
    warnings.warn("`plot2d` is deprecated, use `plot_xy` instead.", DeprecationWarning)
    return plot_xy(*args, **kwargs)
#endregion: plotting

#region: latex
#############################################################################
# TEMPLATING
##############################################################################

def is_tex(path: Path) -> bool:
    """ Check if the given path points to a LaTeX (.tex) file. """
    return path.is_file() and path.suffix == ".tex"


def list_tex_templates() -> list[str]:
    """ List available LaTeX templates in the data directory. """
    return [f.name for f in (DATA / "latex").iterdir() if is_tex(f)]


def load_tex_template(name: str) -> Template:
    """ Load a LaTeX template from the data directory. """
    possible = [f"{name}.tex", DATA / "latex" / f"{name}.tex"]

    if not (path := first_in_path(possible)):
        raise FileNotFoundError(f"Template '{name}' not found in data/latex.")

    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    return Template(content)


def fill_tex_template(template: str | Template, **kw) -> str:
    """ Fill a LaTeX template with the given parameters. """
    if isinstance(template, str):
        template = load_tex_template(template)

    required = template.get_identifiers()
    ignoring = []

    if "graphicspath" in required and "graphicspath" not in kw:
        kw["graphicspath"] = ["."]

    if "userpreamble" in required and "userpreamble" not in kw:
        kw["userpreamble"] = ""

    if "subtitle" in required and "subtitle" not in kw:
        kw["subtitle"] = ""

    for key, value in kw.items():
        if key not in required:
            print(f"Template does not require parameter '{key}'.")
            ignoring.append(key)
            continue

        if key == "graphicspath" and isinstance(value, list):
            kw[key] = graphics_path(value)

    for key in ignoring:
        kw.pop(key)

    return template.substitute(**kw)

##############################################################################
# HELPERS
##############################################################################

def graphics_path(items: list[str]) -> str:
    """ Generate LaTeX graphics path command from a list of directories. """
    return ",".join(f"{{{item}}}" for item in items)


def include_figure(path: str | Path, **kw):
    """ Generate LaTeX code to include a figure with given options. """
    options = []

    for key, value in kw.items():
        match key:
            case "width" | "height" | "scale":
                options.append(f"{key}={value}")
            case "trim":
                pass  # TODO: implement trim option
                # options.append(f"trim={value}")
            case "clip" if value is True:
                options.append("clip")
            case _:
                print(f"Unknown option '{key}' for include_figure.")

    options = ",".join(options)
    return f"\\includegraphics[{options}]{{{Path(path).as_posix()}}}"


def url_link(*, url: str, text: str | None = None) -> str:
    """ Generate a LaTeX hyperlink. """
    return f"\\href{{{url}}}{{{text or url}}}"


def split_line() -> str:
    """ Generate a horizontal line in LaTeX. """
    return f"% {70 * '-'}\n"


def section(title: str, separator: bool = True) -> str:
    """ Generate a LaTeX section command. """
    text = ""
    if separator:
        text += split_line()
    return text + f"\n\\section{{{title}}}\n"

##############################################################################
# LISTS
##############################################################################

def itemize(items: list[str], itemsep: str = "6pt") -> str:
    """ Generate LaTeX itemize environment from a list of items. """
    warnings.warn("LEGACY FUNCTION: replace in new code with Itemize class",
                  DeprecationWarning)

    contents = [
        f"\\begin{{itemize}}",
        f"  \\setlength{{\\itemsep}}{{{itemsep}}}",
        "\n".join(f"  \\item{{}}{item}" for item in items),
        f"\\end{{itemize}}"
    ]
    return "\n".join(contents) + "\n"


class Itemize:
    """ Context manager to create LaTeX itemize environments. """
    __slots__ = ("_itemsep", "_items", "_itemintro")

    def __init__(self, itemsep: str = "6pt") -> None:
        self._itemsep = itemsep
        self._items = []

    def __repr__(self) -> str:
        """ Provides the LaTeX code for the itemize environment. """
        contents = [
            f"\\begin{{itemize}}",
            f"  \\setlength{{\\itemsep}}{{{self._itemsep}}}",
            "\n".join(self._items),
            f"\\end{{itemize}}"
        ]

        if hasattr(self, "_itemintro"):
            contents.insert(0, self._itemintro)

        return "\n".join(contents)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if exc_type:
            print(f"Exception: {exc_type}, {exc_value}")
        return False

    def intro(self, text: str, space: str = "6pt") -> None:
        """ Add introductory text before the itemize environment. """
        self._itemintro = f"{text}\n\\par\\vspace{{{space}}}\\par\n"

    def add(self, item: str) -> None:
        """ Add an item to the itemize list. """
        self._items.append(f"  \\item{{}}{item}")

    def collect(self) -> str:
        """ Collect the LaTeX code for the itemize environment. """
        return repr(self)

##############################################################################
# BEAMER
##############################################################################

def two_columns(*, text_left: str = "", text_right: str = "",
                width_left: float = 0.5, width_max: float = 0.96) -> str:
    """ Create a 2-columns contents for a Beamer slide. """
    width_right = 1.0 - width_left
    w_left  = f"{width_max * width_left}\\linewidth"
    w_right = f"{width_max * width_right}\\linewidth"

    contents = [
        f"\\begin{{columns}}",
        f"  \\begin{{column}}{{{w_left}}}",
        f"  {text_left}",
        f"  \\end{{column}}",
        f"  \\begin{{column}}{{{w_right}}}",
        f"  {text_right}",
        f"  \\end{{column}}",
        f"\\end{{columns}}"
    ]
    return "\n".join(contents)


def beamer_slide(*, title: str = "", subtitle: str = "",
                 contents: str = "", align: str = "\\centering") -> str:
    """ Wraps contents in a beamer frame with provided arguments. """
    slide = [
        f"\\begin{{frame}}\n  {{{title}}}\n  {{{subtitle}}}",
        f"{align}",
        f"{contents}",
        f"\\end{{frame}}"
    ]
    return "\n".join(slide) + "\n"


def beamer_two_columns(*, title: str = "", subtitle: str = "",
                       text_left: str = "", text_right: str = "",
                       width_left: float = 0.5, width_max: float = 0.96,
                       align: str = "\\centering") -> str:
    """ Create a two-column Beamer slide. """
    contents = two_columns(text_left=text_left, text_right=text_right,
                           width_left=width_left, width_max=width_max)

    slide = beamer_slide(title=title, subtitle=subtitle,
                         contents=contents, align=align)

    return slide


class BeamerSlides:
    """ Class to manage multiple Beamer slides. """
    __slots__ = ("_config", "_verbose", "_slides", "_section")

    def __init__(self, *, config: dict[str, Any], verbose: bool = True) -> None:
        self._config = config
        self._verbose = verbose
        self._slides = OrderedDict()
        self._section = 1

    def add_section(self, title: str, separator: bool = True) -> None:
        """ Add a section slide with the given title. """
        content = section(title, separator=separator)
        key = f"section_{self._section}"

        if key not in self._slides:
            self._section += 1

        if self._verbose and key in self._slides:
            warnings.warn(f"Warning: Section with key '{key}' already "
                           "exists. Overwriting with new content.")

        self._slides[key] = content

    def add_slide(self, key, **kw) -> None:
        """ Add a Beamer slide with provided arguments. """
        # XXX: if contents is provided, it is a single column slide:
        f = beamer_slide if "contents" in kw else beamer_two_columns

        # Slide is added to the dictionary, warn if key exists:
        if self._verbose and key in self._slides:
            warnings.warn(f"Warning: Slide with key '{key}' already "
                           "exists. Overwriting with new content.")

        self._slides[key] = f(**kw)

    def _generate(self) -> str:
        """ Generate the complete LaTeX code for all Beamer slides. """
        return "\n".join(self._slides.values()) + "\n"

    def generate(self) -> str:
        """ Public method to generate LaTeX code for slides. """
        contents = self._generate()

        tmp = self._config.copy()
        template = load_tex_template(tmp.pop("template"))
        text = fill_tex_template(template, contents=contents, **tmp)

        return text

    def build(self, saveas: str | Path, bib: bool = False) -> None:
        """ Build the Beamer slides using pdflatex. """
        slides_tex = Path(saveas)
        slides_dir = slides_tex.parent

        if not slides_dir.exists():
            ColorPrint.red(f"Project directory does not exist. "
                           f"Creating '{slides_dir}' for dumping.")
            slides_dir.mkdir(parents=True, exist_ok=True)

        cmd = [
            "pdflatex",
            "--shell-escape",
            "-interaction=nonstopmode",
            slides_tex.stem
        ]

        with open(saveas, "w", encoding="utf-8") as fp:
            fp.write(self.generate())

        with open(slides_dir / f"log.{slides_tex.stem}", "w") as log:
            def run(cmd):
                subprocess.run(cmd, cwd=slides_dir,
                               stdout=log, stderr=log)

            run(cmd)
            run(cmd)

            if bib:
                run(["bibtex", slides_tex.stem])
                run(cmd)
                run(cmd)


class SlideContentWriter:
    """ Context manager to write Beamer LaTeX contents. """
    __slots__ = ("_lines",)

    def __init__(self) -> None:
        self._lines = []

    def __repr__(self) -> str:
        """ Provides the LaTeX code for the slide content. """
        return "\n".join(self._lines)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if exc_type:
            print(f"Exception: {exc_type}, {exc_value}")
        return False

    def vspace(self, space: str) -> None:
        """ Add vertical space in the slide content. """
        self._lines.append(f"\\par\\vspace{{{space}}}\\par\n")

    def add(self, line: str) -> None:
        """ Add a line to the slide content. """
        self._lines.append(line + "\n")

    def collect(self) -> str:
        """ Collect the LaTeX code for the slide content. """
        return repr(self)
#endregion: latex

#region: argument parsing
class FuncArguments:
    """ Metaprogramming helper to manage function arguments.

    To-do: support automatic documentation generation and type checking.

    Parameters
    ----------
    greedy_args: bool = True
        If true, raises if too many positional arguments are given. Notice
        that keyword arguments are not counted towards this limit, and if
        using in multiple inheritance, arguments of parent classes are cannot
        have more positional arguments than the child class.
    pop_kw: bool = True
        If true, keyword arguments are removed from `kwargs` when used. This
        is useful to avoid passing unexpected keywords to parent classes.
    """
    __slots__ = ("greedy_args", "pop_kw", "config", "kwdata",
                 "got", "nargs", "args", "kwargs", "kwget")

    def __init__(self, greedy_args: bool = True, pop_kw: bool = True) -> None:
        self.greedy_args = greedy_args
        self.pop_kw = pop_kw

        self.config = {}
        self.kwdata = {}

        self.got    = 0
        self.nargs  = 0
        self.args   = []
        self.kwargs = {}

    def update(self, *args, **kwargs) -> None:
        """ Updates the arguments to manage at current call. """
        self.got    = 0
        self.nargs  = len(args)
        self.args   = args
        self.kwargs = kwargs

        self.kwget = self.kwargs.pop if self.pop_kw else self.kwargs.get

    def add(self, name: str, index: int | None = None, **kwargs) -> None:
        """ Adds a new argument to manage when configuring function. """
        if name in self.config:
            raise KeyError(f"Argument already configured: {name}.")

        if index is not None and index < 0:
            raise ValueError(f"Negative argument index: {name} ({index})")

        if (try_kw := "default" in kwargs):
            self.kwdata[name] = kwargs.get("default")
            try_kw = True

        if index is None and not try_kw:
            raise ValueError(f"Argument must be either positional or "
                             f"keyword, cannot be neither: {name}")

        self.config[name] = (index, try_kw)

    def _get_by_index(self, index: int) -> Any:
        """ Retrieves a mandatory positional argument by index. """
        try:
            value = self.args[index]
        except IndexError:
            raise IndexError(f"Cannot retrieve mandatory positional "
                             f"argument at position {index}")
        else:
            self.got += 1
            return value

    def _get_by_key(self, name: str) -> Any:
        """ Retrieves a keyword argument by name. """
        return self.kwget(name, self.kwdata.get(name))

    def _get_by_any(self, name: str, index: int) -> Any:
        """ Retrieves an argument by index or keyword. """
        if index < self.nargs and name in self.kwargs:
            raise ValueError(f"Cannot have both positional and keyword "
                                f"version of {name} ({index}) simultaneously")

        try:
            return self._get_by_index(index)
        except IndexError:
            return self._get_by_key(name)

    def get(self, name: str) -> Any:
        """ Retrieves the value of a configured argument. """
        if name not in self.config:
            raise KeyError(f"Argument not configured: {name}.")

        index, try_kw = self.config[name]

        # (1) -- mandatory positional
        if index is not None and not try_kw:
            return self._get_by_index(index)

        # (2) -- keyword-only argument
        if index is None and try_kw:
            return self._get_by_key(name)

        # (3) -- prefer `args` but accept kwargs:
        if index is not None and try_kw:
            return self._get_by_any(name, index)

        # (4) -- should not happen, misconfiguration
        raise RuntimeError(f"Entry for {name} is malformed, this should not "
                           f"happen! Please check creation of arguments.")

    def close(self):
        if self.greedy_args and self.got != self.nargs:
            raise ValueError(f"Too many positional arguments, got "
                             f"{self.nargs} but only {self.got} were used.")
#endregion: argument parsing

#region: pdftools
@dataclass
class PdfExtracted:
    """ Stores data extracted from a PDF file. """
    meta: dict[str, Any] | None
    content: str


class PdfToTextConverter:
    """ Performs text extraction from PDF file.

    Please notice that Tesseract executable path is to be supplied (if
    not in PATH) and not its containing directory, while Poppler's
    directory containing `pdftotext` and other tools is also to be
    supplied (if these are not in PATH).

    Parameters
    ----------
    tesseract : Path | None, optional
        Path to Tesseract executable. If None, searches in PATH.
    pdftotext : Path | None, optional
        Path to pdftotext directory. If None, searches in PATH.
    n_pages_warn : int, optional
        Number of pages above which a warning is issued. Default is 100.
    """
    __slots__ = ("_tesseract", "_pdftotext", "_bigpdf")

    def __init__(self, tesseract: Path | None = None,
                 pdftotext: Path | None = None, n_pages_warn: int = 100) -> None:
        self._pdftotext = self._ensure_program("pdftotext", pdftotext)
        self._tesseract = self._ensure_program("tesseract", tesseract)
        self._bigpdf = n_pages_warn

        if self._pdftotext is not None:
            self._pdftotext = self._pdftotext.parent

        pytesseract.tesseract_cmd = self._tesseract

    def _ensure_program(self, name: str, program: Path | None) -> Path | None:
        """ Ensure that `program` exists, or find it in PATH. """
        if program:
            if not (program := Path(program)).exists():
                raise FileNotFoundError(f"Missing {name} at {program}")
            return program

        return program_path(name)

    def read(self, pdf_path: str | Path) -> PdfReader | None:
        """ Return True if PDF is not encrypted, performs some checks. """
        doc = PdfReader(pdf_path)

        if doc.is_encrypted:
            warnings.warn(f"PDF is encrypted: {pdf_path}")
            return None

        if (n_pages := len(doc.pages)) > self._bigpdf:
            warnings.warn(f"{pdf_path} is too long ({n_pages})")

        return doc

    def _page_image(self, pdf_path: str | Path, page: int, *, dpi: int = 150,
                    userpw: str | None = None, thread_count: int = 1) -> str:
        """ Handles in-memory conversion of PDF to image. """
        max_threads = os.cpu_count() or 1

        if thread_count > max_threads:
            thread_count = max_threads

        kwargs = {
            "dpi": dpi,
            "first_page": page,
            "last_page": page,
            "thread_count": thread_count,
            "poppler_path": self._pdftotext,
            "output_folder": None,
            "fmt": "ppm",
            "jpegopt": None,
            "use_cropbox": False,
            "strict": False,
            "transparent": False,
            "single_file": False,
            "grayscale": False,
            "size": None,
            "paths_only": False,
        }

        if userpw is not None:
            kwargs["userpw"] = userpw

        images = convert_from_path(pdf_path, **kwargs)
        return image_to_string(images[0])

    def __call__(self, pdf_path: str | Path, first_page: int | None = None,
                 last_page: int | None = None, use_ocr: bool = False,
                 fallback_ocr: bool = True, verbose: bool = False,
                 ocr_opts: dict[str, Any] = {}) -> PdfExtracted | None:
        """ In-memory convertion of PDF to text.

        Parameters
        ----------
        pdf_path : str | Path
            Path to PDF file.
        first_page : int | None, optional
            First page to extract (1-based). If None, starts from first page.
        last_page : int | None, optional
            Last page to extract (1-based). If None, goes to last page.
        use_ocr : bool, optional
            Whether to use OCR for all pages. Default is False.
        fallback_ocr : bool, optional
            Whether to use OCR if text extraction fails. Default is True.
        verbose : bool, optional
            Whether to print metadata. Default is False.
        ocr_opts : dict[str, Any], optional
            Options to pass to OCR engine (e.g., `thread_count`, `dpi`).
        """
        if not (doc := self.read(pdf_path)):
            return None

        meta = doc.metadata

        if use_ocr:
            warnings.warn("OCR may take a long time.")

            if not ocr_opts:
                ocr_opts = {"thread_count": os.cpu_count()}

        if verbose and meta is not None:
            skip = max(map(len, meta.keys()))
            fmt = f"{{key:>{skip+1}s}} : {{value}}"

            for key, value in meta.items():
                print(fmt.format(key=key, value=value))

        content = ""

        for i, page in enumerate(doc.pages, 1):
            if first_page is not None and i < first_page:
                continue

            if last_page is not None and i > last_page:
                break

            if use_ocr:
                print(f"Processing page {i} with OCR...")
                content += self._page_image(pdf_path, page=i, **ocr_opts)
            else:
                text = page.extract_text()

                if not text and fallback_ocr:
                    text = self._page_image(pdf_path, page=i, **ocr_opts)

                content += text

        return PdfExtracted(meta=meta, content=content)


# TODO support direct image conversion.
# def img2txt(img_path, valid, tesseract_cmd):
#     """ Extract text from image file. """
#     # Set path of executable.
#     pytesseract.tesseract_cmd = tesseract_cmd
#     base_error = "While converting img2txt"
#     file_format = imghdr.what(img_path)
#
#     if file_format is None:
#         raise ValueError(f"{base_error}: unable to get file format")
#
#     if file_format not in valid:
#         raise ValueError(f"{base_error}: {file_format} not in {valid}")
#
#     try:
#         with Image.open(img_path, mode="r") as img:
#             texts_list = image_to_string(img)
#     except (IOError, Exception) as err:
#         raise IOError(f"{base_error}: {err}")
#
#     return texts_list
#endregion: pdftools

#region: markdown
class LatexDelimiterNormalizer:
    """ Normalize damaged LaTeX delimiters in Markdown text.

    This class was designed to handle cases where LaTeX delimiters
    in Markdown text are damaged (originally to fix OCR-converted
    PDF text), such as when a single backslash is used instead of
    a double backslash, or when delimiters are split across lines.
    It provides methods to normalize these delimiters to ensure
    that LaTeX expressions are correctly identified and rendered
    in Markdown. The normalization process includes handling inline
    math, single-line blocks, and standalone blocks, while keeping
    fenced code blocks untouched.
    """

    MATH_HINT_RE = re.compile(
        r"""
        \\[A-Za-z]+       # any LaTeX command, e.g. \alpha
        | [_^]            # subscript/superscript markers
        | [=<>]           # common math operators
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    INLINE_DELIM_RE = re.compile(
        r"""
        (\\*\()          # opener: (, \(, \\(, ...
        \s*
        (.+?)            # candidate expression (non-greedy)
        \s*
        (\\*\))          # closer: ), \), \\), ...
        """,
        flags=re.VERBOSE | re.MULTILINE | re.DOTALL,
    )

    SINGLE_LINE_BLOCK_RE = re.compile(
        r"""
        ^[ \t]*
        (\\*\[)          # opener: [, \[, \\[ , ...
        \s*
        (.+?)            # candidate expression
        \s*
        (\\*\])          # closer: ], \], \\], ...
        [ \t]*$
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    CODE_FENCE_RE = re.compile(
        r"""
        (
            ^```[^\n]*\n    # opening fence + optional info string
            [\s\S]*?        # fenced body
            ^```[ \t]*$     # closing fence
        )
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    BLOCK_MATH_RE = re.compile(
        r"""
        (
            ^\$\$[ \t]*$     # opening $$
            [\s\S]*?         # block body
            ^\$\$[ \t]*$     # closing $$
        )
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    OPEN_DELIM_RE = re.compile(r"\\*\[")

    CLOSE_DELIM_RE = re.compile(r"\\*\]")

    @classmethod
    def _is_probably_math(cls, expr: str) -> bool:
        return bool(cls.MATH_HINT_RE.search(expr.strip()))

    @classmethod
    def _is_maybe_link(cls, opener, match, text) -> bool:
        # Ignore Markdown links/images: [...](...) and ![...](...)
        # This match is on the "(...)" part, so if previous char is ']',
        # keep it untouched.
        start = match.start()
        return opener == "(" and start > 0 and text[start - 1] == "]"

    @classmethod
    def _is_open_delim(cls, text: str) -> bool:
        return bool(cls.OPEN_DELIM_RE.fullmatch(text))

    @classmethod
    def _is_close_delim(cls, text: str) -> bool:
        return bool(cls.CLOSE_DELIM_RE.fullmatch(text))

    @classmethod
    def _normalize_standalone_blocks(cls, text: str) -> str:
        def handle_block(block: list[str], out: list[str]) -> None:
            expr = "\n".join(block).strip()
            expr = cls._normalize_double_escapes(expr)
            out.append("$$")

            if expr:
                out.append(expr)

            out.append("$$")

        out: list[str] = []
        block: list[str] = []
        in_block = False

        for line in text.splitlines():
            stripped = line.strip()

            if not in_block and cls._is_open_delim(stripped):
                in_block = True
                block = []
                continue

            if in_block and cls._is_close_delim(stripped):
                handle_block(block, out)
                in_block = False
                block = []
                continue

            if in_block:
                block.append(line)
            else:
                out.append(line)

        if in_block:
            handle_block(block, out)

        return "\n".join(out)

    @classmethod
    def _normalize_single_line_blocks(cls, text: str) -> str:
        def repl(match: re.Match[str]) -> str:
            expr = match.group(2).strip()

            if cls._is_probably_math(expr):
                expr = cls._normalize_double_escapes(expr)
                return f"$$\n{expr}\n$$"

            return match.group(0)

        return cls.SINGLE_LINE_BLOCK_RE.sub(repl, text)

    @classmethod
    def _normalize_double_escapes(cls, expr: str) -> str:
        """ Collapse doubled backslashes from before LaTeX tokens. """
        return re.sub(r"\\\\(?=[A-Za-z()[\]{}])", r"\\", expr)

    @classmethod
    def _normalize_inline_math(cls, text: str) -> str:
        def repl(match: re.Match[str]) -> str:
            opener = match.group(1)
            expr   = match.group(2)
            closer = match.group(3)
            expr = expr.strip()

            if cls._is_maybe_link(opener, match, text):
                return match.group(0)

            if "$" in expr:
                return match.group(0)

            has_math_delim = (
                opener.startswith("\\") or closer.endswith("\\)")
            )

            if has_math_delim or cls._is_probably_math(expr):
                expr = cls._normalize_double_escapes(expr)
                return f"${expr}$"

            return match.group(0)

        return cls.INLINE_DELIM_RE.sub(repl, text)

    @classmethod
    def _normalize_inline_outside_blocks(cls, text: str) -> str:
        # Do not touch inline delimiters inside $$...$$ blocks.
        parts = cls.BLOCK_MATH_RE.split(text)
        normalized_parts: list[str] = []

        for idx, part in enumerate(parts):
            if idx % 2 == 1:
                normalized_parts.append(part)
            else:
                normalized_parts.append(cls._normalize_inline_math(part))

        return "".join(normalized_parts)

    @classmethod
    def apply(cls, text: str) -> str:
        """ Apply normalization to the given text.

        Parameters
        ----------
        text : str
            The input Markdown text to normalize.
        """
        # Keep fenced code blocks untouched.
        parts = cls.CODE_FENCE_RE.split(text)
        normalized_parts: list[str] = []

        for idx, part in enumerate(parts):
            if idx % 2 == 1:
                normalized_parts.append(part)
                continue

            chunk = cls._normalize_standalone_blocks(part)
            chunk = cls._normalize_single_line_blocks(chunk)
            chunk = cls._normalize_inline_outside_blocks(chunk)
            normalized_parts.append(chunk)

        return "".join(normalized_parts)
#endregion: markdown