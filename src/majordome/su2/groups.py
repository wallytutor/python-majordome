# -*- coding: utf-8 -*-
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

# XXX: for now, later organize imports properly
from .enums import *

MaybeStr = str | None

MaybeInt = int | None

MaybeFloat = float | None

MarkerList = list[Any]

DupleFloat = tuple[float, float]

TrupleFloat = tuple[float, float, float]

QuadrupleFloat = tuple[float, float, float, float]

TrupleInt = tuple[int, int, int]

MaybeVelocity = TrupleFloat | None

NONE_LIST = ["NONE"]


def empty_list_field():
    """ Return an empty list with a default value of ['NONE']. """
    return field(default_factory=lambda: NONE_LIST)


@dataclass
class ParametersCFL:
    """ Parameters of the adaptive CFL number.

    After the starting iteration has passed, local CFL increases by
    factor-up until max if the solution rate of change is not limited,
    and acceptable linear convergence is achieved. It is reduced if
    rate is limited, or if there is not enough linear convergence, or
    if the nonlinear residuals are stagnant and oscillatory. It is
    reset back to min when linear solvers diverge, or if nonlinear
    residuals increase too much.

    Attributes
    ----------
    factor_down : float
        Factor to reduce CFL number.
    factor_up : float
        Factor to increase CFL number.
    min_value : float
        Minimum CFL number.
    max_value : float
        Maximum CFL number.
    acceptable_convergence : float
        Acceptable linear convergence.
    starting_iteration : int
        Starting iteration for adaptive CFL.
    """
    factor_down: float
    factor_up: float
    min_value: float
    max_value: float
    acceptable_convergence: MaybeFloat = None
    starting_iteration: MaybeInt = None

    @property
    def data(self) -> tuple:
        """ Return parameters as a tuple for formatting. """
        data = [self.factor_down, self.factor_up, self.min_value, self.max_value]

        if self.acceptable_convergence is not None:
            data.append(self.acceptable_convergence)

        if self.starting_iteration is not None:
            data.append(self.starting_iteration)

        return tuple(data)


class GroupEntriesMixin:
    """ Mixin for handling configuration entries for SU2 groups. """
    __slots__ = ("cfg",)

    def start(self) -> None:
        """ Initialize configuration entries list. """
        self.cfg = []

    def header(self, title: str) -> None:
        """ Add header to configuration entries. """
        if not hasattr(self, "cfg"):
            self.start()
        self.cfg.append(f"{80 * '%'}\n%% {title}\n{80 * '%'}")

    def entry(self, key: str, value: Any, force: bool = False) -> None:
        """ Add configuration entry. """
        if force:
            self.cfg.append(f"{key}= {value}")
            return

        ##
        # Handle 'NONE' enum and None values
        ##

        if isinstance(value, Enum) and value.name == "NONE":
            return

        if isinstance(value, (list, tuple)):
            # TODO: check if this should really be this way!
            if not value or (len(value) == 1 and value[0] == "NONE"):
                return

        if value is None:
            return

        ##
        # Convert values
        ##

        if isinstance(value, Enum):
            value = value.value

        if isinstance(value, (list, tuple)):
            value = "( " + ", ".join(str(v) for v in value) + " )"

        self.cfg.append(f"{key}= {value}")

    def stringify(self) -> str:
        return "\n\n".join(self.cfg)


