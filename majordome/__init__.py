# -*- coding: utf-8 -*-

from ._imports import setup_submodules_exports
from ._core import __version__, constants


def plot(*args, **kwargs):
    """ Convenience wrapper for `MajordomePlot.new` """
    from .utilities import MajordomePlot
    return MajordomePlot.new(*args, **kwargs)


__getattr__, __dir__ = setup_submodules_exports(
    __name__,
    globals(),
    submodules=[
        ".engineering",
        ".openfoam",
        ".simulation",
        ".utilities",
    ],
    extra_exports=[
        "__version__",
        "constants"
    ],
)
