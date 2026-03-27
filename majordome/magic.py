# -*- coding: utf-8 -*-
import os
import re

from IPython.core.getipython import get_ipython
from IPython.display import Markdown, display


_VERBOSITY = 0

_LOOKUP_STR2BOOL = {"true": True,   "1": True,  "yes": True,
                    "false": False, "0": False, "no": False}

_MATH_BLOCKS_RE = re.compile(r"(\$\$.*?\$\$|\$.*?\$)", flags=re.DOTALL)

#region: skipper
def _str_to_bool(s: str) -> bool:
    """ Convert allowed values to boolean. """
    if (key := s.strip().lower()) not in _LOOKUP_STR2BOOL:
        raise ValueError(f"Unknown boolean string '{key}'")
    return _LOOKUP_STR2BOOL[key]


def _get_environment_flag(flag: str, default: str = "true") -> bool:
    """ Manage retrieval of environment flag. """
    # XXX: default value true ensures cell is skipped.
    return _str_to_bool(os.environ.get(flag, default))


def _skipper_verbosity(line):
    global _VERBOSITY

    try:
        _VERBOSITY = int(line.strip())
    except ValueError:
        print(f"Invalid verbosity level: '{line}'")
        _VERBOSITY = 0

    if _VERBOSITY > 0:
        print(f"Setting skipper verbosity to {_VERBOSITY}")


def _skipper(flag: str, cell: str | None = None) -> None:
    """ Skip cell is environment variable is set to True. """
    if (value := _get_environment_flag(flag)):
        if _VERBOSITY > 0:
            print(f"Skipping cell: {flag}={value}")
        return

    if (shell := get_ipython()) is not None:
        shell.run_cell(cell)
    else:
        raise RuntimeError("Not running inside an IPython environment.")
#endregion: skipper

#region: md
class _SafeFormatDict(dict):
    """ Preserve unknown placeholders instead of failing formatting. """
    def __missing__(self, key: str) -> str:
        return "{" + key + "}"


def _escape_latex_braces(text: str) -> str:
    """ Escape braces inside LaTeX math blocks so str.format_map is safe. """
    def _escape(match: re.Match[str]) -> str:
        math_text = match.group(0)
        return math_text.replace("{", "{{").replace("}", "}}")

    return _MATH_BLOCKS_RE.sub(_escape, text)


def _md(_line: str, cell: str) -> None:
    if (shell := get_ipython()) is not None:
        namespace = _SafeFormatDict(shell.user_ns)
        escaped_cell = _escape_latex_braces(cell)
        rendered = escaped_cell.format_map(namespace)
        display(Markdown(rendered))
    else:
        raise RuntimeError("Not running inside an IPython environment.")
#endregion: md


def load_ipython_extension(shell) -> None:
    """ Handle to load extension to session. """
    conf = {
        "skipper_verbosity": {
            "func": _skipper_verbosity,
            "kind": "line"
        },
        "skipper": {
            "func": _skipper,
            "kind": "cell"
        },
        "md": {
            "func": _md,
            "kind": "cell"
        },
    }

    for name, conf in conf.items():
        shell.register_magic_function(
            conf["func"], conf["kind"], magic_name=name)

    shell.run_line_magic("skipper_verbosity", "0")
