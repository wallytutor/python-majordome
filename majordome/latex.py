# -*- coding: utf-8 -*-
from collections import OrderedDict
from pathlib import Path
from string import Template
from typing import Any
import subprocess
import warnings
import yaml

from .common import DATA, first_in_path

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
    possible = [f"{name}.tex", DATA / "latex" / f"{name}.tex"]

    if not (path := first_in_path(possible)):
        raise FileNotFoundError(f"Template '{name}' not found in data/latex.")

    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    return Template(content)


def fill_tex_template(template: str | Template, **kw) -> str:
    """ Fill a LaTeX template with the given parameters. """
    if isinstance(template, str):
        template = load_tex_template(template)

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


def url_link(*, url: str, text: str | None = None) -> str:
    """ Generate a LaTeX hyperlink. """
    return f"\\href{{{url}}}{{{text or url}}}"


def split_line() -> str:
    """ Generate a horizontal line in LaTeX. """
    return f"% {70 * '-'}\n"


def section(title: str, separator: bool = True) -> str:
    """ Generate a LaTeX section command. """
    text = ""
    if separator:
        text += split_line()
    return text + f"\n\\section{{{title}}}\n"

##############################################################################
# LISTS
##############################################################################

def itemize(items: list[str], itemsep: str = "6pt") -> str:
    """ Generate LaTeX itemize environment from a list of items. """
    warnings.warn("LEGACY FUNCTION: replace in new code with Itemize class",
                  DeprecationWarning)

    contents = [
        f"\\begin{{itemize}}",
        f"  \\setlength{{\\itemsep}}{{{itemsep}}}",
        "\n".join(f"  \\item{{}}{item}" for item in items),
        f"\\end{{itemize}}"
    ]
    return "\n".join(contents) + "\n"


class Itemize:
    """ Context manager to create LaTeX itemize environments. """
    __slots__ = ("_itemsep", "_items", "_itemintro")

    def __init__(self, itemsep: str = "6pt") -> None:
        self._itemsep = itemsep
        self._items = []

    def __repr__(self) -> str:
        """ Provides the LaTeX code for the itemize environment. """
        contents = [
            f"\\begin{{itemize}}",
            f"  \\setlength{{\\itemsep}}{{{self._itemsep}}}",
            "\n".join(self._items),
            f"\\end{{itemize}}"
        ]

        if hasattr(self, "_itemintro"):
            contents.insert(0, self._itemintro)

        return "\n".join(contents)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if exc_type:
            print(f"Exception: {exc_type}, {exc_value}")
        return False

    def intro(self, text: str, space: str = "6pt") -> None:
        """ Add introductory text before the itemize environment. """
        self._itemintro = f"{text}\n\\par\\vspace{{{space}}}\\par\n"

    def add(self, item: str) -> None:
        """ Add an item to the itemize list. """
        self._items.append(f"  \\item{{}}{item}")

    def collect(self) -> str:
        """ Collect the LaTeX code for the itemize environment. """
        return repr(self)

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


class BeamerSlides:
    """ Class to manage multiple Beamer slides. """
    __slots__ = ("_config", "_verbose", "_slides", "_section")

    def __init__(self, *, config: dict[str, Any], verbose: bool = True) -> None:
        self._config = config
        self._verbose = verbose
        self._slides = OrderedDict()
        self._section = 1

    def add_section(self, title: str, separator: bool = True) -> None:
        """ Add a section slide with the given title. """
        content = section(title, separator=separator)
        key = f"section_{self._section}"

        if key not in self._slides:
            self._section += 1

        if self._verbose and key in self._slides:
            warnings.warn(f"Warning: Section with key '{key}' already "
                           "exists. Overwriting with new content.")

        self._slides[key] = content

    def add_slide(self, key, **kw) -> None:
        """ Add a Beamer slide with provided arguments. """
        # XXX: if contents is provided, it is a single column slide:
        f = beamer_slide if "contents" in kw else beamer_two_columns

        # Slide is added to the dictionary, warn if key exists:
        if self._verbose and key in self._slides:
            warnings.warn(f"Warning: Slide with key '{key}' already "
                           "exists. Overwriting with new content.")

        self._slides[key] = f(**kw)

    def _generate(self) -> str:
        """ Generate the complete LaTeX code for all Beamer slides. """
        return "\n".join(self._slides.values()) + "\n"

    def generate(self) -> str:
        """ Public method to generate LaTeX code for slides. """
        contents = self._generate()

        tmp = self._config.copy()
        template = load_tex_template(tmp.pop("template"))
        text = fill_tex_template(template, contents=contents, **tmp)

        return text

    def build(self, saveas: str | Path, bib: bool = False) -> None:
        """ Build the Beamer slides using pdflatex. """
        slides_tex = Path(saveas)
        slides_dir = slides_tex.parent

        if not slides_dir.exists():
            slides_dir.mkdir(parents=True, exist_ok=True)

        cmd = [
            "pdflatex",
            "--shell-escape",
            "-interaction=nonstopmode",
            slides_tex.stem
        ]

        with open(saveas, "w", encoding="utf-8") as fp:
            fp.write(self.generate())

        with open(slides_dir / f"log.{slides_tex.stem}", "w") as log:
            cnf = dict(cwd=slides_dir, stdout=log, stderr=log)

            subprocess.run(cmd, **cnf)
            subprocess.run(cmd, **cnf)

            if bib:
                subprocess.run(["bibtex", slides_tex.stem], **cnf)
                subprocess.run(cmd, **cnf)
                subprocess.run(cmd, **cnf)


class SlideContentWriter:
    """ Context manager to write Beamer LaTeX contents. """
    __slots__ = ("_lines",)

    def __init__(self) -> None:
        self._lines = []

    def __repr__(self) -> str:
        """ Provides the LaTeX code for the slide content. """
        return "\n".join(self._lines)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if exc_type:
            print(f"Exception: {exc_type}, {exc_value}")
        return False

    def vspace(self, space: str) -> None:
        """ Add vertical space in the slide content. """
        self._lines.append(f"\\par\\vspace{{{space}}}\\par\n")

    def add(self, line: str) -> None:
        """ Add a line to the slide content. """
        self._lines.append(line + "\n")

    def collect(self) -> str:
        """ Collect the LaTeX code for the slide content. """
        return repr(self)
