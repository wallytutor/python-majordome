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
_PLACEHOLDER_RE = re.compile(r"\{([^{}]+)\}")


def _eval_placeholder(content: str, namespace: dict) -> str:
    """ Evaluate a placeholder expression with an optional format spec.

    Supports:
        {variable}          -> str(variable)
        {expr}              -> str(eval(expr))
        {expr:spec}         -> format(eval(expr), spec)
        {10*d:.1f}          -> format(eval('10*d'), '.1f')

    Falls back to the original ``{content}`` if evaluation fails.
    # TODO support formatted expressions in LaTeX math blocks.
    """
    expr, _, spec = content.partition(":")
    try:
        value = eval(expr.strip(), namespace)  # noqa: S307
        return format(value, spec) if spec else str(value)
    except Exception:
        return "{" + content + "}"


def _interpolate(text: str, namespace: dict) -> str:
    """Substitute every ``{expr}`` / ``{expr:spec}`` placeholder in *text*."""
    return _PLACEHOLDER_RE.sub(
        lambda m: _eval_placeholder(m.group(1), namespace), text
    )


def _render_cell(cell: str, namespace: dict) -> str:
    """Interpolate *cell*, leaving LaTeX math blocks ($…$ / $$…$$) intact."""
    parts: list[str] = []
    last = 0

    for match in _MATH_BLOCKS_RE.finditer(cell):
        parts.append(_interpolate(cell[last:match.start()], namespace))
        parts.append(match.group(0))   # math block kept verbatim
        last = match.end()

    parts.append(_interpolate(cell[last:], namespace))
    return "".join(parts)


def _md(_line: str, cell: str) -> None:
    if (shell := get_ipython()) is not None:
        display(Markdown(_render_cell(cell, shell.user_ns)))
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
