# -*- coding: utf-8 -*-

__all__ = []

# ---------------------------------------------------------------------
# majordome.common: considered internals, do not expose StandardPlot,
# InteractiveSession, report_title, ...
# ---------------------------------------------------------------------

from .common import (
    CompositionType,
    StateType,
    NormalFlowRate,
    ReadTextData,
    Capturing,
    RelaxUpdate,
    StabilizeNvarsConvergenceCheck,
    safe_remove,
    standard_plot,
    solution_report,
    bounds,
    within,
    apply,
)

__all__ += [
    "CompositionType",
    "StateType",
    "NormalFlowRate",
    "ReadTextData",
    "Capturing",
    "RelaxUpdate",
    "StabilizeNvarsConvergenceCheck",
    "safe_remove",
    "standard_plot",
    "solution_report",
    "bounds",
    "within",
    "apply",
]

# ---------------------------------------------------------------------
# majordome.combustion: working on cleaning legacy, do not expose!
# ---------------------------------------------------------------------

from .combustion import (
    CombustionAtmosphereCHON,
    CombustionPowerSupply,
    CombustionAtmosphereMixer,
    copy_quantity,
)

__all__ += [
    "CombustionAtmosphereCHON",
    "CombustionPowerSupply",
    "CombustionAtmosphereMixer",
    "copy_quantity",
]

# ---------------------------------------------------------------------
# majordome.fluent: considered internals do not expose FluentSchemePatch,
# FluentSchemeHeader, FluentSchemeTableRow, FluentDpmFile,
# ---------------------------------------------------------------------

from .fluent import (
    FluentInputRow,
    FluentInputFile,
    convert_xy_to_dict,
    load_dpm_table,
)

__all__ += [
    "FluentInputRow",
    "FluentInputFile",
    "convert_xy_to_dict",
    "load_dpm_table," 
]

# ---------------------------------------------------------------------
# majordome.plug
# ---------------------------------------------------------------------

from .plug import (
    PlugFlowAxialSources,
    PlugFlowChainCantera,
    get_reactor_data,
)

__all__ += [
    "PlugFlowAxialSources",
    "PlugFlowChainCantera",
    "get_reactor_data",
]

# ---------------------------------------------------------------------
# majordome.radiation: considered internals, do not expose
# AbstractRadiationModel, ...
# ---------------------------------------------------------------------

from .radiation import (
    AbstractWSGG,
    WSGGRadlibBordbar2020,
)

__all__ += [
    "AbstractWSGG",
    "WSGGRadlibBordbar2020",
]

# ---------------------------------------------------------------------
# majordome.transport
# ---------------------------------------------------------------------

from .transport import (
    EffectiveThermalConductivity,
    SolutionDimless,
    SutherlandFitting,
)

__all__ += [
    "EffectiveThermalConductivity",
    "SolutionDimless",
    "SutherlandFitting",
]
