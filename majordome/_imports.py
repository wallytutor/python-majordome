# -*- coding: utf-8 -*-

from importlib import import_module
from typing import Any


class _NoNameError(AttributeError):
    def __init__(self, name: str, package: str) -> None:
        super().__init__(f"module '{package}' has no attribute '{name}'")
        self.name = name


class ManagedExports:
    __slots__ = ("_package", "_globals", "_exports", "_all_names")

    def __init__(
            self,
            package: str,
            module_globals: dict[str, Any],
            exports: dict[str, Any]
        ) -> None:
        """ Standardizes lazy export management for a module. """
        self._package = package
        self._globals = module_globals
        self._exports = exports

        self._all_names = sorted(list(exports.keys()))
        self._globals["__all__"] = self._all_names

    def _resolve_export(self, spec, name):
        if isinstance(spec, str):
            submodule = import_module(spec, self._package)
            return getattr(submodule, name)

        mod = import_module(spec[0], self._package)

        for attr in spec[1:]:
            mod = getattr(mod, attr)

        return getattr(mod, name)

    def getattr(self, name: str) -> Any:
        """ Lazy imports items from a module. """
        if name in self._exports:
            item = self._resolve_export(self._exports[name], name)
            self._globals[name] = item
            return item

        raise _NoNameError(name, self._package)

    def dir(self) -> list[str]:
        """ Returns the list of all exported names. """
        return sorted(set(list(self._globals.keys()) + self._all_names))


def setup_lazy_exports(
        package: str,
        module_globals: dict[str, Any],
        exports: dict[str, Any]
    ) -> tuple[Any, Any]:
    """ Sets up PEP 562 lazy imports for a module. """
    mngr = ManagedExports(package, module_globals, exports)
    return mngr.getattr, mngr.dir


def setup_submodules_exports(
        package: str,
        module_globals: dict[str, Any],
        submodules: list[str],
        extra_exports: list[str] | None = None
    ) -> tuple[Any, Any]:
    """ Sets up PEP 562 lazy imports by aggregating submodules' exports. """
    exports = {}

    for submod_name in submodules:
        submod = import_module(submod_name, package)

        for export in getattr(submod, "__all__", []):
            exports[export] = submod_name

    getattr_func, dir_func = setup_lazy_exports(
        package, module_globals, exports
    )

    if extra_exports:
        all_names = sorted(set(extra_exports + list(exports.keys())))
        module_globals["__all__"] = all_names

    return getattr_func, dir_func
