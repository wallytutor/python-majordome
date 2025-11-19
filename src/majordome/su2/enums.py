# -*- coding: utf-8 -*-
from enum import Enum
from typing import Any

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# Helpers
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class ConfigEnum(Enum):
    """ Enforce use of string values for enums. """
    def __repr__(self) -> str:
        return self.value

    def __str__(self) -> str:
        return self.value


class NullableEnum(ConfigEnum):
    """ Provides control over boolean evaluation for enums. """
    @property
    def falsehood(self) -> list[Any]:
        """ Define falsehood values for the enum. """
        return ["NONE", None, False]

    def __bool__(self) -> bool:
        """ Evaluate as boolean. """
        return not (self.name == "NONE" or self.value in self.falsehood)


class YesNoEnum(ConfigEnum):
    """ Yes/No options. """
    NONE = "NONE"
    YES  = "YES"
    NO   = "NO"

    def __bool__(self) -> bool:
        """ Evaluate as boolean. """
        return self == YesNoEnum.YES

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Solver-Setup/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class SolverType(ConfigEnum):
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

class TurbulenceModel(NullableEnum):
    """ Turbulence model options. """
    NONE = "NONE"
    SA   = "SA"
    SST  = "SST"


class ShearStressTransportModel(NullableEnum):
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


class SpalartAllmarasModel(NullableEnum):
    """ Spalart-Allmaras (SA) turbulence model versions/corrections. """
    NONE            = "NONE"
    NEGATIVE        = "NEGATIVE"
    EDWARDS         = "EDWARDS"
    BCM             = "BCM"
    WITHFT2         = "WITHFT2"
    QCR2000         = "QCR2000"
    COMPRESSIBILITY = "COMPRESSIBILITY"
    ROTATION        = "ROTATION"


class TransitionModel(NullableEnum):
    """ Transition model options. """
    NONE = "NONE"
    LM   = "LM"


class LmTransitionModelOptions(NullableEnum):
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


class FSInitOption(NullableEnum):
    """ Free-stream option to choose initializing the solution. """
    NONE          = "NONE"
    REYNOLDS      = "REYNOLDS"
    TD_CONDITIONS = "TD_CONDITIONS"


class FSOption(NullableEnum):
    """ Free-stream option to choose between density and temperature. """
    NONE           = "NONE"
    TEMPERATURE_FS = "TEMPERATURE_FS"
    DENSITY_FS     = "DENSITY_FS"


class FSRefDimensionalization(NullableEnum):
    """ Free-stream reference dimensionalization options. """
    NONE                    = "NONE"
    DIMENSIONAL             = "DIMENSIONAL"
    FREESTREAM_PRESS_EQ_ONE = "FREESTREAM_PRESS_EQ_ONE"
    FREESTREAM_VEL_EQ_MACH  = "FREESTREAM_VEL_EQ_MACH"
    FREESTREAM_VEL_EQ_ONE   = "FREESTREAM_VEL_EQ_ONE"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Markers-and-BC/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class InletType(ConfigEnum):
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


class InletInterpolationFunction(NullableEnum):
    """ Type of spanwise interpolation to use for the inlet face. """
    NONE      = "NONE"
    LINEAR_1D = "LINEAR_1D"
    AKIMA_1D  = "AKIMA_1D"
    CUBIC_1D  = "CUBIC_1D"


class InletInterpolationDataType(NullableEnum):
    """ Type of radial spanwise interpolation type for the inlet face. """
    NONE     = "NONE"
    VR_VTHETA = "VR_VTHETA"
    ALPHA_PHI = "ALPHA_PHI"


class ActuatorDiskType(NullableEnum):
    """ Actuator disk boundary type options. """
    NONE              = "NONE"
    VARIABLE_LOAD     = "VARIABLE_LOAD"
    VARIABLES_JUMP    = "VARIABLES_JUMP"
    BC_THRUST         = "BC_THRUST"
    DRAG_MINUS_THRUST = "DRAG_MINUS_THRUST"
    BLADE_ELEMENT     = "BLADE_ELEMENT"


