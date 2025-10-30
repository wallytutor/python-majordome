# -*- coding: utf-8 -*-
from pathlib import Path
from string import Template

from .common import DATA


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


def graphics_path(items: list[str]) -> str:
    """ Generate LaTeX graphics path command from a list of directories. """
    return ",".join(f"{{{item}}}" for item in items)


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
