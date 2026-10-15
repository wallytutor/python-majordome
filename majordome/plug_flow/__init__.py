# -*- coding: utf-8 -*-
from .._imports import setup_lazy_exports

__getattr__, __dir__ = setup_lazy_exports(
    __name__,
    globals(),
    exports={},
    linux_exports={
        "CPFR": ".solver",
        "cPFR": ".solver",
        "Plotter": ".plot",
        "plot_pfr": ".plot",
        "plotPFR": ".plot",
        "PyPFR": ".ct_pfr",
    }
)