@dataclass
class ProblemDefinition(GroupEntriesMixin):
    """ Direct, adjoint, and linearized problem definition.

    Attributes
    ----------
    solver : SolverType
        Solver type.
    turbulence_model : TurbulenceModel
        Turbulence model.
    sst_options : ShearStressTransportModel
        SST model versions/corrections.
    sa_options : SpalartAllmarasModel
        SA model versions/corrections.
    transition_model : TransitionModel
        Transition model.
    hroughness : float
        RMS roughness for transition model.
    lm_options : LmTransitionModelOptions
        LM model versions/corrections.
    sgs_model : SgsModel
        Subgrid scale model.
    solution_verification : Verification
        Verification solution type.
    math_problem : MathProblem
        Mathematical problem type.
    axisymmetric : YesNoEnum
        Axisymmetric simulation for 2D problems.
    gravity_force : YesNoEnum
        Enable gravity force.
    restart_sol : YesNoEnum
        Restart solution.
    wrt_restart_compact : YesNoEnum
        Save only minimum required variables for restart.
    discard_infiles : YesNoEnum
        Discard data stored in solution and geometry files.
    system_measurements : UnitSystem
        System of measurements.
    config_list : list[str]
        List of config files for multizone setup.
    """
    solver: SolverType                     = SolverType.EULER
    turbulence_model: TurbulenceModel      = TurbulenceModel.NONE
    sst_options: ShearStressTransportModel = ShearStressTransportModel.NONE
    sa_options: SpalartAllmarasModel       = SpalartAllmarasModel.NONE
    transition_model: TransitionModel      = TransitionModel.NONE
    hroughness: float                      = 1.0e-6
    lm_options: LmTransitionModelOptions   = LmTransitionModelOptions.NONE
    sgs_model: SgsModel                    = SgsModel.NONE
    solution_verification: Verification    = Verification.NONE
    math_problem: MathProblem              = MathProblem.NONE
    axisymmetric: YesNoEnum                = YesNoEnum.NONE
    gravity_force: YesNoEnum               = YesNoEnum.NONE
    restart_sol: YesNoEnum                 = YesNoEnum.NONE
    wrt_restart_compact: YesNoEnum         = YesNoEnum.NONE
    discard_infiles: YesNoEnum             = YesNoEnum.NONE
    system_measurements: UnitSystem        = UnitSystem.NONE
    config_list: list[str]                 = field(default_factory=lambda: [])

    def _handle_turbulence_model(self) -> None:
        """ Handle turbulence model related settings. """
        self.entry("KIND_TURB_MODEL", self.turbulence_model)

        match self.turbulence_model:
            case TurbulenceModel.SST:
                self.entry("SST_OPTIONS", self.sst_options)

            case TurbulenceModel.SA:
                self.entry("SA_OPTIONS", self.sa_options)

            case _:
                pass

    def _handle_transition_model(self) -> None:
        """ Handle transition model related settings. """
        self.entry("KIND_TRANS_MODEL", self.transition_model)
        self.entry("HROUGHNESS", self.hroughness)

        match self.transition_model:
            case TransitionModel.LM:
                self.entry("LM_OPTIONS", self.lm_options)

            case _:
                pass

    def to_cfg(self) -> str:
        """ Generate configuration file entries for problem definition.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("DIRECT, ADJOINT, AND LINEARIZED PROBLEM DEFINITION")

        self.entry("SOLVER", self.solver)

        if self.turbulence_model:
            self._handle_turbulence_model()

        if self.transition_model:
            self._handle_transition_model()

        self.entry("KIND_SGS_MODEL", self.sgs_model)

        if self.solution_verification:
            self.entry("KIND_VERIFICATION_SOLUTION", self.solution_verification)

        self.entry("MATH_PROBLEM", self.math_problem)
        self.entry("AXISYMMETRIC", self.axisymmetric)
        self.entry("GRAVITY_FORCE", self.gravity_force)
        self.entry("RESTART_SOL", self.restart_sol)
        self.entry("WRT_RESTART_COMPACT", self.wrt_restart_compact)
        self.entry("DISCARD_INFILES", self.discard_infiles)
        self.entry("SYSTEM_MEASUREMENTS", self.system_measurements)

        if self.config_list:
            self.entry("CONFIG_LIST", ','.join(self.config_list))

        return self.stringify()


@dataclass
class CompressibleFreeStreamDefinition(GroupEntriesMixin):
    """ Compressible free-stream conditions definition.

    Attributes
    ----------
    mach : float
        Mach number (non-dimensional, based on the free-stream values).
    angle_of_attack : float
        Angle of attack (degrees, only for compressible flows).
    sideslip_angle : float
        Side-slip angle (degrees, only for compressible flows).
    init_option : FSInitOption
        Initialization option to choose between Reynolds (default) or
        thermodynamics quantities for initializing the solution.
    freestream_option : FSOption
        Free-stream option to choose between density (default) or temperature
        for initializing the solution.
    pressure : float
        Free-stream pressure (101325.0 N/m^2, 2116.216 psf by default)
    temperature : float
        Free-stream temperature (288.15 K, 518.67 R by default).
    temperature_ve : float
        Free-stream VIBRATIONAL temperature (288.15 K, 518.67 R by default).
    reynolds_number : float
        Reynolds number (non-dimensional, based on the free-stream values).
    reynolds_length : float
        Reynolds length (1.0 m, 1.0 inch by default).
    density : float
        Free-stream density (1.2886 Kg/m^3, 0.0025 slug/ft^3 by default).
    velocity : tuple[float, float, float]
        Free-stream velocity vector (1.0 m/s, 1.0 ft/s by default).
    viscosity : float
        Free-stream viscosity (1.853E-5 N s/m^2, 3.87E-7 lbf s/ft^2 by default).
    turbulence_intensity : float
        Free-stream turbulence intensity (0.05 by default).
    intermittency : float
        Free-stream intermittency (1.0 by default).
    turb_fixed_values : YesNoEnum
        Fix turbulence quantities to far-field values inside an upstream
        half-space.
    turb_fixed_values_domain : float
        Shift of the half-space on which fixed values are applied. It
        consists of those coordinates whose dot product with the normalized
        far-field velocity is less than this parameter.
    freestream_turb2lamviscratio : float
        Free-stream ratio between turbulent and laminar viscosity.
    ref_dimensionalization : str
        Compressible flow non-dimensionalization.
    """
    mach: MaybeFloat                         = None
    angle_of_attack: MaybeFloat              = None
    sideslip_angle: MaybeFloat               = None
    init_option: FSInitOption                = FSInitOption.NONE
    freestream_option: FSOption              = FSOption.NONE
    pressure: MaybeFloat                     = None
    temperature: MaybeFloat                  = None
    temperature_ve: MaybeFloat               = None
    reynolds_number: MaybeFloat              = None
    reynolds_length: MaybeFloat              = None
    density: MaybeFloat                      = None
    velocity: MaybeVelocity                  = None
    viscosity: MaybeFloat                    = None
    turbulence_intensity: MaybeFloat         = None
    intermittency: MaybeFloat                = None
    turb_fixed_values: YesNoEnum             = YesNoEnum.NO
    turb_fixed_values_domain: MaybeFloat     = None
    freestream_turb2lamviscratio: MaybeFloat = None
    ref_dimensionalization: FSRefDimensionalization = FSRefDimensionalization.NONE

    def to_cfg(self) -> str:
        """ Generate configuration file entries for compressible free-stream conditions.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("COMPRESSIBLE FREE-STREAM CONDITIONS DEFINITION")

        self.entry("MACH_NUMBER", self.mach)
        self.entry("AOA", self.angle_of_attack)
        self.entry("SIDESLIP_ANGLE", self.sideslip_angle)
        self.entry("INIT_OPTION", self.init_option)
        self.entry("FREESTREAM_OPTION", self.freestream_option)
        self.entry("FREESTREAM_PRESSURE", self.pressure)
        self.entry("FREESTREAM_TEMPERATURE", self.temperature)
        self.entry("FREESTREAM_TEMPERATURE_VE", self.temperature_ve)
        self.entry("REYNOLDS_NUMBER", self.reynolds_number)
        self.entry("REYNOLDS_LENGTH", self.reynolds_length)
        self.entry("FREESTREAM_DENSITY", self.density)
        self.entry("FREESTREAM_VELOCITY", self.velocity)
        self.entry("FREESTREAM_VISCOSITY", self.viscosity)
        self.entry("FREESTREAM_TURBULENCEINTENSITY", self.turbulence_intensity)
        self.entry("FREESTREAM_INTERMITTENCY", self.intermittency)

        if self.turb_fixed_values:
            self.entry("TURB_FIXED_VALUES", self.turb_fixed_values)

        self.entry("TURB_FIXED_VALUES_DOMAIN", self.turb_fixed_values_domain)
        self.entry("FREESTREAM_TURB2LAMVISCRATIO", self.freestream_turb2lamviscratio)
        self.entry("FS_REF_DIMENSIONALIZATION", self.ref_dimensionalization)

        return self.stringify()


