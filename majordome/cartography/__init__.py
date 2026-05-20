# -*- coding: utf-8 -*-
import importlib

_LAZY_EXPORTS = {
    "GpxManager": ".gpx",
    "Tiles": ".maps",
    "map_at_location": ".maps",
    "display_track": ".maps",
}

__all__ = list(_LAZY_EXPORTS.keys())


def __getattr__(name: str):
    if name in _LAZY_EXPORTS:
        # 1. Find which submodule contains the requested item
        submodule_path = _LAZY_EXPORTS[name]

        # 2. Import that submodule dynamically
        submodule = importlib.import_module(submodule_path, __package__)

        # 3. Grab the actual function/class from that imported submodule
        exported_item = getattr(submodule, name)

        # 4. Cache it in globals so Python doesn't hit __getattr__ again
        globals()[name] = exported_item

        return exported_item

    raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


def __dir__():
    return list(globals().keys()) + __all__
