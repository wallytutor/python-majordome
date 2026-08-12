# -*- coding: utf-8 -*-

from importlib import import_module

_AUTODIFF  = (".._core", "numerical", "autodiff")
_DIFFUSION = (".._core", "diffusion")
_CALPHAD   = (".._core", "caphad")

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

    # _core.autodiff:

    # _core.diffusion:
    "ImmersedNodeDomain1D": _DIFFUSION,
    "CarbonitridingInput": _DIFFUSION,
    "CarbonitridingSolver": _DIFFUSION,
    "ElementResults": _DIFFUSION,
    "slycke": _DIFFUSION,

    # _core.calphad:

}

__all__ = list(_LAZY_EXPORTS.keys())


def __getattr__(name: str):
    if name in _LAZY_EXPORTS:
        submodule_path = _LAZY_EXPORTS[name]

        if isinstance(submodule_path, str):
            exported_item = _import_submodule(submodule_path, name)
        else:
            exported_item = _import_pyo3(*submodule_path, name)

        globals()[name] = exported_item
        return exported_item

    raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def _import_submodule(path, name):
    submodule = import_module(path, __package__)
    return getattr(submodule, name)


def _import_pyo3(path, module, name):
    submodule = _import_submodule(path, module)
    # TODO handle the case of autodiff here
    return getattr(submodule, name)


def __dir__():
    return list(globals().keys()) + __all__
