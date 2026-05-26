# -*- coding: utf-8 -*-
from . import _core
from .utilities import MajordomePlot

mod = _core.diffusion

__all__ = sorted(
    [x for x in dir(mod) if not x.startswith("_")] + ["plot_diffusion_results"]
)


@MajordomePlot.new(
    xlabel = "Depth",
    ylabel = "Concentration"
)
def plot_diffusion_results(
        depth,
        carbon_concentration=None,
        nitrogen_concentration=None,
        *,
        plot: MajordomePlot | None = None,
        **kwargs,
    ) -> MajordomePlot:
    """ Plots the diffusion results. """
    if carbon_concentration is not None:
        plot.ax.plot(
            depth, carbon_concentration, label="Carbon", color="black", linestyle="-"
        )
    if nitrogen_concentration is not None:
        plot.ax.plot(
            depth,
            nitrogen_concentration,
            label="Nitrogen",
            color="blue",
            linestyle="--",
        )

    plot.ax.legend()
    return plot


def __getattr__(name: str):
    try:
        globals()[name] = getattr(mod, name)
        return globals()[name]
    except AttributeError:
        raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def __dir__():
    return __all__
