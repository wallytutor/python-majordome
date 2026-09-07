# -*- coding: utf-8 -*-

import functools
import importlib.resources as resources

import juliacall

from ..utilities import Capturing

jl = None


def _init_auchimiste_environment():
    global jl

    # Locate the shared directory (this directory):
    here = resources.files("majordome.auchimiste")

    # Activate the shared environment once:
    try:
        with Capturing() as output:
            jl = juliacall.newmodule("AuChimisteEnv")
            jl.seval("using Pkg")
            jl.seval(f'Pkg.activate("{here.as_posix()}")')
    except Exception as e:
        print(f"Error: {e}\n{'\n'.join(output)}...")
        raise e

    # Include scripts to path:
    for script in here.glob(r"*.jl"):
        jl.include(script.as_posix())


_init_auchimiste_environment()


def requires(module):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            jl.seval(f"using .{module}")
            return func(*args, **kwargs)
        return wrapper
    return decorator


@requires("_main")
def reaction(name: str) -> None:
    """ Print a message with the given name. """
    jl._main.reaction(name)


@requires("_plotting")
def dummy_plot() -> None:
    """ Print a message with the given name. """
    jl._plotting.dummy_plot()