@dataclass
class ReferenceValues(GroupEntriesMixin):
    """ Reference values definition for internal normalization.

    Attributes
    ----------
    ref_origin_moment_x : float
        Reference origin X-coordinate for moment computation (m or in).
    ref_origin_moment_y : float
        Reference origin Y-coordinate for moment computation (m or in).
    ref_origin_moment_z : float
        Reference origin Z-coordinate for moment computation (m or in).
    ref_length : float
        Reference length for moment non-dimensional coefficients (m or in).
    ref_velocity : float
        Reference velocity (incompressible only).
    ref_viscosity : float
        Reference viscosity (incompressible only).
    ref_area : float
        Reference area for non-dimensional force coefficients (m² or in²).
        Set to 0 to enable automatic calculation.
    semi_span : float
        Aircraft semi-span (m or in).
        Set to 0 to enable automatic calculation.
    """
    ref_origin_moment_x: MaybeFloat = None
    ref_origin_moment_y: MaybeFloat = None
    ref_origin_moment_z: MaybeFloat = None
    ref_length: MaybeFloat          = None
    ref_velocity: MaybeFloat        = None
    ref_viscosity: MaybeFloat       = None
    ref_area: MaybeFloat            = None
    semi_span: MaybeFloat           = None

    def to_cfg(self) -> str:
        """ Generate configuration file entries for reference values.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("REFERENCE VALUES DEFINITION")

        self.entry("REF_ORIGIN_MOMENT_X", self.ref_origin_moment_x)
        self.entry("REF_ORIGIN_MOMENT_Y", self.ref_origin_moment_y)
        self.entry("REF_ORIGIN_MOMENT_Z", self.ref_origin_moment_z)
        self.entry("REF_LENGTH", self.ref_length)
        self.entry("REF_VELOCITY", self.ref_velocity)
        self.entry("REF_VISCOSITY", self.ref_viscosity)
        self.entry("REF_AREA", self.ref_area)
        self.entry("SEMI_SPAN", self.semi_span)

        return self.stringify()


@dataclass
class BoundaryConditions(GroupEntriesMixin):
    """ Boundary condition definitions.

    Attributes
    ----------
    marker_euler : MarkerList
        Euler wall boundary markers (inviscid walls).
    marker_heatflux : MarkerList
        Navier-Stokes (no-slip), constant heat flux wall markers.
    marker_heattransfer : MarkerList
        Navier-Stokes (no-slip), heat-transfer/convection wall markers.
    marker_isothermal : MarkerList
        Navier-Stokes (no-slip), isothermal wall markers.

    marker_far : MarkerList
        Far-field boundary markers.
    marker_sym : MarkerList
        Symmetry boundary markers (identical to MARKER_EULER).
    marker_internal : MarkerList
        Internal boundary markers (no boundary condition).
    marker_nearfield : MarkerList
        Near-field boundary markers.
    marker_periodic : MarkerList
        Periodic boundary markers.

    marker_inlet : MarkerList
        Inlet boundary markers with conditions.
    marker_outlet : MarkerList
        Outlet boundary markers.
    marker_inlet_turbulent : MarkerList
        Inlet turbulent boundary markers with parameters.
    marker_supersonic_inlet : MarkerList
        Supersonic inlet boundary markers.
    marker_supersonic_outlet : MarkerList
        Supersonic outlet boundary markers.

    marker_actdisk : MarkerList
        Actuator disk boundary markers.
    marker_actdisk_bem_cg : MarkerList
        Blade element CG markers.
    marker_actdisk_bem_axis : MarkerList
        Blade element axis markers.

    marker_engine_inflow : MarkerList
        Engine inflow boundary markers.
    marker_engine_exhaust : MarkerList
        Engine exhaust boundary markers.

    marker_normal_displ : MarkerList
        Displacement boundary markers.
    marker_pressure : MarkerList
        Pressure boundary markers.
    marker_riemann : MarkerList
        Riemann boundary markers.
    marker_shroud : MarkerList
        Shroud boundary markers.

    marker_zone_interface : MarkerList
        Zone interface markers.
    marker_cht_interface : MarkerList
        CHT (Conjugate Heat Transfer) interface markers.
    marker_fluid_interface : MarkerList
        Fluid interface markers.
    marker_fluid_load : MarkerList
        Markers where flow load is computed/applied.

    marker_smoluchowski_maxwell : MarkerList
        Smoluchowski/Maxwell slip wall boundary markers.
    marker_clamped : MarkerList
        Clamped boundary markers (structural).
    marker_damper : MarkerList
        Damper boundary markers (structural).
    marker_load : MarkerList
        Load boundary markers (structural).

    marker_turbomachinery : MarkerList
        Inflow and outflow markers for turbomachinery.
    marker_mixingplane_interface : MarkerList
        Mixing-plane interface markers.
    marker_giles : MarkerList
        Giles boundary condition markers for turbomachinery.

    catalytic_wall : MarkerList
        Catalytic wall markers.
    marker_displacement : MarkerList
        Displacement boundary markers.
    marker_custom : MarkerList
        Custom boundary markers (user-implemented).

    inlet_type : InletType
        Inlet boundary type.
    specified_inlet_profile : YesNoEnum
        Read inlet profile from a file.
    inlet_filename : str
        File specifying inlet profile.
    inlet_matching_tolerance : float
        Tolerance for matching coordinates in inlet profile file.
    inlet_interpolation_function : InletInterpolationFunction
        Type of spanwise interpolation for inlet face.
    inlet_interpolation_data_type : InletInterpolationDataType
        Type of radial spanwise interpolation for inlet face.
    print_inlet_interpolated_data : YesNoEnum
        Write interpolated inlet vertex data to file.
    actdisk_double_surface : YesNoEnum
        Propeller blade element actuator disk double surface.
    actdisk_type : ActuatorDiskType
        Actuator disk boundary type.
    actdisk_filename : MaybeStr
        Actuator disk data input file name.
    bem_prop_filename : MaybeStr
        Propeller blade element section data file name.
    bem_prop_blade_angle : MaybeFloat
        Propeller blade angle (degrees) at (0.75 * radius).
    bem_freq : MaybeInt
        BEM calculation frequency.
    engine_inflow_type : EngineInflowType
        Engine inflow boundary type.
    kind_interpolation : KindInterpolation
        Interface interpolation method among zones.
    conservative_interpolation : YesNoEnum
        Use conservative approach for interpolating between meshes.
    kind_radial_basis_function : KindRadialBasisFunction
        Type of radial basis function for RBF interpolation.
    radial_basis_function_parameter : MaybeFloat
        Radius for radial basis function.
    radial_basis_function_polynomial_term : YesNoEnum
        Use polynomial term in RBF interpolation.
    radial_basis_function_prune_tolerance : MaybeFloat
        Tolerance to prune small coefficients from RBF matrix.
    num_spanwise_sections : MaybeInt
        Number of spanwise sections for 3D turbo BC.
    spanwise_kind : MaybeInt
        Algorithm to identify span-wise sections (1 = automatic).
    giles_extra_relaxfactor : DupleFloat
        Extra under-relaxation factor for Giles BC at hub/shroud.
    spatial_fourier : YesNoEnum
        Non-reflectivity activation for Giles BC.
    supercatalytic_wall : YesNoEnum
        Specify if catalytic wall is supercatalytic.
    supercatalytic_wall_composition : TrupleFloat
        Species composition at supercatalytic wall.
    catalytic_efficiency : MaybeFloat
        Catalytic efficiency.
    sine_load : YesNoEnum
        Apply load as a sine wave.
    sine_load_coeff : TrupleFloat
        Sine load coefficients (amplitude, frequency, phase).
    ramp_and_release_load : YesNoEnum
        Ramp and release load option.
    ramp_loading : YesNoEnum
        Apply load as a ramp.
    ramp_time : MaybeFloat
        Time for linear load increase.
    ramp_fsi_iter : MaybeInt
        Number of FSI iterations with ramp applied.
    stat_relax_parameter : MaybeFloat
        Aitken static relaxation factor.
    aitken_dyn_max_initial : MaybeFloat
        Aitken dynamic maximum relaxation factor (first iteration).
    aitken_dyn_min_initial : MaybeFloat
        Aitken dynamic minimum relaxation factor (first iteration).
    bgs_relaxation : BGSRelaxation
        Kind of relaxation for BGS coupling.
    relaxation : YesNoEnum
        Relaxation required.
    dynamic_load_transfer : DynamicLoadTransfer
        Transfer method for multiphysics problems.
    """
    marker_euler: MarkerList                 = empty_list_field()
    marker_heatflux: MarkerList              = empty_list_field()
    marker_heattransfer: MarkerList          = empty_list_field()
    marker_isothermal: MarkerList            = empty_list_field()

    marker_far: MarkerList                   = empty_list_field()
    marker_sym: MarkerList                   = empty_list_field()
    marker_internal: MarkerList              = empty_list_field()
    marker_nearfield: MarkerList             = empty_list_field()
    marker_periodic: MarkerList              = empty_list_field()

    marker_inlet: MarkerList                 = empty_list_field()
    marker_outlet: MarkerList                = empty_list_field()
    marker_inlet_turbulent: MarkerList       = empty_list_field()
    marker_supersonic_inlet: MarkerList      = empty_list_field()
    marker_supersonic_outlet: MarkerList     = empty_list_field()

    marker_actdisk: MarkerList               = empty_list_field()
    marker_actdisk_bem_cg: MarkerList        = empty_list_field()
    marker_actdisk_bem_axis: MarkerList      = empty_list_field()

    marker_engine_inflow: MarkerList         = empty_list_field()
    marker_engine_exhaust: MarkerList        = empty_list_field()

    marker_normal_displ: MarkerList          = empty_list_field()
    marker_pressure: MarkerList              = empty_list_field()
    marker_riemann: MarkerList               = empty_list_field()
    marker_shroud: MarkerList                = empty_list_field()

    marker_zone_interface: MarkerList        = empty_list_field()
    marker_cht_interface: MarkerList         = empty_list_field()
    marker_fluid_interface: MarkerList       = empty_list_field()
    marker_fluid_load: MarkerList            = empty_list_field()

    marker_smoluchowski_maxwell: MarkerList  = empty_list_field()
    marker_clamped: MarkerList               = empty_list_field()
    marker_damper: MarkerList                = empty_list_field()
    marker_load: MarkerList                  = empty_list_field()

    marker_turbomachinery: MarkerList        = empty_list_field()
    marker_mixingplane_interface: MarkerList = empty_list_field()
    marker_giles: MarkerList                 = empty_list_field()
    catalytic_wall: MarkerList               = empty_list_field()
    marker_displacement: MarkerList          = empty_list_field()
    marker_custom: MarkerList                = empty_list_field()

    inlet_type: InletType = InletType.TOTAL_CONDITIONS
    specified_inlet_profile: YesNoEnum = YesNoEnum.NONE
    inlet_filename: MaybeStr = None
    inlet_matching_tolerance: MaybeFloat = None
    inlet_interpolation_function: InletInterpolationFunction = InletInterpolationFunction.NONE
    inlet_interpolation_data_type: InletInterpolationDataType = InletInterpolationDataType.VR_VTHETA
    print_inlet_interpolated_data: YesNoEnum = YesNoEnum.NONE
    actdisk_double_surface: YesNoEnum = YesNoEnum.NONE
    actdisk_type: ActuatorDiskType = ActuatorDiskType.VARIABLES_JUMP
    actdisk_filename: MaybeStr = None
    bem_prop_filename: MaybeStr = None
    bem_prop_blade_angle: MaybeFloat = None
    bem_freq: MaybeInt = None
    engine_inflow_type: EngineInflowType = EngineInflowType.FAN_FACE_MACH
    kind_interpolation: KindInterpolation = KindInterpolation.NEAREST_NEIGHBOR
    conservative_interpolation: YesNoEnum = YesNoEnum.NONE
    kind_radial_basis_function: KindRadialBasisFunction = KindRadialBasisFunction.WENDLAND_C2
    radial_basis_function_parameter: MaybeFloat = None
    radial_basis_function_polynomial_term: YesNoEnum = YesNoEnum.NONE
    radial_basis_function_prune_tolerance: MaybeFloat = None
    num_spanwise_sections: MaybeInt = None
    spanwise_kind: MaybeInt = None
    giles_extra_relaxfactor: DupleFloat | None = None
    spatial_fourier: YesNoEnum = YesNoEnum.NONE
    supercatalytic_wall: YesNoEnum = YesNoEnum.NONE
    supercatalytic_wall_composition: TrupleFloat | None = None
    catalytic_efficiency: MaybeFloat = None
    sine_load: YesNoEnum = YesNoEnum.NONE
    sine_load_coeff: TrupleFloat | None = None
    ramp_and_release_load: YesNoEnum = YesNoEnum.NONE
    ramp_loading: YesNoEnum = YesNoEnum.NONE
    ramp_time: MaybeFloat = None
    ramp_fsi_iter: MaybeInt = None
    stat_relax_parameter: MaybeFloat = None
    aitken_dyn_max_initial: MaybeFloat = None
    aitken_dyn_min_initial: MaybeFloat = None
    bgs_relaxation: BGSRelaxation = BGSRelaxation.NONE
    relaxation: YesNoEnum = YesNoEnum.NONE
    dynamic_load_transfer: DynamicLoadTransfer = DynamicLoadTransfer.NONE

    def _handle_wall_markers(self) -> None:
        """ Handle wall boundary markers. """
        self.entry("MARKER_EULER", self.marker_euler)
        # self.entry("MARKER_HEATFLUX", self.marker_heatflux)
        # self.entry("MARKER_HEATTRANSFER", self.marker_heattransfer)
        # self.entry("MARKER_ISOTHERMAL", self.marker_isothermal)

    def _handle_field_markers(self) -> None:
        """ Handle field boundary markers. """
        # self.entry("MARKER_FAR", self.marker_far)
        # self.entry("MARKER_SYM", self.marker_sym)
        # self.entry("MARKER_INTERNAL", self.marker_internal)
        # self.entry("MARKER_NEARFIELD", self.marker_nearfield)
        # self.entry("MARKER_PERIODIC", self.marker_periodic)
        pass

    def _handle_inlet_outlet_markers(self) -> None:
        """ Handle inlet and outlet boundary markers. """
        if self.marker_inlet and self.marker_inlet != NONE_LIST:
            self.entry("INLET_TYPE", self.inlet_type)
            self.entry("MARKER_INLET", self.marker_inlet)

        if self.specified_inlet_profile:
            self.entry("SPECIFIED_INLET_PROFILE", self.specified_inlet_profile)
            self.entry("INLET_FILENAME", self.inlet_filename)
            self.entry("INLET_MATCHING_TOLERANCE", self.inlet_matching_tolerance)

        if self.inlet_interpolation_function:
            self.entry("INLET_INTERPOLATION_FUNCTION", self.inlet_interpolation_function)
            self.entry("INLET_INTERPOLATION_DATA_TYPE", self.inlet_interpolation_data_type)
            self.entry("PRINT_INLET_INTERPOLATED_DATA", self.print_inlet_interpolated_data)

        if self.marker_outlet and self.marker_outlet != NONE_LIST:
            self.entry("MARKER_OUTLET", self.marker_outlet)

        # self.entry("MARKER_INLET_TURBULENT", self.marker_inlet_turbulent)
        # self.entry("MARKER_SUPERSONIC_INLET", self.marker_supersonic_inlet)
        # self.entry("MARKER_SUPERSONIC_OUTLET", self.marker_supersonic_outlet)

    def to_cfg(self) -> str:
        """Generate configuration file entries for boundary conditions.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("BOUNDARY CONDITION DEFINITION")

        self._handle_wall_markers()
        self._handle_field_markers()
        self._handle_inlet_outlet_markers()

        # # Actuator disk
        # self.entry("ACTDISK_DOUBLE_SURFACE", self.actdisk_double_surface)
        # self.entry("ACTDISK_TYPE", self.actdisk_type)
        # self.entry("MARKER_ACTDISK", self.marker_actdisk)
        # self.entry("MARKER_ACTDISK_BEM_CG", self.marker_actdisk_bem_cg)
        # self.entry("MARKER_ACTDISK_BEM_AXIS", self.marker_actdisk_bem_axis)
        # self.entry("ACTDISK_FILENAME", self.actdisk_filename)
        # self.entry("BEM_PROP_FILENAME", self.bem_prop_filename)
        # self.entry("BEM_PROP_BLADE_ANGLE", self.bem_prop_blade_angle)
        # self.entry("BEM_FREQ", self.bem_freq)

        # # Engine
        # self.entry("ENGINE_INFLOW_TYPE", self.engine_inflow_type)
        # self.entry("MARKER_ENGINE_INFLOW", self.marker_engine_inflow)
        # self.entry("MARKER_ENGINE_EXHAUST", self.marker_engine_exhaust)

        # # Structural
        # self.entry("MARKER_NORMAL_DISPL", self.marker_normal_displ)
        # self.entry("MARKER_PRESSURE", self.marker_pressure)

        # # Special
        # self.entry("MARKER_RIEMANN", self.marker_riemann)
        # self.entry("MARKER_SHROUD", self.marker_shroud)

        # # Interfaces
        # self.entry("MARKER_ZONE_INTERFACE", self.marker_zone_interface)
        # self.entry("MARKER_CHT_INTERFACE", self.marker_cht_interface)
        # self.entry("MARKER_FLUID_INTERFACE", self.marker_fluid_interface)
        # self.entry("MARKER_FLUID_LOAD", self.marker_fluid_load)

        # # Interpolation
        # self.entry("KIND_INTERPOLATION", self.kind_interpolation)
        # self.entry("CONSERVATIVE_INTERPOLATION", self.conservative_interpolation)
        # self.entry("KIND_RADIAL_BASIS_FUNCTION", self.kind_radial_basis_function)
        # self.entry("RADIAL_BASIS_FUNCTION_PARAMETER", self.radial_basis_function_parameter)
        # self.entry("RADIAL_BASIS_FUNCTION_POLYNOMIAL_TERM",
        #            self.radial_basis_function_polynomial_term)
        # self.entry("RADIAL_BASIS_FUNCTION_PRUNE_TOLERANCE", self.radial_basis_function_prune_tolerance)

        # # Turbomachinery
        # self.entry("MARKER_TURBOMACHINERY", self.marker_turbomachinery)
        # self.entry("NUM_SPANWISE_SECTIONS", self.num_spanwise_sections)
        # self.entry("SPANWISE_KIND", self.spanwise_kind)
        # self.entry("MARKER_MIXINGPLANE_INTERFACE", self.marker_mixingplane_interface)
        # self.entry("MARKER_GILES", self.marker_giles)
        # self.entry("GILES_EXTRA_RELAXFACTOR", self.giles_extra_relaxfactor)
        # self.entry("SPATIAL_FOURIER", self.spatial_fourier)

        # # Catalytic walls
        # self.entry("CATALYTIC_WALL", self.catalytic_wall)
        # self.entry("SUPERCATALYTIC_WALL", self.supercatalytic_wall)

        # self.entry("SUPERCATALYTIC_WALL_COMPOSITION", self.supercatalytic_wall_composition)
        # self.entry("CATALYTIC_EFFICIENCY", self.catalytic_efficiency)

        # # Custom and special
        # self.entry("MARKER_CUSTOM", self.marker_custom)
        # self.entry("MARKER_SMOLUCHOWSKI_MAXWELL", self.marker_smoluchowski_maxwell)

        # # Structural
        # self.entry("MARKER_CLAMPED", self.marker_clamped)
        # self.entry("MARKER_DAMPER", self.marker_damper)
        # self.entry("MARKER_LOAD", self.marker_load)

        # # Load configuration
        # self.entry("SINE_LOAD", self.sine_load)
        # self.entry("SINE_LOAD_COEFF", self.sine_load_coeff)

        # self.entry("RAMP_AND_RELEASE_LOAD", self.ramp_and_release_load)
        # self.entry("RAMP_LOADING", self.ramp_loading)
        # self.entry("RAMP_TIME", self.ramp_time)
        # self.entry("RAMP_FSI_ITER", self.ramp_fsi_iter)

        # # Relaxation
        # self.entry("STAT_RELAX_PARAMETER", self.stat_relax_parameter)
        # self.entry("AITKEN_DYN_MAX_INITIAL", self.aitken_dyn_max_initial)
        # self.entry("AITKEN_DYN_MIN_INITIAL", self.aitken_dyn_min_initial)
        # self.entry("BGS_RELAXATION", self.bgs_relaxation)
        # self.entry("RELAXATION", self.relaxation)
        # self.entry("DYNAMIC_LOAD_TRANSFER", self.dynamic_load_transfer)

        # # Displacement
        # self.entry("MARKER_DISPLACEMENT", self.marker_displacement)

        return self.stringify()


