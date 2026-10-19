# -*- coding: utf-8 -*-
from .._imports import setup_lazy_exports

from ..data import DATA

__getattr__, __dir__ = setup_lazy_exports(
    __name__,
    globals(),
    exports={},
    linux_exports={
        "CPFR": ".solver",
        "PyPFR": ".ct_pfr",
    },
    load_data=True
)
