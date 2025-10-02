# -*- coding: utf-8 -*-

__all__ = []

# ---------------------------------------------------------------------
# majordome.common: considered internals, do not expose:
# InteractiveSession, report_title, ...
# ---------------------------------------------------------------------

from .common import (
    Constants,
    CompositionType,
    StateType,
    ReadTextData,
    Capturing,
    RelaxUpdate,
    StabilizeNvarsConvergenceCheck,
    ComposedStabilizedConvergence,
    StandardPlot,
    safe_remove,
    standard_plot,
    bounds,
    within,
    apply,
)

__all__ += [
    "Constants",
    "CompositionType",
    "StateType",
    "ReadTextData",
    "Capturing",
    "RelaxUpdate",
    "StabilizeNvarsConvergenceCheck",
    "ComposedStabilizedConvergence",
    "StandardPlot",
    "safe_remove",
    "standard_plot",
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
    FluentInterpolationParser,
    FluentInputRow,
    FluentInputFile,
    convert_xy_to_dict,
    load_dpm_table,
)

__all__ += [
    "FluentInterpolationParser",
    "FluentInputRow",
    "FluentInputFile",
    "convert_xy_to_dict",
    "load_dpm_table", 
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
# majordome.reactor
# ---------------------------------------------------------------------

from .reactor import (
    NormalFlowRate,
    toggle_reactor_warnings,
    composition_to_dict,
    composition_to_array,
    solution_report,
)

__all__ += [
    "NormalFlowRate",
    "toggle_reactor_warnings",
    "composition_to_dict",
    "composition_to_array",
    "solution_report",
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

def toggle_warnings(**kwargs):
    """ Unified caller for modules warnings. """
    toggle_reactor_warnings(**kwargs)