@dataclass
class SurfacesIdentification(GroupEntriesMixin):
    """ Surfaces identification group.

    Attributes
    ----------
    marker_plotting : MarkerList
        Marker(s) of the surface in the surface flow solution file.
    marker_monitoring : MarkerList
        Marker(s) of the surface where the non-dimensional coefficients
        are evaluated.
    marker_wall_functions : MarkerList
        Viscous wall markers for which wall functions must be applied.
    marker_python_custom : MarkerList
        Marker(s) of the surface where custom thermal BC's are defined.
    marker_designing : MarkerList
        Marker(s) of the surface where obj. func. (design problem) will
        be evaluated.
    marker_analyze : MarkerList
        Marker(s) of the surface that is going to be analyzed in detail
        (massflow, average pressure, distortion, etc).
    marker_analyze_average : AverageProcessMap
        Method to compute the average value in MARKER_ANALYZE.
    """
    marker_plotting: MarkerList       = empty_list_field()
    marker_monitoring: MarkerList     = empty_list_field()
    marker_wall_functions: MarkerList = empty_list_field()
    marker_python_custom: MarkerList  = empty_list_field()
    marker_designing: MarkerList      = empty_list_field()
    marker_analyze: MarkerList        = empty_list_field()
    marker_analyze_average: AverageProcessMap = AverageProcessMap.NONE

    def to_cfg(self) -> str:
        """ Generate configuration file entries for surfaces identification.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("SURFACES IDENTIFICATION")

        self.entry("MARKER_PLOTTING", self.marker_plotting)
        self.entry("MARKER_MONITORING", self.marker_monitoring)
        self.entry("MARKER_WALL_FUNCTIONS", self.marker_wall_functions)
        self.entry("MARKER_PYTHON_CUSTOM", self.marker_python_custom)
        self.entry("MARKER_DESIGNING", self.marker_designing)
        self.entry("MARKER_ANALYZE", self.marker_analyze)
        self.entry("MARKER_ANALYZE_AVERAGE", self.marker_analyze_average)

        return self.stringify()


@dataclass
class CommonParametersNumerical(GroupEntriesMixin):
    """ Common numerical parameters for flow solvers.

    Attributes
    ----------
    num_method_grad: NumMethodGrad
        Numerical method for spatial gradient
    num_method_grad_recon: NumMethodGrad
        Numerical method for spatial gradients to be used for MUSCL
        reconstruction. If not specified, the method specified in
        NUM_METHOD_GRAD is used.
    cfl_number: MaybeFloat
        CFL number (initial value for the adaptive CFL number).
    cfl_adapt: YesNoEnum
        Adaptive CFL number (NO, YES).
    cfl_adapt_param: ParametersCFL | None
        Parameters of the adaptive CFL number.
    max_delta_time: MaybeFloat
        Maximum time step size.
    ext_iter_offset: MaybeInt
        External iteration offset for time marching schemes.
    rk_alpha_coeff: TrupleFloat | None
        Coefficients for low-storage Runge-Kutta schemes.
    objective_function: ObjectiveFunction
        Objective function to be used in gradient evaluation.
    objective_weight: MaybeFloat
        Weighting factor for the objective function.
    custom_objfunc: MaybeStr
        Custom expression for objective function evaluation.
    """
    num_method_grad: NumMethodGrad = NumMethodGrad.GREEN_GAUSS
    num_method_grad_recon: NumMethodGrad = NumMethodGrad.NONE
    cfl_number: MaybeFloat = None
    cfl_adapt: YesNoEnum = YesNoEnum.NONE
    cfl_adapt_param: ParametersCFL | None = None
    max_delta_time: MaybeFloat = None
    ext_iter_offset: MaybeInt = None
    rk_alpha_coeff: TrupleFloat | None = None
    objective_function: ObjectiveFunction = ObjectiveFunction.NONE
    objective_weight: MaybeFloat = None
    custom_objfunc: MaybeStr = None

    def to_cfg(self) -> str:
        """ Generate configuration file entries for common numerical parameters.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("OMMON PARAMETERS DEFINING THE NUMERICAL METHOD")

        self.entry("NUM_METHOD_GRAD", self.num_method_grad)
        self.entry("NUM_METHOD_GRAD_RECON", self.num_method_grad_recon)
        self.entry("CFL_NUMBER", self.cfl_number)
        self.entry("CFL_ADAPT", self.cfl_adapt)

        if self.cfl_adapt and self.cfl_adapt_param is not None:
            self.entry("CFL_ADAPT_PARAM", self.cfl_adapt_param.data)

        self.entry("MAX_DELTA_TIME", self.max_delta_time)
        self.entry("EXT_ITER_OFFSET", self.ext_iter_offset)
        self.entry("RK_ALPHA_COEFF", self.rk_alpha_coeff)
        self.entry("OBJECTIVE_FUNCTION", self.objective_function)
        self.entry("OBJECTIVE_WEIGHT", self.objective_weight)
        self.entry("CUSTOM_OBJFUNC", self.custom_objfunc)

        return self.stringify()


