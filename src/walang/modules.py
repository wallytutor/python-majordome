# -*- coding: utf-8 -*-
from contextlib import contextmanager
from importlib import import_module
from pathlib import Path
from types import FunctionType
import inspect
import os

from .core import stockpile
from .logger import WALANG_LOGGER, runtime_arguments

WALANG_LOGGER.warning("walang.modules is *very* experimental!")


def _load_module(name: str):
    """ Try to import a module by its name. """
    try:
        return import_module(name)
    except ModuleNotFoundError:
        WALANG_LOGGER.warning(f"Module `{name}` not found.")
        return None


def _from_globals(name: str):
    """ Try to get a variable from the global scope. """
    globals_ = _get_globals_n_levels_up(4)
    return globals_[name] if name in globals_ else None


def _from_path(name: str, path: str):
    """ Try to get a variable from a module path. """
    if path is None:
        return None

    if (module := _load_module(f"{path}.{name}")) is None:
        return None

    try:
        return getattr(module, name)
    except AttributeError:
        WALANG_LOGGER.warning(f"Function `{name}` not found "
                              f"in `{path}.{name}`.")
        return None


def _from_module(name: str):
    """ Try to get a variable from a module with the same name. """
    if (module := _load_module(name)) is None:
        return None

    try:
        return getattr(module, name)
    except AttributeError:
        WALANG_LOGGER.warning(f"Function `{name}` not found "
                              f"in module `{name}`.")
        return None


def _homonym_function(name: str, path: str | None = None):
    """ Dynamically import a function by its name. """
    # Give preference to current scope, it overrides any module import:
    if (func := _from_globals(name)) is not None:
        return func

    # If a path is explicitly provided, import from that module:
    if (func := _from_path(name, path)) is not None:
        return func

    # Otherwise, try to import from the module named `name`:
    if (func := _from_module(name)) is not None:
        return func

    return None


def _get_globals_n_levels_up(level=3):
    frame = inspect.currentframe()
    for _ in range(level):
        frame = frame.f_back
    return frame.f_globals


@contextmanager
def _walab_module_directory(level=3):
    """ Runs code in the context of the caller's caller directory.

    Notice that the `level` argument indicates how many levels up
    the stack to go to find the caller's caller. The default value
    is 3, which gets the called of `walab_module`, which is usually
    what we want.
    """
    origin = Path.cwd()
    module = Path(inspect.stack()[level].filename).resolve().parent
    os.chdir(module)
    try:
        yield
    finally:
        os.chdir(origin)


def walab_module(class_name, requires: list[tuple[str, dict]], *,
                 module: str | None = None, call_logging: bool = False,
                 properties: dict = {}) -> type:
    """ Create an WaLab model by dynamically importing functions. """
    methods = {}

    with _walab_module_directory():
        for (name, f_namespace) in requires:
            if name in methods:
                raise KeyError(f"Duplicate function `{name}` found.")

            if (func := _homonym_function(name, path=module)) is None:
                raise ImportError(f"Required function `{name}` not found.")
            else:
                f_namespace = {**func.__globals__, **f_namespace}
                func = FunctionType(func.__code__, f_namespace)

                if call_logging:
                    func = runtime_arguments(func)

                methods[name] = func

    if (overlap := set(methods) & set(properties)):
        raise KeyError(f"Overlapping keys found in methods and "
                       f"properties: {overlap}.")

    return type(class_name, (object,), {**methods, **properties})


def walab_import(module, class_name: str) -> type:
    """ Import a class from a WaLab module. """
    try:
        return getattr(import_module(module), class_name)
    except Exception as e:
        WALANG_LOGGER.error(f"Failed to import {class_name} "
                            f"from {module}: {e}")
        raise


def walab_instance(module, class_name: str, *args, **kwargs) -> object:
    """ Import and instantiate a class from a WaLab module. """
    return walab_import(module, class_name)(*args, **kwargs)


def expose():
    """ Expose the module functions to the walang environment. """
    stockpile("wmodule",   walab_module)
    stockpile("wimport",   walab_import)
    stockpile("winstance", walab_instance)