# -*- coding: utf-8 -*-

from .._imports import setup_lazy_exports

__getattr__, __dir__ = setup_lazy_exports(__name__, globals(), {
    # post:
    "FoamTabularData": ".post",
    "FoamLagrangianTable": ".post",
    "FoamPostProcessingLoader": ".post",
    # files:
    "BlockMeshDict": ".files",
    "ControlDict": ".files",
    "DecomposeParDict": ".files",
    "FieldFile": ".files",
    "FoamCaseHandle": ".files",
    "FoamDictFile": ".files",
    "FvSchemes": ".files",
    "FvSolution": ".files",
    "NotACaseError": ".files",
    "SnappyHexMeshDict": ".files",
    "VolScalarField": ".files",
    "VolVectorField": ".files",
}, linux_exports={
    # run:
    "FoamHelpers": ".run",
    "FoamArguments": ".run",
    "FoamCleaner": ".run",
    "FoamRunner": ".run",
    "FoamMeshing": ".run",
    "FoamProject": ".run",
})