class EngineInflowType(NullableEnum):
    """ Engine inflow boundary type options."""
    NONE              = "NONE"
    FAN_FACE_MACH     = "FAN_FACE_MACH"
    FAN_FACE_PRESSURE = "FAN_FACE_PRESSURE"
    FAN_FACE_MDOT     = "FAN_FACE_MDOT"


class KindInterpolation(NullableEnum):
    """ Kind of interface interpolation among different zones. """
    NONE                  = "NONE"
    NEAREST_NEIGHBOR      = "NEAREST_NEIGHBOR"
    WEIGHTED_AVERAGE      = "WEIGHTED_AVERAGE"
    ISOPARAMETRIC         = "ISOPARAMETRIC"
    RADIAL_BASIS_FUNCTION = "RADIAL_BASIS_FUNCTION"


class KindRadialBasisFunction(NullableEnum):
    """ Type of radial basis function to use for RBF interpolation. """
    NONE              = "NONE"
    WENDLAND_C2       = "WENDLAND_C2"
    INV_MULTI_QUADRIC = "INV_MULTI_QUADRIC"
    GAUSSIAN          = "GAUSSIAN"
    THIN_PLATE_SPLINE = "THIN_PLATE_SPLINE"
    MULTI_QUADRIC     = "MULTI_QUADRIC"


class GilesCondition(NullableEnum):
    """ Giles boundary condition types for turbomachinery. """
    NONE                = "NONE"
    TOTAL_CONDITIONS_PT = "TOTAL_CONDITIONS_PT"
    STATIC_PRESSURE     = "STATIC_PRESSURE"
    MIXING_IN           = "MIXING_IN"
    MIXING_OUT          = "MIXING_OUT"


class BGSRelaxation(NullableEnum):
    """ Kind of relaxation for Block Gauss-Seidel coupling. """
    NONE   = "NONE"
    FIXED  = "FIXED"
    AITKEN = "AITKEN"


class DynamicLoadTransfer(NullableEnum):
    """ Transfer method used for multiphysics problems. """
    NONE          = "NONE"
    INSTANTANEOUS = "INSTANTANEOUS"
    POL_ORDER_1   = "POL_ORDER_1"
    POL_ORDER_3   = "POL_ORDER_3"
    POL_ORDER_5   = "POL_ORDER_5"
    SIGMOID_10    = "SIGMOID_10"
    SIGMOID_20    = "SIGMOID_20"


class WallFunctions(NullableEnum):
    """ Viscous wall function markers types. """
    NONE                 = "NO_WALL_FUNCTION"
    STANDARD_FUNCTION    = "STANDARD_WALL_FUNCTION"
    ADAPTIVE_FUNCTION    = "ADAPTIVE_WALL_FUNCTION"
    SCALABLE_FUNCTION    = "SCALABLE_WALL_FUNCTION"
    EQUILIBRIUM_MODEL    = "EQUILIBRIUM_WALL_MODEL"
    NONEQUILIBRIUM_MODEL = "NONEQUILIBRIUM_WALL_MODEL"
    LOGARITHMIC_MODEL    = "LOGARITHMIC_WALL_MODEL"


class AverageProcessMap(NullableEnum):
    """ Type of averaging for analyze markers. """
    NONE       = "NONE"
    ALGEBRAIC  = "ALGEBRAIC"
    AREA       = "AREA"
    MIXEDOUT   = "MIXEDOUT"
    MASSFLUX   = "MASSFLUX"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Convective-Schemes/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class ConvectiveScheme(ConfigEnum):
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


