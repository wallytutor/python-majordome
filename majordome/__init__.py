# -*- coding: utf-8 -*-
from importlib import import_module, resources
from pathlib import Path
import sys
import warnings
import cantera as ct

__all__ = []


def _import_subpackage(name: str):
    """ Import other packages of majordome family."""
    global __all__
    self = sys.modules[__name__]

    try:
        obj = import_module(f"majordome_{name}")
        setattr(self, name, obj)

        __all__ += [name]
    except ImportError as e:
        warnings.warn(f"importing majordome_{name}: {e}", ImportWarning)


def __dir__():
    """ Sanitized module namespace. """
    names = list(globals().keys())

    unwanted = [
        "import_module",
        "resources",
        "Path",
        "sys",
        "warnings",
        "ct",
        "_import_subpackage",
    ]

    for name in unwanted:
        if name in names:
            names.remove(name)

    return sorted(names)


from .utilities import (
    __version__,
    constants,
    MajordomePlot
)

__all__ += [
    "__version__",
    "constants",
    "MajordomePlot",
]

_import_subpackage("utilities")
_import_subpackage("cartography")
_import_subpackage("engineering")
_import_subpackage("simulation")

DATA = Path(str(resources.files("majordome").joinpath("data")))
""" Path to project data folder. """

# XXX: add globally to Cantera path:
ct.add_directory(DATA)