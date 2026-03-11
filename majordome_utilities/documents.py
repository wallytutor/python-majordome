# -*- coding: utf-8 -*-
from inspect import Parameter, Signature
from typing import Callable
from IPython.display import Markdown, display
from rich.console import Console
from rich.syntax import Syntax
from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import Terminal256Formatter
from docstring_parser.common import DocstringParam
import docstring_parser
import functools
import inspect
import textwrap
import warnings

# region: public
class SignatureEntry:
    """ Builds the representation of a function signature.

    Parameters
    ----------
    fn : object
        The function to build the signature for.
    greedy : bool
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

        if n_sig > 0 and inspect.isfunction(self.fn):
            maybe_self = next(iter(self.sig.parameters.keys()))
            if maybe_self in ("self", "cls"):
                n_sig -= 1

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

        return signature

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
        annotated = self._represent(p)
        entry = {"annotated": annotated, "description": ""}

        if p.name in ("self", "cls"):
            return

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
    def code_fences(code: str) -> str:
        """ Wraps a piece of code in markdown code fences.

        Parameters
        ----------
        code : str
            The code to wrap in markdown code fences.
        """
        return f"```python\n{code.rstrip()}\n```"

    @staticmethod
    def get_annotated(p: Parameter) -> str:
        """ Returns the annotated version of the parameter.

        Parameters
        ----------
        p : Parameter
            The parameter to annotate.
        """
        annotated = (f"{SignatureEntry.get_name(p)} : "
                     f"{SignatureEntry.get_annotation(p)}")
        return annotated

    @staticmethod
    def get_name(p: Parameter) -> str:
        """ Returns the name of the parameter.

        Notice that this handles the special cases of stars in variadic
        parameters (e.g. *args, **kwargs), which are not directly
        represented in the parameter name.

        Parameters
        ----------
        p : Parameter
            The parameter to get the name of.
        """
        if p.kind == Parameter.VAR_POSITIONAL:
            return f"*{p.name}"

        if p.kind == Parameter.VAR_KEYWORD:
            return f"**{p.name}"

        return p.name

    @staticmethod
    def get_annotation(p: Parameter) -> str:
        """ Returns the annotation of the parameter.

        Parameters
        ----------
        p : Parameter
            The parameter to retrieve the annotation from.
        """
        if p.annotation is Parameter.empty:
            return "Any"
        elif isinstance(p.annotation, type):
            return p.annotation.__name__
        else:
            return str(p.annotation)

    @staticmethod
    def get_default(p: Parameter) -> str:
        """ Returns the default value of the parameter.

        Parameters
        ----------
        p : Parameter
            The parameter to retrieve the default value from.
        """
        if p.default is Parameter.empty:
            return ""
        elif isinstance(p.default, str):
            return f"'{p.default}'"
        else:
            return f"{p.default}"

    def documentation(self, **kwargs) -> None:
        """ Generates the markdown documentation for the function.

        Parameters
        ----------
        add_section : bool
            Whether to add a section header for the function. By default,
            a section header is added if the function is a method (i.e.
            it is a class member) and not added otherwise.
        section_lv : int
            The level of the section header to add (e.g. 2 for '##', 3
            for '###', etc.). By default, the level is determined based
            on whether the function is a method or not (see `add_section`).
        title : str
            The title to use for the section header and callout. By
            default, the function name is used.
        """
        # some_class = inspect.isclass(self.fn)
        # section_lv = 2 if some_class else 3
        # add_section = kwargs.get("add_section", some_class)
        # section_lv = kwargs.get("section_lv", section_lv)
        title = kwargs.get("title", self.fn.__name__)

        text = ""

        # if add_section:
        #     level = "#" * section_lv
        #     text = f"{level} {title}\n\n"

        text += f"""::: {{.callout-note title="{title}"}}\n\n"""
        text += self.code_fences(self._sig_text) + "\n\n"

        if self.doc:
            if short := self.doc.short_description:
                text += f"{short}\n\n"
            else:
                text += "(missing summary)\n\n"

            if long := self.doc.long_description:
                text += f"{long}\n\n"

        if self._docs:
            text += "\n\n---\n\n"
            text += f"**Parameters**\n\n"

            for entry in self._docs:
                head = entry["annotated"]
                body = entry["description"]

                text += self.code_fences(head) + "\n\n"
                text += "<p>&nbsp;&nbsp;&nbsp;&nbsp;"
                text += body + "</p>\n\n"

        text += f":::\n\n"
        # print(text)

        display(Markdown(text))


class DocumentedClass:
    """ Helper for documenting all members of a class. """
    def __init__(self, cls: type) -> None:
        self.cls = cls

    @staticmethod
    def _doc_it(fn, **kwargs):
        entry = SignatureEntry(fn, **kwargs)
        entry.documentation(**kwargs)

    @staticmethod
    def _members_from_dict(
            objcls: type,
            predicate: Callable[[str, object], None],
            **kwargs
        ) -> None:
        public_only = kwargs.get("public_only", True)

        for name, func in objcls.__dict__.items():
            if public_only and DocumentedClass._is_private(name):
                continue

            predicate(name, func, **kwargs)

    @staticmethod
    def _is_private(name: str) -> bool:
        private = name.startswith("_")
        dunder = DocumentedClass._is_dunder(name)
        return private and not dunder

    @staticmethod
    def _is_dunder(name: str) -> bool:
        return name.startswith("__") and name.endswith("__")

    def _members(self, name, func, **kwargs) -> None:
        disallow = (staticmethod, classmethod, property)

        is_callable = callable(func)
        is_allowed  = not isinstance(func, disallow)
        is_dunder = DocumentedClass._is_dunder(name)

        if is_allowed and is_callable and not is_dunder:
            DocumentedClass._doc_it(func, **kwargs)

    def _properties(self, name, func, **kwargs) -> None:
        if isinstance(func, property):
            DocumentedClass._doc_it(func.fget, **kwargs)

    def _classmethods(self, name, func, **kwargs) -> None:
        if isinstance(func, classmethod):
            DocumentedClass._doc_it(func.__func__, **kwargs)

    def _staticmethods(self, name, func, **kwargs) -> None:
        if isinstance(func, staticmethod):
            DocumentedClass._doc_it(func.__func__, **kwargs)

    def constructor(self, **kwargs) -> None:
        entry = SignatureEntry(self.cls)
        entry.documentation(**kwargs)

    def members(self, **kwargs) -> None:
        self._members_from_dict(self.cls, self._members, **kwargs)

    def properties(self, **kwargs) -> None:
        self._members_from_dict(self.cls, self._properties, **kwargs)

    def classmethods(self, **kwargs) -> None:
        self._members_from_dict(self.cls, self._classmethods, **kwargs)

    def staticmethods(self, **kwargs) -> None:
        self._members_from_dict(self.cls, self._staticmethods, **kwargs)
# endregion: public

# region: internals
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
def print_signature(
        signature: str,
        width: int | None = None,
        parse_syntax: bool = False
    ) -> None:
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

    if parse_syntax:
        syntax = Syntax(signature, "python")
        console.print(syntax)
    else:
        console.print(signature)


def test_for_func(f, *, greedy=False):
    entry = SignatureEntry(f, greedy=greedy)
    entry.documentation()

    try:
        SignatureEntry(f, greedy=True)
    except ValueError:
        pass
# endregion: internals