@dataclass
class LinearSolverParameters(GroupEntriesMixin):
    """ Linear solver definitions.

    Attributes
    ----------
    enable_cuda : YesNoEnum
        Use CUDA GPU Acceleration for FGMRES Linear Solver only.
    linear_solver : LinearSolver
        Linear solver or smoother for implicit formulations.
    linear_solver_prec : Preconditioner
        Preconditioner of the Krylov linear solver or type of smoother.
    discadj_lin_solver : LinearSolver
        Linear solver for discrete adjoint (smoothers not supported).
        Replaces LINEAR_SOLVER in SU2_*_AD codes.
    discadj_lin_prec : Preconditioner
        Preconditioner for discrete adjoint (JACOBI or ILU).
        Replaces LINEAR_SOLVER_PREC in SU2_*_AD codes.
    adjturb_lin_solver : LinearSolver
        Linear solver for the turbulent adjoint systems.
    adjturb_lin_prec : Preconditioner
        Preconditioner for the turbulent adjoint Krylov linear solvers.
    adjturb_lin_iter : int
        Maximum number of iterations of the turbulent adjoint linear solver
        for the implicit formulation.
    ilu_fill_in : int
        Linear solver ILU preconditioner fill-in level (0 by default).
    error : float
        Minimum error of the linear solver for implicit formulations.
    n_iter : int
        Max number of iterations of the linear solver for the implicit formulation.
    restart_frequency : int
        Restart frequency for RESTARTED_FGMRES.
    smoother_relaxation : float
        Relaxation factor for smoother-type solvers (LINEAR_SOLVER= SMOOTHER).
    """
    enable_cuda: YesNoEnum = YesNoEnum.NONE

    linear_solver: LinearSolver = LinearSolver.NONE
    linear_solver_prec: Preconditioner = Preconditioner.NONE

    discadj_lin_solver: LinearSolver = LinearSolver.NONE
    discadj_lin_prec: Preconditioner = Preconditioner.NONE

    adjturb_lin_solver: LinearSolver = LinearSolver.NONE
    adjturb_lin_prec: Preconditioner = Preconditioner.NONE
    adjturb_lin_iter: MaybeInt = None

    ilu_fill_in: MaybeInt = None
    error: MaybeFloat = None
    n_iter: MaybeInt = None
    restart_frequency: MaybeInt = None
    smoother_relaxation: MaybeFloat = None

    def to_cfg(self) -> str:
        """ Generate configuration file entries for linear solver parameters.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("LINEAR SOLVER DEFINITION")

        self.entry("ENABLE_CUDA", self.enable_cuda)

        self.entry("LINEAR_SOLVER", self.linear_solver)
        self.entry("LINEAR_SOLVER_PREC", self.linear_solver_prec)

        self.entry("DISCADJ_LIN_SOLVER", self.discadj_lin_solver)
        self.entry("DISCADJ_LIN_PREC", self.discadj_lin_prec)

        self.entry("ADJTURB_LIN_SOLVER", self.adjturb_lin_solver)
        self.entry("ADJTURB_LIN_PREC", self.adjturb_lin_prec)
        self.entry("ADJTURB_LIN_ITER", self.adjturb_lin_iter)

        self.entry("LINEAR_SOLVER_ILU_FILL_IN", self.ilu_fill_in)
        self.entry("LINEAR_SOLVER_ERROR", self.error)
        self.entry("LINEAR_SOLVER_ITER", self.n_iter)
        self.entry("LINEAR_SOLVER_RESTART_FREQUENCY", self.restart_frequency)
        self.entry("LINEAR_SOLVER_SMOOTHER_RELAXATION", self.smoother_relaxation)

        return self.stringify()


@dataclass
class MultigridParameters(GroupEntriesMixin):
    """ Multi-grid definitions.

    Attributes
    ----------
    mg_level: int
        Multi-grid levels (0 = no multi-grid)
    mg_cycle: MgCycle
        Multi-grid cycle.
    mg_pre_smooth: list[int] | None
        Multi-grid pre-smoothing level.
    mg_post_smooth: list[int] | None
        Multi-grid post-smoothing level.
    mg_correction_smooth: list[int] | None
        Jacobi implicit smoothing of the correction.
    mg_damp_restriction: MaybeFloat
        Damping factor for the residual restriction.
    mg_damp_prolongation: MaybeFloat
        Damping factor for the correction prolongation.
    """
    mg_level: int = 0
    mg_cycle: MgCycle = MgCycle.V_CYCLE
    mg_pre_smooth: list[int] | None = None
    mg_post_smooth: list[int] | None = None
    mg_correction_smooth: list[int] | None = None
    mg_damp_restriction: MaybeFloat = None
    mg_damp_prolongation: MaybeFloat = None

    def to_cfg(self) -> str:
        """ Generate configuration file entries for multi-grid parameters.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("MULTIGRID PARAMETERS")

        if self.mg_level > 0:
            lists_check = [self.mg_pre_smooth,
                           self.mg_post_smooth,
                           self.mg_correction_smooth]

            for lst in lists_check:
                if lst is None or len(lst) != self.mg_level + 1:
                    raise ValueError("MG_PRE_SMOOTH, MG_POST_SMOOTH and "
                                     "MG_CORRECTION_SMOOTH must be defined "
                                     "with length equal to MGLEVEL + 1.")

            self.entry("MGLEVEL", self.mg_level)
            self.entry("MGCYCLE", self.mg_cycle)

            self.entry("MG_PRE_SMOOTH", self.mg_pre_smooth)
            self.entry("MG_POST_SMOOTH", self.mg_post_smooth)
            self.entry("MG_CORRECTION_SMOOTH", self.mg_correction_smooth)

            self.entry("MG_DAMP_RESTRICTION", self.mg_damp_restriction)
            self.entry("MG_DAMP_PROLONGATION", self.mg_damp_prolongation)

        return self.stringify()


