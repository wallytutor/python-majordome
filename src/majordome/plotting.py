# -*- coding: utf-8 -*-
from matplotlib import colormaps
from matplotlib.cm import ScalarMappable
from matplotlib.colors import ListedColormap, TwoSlopeNorm
from pyvista import LookupTable
import functools
import matplotlib.pyplot as plt
import numpy as np


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


def standard_plot(shape: tuple[int, int] = (1, 1), sharex: bool = True,
                  grid: bool = True, style: str = "classic",
                  resized: tuple[float, float] = None,
                  xlabel: str = None, ylabel: str = None
                  ) -> StandardPlot:
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

            if xlabel:
                for ax_k in ax:
                    ax_k.set_xlabel(xlabel)

            if ylabel:
                for ax_k in ax:
                    ax_k.set_ylabel(ylabel)

            func(self, fig, ax, *args, **kwargs)
            fig.tight_layout()

            plot = StandardPlot(fig, ax)
            if resized is not None:
                plot.resize(*resized)

            return plot
        return wrapper
    return decorator


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
    vcenter : float, optional
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
