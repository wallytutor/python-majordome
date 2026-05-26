# -*- coding: utf-8 -*-
import sys
from .utilities import ColorPrint


def majordome():
    from ._core import majordome as main

    main(sys.argv[1:])


def containerize():
    if sys.platform != "linux":
        ColorPrint.red("This tool only runs on Linux systems.")
        sys.exit(1)

    from ._core import containerize as main

    main(sys.argv[1:])
