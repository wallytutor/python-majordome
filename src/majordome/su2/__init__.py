# -*- coding: utf-8 -*-

SU2_VERSION = "8.3.0"

__all__ = []

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# enums
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

from .enums import (
    YesNoEnum,
    SolverType,
    TurbulenceModel,
    ShearStressTransportModel,
    SpalartAllmarasModel,
    TransitionModel,
    LmTransitionModelOptions,
    FSInitOption,
    FSOption,
    FSRefDimensionalization,
    InletType,
    InletInterpolationFunction,
    InletInterpolationDataType,
    ActuatorDiskType,
    EngineInflowType,
    KindInterpolation,
    KindRadialBasisFunction,
    GilesCondition,
    BGSRelaxation,
    DynamicLoadTransfer,
    WallFunctions,
    AverageProcessMap,
    ConvectiveScheme,
    LinearSolver,
    Preconditioner,
    MathProblem,
    NumMethodGrad,
    MgCycle,
    TimeDiscretization,
    SgsModel,
    Verification,
    UnitSystem,
)

__all__ += [
    "YesNoEnum",
    "SolverType",
    "TurbulenceModel",
    "ShearStressTransportModel",
    "SpalartAllmarasModel",
    "TransitionModel",
    "LmTransitionModelOptions",
    "FSInitOption",
    "FSOption",
    "FSRefDimensionalization",
    "InletType",
    "InletInterpolationFunction",
    "InletInterpolationDataType",
    "ActuatorDiskType",
    "EngineInflowType",
    "KindInterpolation",
    "KindRadialBasisFunction",
    "GilesCondition",
    "BGSRelaxation",
    "DynamicLoadTransfer",
    "WallFunctions",
    "AverageProcessMap",
    "ConvectiveScheme",
    "LinearSolver",
    "Preconditioner",
    "MathProblem",
    "NumMethodGrad",
    "MgCycle",
    "TimeDiscretization",
    "SgsModel",
    "Verification",
    "UnitSystem",
]

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# groups
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

from .groups import (
    ProblemDefinition,
    CompressibleFreeStreamDefinition,
    ReferenceValues,
    BoundaryConditions,
    SurfacesIdentification,
    SU2Configuration,
)

__all__ += [
    "ProblemDefinition",
    "CompressibleFreeStreamDefinition",
    "ReferenceValues",
    "BoundaryConditions",
    "SurfacesIdentification",
    "SU2Configuration",
]

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# EOF
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+