@dataclass
class FlowNumericalMethod(GroupEntriesMixin):
    """ Flow numerical method definitions.

    Attributes
    ----------
    conv_num_method_flow : ConvectiveScheme
        Convective numerical method.
    roe_low_dissipation : RoeLowDissipation
        Roe Low Dissipation function for Hybrid RANS/LES simulations.
    roe_kappa : float
        Roe dissipation coefficient.
    min_roe_turkel_prec : float
        Minimum value for beta for the Roe-Turkel preconditioner.
    max_roe_turkel_prec : float
        Maximum value for beta for the Roe-Turkel preconditioner.
    low_mach_corr : YesNoEnum
        Post-reconstruction correction for low Mach number flows.
    low_mach_prec : YesNoEnum
        Roe-Turkel preconditioning for low Mach number flows.
    use_accurate_flux_jacobians : YesNoEnum
        Use numerically computed Jacobians for AUSM+up(2) and SLAU(2).
        Slower per iteration but potentially more stable and capable of higher CFL.
    use_vectorization : YesNoEnum
        Use the vectorized version of the selected numerical method
        (available for JST family and Roe). SU2 should be compiled for
        an AVX or AVX512 architecture for best performance.
        NOTE: Currently vectorization always used for schemes that support it.
    entropy_fix_coeff : float
        Entropy fix coefficient (0.0 implies no entropy fixing,
        1.0 implies scalar artificial dissipation).
    central_jacobian_fix_factor : float
        Higher values than 1 (3 to 4) make the global Jacobian of central
        schemes (compressible flow only) more diagonal dominant (but
        mathematically incorrect) so that higher CFL can be used.
    central_inc_jacobian_fix_factor : float
        Control numerical properties of the global Jacobian matrix using
        a multiplication factor for incompressible central schemes.
    time_discre_flow : TimeDiscretization
        Time discretization scheme.
    newton_krylov : YesNoEnum
        Use a Newton-Krylov method on the flow equations.
        For multizone discrete adjoint it will use FGMRES on inner
        iterations with restart frequency equal to QUASI_NEWTON_NUM_SAMPLES.
    newton_krylov_iparam : TrupleInt
        Integer parameters for Newton-Krylov method: startup iters,
        precond iters, initial tolerance relaxation.
        TODO: make a class as ParametersCFL.
    newton_krylov_dparam : QuadrupleFloat
        Double parameters for Newton-Krylov method: startup residual drop,
        precond tolerance, full tolerance residual drop, findiff step.
        TODO: make a class as ParametersCFL.
    """
    conv_num_method_flow: ConvectiveScheme = ConvectiveScheme.ROE
    roe_low_dissipation: RoeLowDissipation = RoeLowDissipation.FD
    roe_kappa: MaybeFloat = None
    min_roe_turkel_prec: MaybeFloat = None
    max_roe_turkel_prec: MaybeFloat = None
    low_mach_corr: YesNoEnum = YesNoEnum.NONE
    low_mach_prec: YesNoEnum = YesNoEnum.NONE
    use_accurate_flux_jacobians: YesNoEnum = YesNoEnum.NONE
    use_vectorization: YesNoEnum = YesNoEnum.NONE
    entropy_fix_coeff: MaybeFloat = None
    central_jacobian_fix_factor: MaybeFloat = None
    central_inc_jacobian_fix_factor: MaybeFloat = None
    time_discre_flow: TimeDiscretization = TimeDiscretization.EULER_IMPLICIT
    newton_krylov: YesNoEnum = YesNoEnum.NONE
    newton_krylov_iparam: TrupleInt | None = None
    newton_krylov_dparam: QuadrupleFloat | None = None

    def to_cfg(self) -> str:
        """ Generate configuration file entries for flow numerical method.

        Returns
        -------
        str
            Configuration file entries.
        """
        self.header("FLOW NUMERICAL METHOD DEFINITION")

        self.entry("CONV_NUM_METHOD_FLOW", self.conv_num_method_flow)
        self.entry("ROE_LOW_DISSIPATION", self.roe_low_dissipation)
        self.entry("ROE_KAPPA", self.roe_kappa)

        self.entry("MIN_ROE_TURKEL_PREC", self.min_roe_turkel_prec)
        self.entry("MAX_ROE_TURKEL_PREC", self.max_roe_turkel_prec)

        self.entry("LOW_MACH_CORR", self.low_mach_corr)
        self.entry("LOW_MACH_PREC", self.low_mach_prec)

        self.entry("USE_ACCURATE_FLUX_JACOBIANS", self.use_accurate_flux_jacobians)
        self.entry("USE_VECTORIZATION", self.use_vectorization)

        self.entry("ENTROPY_FIX_COEFF", self.entropy_fix_coeff)
        self.entry("CENTRAL_JACOBIAN_FIX_FACTOR", self.central_jacobian_fix_factor)
        self.entry("CENTRAL_INC_JACOBIAN_FIX_FACTOR", self.central_inc_jacobian_fix_factor)

        self.entry("TIME_DISCRE_FLOW", self.time_discre_flow)

        if self.newton_krylov:
            self.entry("NEWTON_KRYLOV", self.newton_krylov)
            self.entry("NEWTON_KRYLOV_IPARAM", self.newton_krylov_iparam)
            self.entry("NEWTON_KRYLOV_DPARAM", self.newton_krylov_dparam)

        return self.stringify()


