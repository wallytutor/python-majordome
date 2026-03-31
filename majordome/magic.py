# -*- coding: utf-8 -*-
import os
import re
import warnings
import sympy as sp

from IPython.core.getipython import get_ipython
from IPython.display import Markdown, Math, display


class SkipperMagic:
    """ An extension for skipping the execution of code cells. """
    VERBOSITY = 0

    LOOKUP_STR2BOOL = {
        "true": True,   "1": True,  "yes": True,
        "false": False, "0": False, "no": False
    }

    @staticmethod
    def str_to_bool(s: str) -> bool:
        """ Convert allowed values to boolean. """
        if (key := s.strip().lower()) in SkipperMagic.LOOKUP_STR2BOOL:
            return SkipperMagic.LOOKUP_STR2BOOL[key]

        warnings.warn(f"Unknown boolean string '{key}'")
        return False

    @staticmethod
    def get_environment_flag(flag: str, default: str = "true") -> bool:
        """ Manage retrieval of environment flag. """
        # XXX: default value true ensures cell is skipped.
        return SkipperMagic.str_to_bool(os.environ.get(flag, default))

    @staticmethod
    def skipper_verbosity(line):
        try:
            SkipperMagic.VERBOSITY = int(line.strip())
        except ValueError:
            print(f"Invalid verbosity level: '{line}'")
            SkipperMagic.VERBOSITY = 0

        if SkipperMagic.VERBOSITY > 0:
            print(f"Setting skipper verbosity to {SkipperMagic.VERBOSITY}")

    @staticmethod
    def skipper(flag: str, cell: str | None = None) -> None:
        """ Skip cell is environment variable is set to True. """
        if (value := SkipperMagic.get_environment_flag(flag)):
            if SkipperMagic.VERBOSITY > 0:
                print(f"Skipping cell: {flag}={value}")
            return

        if (shell := get_ipython()) is None:
            raise RuntimeError("Not running inside an IPython environment.")

        shell.run_cell(cell)


class MdMagic:
    """ An extension for interpolating code in Markdown.

    Cell magic extension to interpolate Markdown and LaTeX. It must be
    used from code cells and the content is rendered as Markdown. As
    such, it is expected to be used only when required, as without some
    frontend tweaks you will have undesirable syntax highlighting in the
    cell, as it is not interpreted as text. Nonetheless, this proves very
    useful for complex reporting with dynamic values.

    - Variables are interpolated from the IPython user namespace using
      Python format placeholders, e.g. `{variable}`.

    - If a variable is not found or evaluation fails, the original
      placeholder is left unchanged in the output, e.g. `{variable}`.
      For details, check `eval_placeholder` method.

    - Curly braces inside LaTeX math blocks (`$...$` or `$$...$$`)
      are automatically escaped before interpolation so expressions
      such as `$x_{i}$` render correctly.

    - You can override the interpretation of curly braces inside LaTex
      math blocks by providing a format spec, e.g. `{variable:.2f}`.
    """
    MATH_BLOCKS_RE = re.compile(r"(\$\$.*?\$\$|\$.*?\$)", flags=re.DOTALL)

    PLACEHOLDER_RE = re.compile(r"\{([^{}]+)\}")

    @staticmethod
    def split_unescaped_colon(content: str) -> tuple[str, str | None]:
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

    @staticmethod
    def eval_placeholder(
            content: str,
            namespace: dict,
            require_spec: bool = False,
        ) -> str:
        """ Evaluate a placeholder expression with optional formatting.

        Supports the following forms:

        - `{variable}`  -> `str(variable)`
        - `{expr}`      -> `str(eval(expr))`
        - `{expr:spec}` -> `format(eval(expr), spec)`
        - `{10*d:.1f}`  -> `format(eval('10*d'), '.1f')`
        - `{sympy_expr}` -> ``$<latex>$`` when value is a ``sp.Basic`` instance

        Falls back to the original ``{content}`` if evaluation fails.
        """
        expr, spec = MdMagic.split_unescaped_colon(content)
        if require_spec and spec is None:
            return "{" + content + "}"

        try:
            value = eval(expr.strip(), namespace)  # noqa: S307
            if spec:
                return format(value, spec)
            if isinstance(value, sp.Basic):
                return f"${sp.latex(value)}$"
            return str(value)
        except Exception:
            return "{" + content + "}"

    @staticmethod
    def interpolate(text: str, namespace: dict,
                    require_spec: bool = False) -> str:
        """ Substitute ``{expr}`` / ``{expr:spec}`` placeholder in text. """
        return MdMagic.PLACEHOLDER_RE.sub(
            lambda m: MdMagic.eval_placeholder(m.group(1), namespace, require_spec), text
        )

    @staticmethod
    def assembly_math_block(math_block: str, namespace: dict) -> str:
        """ Interpolate math block content with format spec required. """
        delimiter = "$$" if math_block.startswith("$$") else "$"

        rendered_math = MdMagic.interpolate(
            math_block[len(delimiter):-len(delimiter)],
            namespace, require_spec=True)

        return f"{delimiter}{rendered_math}{delimiter}"

    @staticmethod
    def render_cell(cell: str, namespace: dict) -> str:
        """ Interpolate text and math blocks with distinct rules.

        - Outside math blocks: ``{expr}`` and ``{expr:spec}`` are supported.

        - Inside math blocks: only ``{expr:spec}`` is supported (as you
          cannot distinguish plain expressions from LaTeX). Plain ``{expr}``
          and escaped-colon forms (e.g. ``{d\\:f}``) are untouched.
        """
        parts: list[str] = []
        last = 0

        for match in MdMagic.MATH_BLOCKS_RE.finditer(cell):
            line = MdMagic.interpolate(cell[last:match.start()], namespace)
            parts.append(line)

            line = MdMagic.assembly_math_block(match.group(0), namespace)
            parts.append(line)
            last = match.end()

        line = MdMagic.interpolate(cell[last:], namespace)
        parts.append(line)

        return "".join(parts)

    @staticmethod
    def md(_line: str, cell: str) -> None:
        if (shell := get_ipython()) is None:
            raise RuntimeError("Not running inside an IPython environment.")

        content = _strip_leading_quarto_annotations(cell)
        rendered = MdMagic.render_cell(content, shell.user_ns)
        MdMagic.display_rendered(rendered)

    @staticmethod
    def display_rendered(rendered: str) -> None:
        """Display interpolated content with robust math rendering.

        Some frontends may escape markdown math delimiters in rich output.
        To make equations reliable, we render math blocks with ``Math`` and
        non-math regions with ``Markdown``.
        """
        last = 0

        for match in MdMagic.MATH_BLOCKS_RE.finditer(rendered):
            text = rendered[last:match.start()]
            if text.strip():
                display(Markdown(text))

            block = match.group(0)
            delimiter = "$$" if block.startswith("$$") else "$"
            math = block[len(delimiter):-len(delimiter)].strip()
            if math:
                display(Math(math))

            last = match.end()

        tail = rendered[last:]
        if tail.strip():
            display(Markdown(tail))


