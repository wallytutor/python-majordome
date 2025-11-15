# -*- coding: utf-8 -*-
from enum import Enum

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# Helpers
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class YesNoEnum(Enum):
    """ Yes/No options. """
    YES = "YES"
    NO  = "NO"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Solver-Setup/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class SolverType(Enum):
    """ Solver type options. """
    EULER              = "EULER"
    NAVIER_STOKES      = "NAVIER_STOKES"
    RANS               = "RANS"
    INC_EULER          = "INC_EULER"
    INC_NAVIER_STOKES  = "INC_NAVIER_STOKES"
    INC_RANS           = "INC_RANS"
    NEMO_EULER         = "NEMO_EULER"
    NEMO_NAVIER_STOKES = "NEMO_NAVIER_STOKES"
    FEM_EULER          = "FEM_EULER"
    FEM_NAVIER_STOKES  = "FEM_NAVIER_STOKES"
    FEM_RANS           = "FEM_RANS"
    FEM_LES            = "FEM_LES"
    HEAT_EQUATION_FVM  = "HEAT_EQUATION_FVM"
    ELASTICITY         = "ELASTICITY"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Physical-Definition/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class TurbulenceModel(Enum):
    """ Turbulence model options. """
    NONE = "NONE"
    SA   = "SA"
    SST  = "SST"


class ShearStressTransportModel(Enum):
    """ Shear Stress Transport (SST) turbulence model versions/corrections. """
    NONE                   = "NONE"
    V2003m                 = "V2003m"
    V1994m                 = "V1994m"
    VORTICITY              = "VORTICITY"
    KATO_LAUNDER           = "KATO_LAUNDER"
    UQ                     = "UQ"
    SUSTAINING             = "SUSTAINING"
    COMPRESSIBILITY_WILCOX = "COMPRESSIBILITY-WILCOX"
    COMPRESSIBILITY_SARKAR = "COMPRESSIBILITY-SARKAR"
    DIMENSIONLESS_LIMIT    = "DIMENSIONLESS_LIMIT"


class SpalartAllmarasModel(Enum):
    """ Spalart-Allmaras (SA) turbulence model versions/corrections. """
    NONE            = "NONE"
    NEGATIVE        = "NEGATIVE"
    EDWARDS         = "EDWARDS"
    BCM             = "BCM"
    WITHFT2         = "WITHFT2"
    QCR2000         = "QCR2000"
    COMPRESSIBILITY = "COMPRESSIBILITY"
    ROTATION        = "ROTATION"


class TransitionModel(Enum):
    """ Transition model options. """
    NONE = "NONE"
    LM   = "LM"


class LmTransitionModelOptions(Enum):
    """ Transition model versions/corrections. """
    NONE           = "NONE"
    LM2015         = "LM2015"
    MALAN          = "MALAN"
    SULUKSNA       = "SULUKSNA"
    KRAUSE         = "KRAUSE"
    KRAUSE_HYPER   = "KRAUSE_HYPER"
    MEDIDA         = "MEDIDA"
    MEDIDA_BAEDER  = "MEDIDA_BAEDER"
    MENTER_LANGTRY = "MENTER_LANGTRY"


class FSInitOption(Enum):
    """ Free-stream option to choose initializing the solution. """
    NONE          = "NONE"
    REYNOLDS      = "REYNOLDS"
    TD_CONDITIONS = "TD_CONDITIONS"


class FSOption(Enum):
    """ Free-stream option to choose between density and temperature. """
    NONE           = "NONE"
    TEMPERATURE_FS = "TEMPERATURE_FS"
    DENSITY_FS     = "DENSITY_FS"


