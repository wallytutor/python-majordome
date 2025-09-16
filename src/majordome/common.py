# -*- coding: utf-8 -*-
from collections import deque
from importlib import resources
from io import StringIO
from numbers import Number
from pathlib import Path
from textwrap import dedent
from typing import Any
from typing import NamedTuple
from IPython import embed
from matplotlib import pyplot as plt
from tabulate import tabulate
import functools
import sys
import cantera as ct
import numpy as np
import pandas as pd

DATA = Path(resources.files("majordome").joinpath("data"))
""" Path to project data folder. """

# XXX: add globally to Cantera path:
ct.add_directory(DATA)

GRAVITY = 9.80665
""" Conventional gravitational acceleration on Earth [m/s²]. """

T_REFERENCE = 298.15
""" Thermodynamic reference temperature [K]. """

T_NORMAL = 273.15
""" Normal state reference temperature [K]. """

P_NORMAL = 101325.0
""" Normal state reference temperature [K]. """

CompositionType = str | dict[str, float]
""" Input type for Cantera composition dictionaries. """


class StateType(NamedTuple):
    """ Input type for Cantera TPX state dictionaries. """
    X: CompositionType
    T: Number = T_NORMAL
    P: Number = P_NORMAL


class NormalFlowRate:
    """ Compute normal flow rate for a given composition.

    This class makes use of the user defined state to create a function
    object that converts industrial scale flow rates in normal cubic
    meters per hour to kilograms per second. Nothing more, nothing less,
    it aims at helping the process engineer in daily life for this quite
    repetitive need when performing mass balances.

    Parameters
    ----------
    mech: str | Path
        Path to Cantera mechanism used to compute mixture properties.
    X: CompositionType = None
        Composition specification in mole fractions. Notice that both
        `X` and `Y` are mutally exclusive keyword arguments.
    Y: CompositionType = None
        Composition specification in mass fractions. Notice that both
        `X` and `Y` are mutally exclusive keyword arguments.
    T_ref: float = T_NORMAL
        Reference temperature of the system. If your industry does not
        use the same standard as the default values, and only in that
        case, please consider updating this keyword.
    P_ref: float = P_NORMAL
        Reference pressure of the system. If your industry does not
        use the same standard as the default values, and only in that
        case, please consider updating this keyword.
    name: str = None
        Name of phase in mechanism, if more than one are specified
        within the same Cantera YAML database file.
    """
    def __init__(self, mech: str | Path, *, X: CompositionType = None,
                 Y: CompositionType = None, T_ref: float = T_NORMAL,
                 P_ref: float = P_NORMAL, name: str = None) -> None:
        if X is not None and Y is not None:
            raise ValueError("You can provide either X or Y, not both!")

        self._sol = ct.Solution(mech, name)
        self._sol.TP = T_ref, P_ref

        if X is not None:
            self._sol.TPX = None, None, X

        if Y is not None:
            self._sol.TPY = None, None, Y

        self._rho = self._sol.density_mass

    def __call__(self, qdot: float) -> float:
        """ Convert flow rate [Nm³/h] to mass units [kg/s]. """
        return self._rho * qdot / 3600

    @property
    def density(self) -> float:
        """ Provides access to the density of internal solution [kg/m³]. """
        return self._rho

    @property
    def TPX(self) -> tuple[float, float, dict[str, float]]:
        """ Provides access to the state of internal solution. """
        return (*self._sol.TP, self._sol.mole_fraction_dict())

    def report(self, **kwargs) -> str:
        """ Provides a report of the mixture state. """
        data = solution_report(self._sol, **kwargs)
        return tabulate(data, tablefmt="github")


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


