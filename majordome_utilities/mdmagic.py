# -*- coding: utf-8 -*-
import re
from IPython.display import Markdown, display

_MATH_BLOCKS_RE = re.compile(r"(\$\$.*?\$\$|\$.*?\$)", flags=re.DOTALL)


class _SafeFormatDict(dict):
    """Preserve unknown placeholders instead of failing formatting."""

    def __missing__(self, key: str) -> str:
        return "{" + key + "}"


def _escape_latex_braces(text: str) -> str:
    """Escape braces inside LaTeX math blocks so str.format_map is safe."""

    def _escape(match: re.Match[str]) -> str:
        math_text = match.group(0)
        return math_text.replace("{", "{{").replace("}", "}}")

    return _MATH_BLOCKS_RE.sub(_escape, text)


def load_ipython_extension(ipython) -> None:
    """ Register the %%md cell magic. """

    def _md(_line: str, cell: str) -> None:
        namespace = _SafeFormatDict(ipython.user_ns)
        escaped_cell = _escape_latex_braces(cell)
        rendered = escaped_cell.format_map(namespace)
        display(Markdown(rendered))

    ipython.register_magic_function(_md, magic_kind="cell", magic_name="md")