class FSRefDimensionalization(Enum):
    """ Free-stream reference dimensionalization options. """
    NONE                    = "NONE"
    DIMENSIONAL             = "DIMENSIONAL"
    FREESTREAM_PRESS_EQ_ONE = "FREESTREAM_PRESS_EQ_ONE"
    FREESTREAM_VEL_EQ_MACH  = "FREESTREAM_VEL_EQ_MACH"
    FREESTREAM_VEL_EQ_ONE   = "FREESTREAM_VEL_EQ_ONE"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Markers-and-BC/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class InletType(Enum):
    """ Inlet boundary condition types. """
    TOTAL_CONDITIONS = "TOTAL_CONDITIONS"
    MASS_FLOW        = "MASS_FLOW"
    VELOCITY_INLET   = "VELOCITY_INLET"
    PRESSURE_INLET   = "PRESSURE_INLET"

    def validate_solver(self, solver_type: SolverType) -> bool:
        """ Validate if the inlet type is compatible with the solver type. """
        match self:

            case InletType.TOTAL_CONDITIONS | InletType.MASS_FLOW:
                return solver_type in {
                    SolverType.EULER,
                    SolverType.NAVIER_STOKES,
                    SolverType.RANS,
                    SolverType.FEM_EULER,
                    SolverType.FEM_NAVIER_STOKES,
                }

            case InletType.VELOCITY_INLET | InletType.PRESSURE_INLET:
                return solver_type in {
                    SolverType.INC_EULER,
                    SolverType.INC_NAVIER_STOKES,
                    SolverType.INC_RANS
                }

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Convective-Schemes/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class ConvectiveScheme(Enum):
    """ Convective numerical scheme. """
    JST           = "JST"
    JST_KE        = "JST_KE"
    JST_MAT       = "JST_MAT"
    LAX_FRIEDRICH = "LAX-FRIEDRICH"
    ROE           = "ROE"
    AUSM          = "AUSM"
    AUSMPLUSUP    = "AUSMPLUSUP"
    AUSMPLUSUP2   = "AUSMPLUSUP2"
    AUSMPLUSM     = "AUSMPLUSM"
    HLLC          = "HLLC"
    TURKEL_PREC   = "TURKEL_PREC"
    SW            = "SW"
    MSW           = "MSW"
    FDS           = "FDS"
    SLAU          = "SLAU"
    SLAU2         = "SLAU2"
    L2ROE         = "L2ROE"
    LMROE         = "LMROE"

    def validate_solver(self, solver_type: SolverType) -> bool:
        """ Validate if the convective scheme is compatible with the solver type. """
        raise NotImplementedError("Validation not implemented yet.")

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Linear-Solvers-and-Preconditioners
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class LinearSolver(Enum):
    """ Linear solver options. """
    FGMRES             = "FGMRES"
    RESTARTED_FGMRES   = "RESTARTED_FGMRES"
    BCGSTAB            = "BCGSTAB"
    CONJUGATE_GRADIENT = "CONJUGATE_GRADIENT"
    SMOOTHER           = "SMOOTHER"


class Preconditioner(Enum):
    """ Preconditioner options. """
    JACOBI  = "JACOBI"
    LU_SGS  = "LU_SGS"
    ILU     = "ILU"
    LINELET = "LINELET"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# TBD : not found in the documentation
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class MathProblem(Enum):
    """ Mathematical problem types. """
    NONE               = "NONE"
    DIRECT             = "DIRECT"
    CONTINUOUS_ADJOINT = "CONTINUOUS_ADJOINT"
    DISCRETE_ADJOINT   = "DISCRETE_ADJOINT"


class NumMethodGrad(Enum):
    """ Numerical method for gradient computation. """
    GREEN_GAUSS            = "GREEN_GAUSS"
    WEIGHTED_LEAST_SQUARES = "WEIGHTED_LEAST_SQUARES"


class MgCycle(Enum):
    """ Multigrid cycle types. """
    V_CYCLE      = "V_CYCLE"
    W_CYCLE      = "W_CYCLE"
    FULLMG_CYCLE = "FULLMG_CYCLE"


class TimeDiscretization(Enum):
    """ Time discretization scheme. """
    RUNGE_KUTTA_EXPLICIT = "RUNGE-KUTTA_EXPLICIT"
    EULER_IMPLICIT       = "EULER_IMPLICIT"
    EULER_EXPLICIT       = "EULER_EXPLICIT"


class SgsModel(Enum):
    """ Subgrid scale model options. """
    NONE          = "NONE"
    IMPLICIT_LES  = "IMPLICIT_LES"
    SMAGORINSKY   = "SMAGORINSKY"
    WALE          = "WALE"
    VREMAN        = "VREMAN"


class Verification(Enum):
    """ Solution verification types. """
    NO_VERIFICATION_SOLUTION = "NO_VERIFICATION_SOLUTION"
    INVISCID_VORTEX          = "INVISCID_VORTEX"
    RINGLEB                  = "RINGLEB"
    NS_UNIT_QUAD             = "NS_UNIT_QUAD"
    TAYLOR_GREEN_VORTEX      = "TAYLOR_GREEN_VORTEX"
    MMS_NS_UNIT_QUAD         = "MMS_NS_UNIT_QUAD"
    MMS_NS_UNIT_QUAD_WALL_BC = "MMS_NS_UNIT_QUAD_WALL_BC"
    MMS_NS_TWO_HALF_CIRCLES  = "MMS_NS_TWO_HALF_CIRCLES"
    MMS_NS_TWO_HALF_SPHERES  = "MMS_NS_TWO_HALF_SPHERES"
    MMS_INC_EULER            = "MMS_INC_EULER"
    MMS_INC_NS               = "MMS_INC_NS"
    INC_TAYLOR_GREEN_VORTEX  = "INC_TAYLOR_GREEN_VORTEX"
    USER_DEFINED_SOLUTION    = "USER_DEFINED_SOLUTION"


class UnitSystem(Enum):
    """ System of measurements.

    Attributes
    ----------
    NONE : str
        No specific system of units (use default SU2 units).
    SI : str
        International system of units (SI): (meters, kilograms, Kelvins,
        Newtons = kg m/s^2, Pascals = N/m^2, Density = kg/m^3,
        Speed = m/s, Equiv. Area = m^2)
    US : str
        United States customary units (US): (inches, slug, Rankines,
        lbf = slug ft/s^2, psf = lbf/ft^2, Density = slug/ft^3,
        Speed = ft/s, Equiv. Area = ft^2)
    """
    NONE = "NONE"
    SI   = "SI"
    US   = "US"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# EOF
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
