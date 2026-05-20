# -*- coding: utf-8 -*-
import importlib

_LAZY_EXPORTS = {
    # elmer:
    "ConstantTimeStepInterval": ".elmer",
    "TimeStepAccumulator": ".elmer",
    "ElmerConvergenceData": ".elmer",
    "ElmerTabularMetadata": ".elmer",
    "ElmerTabularData": ".elmer",

    # fluent:
    "FluentFvParticlesParser": ".fluent",
    "FluentInterpolationParser": ".fluent",
    "FluentInputRow": ".fluent",
    "FluentInputFile": ".fluent",
    "FluentSchemePatch": ".fluent",
    "FluentSchemeHeader": ".fluent",
    "FluentSchemeTableRow": ".fluent",
    "FluentDpmFile": ".fluent",
    "convert_xy_to_dict": ".fluent",
    "load_dpm_table": ".fluent",

    # openfoam:
    "FoamTabularData": ".openfoam",
    "FoamPostProcessingLoader": ".openfoam",

    # meshing:
    "GmshOCCModel": ".meshing",
    "GeometricProgression": ".meshing",
    "RingBuilder": ".meshing",
    "CircularCrossSection": ".meshing",
    "points_on_circle": ".meshing",
    "hexagon_points_xy": ".meshing",
    "square_points_xy": ".meshing",
    "get_extrusion_tags": ".meshing",
}

__all__ = list(_LAZY_EXPORTS.keys())


def __getattr__(name: str):
    if name in _LAZY_EXPORTS:
        submodule_path = _LAZY_EXPORTS[name]
        submodule = importlib.import_module(submodule_path, __package__)
        exported_item = getattr(submodule, name)
        globals()[name] = exported_item
        return exported_item

    raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def __dir__():
    return list(globals().keys()) + __all__
