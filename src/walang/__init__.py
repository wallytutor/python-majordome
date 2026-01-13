# -*- coding: utf-8 -*-
from .core import expose as expose_core
# from .modules import expose as expose_modules


@(run_on_import := lambda f: f())
def walang():
    """ Initialize the walang environment. """
    expose_core()
    # expose_modules()
