# -*- coding: utf-8 -*-
from textwrap import dedent
from majordome.utilities import (
    LatexDelimiterNormalizer,
)

class TestLatexDelimiterNormalizer:
    normalizer = LatexDelimiterNormalizer()

    def test_inline_good(self):
        sample   = r"\( x^2 + y^2 \)"
        expected = r"$x^2 + y^2$"
        assert self.normalizer.apply(sample) == expected

    def test_inline_parenthesized(self):
        sample   = r"(\( x^2 + y^2 \))"
        expected = r"($x^2 + y^2$)"
        assert self.normalizer.apply(sample) == expected

    def test_inline_missing_open_slash(self):
        sample   = r"(c+d\)"
        expected = r"$c+d$"
        assert self.normalizer.apply(sample) == expected

    def test_inline_missing_close_slash(self):
        sample   = r"\(a+b)"
        expected = r"$a+b$"
        assert self.normalizer.apply(sample) == expected

    def test_inline_breaking_case(self):
        sample   = r"\( V_{IJ}^{(n)} \)"
        expected = r"$V_{IJ}^{(n)}$"
        assert self.normalizer.apply(sample) == expected

    def test_block_good(self):
        sample   = r"\[ \int_0^1 f(x)\,dx \]"
        expected = "$$\n\\int_0^1 f(x)\\,dx\n$$"  # XXX not raw string!
        assert self.normalizer.apply(sample) == expected

        sample   = "\\[\n\\int_0^1 f(x)\\,dx\n\\]"
        expected = "$$\n\\int_0^1 f(x)\\,dx\n$$"  # XXX not raw string!
        assert self.normalizer.apply(sample) == expected

    def test_block_inline(self):
        sample   = r"text to be inline \[ \int_0^1 f(x)\,dx ]"
        expected = "text to be inline $$ \\int_0^1 f(x)\\,dx $$"
        assert self.normalizer.apply(sample) == expected

    def test_skip_md_links(self):
        sample   = r"[link](https://example.com/path?query=param)"
        expected = r"[link](https://example.com/path?query=param)"
        assert self.normalizer.apply(sample) == expected

    def test_double_escaped_inline(self):
        sample   = r"\\( \\Delta J \\)"
        expected = r"$\Delta J$"
        assert self.normalizer.apply(sample) == expected

    def test_double_escaped_block(self):
        sample   = dedent(r"""
            \\[
                W_{\\text{point}}^{(n)} =
                \\left( W_{AA}^{(n)}+W_{BB}^{(n)}-2W_{AB}^{(n)} \\right)
            \\]
            """)

        expected = dedent(r"""
            $$
            W_{\text{point}}^{(n)} =
                \left( W_{AA}^{(n)}+W_{BB}^{(n)}-2W_{AB}^{(n)} \right)
            $$""") # XXX cannot break to next line!

        assert self.normalizer.apply(sample) == expected
