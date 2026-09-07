# -*- coding: utf-8 -*-

import functools
import importlib.resources as resources
import os

from ..utilities import Capturing

jl = None


def _init_outer():
    """ Locate the shared directory and initialize the environment. """
    here = resources.files("majordome.auchimiste")

    try:
        with Capturing(mode="standard") as output:
            _init_inner(here)
    except Exception as e:
        print(f"Error: {e}\n{output}...")
        raise e


def _init_inner(here):
    """ Activate the shared environment and include scripts. """
    global jl

    os.environ.setdefault("PYTHON_JULIACALL_STARTUP_FILE", "no")
    import juliacall

    jl = juliacall.newmodule("AuChimisteEnv")
    jl.seval("using Pkg")
    jl.seval(f'Pkg.activate("{here.as_posix()}", io=devnull)')

    for script in here.glob(r"*.jl"):
        jl.include(script.as_posix())


_init_outer()


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
