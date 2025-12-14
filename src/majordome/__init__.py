# -*- coding: utf-8 -*-

__all__ = []

# ---------------------------------------------------------------------
# majordome._majordome: Rust extension module
# ---------------------------------------------------------------------

try:
    from ._majordome import (
        calphad,
        diffusion,
    )

    __all__ += [
        "calphad",
        "diffusion",
    ]
except ImportError:
    print("Warning: majordome Rust extension module not found.")
    pass

# ---------------------------------------------------------------------
# majordome.common: considered internals, do not expose:
# InteractiveSession, report_title, ...
# ---------------------------------------------------------------------

from .common import (
    CompositionType,
    SolutionLikeType,
    PathLike,
    MaybePath,
    StateType,
    AbstractReportable,
    ReadTextData,
    Capturing,
    RelaxUpdate,
    StabilizeNvarsConvergenceCheck,
    ComposedStabilizedConvergence,
    has_program,
    program_path,
    first_in_path,
    normalize_string,
    safe_remove,
    bounds,
    within,
    apply,
)

__all__ += [
    "CompositionType",
    "SolutionLikeType",
    "PathLike",
    "MaybePath",
    "StateType",
    "AbstractReportable",
    "ReadTextData",
    "Capturing",
    "RelaxUpdate",
    "StabilizeNvarsConvergenceCheck",
    "ComposedStabilizedConvergence",
    "has_program",
    "program_path",
    "first_in_path",
    "normalize_string",
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
# majordome.pdftools
# ---------------------------------------------------------------------

try:
    from .pdftools import (
        PdfExtracted,
        PdfToTextConverter,
    )

    __all__ += [
        "PdfExtracted",
        "PdfToTextConverter",
    ]
except ImportError:
    pass

# ---------------------------------------------------------------------
# majordome.plotting
# ---------------------------------------------------------------------

from .plotting import (
    MajordomePlot,
    centered_colormap,
    StandardPlot,
    standard_plot,
)

__all__ += [
    "MajordomePlot",
    "centered_colormap",
    "StandardPlot",
    "standard_plot",
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
# majordome.transport
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

# ---------------------------------------------------------------------
# majordome.vision
# ---------------------------------------------------------------------

try:
    from .vision import (
        ImageCrop,
        ChannelSelector,
        ContrastEnhancement,
        ThresholdImage,
    )

    __all__ += [
        "ImageCrop",
        "ChannelSelector",
        "ContrastEnhancement",
        "ThresholdImage",
    ]
except ImportError:
    pass

# ---------------------------------------------------------------------
# EOF
# ---------------------------------------------------------------------