class RoeLowDissipation(NullableEnum):
    """ Types of Roe Low Dissipation Schemes. """
    NONE       = "NO_ROELOWDISS"
    FD         = "FD"
    NTS        = "NTS"
    NTS_DUCROS = "NTS_DUCROS"
    FD_DUCROS  = "FD_DUCROS"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Slope-Limiters-and-Shock-Resolution/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class SlopeLimiterType(NullableEnum):
    """ Slope limiter types for flow/turbulence equations.

    Slope limiters are used in higher-order spatial discretization schemes
    to preserve monotonicity and prevent oscillations near discontinuities.
    """
    NONE                 = "NONE"
    VENKATAKRISHNAN      = "VENKATAKRISHNAN"
    NISHIKAWA_R3         = "NISHIKAWA_R3"
    NISHIKAWA_R4         = "NISHIKAWA_R4"
    NISHIKAWA_R5         = "NISHIKAWA_R5"
    VENKATAKRISHNAN_WANG = "VENKATAKRISHNAN_WANG"
    BARTH_JESPERSEN      = "BARTH_JESPERSEN"
    VAN_ALBADA_EDGE      = "VAN_ALBADA_EDGE"
    SHARP_EDGES          = "SHARP_EDGES"
    WALL_DISTANCE        = "WALL_DISTANCE"


class SensSmoothing(NullableEnum):
    """ Sensitivity smoothing types. """
    NONE    = "NONE"
    SOBOLEV = "SOBOLEV"
    BIGRID  = "BIGRID"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Linear-Solvers-and-Preconditioners
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class LinearSolver(NullableEnum):
    """ Linear solver options. """
    NONE               = "NONE"
    CONJUGATE_GRADIENT = "CONJUGATE_GRADIENT"
    BCGSTAB            = "BCGSTAB"
    FGMRES             = "FGMRES"
    RESTARTED_FGMRES   = "RESTARTED_FGMRES"
    SMOOTHER           = "SMOOTHER"
    PASTIX_LDLT        = "PASTIX_LDLT"
    PASTIX_LU          = "PASTIX_LU"


class Preconditioner(NullableEnum):
    """ Preconditioner options. """
    NONE          = "NONE"
    JACOBI        = "JACOBI"
    LU_SGS        = "LU_SGS"
    LINELET       = "LINELET"
    ILU           = "ILU"
    PASTIX_ILU    = "PASTIX_ILU"
    PASTIX_LU_P   = "PASTIX_LU"
    PASTIX_LDLT_P = "PASTIX_LDLT"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# https://su2code.github.io/docs_v7/Custom-Output/
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class TabularFormat(ConfigEnum):
    """ Output tabular file format options. """
    TECPLOT = "TECPLOT"
    CSV     = "CSV"


class OutputFileFormat(ConfigEnum):
    """ Output file format options.

    Various output formats for solution visualization and post-processing.
    Different formats are suitable for different visualization tools.
    """
    TECPLOT_ASCII           = "TECPLOT_ASCII"
    TECPLOT                 = "TECPLOT"
    SURFACE_TECPLOT_ASCII   = "SURFACE_TECPLOT_ASCII"
    SURFACE_TECPLOT         = "SURFACE_TECPLOT"
    CSV                     = "CSV"
    SURFACE_CSV             = "SURFACE_CSV"
    PARAVIEW_ASCII          = "PARAVIEW_ASCII"
    PARAVIEW_LEGACY         = "PARAVIEW_LEGACY"
    SURFACE_PARAVIEW_ASCII  = "SURFACE_PARAVIEW_ASCII"
    SURFACE_PARAVIEW_LEGACY = "SURFACE_PARAVIEW_LEGACY"
    PARAVIEW                = "PARAVIEW"
    SURFACE_PARAVIEW        = "SURFACE_PARAVIEW"
    RESTART_ASCII           = "RESTART_ASCII"
    RESTART                 = "RESTART"
    CGNS                    = "CGNS"
    SURFACE_CGNS            = "SURFACE_CGNS"
    STL_ASCII               = "STL_ASCII"
    STL_BINARY              = "STL_BINARY"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# TBD : not found in the documentation
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

