# -*- coding: utf-8 -*-
import os
import re

from IPython.core.getipython import get_ipython
from IPython.display import Markdown, display


_VERBOSITY = 0

_LOOKUP_STR2BOOL = {"true": True,   "1": True,  "yes": True,
                    "false": False, "0": False, "no": False}

_MATH_BLOCKS_RE = re.compile(r"(\$\$.*?\$\$|\$.*?\$)", flags=re.DOTALL)

_PLACEHOLDER_RE = re.compile(r"\{([^{}]+)\}")

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

    if (shell := get_ipython()) is None:
        raise RuntimeError("Not running inside an IPython environment.")

    shell.run_cell(cell)
#endregion: skipper

#region: md
def _split_unescaped_colon(content: str) -> tuple[str, str | None]:
    """ Split ``content`` at first unescaped ``:``.

    ``\\:`` is treated as a literal colon and does not split.
    """
    for index, char in enumerate(content):
        if char != ":":
            continue

        backslashes = 0
        cursor = index - 1

        while cursor >= 0 and content[cursor] == "\\":
            backslashes += 1
            cursor -= 1

        if backslashes % 2 == 0:
            return content[:index], content[index + 1 :]

    return content, None


def _eval_placeholder(
        content: str,
        namespace: dict,
        require_spec: bool = False,
    ) -> str:
    """ Evaluate a placeholder expression with an optional format spec.

    Supports:
        {variable}          -> str(variable)
        {expr}              -> str(eval(expr))
        {expr:spec}         -> format(eval(expr), spec)
        {10*d:.1f}          -> format(eval('10*d'), '.1f')

    Falls back to the original ``{content}`` if evaluation fails.
    """
    expr, spec = _split_unescaped_colon(content)
    if require_spec and spec is None:
        return "{" + content + "}"

    try:
        value = eval(expr.strip(), namespace)  # noqa: S307
        return format(value, spec) if spec else str(value)
    except Exception:
        return "{" + content + "}"


def _interpolate(text: str, namespace: dict, require_spec: bool = False) -> str:
    """ Substitute every ``{expr}`` / ``{expr:spec}`` placeholder in *text*. """
    return _PLACEHOLDER_RE.sub(
        lambda m: _eval_placeholder(m.group(1), namespace, require_spec), text
    )


def _assembly_math_block(math_block: str, namespace: dict) -> str:
    """ Interpolate math block content with format spec required. """
    delimiter = "$$" if math_block.startswith("$$") else "$"
    inner_math = math_block[len(delimiter) : -len(delimiter)]
    rendered_math = _interpolate(inner_math, namespace, require_spec=True)
    return f"{delimiter}{rendered_math}{delimiter}"


def _render_cell(cell: str, namespace: dict) -> str:
    """ Interpolate text and math blocks with distinct rules.

    - Outside math blocks: ``{expr}`` and ``{expr:spec}`` are supported.
    - Inside math blocks: only ``{expr:spec}`` is supported.
        Plain ``{expr}`` and escaped-colon forms (e.g. ``{d\\:f}``) are untouched.
    """
    parts: list[str] = []
    last = 0

    for match in _MATH_BLOCKS_RE.finditer(cell):
        parts.append(_interpolate(cell[last:match.start()], namespace))
        parts.append(_assembly_math_block(match.group(0), namespace))
        last = match.end()

    parts.append(_interpolate(cell[last:], namespace))
    return "".join(parts)


def _md(_line: str, cell: str) -> None:
    if (shell := get_ipython()) is None:
        raise RuntimeError("Not running inside an IPython environment.")

    display(Markdown(_render_cell(cell, shell.user_ns)))
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
