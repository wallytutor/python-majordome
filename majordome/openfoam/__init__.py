# -*- coding: utf-8 -*-

from .._imports import setup_lazy_exports

__getattr__, __dir__ = setup_lazy_exports(__name__, globals(), {
    # post:
    "FoamTabularData": ".post",
    "FoamLagrangianTable": ".post",
    "FoamPostProcessingLoader": ".post",
})
