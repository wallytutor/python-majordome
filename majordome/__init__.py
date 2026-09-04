# -*- coding: utf-8 -*-

from ._imports import setup_submodules_exports
from ._core import __version__, constants

__getattr__, __dir__ = setup_submodules_exports(
    __name__,
    globals(),
    submodules=[
        ".engineering",
        ".simulation",
        ".utilities",
    ],
    extra_exports=["__version__", "constants"],
)
