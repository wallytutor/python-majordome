# -*- coding: utf-8 -*-
from dataclasses import dataclass
from docstring_parser import parse
import inspect
from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import Terminal256Formatter


class FunctionEntry:
    def __init__(self, name, annotation, default):
        self.name = name
        self.annotation = annotation
        self.default = default


def handle_annotation(param):
    if param.annotation is inspect.Parameter.empty:
        annotation = "Any"
    elif isinstance(param.annotation, type):
        annotation = param.annotation.__name__
    else:
        annotation = str(param.annotation)

    return f"{param.name} : {annotation}"


def handle_entry(param):
    annotated = handle_annotation(param)

    if param.default is inspect.Parameter.empty:
        entry = annotated
    elif isinstance(param.default, str):
        entry = f"{annotated} = '{param.default}'"
    else:
        entry = f"{annotated} = {param.default}"

    return entry


def is_method(f, n):
    return n[:1].isalpha() and callable(getattr(f, n))


def is_property(f, n):
    return n[:1].isalpha() and isinstance(getattr(f, n), property)


def get_methods(f):
    return sorted([n for n in f.__dict__.keys() if is_method(f, n)])


def get_properties(f):
    return sorted([n for n in f.__dict__.keys() if is_property(f, n)])


# Check using inspect directly!
# inspect.getmembers(plotting.MajordomePlot)
# get_properties(plotting.MajordomePlot)
# get_methods(plotting.MajordomePlot)





# import black
# from rich.console import Console
# from rich.syntax import Syntax

# f = plotting.MajordomePlot

# parsed = parse(f.__doc__)
# sig = f"{f.__name__}{inspect.signature(f)}"

# sig = black.format_str(
#     f"def {sig}: pass",
#     mode=black.Mode(line_length=80)
# )

# print(parsed.short_description)

# colored = highlight(sig, PythonLexer(), Terminal256Formatter())
# print(colored)

# for param in parsed.params:
#     print(f"{param.arg_name} : {param.type_name}")

# print("Params:", parsed.params)

# console = Console()
# f = plotting.MajordomePlot
# console.print(Syntax(plotting.MajordomePlot.__doc__, "python"))
# console.print(Syntax(plotting.MajordomePlot.__doc__, "markdown"))
# display(highlight(f.__doc__, HtmlLexer(), Terminal256Formatter()))

# doc = parse(f.__doc__)
# console = Console()
# console.print(doc)