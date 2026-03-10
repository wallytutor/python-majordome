# -*- coding: utf-8 -*-
from dataclasses import dataclass
from docstring_parser import parse
import inspect
from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import Terminal256Formatter


@dataclass
class FunctionEntry:
    name: str
    annotation: str = "Any"
    default: str = ""

    def __init__(self, param: inspect.Parameter) -> None:
        self.name = param.name
        self.annotation = self._get_annotation(param)
        self.default = self._get_default(param)

    def __str__(self) -> str:
        annotated = f"{self.name} : {self.annotation}"

        if not self.default:
            return annotated

        return f"{annotated} = {self.default}"

    def _get_annotation(self, param: inspect.Parameter) -> str:
        if param.annotation is inspect.Parameter.empty:
            return "Any"
        elif isinstance(param.annotation, type):
            return param.annotation.__name__
        else:
            return str(param.annotation)

    def _get_default(self, param: inspect.Parameter) -> str:
        if param.default is inspect.Parameter.empty:
            return ""
        elif isinstance(param.default, str):
            return f"'{param.default}'"
        else:
            return f"{param.default}"


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