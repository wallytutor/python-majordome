# -*- coding: utf-8 -*-
from majordome.engineering import (
    SolutionDimless,
    PlugFlowChainCantera,
    ImageCrop,
    BaseGraph,
    DirectedGraph,
    UndirectedGraph,
    extract_submechanism,
    MechanismFilter,
    SimplifyDRG,
    SimplifySetup,
    StateSpace,
    Re,
    Pr,
    Sc,
    Pe,
    Gr,
    Ra,
)

def test_lazy_imports():
    assert SolutionDimless is not None
    assert PlugFlowChainCantera is not None
    assert ImageCrop is not None
    assert BaseGraph is not None
    assert DirectedGraph is not None
    assert UndirectedGraph is not None
    assert extract_submechanism is not None
    assert MechanismFilter is not None
    assert SimplifyDRG is not None
    assert SimplifySetup is not None
    assert StateSpace is not None
    assert Re is not None
    assert Pr is not None
    assert Sc is not None
    assert Pe is not None
    assert Gr is not None
    assert Ra is not None

