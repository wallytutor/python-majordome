# -*- coding: utf-8 -*-
from pathlib import Path
from typing import Any, Callable, ParamSpec
from matplotlib import colormaps
from matplotlib.axes import Axes
from matplotlib.figure import Figure
from matplotlib.cm import ScalarMappable
from matplotlib.colors import ListedColormap, TwoSlopeNorm
from pyvista import LookupTable
import functools
import matplotlib.pyplot as plt
import numpy as np


Params = ParamSpec("Params")
SigIn  = Callable[Params, None]
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
    style : str, optional
        Matplotlib style to use for the plot. By default "classic".
    opts : dict[str, Any], optional
        Additional options to pass to `plt.subplots()`, by default {}.
    size : tuple[float, float] | None, optional
        Size of the plot in inches as (width, height). If None, the
        default size will be used. By default None.
    xlabel : str | list[str] | None, optional
        Label(s) for the x-axis. If a list is provided, each subplot
        will get its own label. By default None.
    ylabel : str | list[str] | None, optional
        Label(s) for the y-axis. If a list is provided, each subplot
        will get its own label. By default None.
    """
    __slots__ = ("_fig", "_ax", "_xlabel", "_ylabel")

    def __init__(self,
                 shape: tuple[int, int],
                 style: str = "classic",
                 opts: dict[str, Any] = {},
                 size: tuple[float, float] | None = None,
                 xlabel: str | list[str] | None = None,
                 ylabel: str | list[str] | None = None,
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

    def get_label(self, name: str, k: int) -> str:
        """ Get label for axis at the k-th subplot, if any. """
        match name:
            case "x":
                label = self._xlabel if self._xlabel is not None else "X-axis"
            case "y":
                label = self._ylabel if self._ylabel is not None else "Y-axis"
            case _:
                raise ValueError(f"Unknown label name `{name}`.")

        return label if isinstance(label, str) else label[k]

    def resize(self, w: float, h: float) -> None:
        """ Resize a plot with width and height in inches. """
        self._fig.set_size_inches(w, h)
        self._fig.tight_layout()

    def savefig(self, filename: str | Path, **kwargs) -> None:
        """ Wrapper for saving a figure to file. """
        self._fig.savefig(filename, **kwargs)

    @property
    def figure(self) -> Figure:
        """ Provides access to undelining figure. """
        return self._fig

    @property
    def axes(self) -> list[Axes]:
        """ Provides access to underlying axes. """
        return self._ax

    def subplots(self) -> tuple[Figure, list[Axes]]:
        """ Provides access to underlying figure and axes. """
        return self._fig, self._ax

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
        """ Wraps a function for ensuring a standardized plot. """
        opts = dict(sharex=sharex, facecolor=facecolor)

        def decorator(func: SigIn) -> SigOut:
            @functools.wraps(func)
            def wrapper(*args: Params.args, **kwargs: Params.kwargs) -> object:
                if "plot" in kwargs and kwargs.get("plot") is not None:
                    raise ValueError("The `plot` keyword argument is reserved "
                                     "for `MajordomePlot.new` decorator.")

                kwargs["plot"] = obj = cls(shape, style, opts, size=size,
                                           xlabel=xlabel, ylabel=ylabel)

                for k, ax in enumerate(obj.axes):
                    ax.set_xlabel(obj.get_label("x", k))
                    ax.set_ylabel(obj.get_label("y", k))

                    if grid:
                        ax.grid(linestyle=":")

                func(*args, **kwargs)
                obj.figure.tight_layout()
                return obj
            return wrapper
        return decorator if _func is None else decorator(_func)


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
