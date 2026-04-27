# -*- coding: utf-8 -*-
import sys
from .utilities import ColorPrint


def majordome():
    from ._core import majordome_entrypoint
    majordome_entrypoint(sys.argv[1:])


def containerize():
    if sys.platform != "linux":
        ColorPrint.red("This tool only runs on Linux systems.")
        sys.exit(1)

    from ._core import containerize_entrypoint
    containerize_entrypoint(sys.argv[1:])