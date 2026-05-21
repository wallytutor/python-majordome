# -*- coding: utf-8 -*-
from . import _core

mod = _core.py_num


__all__ = [
    "Dual",
]


def __getattr__(name: str):
    if name in __all__:
        globals()[name] = getattr(mod, name)
        return globals()[name]

    raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def __dir__():
    return sorted(__all__)
