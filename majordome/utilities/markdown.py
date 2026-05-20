# -*- coding: utf-8 -*-
import re
from copy import deepcopy
from markdown_it.token import Token

from .internals import majordome_warning


class LatexDelimiterNormalizer:
    """ Normalize damaged LaTeX delimiters in Markdown text.

    This class was designed to handle cases where LaTeX delimiters
    in Markdown text are damaged (originally to fix OCR-converted
    PDF text), such as when a single backslash is used instead of
    a double backslash, or when delimiters are split across lines.
    It provides methods to normalize these delimiters to ensure
    that LaTeX expressions are correctly identified and rendered
    in Markdown. The normalization process includes handling inline
    math, single-line blocks, and standalone blocks, while keeping
    fenced code blocks untouched.
    """

    MATH_HINT_RE = re.compile(
        r"""
        \\[A-Za-z]+       # any LaTeX command, e.g. \alpha
        | [_^]            # subscript/superscript markers
        | [=<>]           # common math operators
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    SINGLE_LINE_BLOCK_RE = re.compile(
        r"""
        ^[ \t]*
        (\\*\[)          # opener: [, \[, \\[ , ...
        \s*
        (.+?)            # candidate expression
        \s*
        (\\*\])          # closer: ], \], \\], ...
        [ \t]*$
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    INLINE_BLOCK_RE = re.compile(
        r"""
        (\\*\[)          # opener: [, \[, \\[ , ...
        \s*
        (.+?)            # candidate expression
        \s*
        (\\*\])          # closer: ], \], \\], ...
        """,
        flags=re.VERBOSE,
    )

    CODE_FENCE_RE = re.compile(
        r"""
        (
            ^```[^\n]*\n    # opening fence + optional info string
            [\s\S]*?        # fenced body
            ^```[ \t]*$     # closing fence
        )
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    BLOCK_MATH_RE = re.compile(
        r"""
        (
            ^\$\$[ \t]*$     # opening $$
            [\s\S]*?         # block body
            ^\$\$[ \t]*$     # closing $$
        )
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    OPEN_DELIM_RE = re.compile(r"\\*\[")

    CLOSE_DELIM_RE = re.compile(r"\\*\]")

    @classmethod
    def _is_probably_math(cls, expr: str) -> bool:
        return bool(cls.MATH_HINT_RE.search(expr.strip()))

    @classmethod
    def _is_maybe_link(cls, opener_start: int, opener_escaped: bool,
                       text: str) -> bool:
        # Ignore Markdown links/images: [...](...) and ![...](...).
        return (not opener_escaped
                and opener_start > 0
                and text[opener_start - 1] == "]")

    @classmethod
    def _count_preceding_backslashes(cls, text: str, idx: int) -> int:
        count = 0
        j = idx - 1

        while j >= 0 and text[j] == "\\":
            count += 1
            j -= 1

        return count

    @classmethod
    def _find_inline_closer(cls, text: str, start: int) -> int | None:
        depth = 0

        for k in range(start, len(text)):
            char = text[k]

            if char == "(":
                depth += 1
                continue

            if char == ")":
                if depth > 0:
                    depth -= 1
                    continue

                return k

        return None

    @classmethod
    def _is_open_delim(cls, text: str) -> bool:
        return bool(cls.OPEN_DELIM_RE.fullmatch(text))

    @classmethod
    def _is_close_delim(cls, text: str) -> bool:
        return bool(cls.CLOSE_DELIM_RE.fullmatch(text))

    @classmethod
    def _normalize_standalone_blocks(cls, text: str) -> str:
        def handle_block(block: list[str], out: list[str]) -> None:
            expr = "\n".join(block).strip()
            expr = cls._normalize_double_escapes(expr)
            out.append("$$")

            if expr:
                out.append(expr)

            out.append("$$")

        out: list[str] = []
        block: list[str] = []
        in_block = False

        for line in text.splitlines():
            stripped = line.strip()

            if not in_block and cls._is_open_delim(stripped):
                in_block = True
                block = []
                continue

            if in_block and cls._is_close_delim(stripped):
                handle_block(block, out)
                in_block = False
                block = []
                continue

            if in_block:
                block.append(line)
            else:
                out.append(line)

        if in_block:
            handle_block(block, out)

        return "\n".join(out)

    @classmethod
    def _normalize_single_line_blocks(cls, text: str) -> str:
        def repl_full_line(match: re.Match[str]) -> str:
            expr = match.group(2).strip()

            if cls._is_probably_math(expr):
                expr = cls._normalize_double_escapes(expr)
                return f"$$\n{expr}\n$$"

            return match.group(0)

        def repl_inline(match: re.Match[str]) -> str:
            opener = match.group(1)
            expr = match.group(2).strip()
            closer = match.group(3)

            # Ignore plain bracket groups unless at least one delimiter side
            # uses LaTeX escaping (e.g. \[ ... ] or [ ... \]).
            if "\\" not in opener and "\\" not in closer:
                return match.group(0)

            if cls._is_probably_math(expr):
                expr = cls._normalize_double_escapes(expr)
                return f"$$ {expr} $$"

            return match.group(0)

        text = cls.SINGLE_LINE_BLOCK_RE.sub(repl_full_line, text)
        return cls.INLINE_BLOCK_RE.sub(repl_inline, text)

    @classmethod
    def _normalize_double_escapes(cls, expr: str) -> str:
        """ Collapse doubled backslashes from before LaTeX tokens. """
        return re.sub(r"\\\\(?=[A-Za-z()[\]{}])", r"\\", expr)

    @classmethod
    def _normalize_inline_math(cls, text: str) -> str:
        out: list[str] = []
        cursor = 0
        idx = 0
        n = len(text)

        while idx < n:
            if text[idx] != "(":
                idx += 1
                continue

            opener_bs = cls._count_preceding_backslashes(text, idx)
            opener_escaped = opener_bs > 0
            opener_start = idx - opener_bs

            if cls._is_maybe_link(opener_start, opener_escaped, text):
                idx += 1
                continue

            closer_idx = cls._find_inline_closer(text, idx + 1)

            if closer_idx is None:
                idx += 1
                continue

            closer_bs = cls._count_preceding_backslashes(text, closer_idx)
            closer_escaped = closer_bs > 0

            expr_end = closer_idx - closer_bs if closer_escaped else closer_idx
            expr = text[idx + 1:expr_end].strip()

            if "$" in expr:
                idx = closer_idx + 1
                continue

            has_math_delim = opener_escaped or closer_escaped

            # If plain parentheses already contain escaped inline delimiters,
            # keep outer parentheses outside math and let nested matches handle.
            if (not has_math_delim
                    and ("\\(" in expr or "\\)" in expr)):
                idx += 1
                continue

            if has_math_delim or cls._is_probably_math(expr):
                out.append(text[cursor:opener_start])
                expr = cls._normalize_double_escapes(expr)
                out.append(f"${expr}$")
                cursor = closer_idx + 1
                idx = cursor
                continue

            # For non-math groups, advance one character only so nested
            # escaped inline math like "(\(n\))" can still be detected.
            idx += 1

        out.append(text[cursor:])
        return "".join(out)

    @classmethod
    def _normalize_inline_outside_blocks(cls, text: str) -> str:
        # Do not touch inline delimiters inside $$...$$ blocks.
        parts = cls.BLOCK_MATH_RE.split(text)
        normalized_parts: list[str] = []

        for idx, part in enumerate(parts):
            if idx % 2 == 1:
                normalized_parts.append(part)
            else:
                normalized_parts.append(cls._normalize_inline_math(part))

        return "".join(normalized_parts)

    @classmethod
    def apply(cls, text: str) -> str:
        """ Apply normalization to the given text.

        Parameters
        ----------
        text : str
            The input Markdown text to normalize.
        """
        # Keep fenced code blocks untouched.
        parts = cls.CODE_FENCE_RE.split(text)
        normalized_parts: list[str] = []

        for idx, part in enumerate(parts):
            if idx % 2 == 1:
                normalized_parts.append(part)
                continue

            chunk = cls._normalize_standalone_blocks(part)
            chunk = cls._normalize_single_line_blocks(chunk)
            chunk = cls._normalize_inline_outside_blocks(chunk)
            normalized_parts.append(chunk)

        return "".join(normalized_parts)

    @classmethod
    def apply_token_list(cls,
            tokens: list[Token],
            inplace: bool = True
        ) -> tuple[list[Token], int]:
        """ Apply LaTeX delimiter normalization to all applicable tokens.

        Parameters
        ----------
        tokens : list[Token]
            The token stream to process.
        inplace : bool
            Whether to modify the tokens in place or return a new list
            (default is True).
        """
        normalizer = cls()
        root = tokens if inplace else deepcopy(tokens)
        changed = 0

        def skip(tok: Token) -> bool:
            return tok.type in {"code_inline", "code_block", "fence"}

        def walk(stream: list[Token]) -> None:
            nonlocal changed

            for tok in stream:
                if not skip(tok) and tok.content:
                    updated = normalizer.apply(tok.content)

                    if updated != tok.content:
                        tok.content = updated
                        changed += 1

                if tok.children:
                    walk(tok.children)

        walk(root)
        return root, changed


class MarkdownLinkStripper:
    """ Remove `![alt-text](url)` image/object tags from text.

    Please notice that this can be fragile if the Markdown is malformed,
    e.g. missing closing parentheses or brackets, so it is recommended
    to run this after a Markdown linter or parser. Supports nested square
    brackets in image alt text, `![phase [alpha] region](figure-1.png)`
    as this appears when scanning papers with references.
    """
    LINK_RE = re.compile(
        r"""
        !\[
            (?:
                [^\[\]\\]                           # plain alt-text char
                | \\.                               # escaped character
                | \[[^\[\]\\]*(?:\\.[^\[\]\\]*)*\]  # one nested [] group
            )*
        \]
        \(
            (?:
                [^()\\\n]         # plain target character
                | \\.             # escaped character
                | \([^()\\\n]*\)  # one nested () group
            )*
        \)
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    LINK_OR_IMAGE_RE = re.compile(
        r"""
        !?\[
            (?:
                [^\[\]\\]                           # plain alt-text char
                | \\.                               # escaped character
                | \[[^\[\]\\]*(?:\\.[^\[\]\\]*)*\]  # one nested [] group
            )*
        \]
        \(
            (?:
                [^()\\\n]         # plain target character
                | \\.             # escaped character
                | \([^()\\\n]*\)  # one nested () group
            )*
        \)
        """,
        flags=re.VERBOSE | re.MULTILINE,
    )

    @staticmethod
    def consume_balanced(
            text: str,
            start: int,
            opener: str,
            closer: str
        ) -> int:
        """ Index after matching closer for a balanced opener or -1."""
        if start >= len(text) or text[start] != opener:
            return -1

        depth = 0
        i = start

        while i < len(text):
            ch = text[i]

            if ch == "\\":
                i += 2
                continue

            if ch == opener:
                depth += 1
            elif ch == closer:
                depth -= 1
                if depth == 0:
                    return i + 1

            i += 1

        return -1

    @classmethod
    def consume_parens(cls, selected: str, start: int) -> int:
        return cls.consume_balanced(selected, start, "(", ")")

    @classmethod
    def consume_brackets(cls, selected: str, start: int) -> int:
        return cls.consume_balanced(selected, start, "[", "]")

    @staticmethod
    def open_alt(text: str, j: int) -> bool:
        return text[j] == "!" and j + 1 < len(text) and text[j + 1] == "["

    @staticmethod
    def open_link(text: str, j: int) -> bool:
        return text[j] == "["

    @staticmethod
    def open_url(text: str, j: int) -> bool:
        return j != -1 and j < len(text) and text[j] == "("

    @classmethod
    def brute(cls,
            text: str,
            placeholder: str = "",
            remove_links: bool = False
        ) -> tuple[str, list[str]]:
        """ Brute-force approach (use if regex fails). """
        removed: list[str] = []
        out: list[str] = []
        cursor = 0
        n = len(text)

        while cursor < n:
            is_image = cls.open_alt(text, cursor)
            is_link = remove_links and cls.open_link(text, cursor)

            if is_image or is_link:
                bracket_start = cursor + 1 if is_image else cursor
                alt_end = cls.consume_brackets(text, bracket_start)

                if cls.open_url(text, alt_end):
                    url_end = cls.consume_parens(text, alt_end)

                    if url_end != -1:
                        removed.append(text[cursor:url_end])
                        out.append(placeholder)
                        cursor = url_end
                        continue

            out.append(text[cursor])
            cursor += 1

        cleaned = "".join(out)
        cleaned = re.sub(r"\n{3,}", "\n\n", cleaned)
        return cleaned, removed

    @classmethod
    def apply(cls,
            text: str,
            placeholder: str = "",
            remove_links: bool = False
        ) -> tuple[str, list[str]]:
        """ Apply the link stripping to the given text.

        Parameters
        ----------
        text : str
            Input Markdown text.
        placeholder : str
            Replacement text for each removed link/image.
        remove_links : bool
            If True, remove both `[text](url)` and `![alt](url)`.
            If False, remove only image/object tags.
        """
        try:
            pattern = cls.LINK_OR_IMAGE_RE if remove_links else cls.LINK_RE
            removed = [m.group(0) for m in pattern.finditer(text)]
            cleaned = pattern.sub(placeholder, text)
            cleaned = re.sub(r"\n{3,}", "\n\n", cleaned)
        except re.error:
            majordome_warning("Regex failed in MarkdownLinkStripper, "
                              "falling back to brute-force method.")
            cleaned, removed = cls.brute(
                text,
                placeholder=placeholder,
                remove_links=remove_links,
            )

        return cleaned, removed
