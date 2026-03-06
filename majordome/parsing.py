# -*- coding: utf-8 -*-
from typing import Any


class FuncArguments:
    """ Metaprogramming helper to manage function arguments.
    
    To-do: support automatic documentation generation and type checking.

    Parameters
    ----------
    greedy_args: bool = True
        If true, raises if too many positional arguments are given. Notice
        that keyword arguments are not counted towards this limit, and if
        using in multiple inheritance, arguments of parent classes are cannot
        have more positional arguments than the child class.
    pop_kw: bool = True
        If true, keyword arguments are removed from `kwargs` when used. This
        is useful to avoid passing unexpected keywords to parent classes.
    """
    __slots__ = ("greedy_args", "pop_kw", "config", "kwdata",
                 "got", "nargs", "args", "kwargs", "kwget")

    def __init__(self, greedy_args: bool = True, pop_kw: bool = True) -> None:
        self.greedy_args = greedy_args
        self.pop_kw = pop_kw

        self.config = {}
        self.kwdata = {}

        self.got    = 0
        self.nargs  = 0
        self.args   = []
        self.kwargs = {}

    def update(self, *args, **kwargs) -> None:
        """ Updates the arguments to manage at current call. """
        self.got    = 0
        self.nargs  = len(args)
        self.args   = args
        self.kwargs = kwargs

        self.kwget = self.kwargs.pop if self.pop_kw else self.kwargs.get

    def add(self, name: str, index: int | None = None, **kwargs) -> None:
        """ Adds a new argument to manage when configuring function. """
        if name in self.config:
            raise KeyError(f"Argument already configured: {name}.")

        if index is not None and index < 0:
            raise ValueError(f"Negative argument index: {name} ({index})")

        if (try_kw := "default" in kwargs):
            self.kwdata[name] = kwargs.get("default")
            try_kw = True

        if index is None and not try_kw:
            raise ValueError(f"Argument must be either positional or "
                             f"keyword, cannot be neither: {name}")

        self.config[name] = (index, try_kw)

    def _get_by_index(self, index: int) -> Any:
        """ Retrieves a mandatory positional argument by index. """
        try:
            value = self.args[index]
        except IndexError:
            raise IndexError(f"Cannot retrieve mandatory positional "
                             f"argument at position {index}")
        else:
            self.got += 1
            return value

    def _get_by_key(self, name: str) -> Any:
        """ Retrieves a keyword argument by name. """
        return self.kwget(name, self.kwdata.get(name))

    def _get_by_any(self, name: str, index: int) -> Any:
        """ Retrieves an argument by index or keyword. """
        if index < self.nargs and name in self.kwargs:
            raise ValueError(f"Cannot have both positional and keyword "
                                f"version of {name} ({index}) simultaneously")

        try:
            return self._get_by_index(index)
        except IndexError:
            return self._get_by_key(name)

    def get(self, name: str) -> Any:
        """ Retrieves the value of a configured argument. """
        if name not in self.config:
            raise KeyError(f"Argument not configured: {name}.")

        index, try_kw = self.config[name]

        # (1) -- mandatory positional
        if index is not None and not try_kw:
            return self._get_by_index(index)

        # (2) -- keyword-only argument
        if index is None and try_kw:
            return self._get_by_key(name)

        # (3) -- prefer `args` but accept kwargs:
        if index is not None and try_kw:
            return self._get_by_any(name, index)

        # (4) -- should not happen, misconfiguration
        raise RuntimeError(f"Entry for {name} is malformed, this should not "
                           f"happen! Please check creation of arguments.")

    def close(self):
        if self.greedy_args and self.got != self.nargs:
            raise ValueError(f"Too many positional arguments, got "
                             f"{self.nargs} but only {self.got} were used.")
