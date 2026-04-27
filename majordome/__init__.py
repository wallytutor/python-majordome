# -*- coding: utf-8 -*-
from ._core import __version__, constants
from .utilities import MajordomePlot

__all__ = [
    "__version__",
    "constants",
    "MajordomePlot",
]


def __dir__():
    """ Sanitized module namespace. """
    names = list(globals().keys())
    unwanted = []

    for name in unwanted:
        if name in names:
            names.remove(name)

    return sorted(names)