@dataclass
class SlopeLimiter(GroupEntriesMixin):
    def to_cfg(self) -> str:
        return self.stringify()


@dataclass
class SolverControl(GroupEntriesMixin):
    def to_cfg(self) -> str:
        return self.stringify()


@dataclass
class ScreenHistoryInfo(GroupEntriesMixin):
    def to_cfg(self) -> str:
        return self.stringify()


@dataclass
class IOFileInfo(GroupEntriesMixin):
    def to_cfg(self) -> str:
        return self.stringify()


@dataclass
class SU2Configuration(GroupEntriesMixin):
    """ SU2 configuration file generator.

    Attributes
    ----------
    problem_definition : ProblemDefinition
        Problem definition group.
    compressible_freestream_definition : CompressibleFreeStreamDefinition
        Compressible free-stream conditions definition group.
    """
    problem: ProblemDefinition
    compressible_freestream: CompressibleFreeStreamDefinition | None = None
    reference_values: ReferenceValues | None = None
    boundary_conditions: BoundaryConditions | None = None
    surfaces_identification: SurfacesIdentification | None = None
    common_numerical_parameters: CommonParametersNumerical | None = None
    linear_solver_parameters: LinearSolverParameters | None = None
    multigrid_parameters: MultigridParameters | None = None
    flow_numerical_method: FlowNumericalMethod | None = None
    slope_limiter: SlopeLimiter | None = None
    solver_control: SolverControl | None = None
    io_file_info: IOFileInfo | None = None
    screen_history_info: ScreenHistoryInfo | None = None

    def to_cfg(self) -> str:
        """ Generate full SU2 configuration file.

        Returns
        -------
        str
            Full SU2 configuration file.
        """
        self.start()
        self.cfg.append(self.problem.to_cfg())

        if self.compressible_freestream is not None:
            self.cfg.append(self.compressible_freestream.to_cfg())

        if self.reference_values is not None:
            self.cfg.append(self.reference_values.to_cfg())

        if self.boundary_conditions is not None:
            self.cfg.append(self.boundary_conditions.to_cfg())

        if self.surfaces_identification is not None:
            self.cfg.append(self.surfaces_identification.to_cfg())

        if self.common_numerical_parameters is not None:
            self.cfg.append(self.common_numerical_parameters.to_cfg())

        if self.linear_solver_parameters is not None:
            self.cfg.append(self.linear_solver_parameters.to_cfg())

        if self.multigrid_parameters is not None:
            self.cfg.append(self.multigrid_parameters.to_cfg())

        if self.flow_numerical_method is not None:
            self.cfg.append(self.flow_numerical_method.to_cfg())

        if self.slope_limiter is not None:
            self.cfg.append(self.slope_limiter.to_cfg())

        if self.solver_control is not None:
            self.cfg.append(self.solver_control.to_cfg())

        if self.screen_history_info is not None:
            self.cfg.append(self.screen_history_info.to_cfg())

        if self.io_file_info is not None:
            self.cfg.append(self.io_file_info.to_cfg())

        self.header("EOF")
        return self.stringify()
