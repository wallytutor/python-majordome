# # -*- coding: utf-8 -*-
# import importlib

# _LAZY_EXPORTS = {
# }

# __all__ = list(_LAZY_EXPORTS.keys())


# def __getattr__(name: str):
#     if name in _LAZY_EXPORTS:
#         submodule_path = _LAZY_EXPORTS[name]
#         submodule = importlib.import_module(submodule_path, __package__)
#         exported_item = getattr(submodule, name)
#         globals()[name] = exported_item
#         return exported_item

#     raise AttributeError(f"module '{__name__}' has no attribute '{name}'")


# def __dir__():
#     return list(globals().keys()) + __all__