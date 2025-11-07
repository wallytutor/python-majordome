# -*- coding: utf-8 -*-
from pathlib import Path
from string import Template

from .common import DATA

##############################################################################
# TEMPLATING
##############################################################################

def is_tex(path: Path) -> bool:
    """ Check if the given path points to a LaTeX (.tex) file. """
    return path.is_file() and path.suffix == ".tex"


def list_tex_templates() -> list[str]:
    """ List available LaTeX templates in the data directory. """
    return [f.name for f in (DATA / "latex").iterdir() if is_tex(f)]


def load_tex_template(name: str) -> Template:
    """ Load a LaTeX template from the data directory. """
    if not (path := DATA / "latex" / f"{name}.tex").exists():
        raise FileNotFoundError(f"Template '{name}' not found in data/latex.")

    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    return Template(content)


def fill_tex_template(template: Template, **kw) -> str:
    """ Fill a LaTeX template with the given parameters. """
    required = template.get_identifiers()
    ignoring = []

    if "graphicspath" in required and "graphicspath" not in kw:
        kw["graphicspath"] = ["."]

    if "userpreamble" in required and "userpreamble" not in kw:
        kw["userpreamble"] = ""

    for key, value in kw.items():
        if key not in required:
            print(f"Template does not require parameter '{key}'.")
            ignoring.append(key)
            continue

        if key == "graphicspath" and isinstance(value, list):
            kw[key] = graphics_path(value)

    for key in ignoring:
        kw.pop(key)

    return template.substitute(**kw)

##############################################################################
# HELPERS
##############################################################################

def itemize(items: list[str]) -> str:
    """ Generate LaTeX itemize environment from a list of items. """
    contents = [
        f"\\begin{{itemize}}",
        "\n".join(f"  \\item{{}}{item}" for item in items),
        f"\\end{{itemize}}"
    ]
    return "\n".join(contents) + "\n"


def graphics_path(items: list[str]) -> str:
    """ Generate LaTeX graphics path command from a list of directories. """
    return ",".join(f"{{{item}}}" for item in items)


def include_figure(path: str | Path, **kw):
    """ Generate LaTeX code to include a figure with given options. """
    options = []

    for key, value in kw.items():
        match key:
            case "width" | "height" | "scale":
                options.append(f"{key}={value}")
            case "trim":
                pass  # TODO: implement trim option
                # options.append(f"trim={value}")
            case "clip" if value is True:
                options.append("clip")
            case _:
                print(f"Unknown option '{key}' for include_figure.")

    options = ",".join(options)
    return f"\\includegraphics[{options}]{{{Path(path).as_posix()}}}"


def split_line() -> str:
    """ Generate a horizontal line in LaTeX. """
    return f"% {70 * '-'}\n"

##############################################################################
# BEAMER
##############################################################################

def two_columns(*, text_left: str = "", text_right: str = "",
                width_left: float = 0.5, width_max: float = 0.96) -> str:
    """ Create a 2-columns contents for a Beamer slide. """
    width_right = 1.0 - width_left
    w_left  = f"{width_max * width_left}\\linewidth"
    w_right = f"{width_max * width_right}\\linewidth"

    contents = [
        f"\\begin{{columns}}",
        f"  \\begin{{column}}{{{w_left}}}",
        f"  {text_left}",
        f"  \\end{{column}}",
        f"  \\begin{{column}}{{{w_right}}}",
        f"  {text_right}",
        f"  \\end{{column}}",
        f"\\end{{columns}}"
    ]
    return "\n".join(contents)


def beamer_slide(*, title: str = "", subtitle: str = "",
                 contents: str = "", align: str = "\\centering") -> str:
    """ Wraps contents in a beamer frame with provided arguments. """
    slide = [
        f"\\begin{{frame}}\n  {{{title}}}\n  {{{subtitle}}}",
        f"{align}",
        f"{contents}",
        f"\\end{{frame}}"
    ]
    return "\n".join(slide) + "\n"


def beamer_two_columns(*, title: str = "", subtitle: str = "",
                       text_left: str = "", text_right: str = "",
                       width_left: float = 0.5, width_max: float = 0.96,
                       align: str = "\\centering") -> str:
    """ Create a two-column Beamer slide. """
    contents = two_columns(text_left=text_left, text_right=text_right,
                           width_left=width_left, width_max=width_max)

    slide = beamer_slide(title=title, subtitle=subtitle,
                         contents=contents, align=align)

    return slide