class StandardPlot:
    """ Wraps a matplotlib figure and axis. """
    def __init__(self, fig, ax):
        self._fig = fig
        self._ax = ax

    def resize(self, w, h):
        """ Resize a plot with width and height in inches. """
        self._fig.set_size_inches(w, h)
        self._fig.tight_layout()

    def savefig(self, filename: str, **kwargs):
        """ Save figure to file. """
        self._fig.savefig(filename, **kwargs)

    @property
    def figure(self):
        """ Provides access to undelining figure. """
        return self._fig

    @property
    def axes(self):
        """ Provides access to undelining figure. """
        return self._ax
    

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


def report_title(title: str, report: str) -> str:
    """ Generate a text report with a underscored title. """
    return dedent(f"""\n{title}\n{len(title) * "-"}\n""") + report


def safe_remove(target_list: list, to_remove: list, inplace: bool = False) -> list:
    """ Safely remove elements from a list and return it. """
    the_clist = target_list if inplace else target_list.copy()

    # Support an empty/None to_remove list.
    if not to_remove:
        return the_clist

    for remove in filter(lambda n: n in the_clist, to_remove):
        the_clist.remove(remove)

    return the_clist


def standard_plot(shape: tuple[int, int] = (1, 1), sharex: bool = True,
                  grid: bool = True, style: str = "classic",
                  resized: tuple[float, float] = None) -> StandardPlot:
    """ Wraps a function for ensuring a standardized plot. """
    opts = dict(sharex=sharex, facecolor="white")

    def decorator(func):
        @functools.wraps(func)
        def wrapper(self, *args, **kwargs):
            plt.close("all")
            plt.style.use(style)
            fig, ax = plt.subplots(*shape, **opts)
            ax = np.ravel(ax)

            if grid:
                for ax_k in ax:
                    ax_k.grid(linestyle=":")

            func(self, fig, ax, *args, **kwargs)
            fig.tight_layout()

            plot = StandardPlot(fig, ax)
            if resized is not None:
                plot.resize(*resized)

            return plot
        return wrapper
    return decorator


def solution_report(sol: ct.Solution,
                    specific_props: bool = True,
                    composition_spec: str = "mass",
                    selected_species: list[str] = []
                    ) -> list[tuple[str, str, Any]]:
    """ Generate a solution report for tabulation.
    
    Parameters
    ----------
    sol: ct.Solution
        Cantera solution object for report generation.
    specific_props: bool = True
        If true, add specific heat capacity and enthalpy.
    composition_spec: str = "mass"
        Composition units specification, `mass` or `mole`.
    selected_species: list[str] = []
        Selected species to display; return all if a composition
        specification was provided.

    Raises
    ------
    ValueError
        If in invalid composition specification is provided.
        If species filtering lead to an empty set of compositions.

    Returns
    -------
    list[tuple[str, str, Any]]
        A list of data entries intended to be displayed externally,
        *e.g.* with `tabulate.tabulate` or appended.
    """
    report = [("Temperature", "K", sol.T), ("Pressure", "Pa",sol.P),
              ("Density", "kg/m³", sol.density_mass)]

    if specific_props:
        report.extend([
            ("Specific enthalpy", "J/(kg.K)", sol.enthalpy_mass),
            ("Specific heat capacity", "J/(kg.K)", sol.cp_mass),
        ])

    if composition_spec is not None:
        if composition_spec not in ["mass", "mole"]:
            raise ValueError(f"Unknown composition type {composition_spec}")

        comp = getattr(sol, f"{composition_spec}_fraction_dict")()

        if selected_species:
            comp = {s: v for s, v in comp.items() if s in selected_species}

        if not comp:
            raise ValueError("No species left in mixture for display!")

        for species, X in comp.items():
            report.append((f"{composition_spec}: {species}", "-", X))

    return report


def bounds(arr):
    """ Returns minimum and maximum values of array `arr`. """
    return np.min(arr), np.max(arr)


def within(x, arr):
    """ Check if value `x` is between extrema of array `arr`. """
    return np.min(arr) <= x <= np.max(arr)


def apply(f, iterable):
    """ Apply unit operation over iterable items. """
    return list(map(f, iterable))
