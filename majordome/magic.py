# -*- coding: utf-8 -*-
import os
import re
import warnings

from IPython.core.getipython import get_ipython
from IPython.display import Markdown, display


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

        Falls back to the original ``{content}`` if evaluation fails.
        """
        expr, spec = MdMagic.split_unescaped_colon(content)
        if require_spec and spec is None:
            return "{" + content + "}"

        try:
            value = eval(expr.strip(), namespace)  # noqa: S307
            return format(value, spec) if spec else str(value)
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

        display(Markdown(MdMagic.render_cell(cell, shell.user_ns)))


def load_ipython_extension(shell) -> None:
    """ Handle to load extension to session. """
    conf = {
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

    for name, conf in conf.items():
        shell.register_magic_function(
            conf["func"], conf["kind"], magic_name=name)

    shell.run_line_magic("skipper_verbosity", "0")
