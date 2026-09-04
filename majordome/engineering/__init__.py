# -*- coding: utf-8 -*-

from .._imports import ManagedExports

_AUTODIFF  = (".._core", "numerical", "autodiff")
_DIFFUSION = (".._core", "diffusion")

_LAZY_EXPORTS = {
    # numerical:
    "RelaxUpdate": ".numerical",
    "StabilizeNvarsConvergenceCheck": ".numerical",
    "ComposedStabilizedConvergence": ".numerical",

    # reactor:
    "StateType": ".reactor",
    "toggle_reactor_warnings": ".reactor",
    "composition_to_dict": ".reactor",
    "composition_to_array": ".reactor",
    "solution_report": ".reactor",
    "copy_solution": ".reactor",
    "copy_quantity": ".reactor",
    "NormalFlowRate": ".reactor",
    "PlugFlowAxialSources": ".reactor",
    "PlugFlowChainCantera": ".reactor",
    "get_reactor_data": ".reactor",

    # energy:
    "CombustionPowerOp": ".energy",
    "CombustionFlowOp": ".energy",
    "CombustionAtmosphereCHON": ".energy",
    "CombustionPowerSupply": ".energy",
    "HeatedGasEnergySource": ".energy",
    "CombustionEnergySource": ".energy",

    # symbolic:
    "PiecewiseSymbolicFunction": ".symbolic",
    "Nasa7Thermo": ".symbolic",
    "symbolic_thermo_factory": ".symbolic",
    "symbolic_transport_factory": ".symbolic",

    # transport:
    "EffectiveThermalConductivity": ".transport",
    "SolutionDimless": ".transport",
    "SkinFrictionFactor": ".transport",
    "WallGradingCalculator": ".transport",
    "SutherlandFitting": ".transport",
    "WSGGRadlibBordbar2020": ".transport",

    # vision:
    "ImageCrop": ".vision",
    "CropGuidesDisplay": ".vision",
    "ChannelSelector": ".vision",
    "ContrastEnhancement": ".vision",
    "ThresholdImage": ".vision",
    "LabelizeRegions": ".vision",
    "HelpersFFT": ".vision",
    "AbstractSEMImageLoader": ".vision",
    "HyperSpySEMImageLoaderStub": ".vision",
    "CharacteristicLengthSEMImage": ".vision",
    "load_metadata": ".vision",
    "metadata_exifread": ".vision",
    "metadata_pil": ".vision",
    "hyperspy_rgb_to_numpy": ".vision",

    # XXX calphad has its own module instead of importing directly from
    # the _core as it extends base Rust elements.
    # calphad:

    "CalphadSubstance": ".calphad",
    "CalphadSystemComposition": ".calphad",
    "CalphadDatabaseLoader": ".calphad",
    "add_calphad_data_directory": ".calphad",
    "list_calphad_data_directories": ".calphad",
    "CalphadEquilibrium": ".calphad",
    "equilibrate_stoichiometric": ".calphad",
    "CalphadStoichiometricSystem": ".calphad",

    # _core.autodiff:

    # _core.diffusion:
    "ImmersedNodeDomain1D": _DIFFUSION,
    "CarbonitridingInput": _DIFFUSION,
    "CarbonitridingSolver": _DIFFUSION,
    "ElementResults": _DIFFUSION,
    "slycke": _DIFFUSION,
}

_mngr = ManagedExports(__package__, _LAZY_EXPORTS)

__all__ = _mngr.names

def __getattr__(name: str):
    return _mngr.getattr(name)

def __dir__():
    return _mngr.dir()
