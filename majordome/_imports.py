# -*- coding: utf-8 -*-

from importlib import import_module
from typing import Any

class _NoNameError(AttributeError):
    def __init__(self, name: str):
        super().__init__(f"module '{__name__}' has no attribute '{name}'")
        self.name = name


class ManagedExports:
    def __init__(
            self,
            package: str,
            exports: dict[str, Any]
        ) -> None:
        self._globals = globals()
        self._package = package
        self._all_names = list(exports.keys())
        self._exports = exports

    def _import_submodule(self, path, name):
        submodule = import_module(path, self._package)
        return getattr(submodule, name)

    def _import_pyo3(self, path, module, name):
        submodule = self._import_submodule(path, module)
        # TODO handle the case of autodiff here; UPDATE: ignore the to-do,
        # and make autodiff importable from numerical root.
        return getattr(submodule, name)

    def getattr(self, name: str):
        """ Lazy imports items from a module. """
        if name in self._exports:
            submodule_path = self._exports[name]

            if isinstance(submodule_path, str):
                exported_item = self._import_submodule(submodule_path, name)
            else:
                exported_item = self._import_pyo3(*submodule_path, name)

            self._globals[name] = exported_item
            return exported_item

        print(f"{self._package=}, {name=}")
        raise _NoNameError(name)

    def dir(self):
        """ Returns the list of all exported names. """
        return list(globals().keys()) + self._all_names

    def names(self) -> list[str]:
        """ Returns the list of all exported names. """
        return list(self._all_names)
