# -*- coding: utf-8 -*-

__all__ = []

# ---------------------------------------------------------------------
# majordome.common: considered internals, do not expose:
# InteractiveSession, report_title, ...
# ---------------------------------------------------------------------

from .common import (
    Constants,
    CompositionType,
    SolutionLikeType,
    StateType,
    AbstractReportable,
    ReadTextData,
    Capturing,
    RelaxUpdate,
    StabilizeNvarsConvergenceCheck,
    ComposedStabilizedConvergence,
    safe_remove,
    bounds,
    within,
    apply,
)

__all__ += [
    "Constants",
    "CompositionType",
    "SolutionLikeType",
    "StateType",
    "AbstractReportable",
    "ReadTextData",
    "Capturing",
    "RelaxUpdate",
    "StabilizeNvarsConvergenceCheck",
    "ComposedStabilizedConvergence",
    "safe_remove",
    "bounds",
    "within",
    "apply",
]

# ---------------------------------------------------------------------
# majordome.energy
# ---------------------------------------------------------------------

from .energy import (
    CombustionPowerOp,
    CombustionFlowOp,
    CombustionAtmosphereCHON,
    CombustionPowerSupply,
    CombustionAtmosphereMixer,
    AbstractEnergySource,
    CanteraEnergySource,
    GasFlowEnergySource,
    HeatedGasEnergySource,
    CombustionEnergySource,
)

__all__ += [
    "CombustionPowerOp",
    "CombustionFlowOp",
    "CombustionAtmosphereCHON",
    "CombustionPowerSupply",
    "CombustionAtmosphereMixer",
    "AbstractEnergySource",
    "CanteraEnergySource",
    "GasFlowEnergySource",
    "HeatedGasEnergySource",
    "CombustionEnergySource",
]

# ---------------------------------------------------------------------
# majordome.fluent: considered internals do not expose FluentSchemePatch,
# FluentSchemeHeader, FluentSchemeTableRow, FluentDpmFile,
# ---------------------------------------------------------------------

from .fluent import (
    FluentFvParticlesParser,
    FluentInterpolationParser,
    FluentInputRow,
    FluentInputFile,
    convert_xy_to_dict,
    load_dpm_table,
)

__all__ += [
    "FluentFvParticlesParser",
    "FluentInterpolationParser",
    "FluentInputRow",
    "FluentInputFile",
    "convert_xy_to_dict",
    "load_dpm_table",
]

# ---------------------------------------------------------------------
# majordome.latex
# ---------------------------------------------------------------------

from .latex import (
    list_tex_templates,
    load_tex_template,
    fill_tex_template,
)

__all__ += [
    "list_tex_templates",
    "load_tex_template",
    "fill_tex_template",
]

# ---------------------------------------------------------------------
# majordome.plotting
# ---------------------------------------------------------------------

from .plotting import (
    StandardPlot,
    standard_plot,
    centered_colormap
)

__all__ += [
    "StandardPlot",
    "standard_plot",
    "centered_colormap"
]

# ---------------------------------------------------------------------
# majordome.reactor
# ---------------------------------------------------------------------

from .reactor import (
    NormalFlowRate,
    PlugFlowAxialSources,
    PlugFlowChainCantera,
    toggle_reactor_warnings,
    composition_to_dict,
    composition_to_array,
    solution_report,
    copy_solution,
    copy_quantity,
    get_reactor_data,
)

__all__ += [
    "NormalFlowRate",
    "PlugFlowAxialSources",
    "PlugFlowChainCantera",
    "toggle_reactor_warnings",
    "composition_to_dict",
    "composition_to_array",
    "solution_report",
    "copy_solution",
    "copy_quantity",
    "get_reactor_data",
]

# ---------------------------------------------------------------------
# majordome.transport: considered internals, do not expose
# AbstractRadiationModel, ...
# ---------------------------------------------------------------------

from .transport import (
    EffectiveThermalConductivity,
    SolutionDimless,
    SutherlandFitting,
    AbstractWSGG,
    WSGGRadlibBordbar2020,
)

__all__ += [
    "EffectiveThermalConductivity",
    "SolutionDimless",
    "SutherlandFitting",
    "AbstractWSGG",
    "WSGGRadlibBordbar2020",
]

def toggle_warnings(**kwargs):
    """ Unified caller for modules warnings. """
    toggle_reactor_warnings(**kwargs)
