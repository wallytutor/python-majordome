# -*- coding: utf-8 -*-
from dataclasses import dataclass, field
from typing import Any
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
    SgsModel,
    Verification,
    MathProblem,
    UnitSystem,
)

MaybeFloat = float | None

VelocityType = tuple[float, float, float]

MaybeVelocity = VelocityType | None


class GroupEntriesMixin:
    """ Mixin for handling configuration entries for SU2 groups. """
    __slots__ = ("cfg",)

    def start(self) -> None:
        """ Initialize configuration entries list. """
        self.cfg = []

    def header(self, title: str) -> None:
        """ Add header to configuration entries. """
        self.start()
        self.cfg.append(f"{80 * '%'}\n%% {title}\n{80 * '%'}")

    def entry(self, key: str, value: Any) -> None:
        """ Add configuration entry. """
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
    solution_verification: Verification    = Verification.NO_VERIFICATION_SOLUTION
    math_problem: MathProblem              = MathProblem.NONE
    axisymmetric: YesNoEnum                = YesNoEnum.NO
    gravity_force: YesNoEnum               = YesNoEnum.NO
    restart_sol: YesNoEnum                 = YesNoEnum.NO
    wrt_restart_compact: YesNoEnum         = YesNoEnum.NO
    discard_infiles: YesNoEnum             = YesNoEnum.NO
    system_measurements: UnitSystem        = UnitSystem.NONE
    config_list: list[str]                 = field(default_factory=lambda: [])

    def _handle_turbulence_model(self) -> None:
        """ Handle turbulence model related settings. """
        self.entry("KIND_TURB_MODEL", self.turbulence_model.value)

        match self.turbulence_model:
            case TurbulenceModel.SST:
                if self.sst_options != ShearStressTransportModel.NONE:
                    self.entry("SST_OPTIONS", self.sst_options.value)
            case TurbulenceModel.SA:
                if self.sa_options != SpalartAllmarasModel.NONE:
                    self.entry("SA_OPTIONS", self.sa_options.value)
            case _:
                pass

    def _handle_transition_model(self) -> None:
        """ Handle transition model related settings. """
        self.entry("KIND_TRANS_MODEL", self.transition_model.value)
        self.entry("HROUGHNESS", self.hroughness)

        match self.transition_model:
            case TransitionModel.LM:
                if self.lm_options != LmTransitionModelOptions.NONE:
                    self.entry("LM_OPTIONS", self.lm_options.value)
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

        self.entry("SOLVER", self.solver.value)

        if self.turbulence_model != TurbulenceModel.NONE:
            self._handle_turbulence_model()

        if self.transition_model != TransitionModel.NONE:
            self._handle_transition_model()

        if self.sgs_model != SgsModel.NONE:
            self.entry("KIND_SGS_MODEL", self.sgs_model.value)

        if self.solution_verification != Verification.NO_VERIFICATION_SOLUTION:
            self.entry("KIND_VERIFICATION_SOLUTION", self.solution_verification.value)

        if self.math_problem != MathProblem.NONE:
            self.entry("MATH_PROBLEM", self.math_problem.value)

        if self.axisymmetric != YesNoEnum.NO:
            self.entry("AXISYMMETRIC", self.axisymmetric.value)

        if self.gravity_force != YesNoEnum.NO:
            self.entry("GRAVITY_FORCE", self.gravity_force.value)

        if self.restart_sol != YesNoEnum.NO:
            self.entry("RESTART_SOL", self.restart_sol.value)

        if self.wrt_restart_compact != YesNoEnum.NO:
            self.entry("WRT_RESTART_COMPACT", self.wrt_restart_compact.value)

        if self.discard_infiles != YesNoEnum.NO:
            self.entry("DISCARD_INFILES", self.discard_infiles.value)

        if self.system_measurements != UnitSystem.NONE:
            self.entry("SYSTEM_MEASUREMENTS", self.system_measurements.value)

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

        if self.mach is not None:
            self.entry("MACH_NUMBER", self.mach)

        if self.angle_of_attack is not None:
            self.entry("AOA", self.angle_of_attack)

        if self.sideslip_angle is not None:
            self.entry("SIDESLIP_ANGLE", self.sideslip_angle)

        if self.init_option != FSInitOption.NONE:
            self.entry("INIT_OPTION", self.init_option.value)

        if self.freestream_option != FSOption.NONE:
            self.entry("FREESTREAM_OPTION", self.freestream_option.value)

        if self.pressure is not None:
            self.entry("FREESTREAM_PRESSURE", self.pressure)

        if self.temperature is not None:
            self.entry("FREESTREAM_TEMPERATURE", self.temperature)

        if self.temperature_ve is not None:
            self.entry("FREESTREAM_TEMPERATURE_VE", self.temperature_ve)

        if self.reynolds_number is not None:
            self.entry("REYNOLDS_NUMBER", self.reynolds_number)

        if self.reynolds_length is not None:
            self.entry("REYNOLDS_LENGTH", self.reynolds_length)

        if self.density is not None:
            self.entry("FREESTREAM_DENSITY", self.density)

        if self.velocity is not None:
            vel_str = ", ".join(str(v) for v in self.velocity)
            self.entry("FREESTREAM_VELOCITY", f"( {vel_str} )")

        if self.viscosity is not None:
            self.entry("FREESTREAM_VISCOSITY", self.viscosity)

        if self.turbulence_intensity is not None:
            self.entry("FREESTREAM_TURBULENCEINTENSITY", self.turbulence_intensity)

        if self.intermittency is not None:
            self.entry("FREESTREAM_INTERMITTENCY", self.intermittency)

        if self.turb_fixed_values != YesNoEnum.NO:
            self.entry("TURB_FIXED_VALUES", self.turb_fixed_values.value)

        if self.turb_fixed_values_domain is not None:
            self.entry("TURB_FIXED_VALUES_DOMAIN", self.turb_fixed_values_domain)

        if self.freestream_turb2lamviscratio is not None:
            self.entry("FREESTREAM_TURB2LAMVISCRATIO", self.freestream_turb2lamviscratio)

        if self.ref_dimensionalization != FSRefDimensionalization.NONE:
            self.entry("FS_REF_DIMENSIONALIZATION", self.ref_dimensionalization.value)

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

        return self.stringify()