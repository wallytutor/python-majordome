# -*- coding: utf-8 -*-

from importlib import import_module as _import_module

from ._core import __version__, constants


_LAZY_EXPORTS = {}


def __load_submodule(name):
    global _LAZY_EXPORTS
    submodule = _import_module(name, __package__)
    lazy_exports = getattr(submodule, "_LAZY_EXPORTS")
    _LAZY_EXPORTS.update({k: name for k in lazy_exports.keys()})


# __load_submodule(".autodiff")
# __load_submodule(".calphad")
# __load_submodule(".diffusion")
__load_submodule(".engineering")
__load_submodule(".simulation")
__load_submodule(".utilities")

__all__ = ["__version__", "constants"] + list(_LAZY_EXPORTS.keys())


def __getattr__(name: str):
    global __all__

    if name in _LAZY_EXPORTS:
        submodule_path = _LAZY_EXPORTS[name]
        submodule = _import_module(submodule_path, __package__)
        globals()[name] = exported_item = getattr(submodule, name)
        return exported_item

    raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def __dir__():
    names = list(set(list(globals().keys()) + __all__))
    names = [n for n in names if not n.startswith("_")]
    return sorted(names + ["__version__"])
