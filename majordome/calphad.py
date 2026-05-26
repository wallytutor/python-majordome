# -*- coding: utf-8 -*-
from . import _core
from .data import DATA

mod = _core.calphad
mod.add_data_directory(str(DATA / "calphad"))

__all__ = sorted([x for x in dir(mod) if not x.startswith("_")])


def __getattr__(name: str):
    try:
        globals()[name] = getattr(mod, name)
        return globals()[name]
    except AttributeError:
        raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def __dir__():
    return __all__
