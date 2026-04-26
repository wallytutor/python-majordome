# -*- coding: utf-8 -*-
from importlib import import_module
import sys
import warnings

__all__ = []


def _import_subpackage(name: str):
    """ Import other packages of majordome family."""
    global __all__
    self = sys.modules[__name__]

    try:
        obj = import_module(f"majordome.{name}")
        setattr(self, name, obj)

        __all__ += [name]
    except ImportError as e:
        warnings.warn(f"importing majordome.{name}: {e}", ImportWarning)


def __dir__():
    """ Sanitized module namespace. """
    names = list(globals().keys())

    unwanted = [
        "import_module",
        "sys",
        "warnings",
        "_import_subpackage",
    ]

    for name in unwanted:
        if name in names:
            names.remove(name)

    return sorted(names)


from _majordome import __version__, constants
from .utilities import MajordomePlot

__all__ += [
    "__version__",
    "constants",
    "MajordomePlot",
]

_import_subpackage("utilities")
_import_subpackage("cartography")
_import_subpackage("documents")
_import_subpackage("engineering")
_import_subpackage("simulation")
