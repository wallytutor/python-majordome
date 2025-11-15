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
    InletType,
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
    "InletType",
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
)

__all__ += [
    "ProblemDefinition",
]

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# EOF
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+