# -*- coding: utf-8 -*-
from majordome.engineering import (
    SolutionDimless,
    PlugFlowChainCantera,
    ImageCrop,
)

def test_lazy_imports():
    assert SolutionDimless is not None
    assert PlugFlowChainCantera is not None
    assert ImageCrop is not None
