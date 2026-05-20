# -*- coding: utf-8 -*-
import importlib

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
}

__all__ = list(_LAZY_EXPORTS.keys())


def __getattr__(name: str):
    if name in _LAZY_EXPORTS:
        submodule_path = _LAZY_EXPORTS[name]
        submodule = importlib.import_module(submodule_path, __package__)
        exported_item = getattr(submodule, name)
        globals()[name] = exported_item
        return exported_item

    raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def __dir__():
    return list(globals().keys()) + __all__
