# -*- coding: utf-8 -*-

from .._imports import setup_lazy_exports

__getattr__, __dir__ = setup_lazy_exports(__name__, globals(), {
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

    # meshing:
    "GmshSessionWrapper": ".meshing",
    "GmshOCCModel": ".meshing",
    "GeometricProgression": ".meshing",
    "RingBuilder": ".meshing",
    "CircularCrossSection": ".meshing",
    "points_on_circle": ".meshing",
    "hexagon_points_xy": ".meshing",
    "square_points_xy": ".meshing",
    "get_extrusion_tags": ".meshing",
})
