# -*- coding: utf-8 -*-
from majordome.simulation import (
    ConstantTimeStepInterval,
    FluentFvParticlesParser,
    GmshOCCModel,
    GmshSessionWrapper,
)

def test_lazy_imports():
    assert ConstantTimeStepInterval is not None
    assert FluentFvParticlesParser is not None
    assert GmshOCCModel is not None
    assert GmshSessionWrapper is not None

def test_gmsh_occ_model_inheritance():
    assert issubclass(GmshOCCModel, GmshSessionWrapper)

    with GmshOCCModel(name="test_domain", render=False) as model:
        assert isinstance(model, GmshSessionWrapper)
        assert model._name == "test_domain"
        assert model.render is False
        assert model._render is False
        pt_tag = model.add_point(0.0, 0.0, 0.0)
        assert pt_tag > 0

