# -*- coding: utf-8 -*-
from inspect import Parameter, Signature
from pydoc import text
from rich.console import Console
from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import Terminal256Formatter
import docstring_parser
import inspect


class FunctionEntry:
    """ Builds the representation of a function parameter.

    Parameters
    ----------
    param : inspect.Parameter
        The parameter to build the entry for.
    """
    def __init__(self, param: Parameter) -> None:
        self.param = param

    def __str__(self) -> str:
        annotated = self.get_annotated(self.param)

        if not (default := self.get_default(self.param)):
            return annotated

        return f"{annotated} = {default}"

    @staticmethod
    def get_annotated(p: Parameter) -> str:
        annotated = (f"{FunctionEntry.get_name(p)} :"
                     f"{FunctionEntry.get_annotation(p)}")
        return annotated

    @staticmethod
    def get_name(p: Parameter) -> str:
        if p.kind == Parameter.VAR_POSITIONAL:
            return f"*{p.name}"

        if p.kind == Parameter.VAR_KEYWORD:
            return f"**{p.name}"

        return p.name

    @staticmethod
    def get_annotation(param: Parameter) -> str:
        if param.annotation is Parameter.empty:
            return "Any"
        elif isinstance(param.annotation, type):
            return param.annotation.__name__
        else:
            return str(param.annotation)

    @staticmethod
    def get_default(param: Parameter) -> str:
        if param.default is Parameter.empty:
            return ""
        elif isinstance(param.default, str):
            return f"'{param.default}'"
        else:
            return f"{param.default}"


class SignatureEntry:
    """ Builds the representation of a function signature.

    Parameters
    ----------
    fn : object
        The function to build the signature for.
    greedy : bool, optional
        Whether to raise errors for missing docstrings or parameters.
    """
    def __init__(self, fn: type, *, greedy: bool = True) -> None:
        self.fn = fn
        self.doc = docstring_parser.parse(self.fn.__doc__ or "")
        self.sig = inspect.signature(fn)

        self.greedy = greedy
        self.lexer = PythonLexer()
        self.termf = Terminal256Formatter()

        self._vals = []
        self._docs = []

        self._sig_text = ""
        self._doc_text = ""

        self._seek_slashed = False
        self._seek_starred = False

        self._checks()
        self._scan()

    def __str__(self) -> str:
        return self._sig_text

    def _checks(self):
        if not self.greedy:
            return

        n_doc = len(self.doc.params)
        n_sig = len(self.sig.parameters.items())

        if not self.doc or not self.doc.short_description:
            raise ValueError(
                f"Function '{self.fn.__name__}' has no docstring, but "
                f"greedy mode is enabled!"
            )

        # XXX: there is a special case where the signature contains only
        # starred parameters. The variadic parameters are expected to be
        # documented in the docstring (count 1) and at least one individual
        # keyword-only parameter is expected to be documented (count 2).
        # In this situation, no error is raised here but may be later when
        # scanning the signature.
        if n_doc < n_sig:
            raise ValueError(
                f"Function '{self.fn.__name__}' has {n_doc} documented "
                f"parameters, but {n_sig} parameters!"
            )

    def _scan(self):
        docs = {p.arg_name: p for p in self.doc.params}
        needs_docs = self._docs_needed()

        for pname, p in self.sig.parameters.items():
            self._handle_entry(p)

            if self.greedy and pname in needs_docs:
                try:
                    self._docs.append(self._get_doc(p, docs))
                except KeyError:
                    raise ValueError(
                        f"Parameter '{pname}' not found in docstring "
                        f"for function '{self.fn.__name__}'!"
                    )

        # TODO handle the remaining **kwargs doc here and raise
        # if missing and greedy is enabled

        self._sig_text = self._handle_signature()
        self._doc_text = self.doc.short_description
        # TODO continue formatting docs with self._docs here.

    def _docs_needed(self) -> list[str]:
        # starred = [Parameter.VAR_POSITIONAL, Parameter.VAR_KEYWORD]
        starred = [Parameter.VAR_KEYWORD]
        allpars = self.sig.parameters.values()

        needs_docs = filter(lambda p: p.kind not in starred, allpars)
        needs_docs = [p.name for p in needs_docs]

        return needs_docs

    def _handle_entry(self, p: Parameter) -> None:
        # if p.kind == Parameter.VAR_POSITIONAL:
        #     self._vals.append(f"    *{p.name}")

        # elif p.kind == Parameter.VAR_KEYWORD:
        #     self._vals.append(f"    **{p.name}")

        # else:
        self._handle_positional_only(p)
        self._handle_keyword_only(p)

        entry = FunctionEntry(p)
        output = highlight(str(entry), self.lexer, self.termf)
        self._vals.append(f"    {output.strip()}")


    def _handle_positional_only(self, p: Parameter) -> None:
        if p.kind == Parameter.POSITIONAL_ONLY:
            self._seek_slashed = True
        elif self._seek_slashed and p.kind != Parameter.POSITIONAL_ONLY:
            self._vals.append(f"    /")
            self._seek_slashed = False

    def _handle_keyword_only(self, p: Parameter) -> None:
        if not self._seek_starred and p.kind == Parameter.KEYWORD_ONLY:
            self._vals.append(f"    *")
            self._seek_starred = True

    def _handle_signature(self) -> str:
        name = self.fn.__name__
        returns = self.sig.return_annotation

        if not self._vals:
            signature = f"{name}()"
        elif len(self._vals) == 1:
            signature = f"{name}({self._vals[0].strip()}):"
        else:
            signature = f"{name}(\n{',\n'.join(self._vals)}\n    )"

        if returns is Signature.empty:
            signature = f"{signature}:"
        elif isinstance(returns, type):
            signature = f"{signature} -> {returns.__name__}:"
        else:
            signature = f"{signature} -> {str(returns)}:"

        return signature

    def _get_doc(self, p: Parameter, docs: dict) -> dict:
        annotated = (f"{FunctionEntry.get_name(p)} :"
                     f"{FunctionEntry.get_annotation(p)}")
        entry = {"annotated": annotated, "description": ""}

        try:
            doc = docs.pop(p.name)
            descr = " ".join(doc.description.split("\n"))
            entry["description"] = descr
            return entry
        except KeyError:
            return entry



def print_signature(signature: str, width: int | None = None):
    """ Print a function signature with syntax highlighting.

    This function is required as the default printing will strip colors
    and without configuration, rich.print will wrap long lines (from the
    standpoint of ANSI color codes) which can lead to broken formatting.
    If soft_wrap fails for some reason, try setting width to a large
    number (e.g. 200, accounting for ANSI color codes).
    """
    console = Console(width=width, soft_wrap=True)
    console.print(signature)


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


# console = Console()
# f = plotting.MajordomePlot
# console.print(Syntax(plotting.MajordomePlot.__doc__, "python"))
# console.print(Syntax(plotting.MajordomePlot.__doc__, "markdown"))
# display(highlight(f.__doc__, HtmlLexer(), Terminal256Formatter()))

# doc = parse(f.__doc__)
# console = Console()
# console.print(doc)