class MathProblem(NullableEnum):
    """ Mathematical problem types. """
    NONE               = "NONE"
    DIRECT             = "DIRECT"
    CONTINUOUS_ADJOINT = "CONTINUOUS_ADJOINT"
    DISCRETE_ADJOINT   = "DISCRETE_ADJOINT"


class NumMethodGrad(NullableEnum):
    """ Numerical method for gradient computation. """
    NONE                   = "NONE"
    GREEN_GAUSS            = "GREEN_GAUSS"
    WEIGHTED_LEAST_SQUARES = "WEIGHTED_LEAST_SQUARES"
    LEAST_SQUARES          = "LEAST_SQUARES"   # MUSCL only!


class MgCycle(ConfigEnum):
    """ Multigrid cycle types. """
    V_CYCLE      = "V_CYCLE"
    W_CYCLE      = "W_CYCLE"
    FULLMG_CYCLE = "FULLMG_CYCLE"


class TimeDiscretization(ConfigEnum):
    """ Time discretization scheme. """
    RUNGE_KUTTA_EXPLICIT = "RUNGE-KUTTA_EXPLICIT"
    EULER_IMPLICIT       = "EULER_IMPLICIT"
    EULER_EXPLICIT       = "EULER_EXPLICIT"


class SgsModel(NullableEnum):
    """ Subgrid scale model options. """
    NONE          = "NONE"
    IMPLICIT_LES  = "IMPLICIT_LES"
    SMAGORINSKY   = "SMAGORINSKY"
    WALE          = "WALE"
    VREMAN        = "VREMAN"


class Verification(NullableEnum):
    """ Solution verification types. """
    NONE                     = "NO_VERIFICATION_SOLUTION"
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


class UnitSystem(NullableEnum):
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


class ObjectiveFunction(NullableEnum):
    """ Objective function in gradient evaluation. """
    NONE                    = "NONE"
    DRAG                    = "DRAG"
    LIFT                    = "LIFT"
    SIDEFORCE               = "SIDEFORCE"
    MOMENT_X                = "MOMENT_X"
    MOMENT_Y                = "MOMENT_Y"
    MOMENT_Z                = "MOMENT_Z"
    EFFICIENCY              = "EFFICIENCY"
    BUFFET                  = "BUFFET"
    EQUIVALENT_AREA         = "EQUIVALENT_AREA"
    NEARFIELD_PRESSURE      = "NEARFIELD_PRESSURE"
    FORCE_X                 = "FORCE_X"
    FORCE_Y                 = "FORCE_Y"
    FORCE_Z                 = "FORCE_Z"
    THRUST                  = "THRUST"
    TORQUE                  = "TORQUE"
    TOTAL_HEATFLUX          = "TOTAL_HEATFLUX"
    CUSTOM_OBJFUNC          = "CUSTOM_OBJFUNC"
    MAXIMUM_HEATFLUX        = "MAXIMUM_HEATFLUX"
    INVERSE_DESIGN_PRESSURE = "INVERSE_DESIGN_PRESSURE"
    INVERSE_DESIGN_HEATFLUX = "INVERSE_DESIGN_HEATFLUX"
    SURFACE_TOTAL_PRESSURE  = "SURFACE_TOTAL_PRESSURE"
    SURFACE_MASSFLOW        = "SURFACE_MASSFLOW"
    SURFACE_STATIC_PRESSURE = "SURFACE_STATIC_PRESSURE"
    SURFACE_MACH            = "SURFACE_MACH"


class MeshFormat(ConfigEnum):
    """ Mesh file format options. """
    SU2  = "SU2"
    CGNS = "CGNS"


class CommLevel(ConfigEnum):
    """ MPI communication level options. """
    NONE    = "NONE"
    MINIMAL = "MINIMAL"
    FULL    = "FULL"

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# EOF
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
