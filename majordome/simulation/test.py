# -*- coding: utf-8 -*-
from majordome.simulation import (
    ConstantTimeStepInterval,
    FluentFvParticlesParser,
    GmshOCCModel,
)

def test_lazy_imports():
    assert ConstantTimeStepInterval is not None
    assert FluentFvParticlesParser is not None
    assert GmshOCCModel is not None
