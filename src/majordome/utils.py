# -*- coding: utf-8 -*-
from collections import deque
from io import StringIO
from IPython import embed
from matplotlib import pyplot as plt
import functools
import sys
import numpy as np
import pandas as pd


def safe_remove(target_list: list, to_remove: list, inplace: bool = False) -> list:
    """ Safely remove elements from a list and return it. """
    the_clist = target_list if inplace else target_list.copy()
    
    # Support an empty/None to_remove list.
    if not to_remove:
        return the_clist
    
    for remove in filter(lambda n: n in the_clist, to_remove):
        the_clist.remove(remove)

    return the_clist


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

            func(self, ax, *args, **kwargs)
            fig.tight_layout()

            plot = StandardPlot(fig, ax)
            if resized is not None:
                plot.resize(*resized)

            return plot
        return wrapper
    return decorator


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


class ReadTextData:
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