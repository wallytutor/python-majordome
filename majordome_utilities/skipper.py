# -*- coding: utf-8 -*-
from IPython.core.getipython import get_ipython
from IPython.core.magic import register_line_magic
import os

VERBOSITY = 0

LOOKUP_STR2BOOL = {"true": True,   "1": True,  "yes": True,
                   "false": False, "0": False, "no": False}


def _str_to_bool(s: str) -> bool:
    """ Convert allowed values to boolean. """
    if (key := s.strip().lower()) not in LOOKUP_STR2BOOL:
        raise ValueError(f"Unknown boolean string '{key}'")
    return LOOKUP_STR2BOOL[key]


def _get_environment_flag(flag: str, default: str = "true") -> bool:
    """ Manage retrieval of environment flag. """
    # XXX: default value true ensures cell is skipped.
    return _str_to_bool(os.environ.get(flag, default))


def skipper(flag: str, cell: str | None = None) -> None:
    """ Skip cell is environment variable is set to True. """
    if (value := _get_environment_flag(flag)):
        if VERBOSITY > 0:
            print(f"Skipping cell: {flag}={value}")
        return

    if (ip := get_ipython()) is not None:
        ip.run_cell(cell)


def load_ipython_extension(shell) -> None:
    """ Handle to load extension to session. """
    @register_line_magic
    def skipper_verbosity(line):
        global VERBOSITY

        try:
            VERBOSITY = int(line.strip())
        except ValueError:
            print(f"Invalid verbosity level: '{line}'")
            VERBOSITY = 0

        if VERBOSITY > 0:
            print(f"Setting skipper verbosity to {VERBOSITY}")

    shell.run_line_magic("skipper_verbosity", "0")
    shell.register_magic_function(skipper, "cell")