def _lift_supported_cell_magic_after_quarto_preamble(
        cell: str,
        supported_magics: set[str],
    ) -> str:
    """Move supported ``%%magic`` above leading Quarto ``#|`` lines."""
    lines = cell.splitlines()

    if not lines:
        return cell

    cursor = 0
    preamble: list[str] = []
    has_quarto_annotation = False

    while cursor < len(lines):
        stripped = lines[cursor].strip()

        if not stripped:
            preamble.append(lines[cursor])
            cursor += 1
            continue

        if stripped.startswith("#|"):
            has_quarto_annotation = True
            preamble.append(lines[cursor])
            cursor += 1
            continue

        break

    if not has_quarto_annotation or cursor >= len(lines):
        return cell

    match = re.match(r"^\s*%%([A-Za-z_][A-Za-z0-9_]*)\b", lines[cursor])
    if not match:
        return cell

    if match.group(1) not in supported_magics:
        return cell

    magic_line = lines[cursor]
    rewritten = [magic_line, *preamble, *lines[cursor + 1:]]
    transformed = "\n".join(rewritten)

    if cell.endswith("\n"):
        transformed += "\n"

    return transformed


def _strip_leading_quarto_annotations(cell: str) -> str:
    """Remove leading Quarto ``#|`` preamble lines from magic cell body."""
    lines = cell.splitlines()

    if not lines:
        return cell

    cursor = 0
    has_quarto_annotation = False

    while cursor < len(lines):
        stripped = lines[cursor].strip()

        if not stripped:
            cursor += 1
            continue

        if stripped.startswith("#|"):
            has_quarto_annotation = True
            cursor += 1
            continue

        break

    if not has_quarto_annotation:
        return cell

    transformed = "\n".join(lines[cursor:])

    if cell.endswith("\n") and transformed:
        transformed += "\n"

    return transformed


def _install_quarto_magic_preamble_transform(
        shell,
        supported_magics: set[str],
    ) -> None:
    """Install one-time transform hook for Quarto-first cell magics."""
    if hasattr(shell, "_majordome_transform_cell_original"):
        return

    shell._majordome_transform_cell_original = shell.transform_cell

    def transform_cell_with_quarto_support(cell: str) -> str:
        adapted = _lift_supported_cell_magic_after_quarto_preamble(
            cell,
            supported_magics,
        )

        return shell._majordome_transform_cell_original(adapted)

    shell.transform_cell = transform_cell_with_quarto_support


def load_ipython_extension(shell) -> None:
    """ Handle to load extension to session. """
    registry = {
        "skipper_verbosity": {
            "func": SkipperMagic.skipper_verbosity,
            "kind": "line"
        },
        "skipper": {
            "func": SkipperMagic.skipper,
            "kind": "cell"
        },
        "md": {
            "func": MdMagic.md,
            "kind": "cell"
        },
    }

    for name, entry in registry.items():
        shell.register_magic_function(
            entry["func"], entry["kind"], magic_name=name)

    supported_cell_magics = {
        name for name, entry in registry.items() if entry["kind"] == "cell"
    }

    _install_quarto_magic_preamble_transform(shell, supported_cell_magics)

    shell.run_line_magic("skipper_verbosity", "0")
