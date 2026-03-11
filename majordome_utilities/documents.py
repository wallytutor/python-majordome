# -*- coding: utf-8 -*-
from inspect import Parameter, Signature
from rich.console import Console
from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import Terminal256Formatter
from docstring_parser.common import DocstringParam
import docstring_parser
import functools
import inspect
import textwrap
import warnings


class SignatureEntry:
    """ Builds the representation of a function signature.

    Parameters
    ----------
    fn : object
        The function to build the signature for.
    greedy : bool
        Whether to raise errors for missing docstrings or parameters.
    style : str
        The Pygments style to use for syntax highlighting.
    """
    def __init__(self, fn: type, *, greedy: bool = True,
                 style: str = "vs") -> None:
        self.fn = fn
        self.doc = docstring_parser.parse(self.fn.__doc__ or "")
        self.sig = inspect.signature(fn)

        self.greedy = greedy
        self.lexer = PythonLexer()
        self.termf = Terminal256Formatter(style=style)

        self._vals = []
        self._docs = []

        self._sig_text = ""
        self._doc_text = ""

        self._seek_slashed = False
        self._seek_starred = False

        self._buffer = {}

        self._checks()
        self._scan()

    def __str__(self) -> str:
        return self._sig_text + "\n\n" + self._doc_text

    def _checks(self):
        n_doc = len(self.doc.params)
        n_sig = len(self.sig.parameters.items())

        if not self.doc:
            self._handle_greedy(
                f"Function '{self.fn.__name__}' has no docstring!")

        if self.doc and not self.doc.short_description:
            self._handle_greedy(
                f"Function '{self.fn.__name__}' has no summary!")

        # XXX: there is a special case where the signature contains only
        # starred parameters. The variadic parameters are expected to be
        # documented in the docstring (count 1) and at least one individual
        # keyword-only parameter is expected to be documented (count 2).
        # In this situation, no error is raised here but may be later when
        # scanning the signature.
        if n_doc < n_sig:
            self._handle_greedy(
                f"Function '{self.fn.__name__}' has {n_doc} "
                f"documented parameters, but {n_sig} parameters!")

    def _scan(self):
        # Build a buffer of the docstring parameters for retrieval
        # during signature scanning. Values are popped from the buffer.
        self._buffer = {p.arg_name: p for p in self.doc.params}

        # Iterate through the signature parameters and build the
        # signature text for each parameter not hidden in **kwargs.
        for p in self.sig.parameters.values():
            self._handle_entry(p)

        # Handle the remaining **kwargs doc here. This assumes that
        # the author maybe documented some of the variadic parameters
        # in the docstring (and maybe not all of them).
        for pdoc in self._buffer.copy().values():
            self._add_kward_doc(pdoc)

        # If there are any remaining parameters, they were not
        # documented (we should never end here as per above!)
        if self._buffer:
            names = list(self._buffer.keys())
            self._handle_greedy(
                f"Function '{self.fn.__name__}' has {len(names)} "
                f"undocumented parameters: {', '.join(names)}!")

        self._sig_text = self._handle_signature()
        self._doc_text = self._handle_docstring()

    def _handle_greedy(self, msg: str) -> None:
        if not self.greedy:
            warnings.warn(msg)
        else:
            raise ValueError(f"{msg} (greedy mode enabled)")

    def _handle_entry(self, p: Parameter) -> None:
        self._handle_positional_only(p)
        self._handle_keyword_only(p)
        self._vals.append(f"    {self._represent(p)}")

        if p.kind != Parameter.VAR_KEYWORD:
            self._add_param_doc(p)

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

        return self._highlight(signature)

    def _handle_docstring(self) -> str:
        width = 66
        spaces = " " * 4
        docs = "\n(missing summary)"

        if self.doc and self.doc.short_description:
            docs = f"\n{self.doc.short_description}"

        # TODO handle long description!

        if self._docs:
            docs += "\n\n\nParameters\n----------"

            for entry in self._docs:
                head = entry["annotated"]
                body = entry["description"]

                body = textwrap.fill(
                    text             = body,
                    width            = width,
                    initial_indent   = spaces,
                    subsequent_indent= spaces
                )
                docs += f"\n{head}\n{body}"

        return docs

    def _add_param_doc(self, p: Parameter) -> None:
        annotated = self._highlight(self._represent(p))
        entry = {"annotated": annotated, "description": ""}

        if p.name not in self._buffer:
            self._handle_greedy(
                f"Parameter '{p.name}' not found in docstring for "
                f"function '{self.fn.__name__}'!")

        try:
            if (doc := self._buffer.pop(p.name)).description:
                descr = " ".join(doc.description.split("\n"))
                entry["description"] = descr
        except KeyError:
            entry["description"] = "(missing description)"

        self._docs.append(entry)

    def _add_kward_doc(self, pdoc: DocstringParam) -> None:
        annotation = pdoc.type_name
        default = None

        if annotation and "=" in annotation:
            try:
                annotation, default = annotation.split("=")
                default = default.strip()
            except ValueError:
                pass

        # TODO: notice that no matter what the type of the annotation,
        # it is always treated as a string. Find a way around sometime...
        p = Parameter(pdoc.arg_name, Parameter.KEYWORD_ONLY,
                      annotation=annotation, default=default)

        self._add_param_doc(p)

    def _highlight(self, text: str) -> str:
        return highlight(text, self.lexer, self.termf)

    def _represent(self, p: Parameter) -> str:
        annotated = self.get_annotated(p)

        if not (default := self.get_default(p)):
            entry = annotated
        else:
            entry = f"{annotated} = {default}"

        return entry.strip()

    @staticmethod
    def get_annotated(p: Parameter) -> str:
        annotated = (f"{SignatureEntry.get_name(p)} : "
                     f"{SignatureEntry.get_annotation(p)}")
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


def with_attrs(**attrs):
    def wrap(fn):
        for k, v in attrs.items():
            setattr(fn, k, v)

        @functools.wraps(fn)
        def inner(*args, **kwargs):
            return fn(*args, **kwargs)

        return inner
    return wrap


@with_attrs(console=True)
def print_signature(signature: str, width: int | None = None):
    """ Print a function signature with syntax highlighting.

    This function is required as the default printing will strip colors
    and without configuration, rich.print will wrap long lines (from the
    standpoint of ANSI color codes) which can lead to broken formatting.
    If soft_wrap fails for some reason, try setting width to a large
    number (e.g. 200, accounting for ANSI color codes).
    """
    if not getattr(print_signature, "console", True):
        print(signature)
        return

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


def test_for_func(f, *, greedy=False):
    entry = SignatureEntry(f, greedy=greedy)
    print_signature(str(entry))

    try:
        SignatureEntry(f, greedy=True)
    except ValueError:
        pass

# Check using inspect directly!
# inspect.getmembers(plotting.MajordomePlot)
# get_properties(plotting.MajordomePlot)
# get_methods(plotting.MajordomePlot)


# console = Console()
# console.print(Syntax(plotting.MajordomePlot.__doc__, "python"))
# console.print(Syntax(plotting.MajordomePlot.__doc__, "markdown"))
# display(highlight(f.__doc__, HtmlLexer(), Terminal256Formatter()))

# doc = parse(f.__doc__)
# console = Console()
# console.print(doc)