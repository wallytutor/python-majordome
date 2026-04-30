# Changelog

## Ongoing Development

- Added .NET extras for educational purposes. The code is currently not part of the Python package and is highly experimental.

- Included `majordome.utilities.sympy_symbols_factory` utility to create SymPy symbols in batch, with support for custom naming conventions and indexing.

## 1.1.0 - 2026-04-29

- Updated `majordome.utilities.LatexDelimiterNormalizer` to handle parenthesized LaTeX blocks and inline expressions (mostly to support outputs of OCR when extracting text from PDFs).

- Added `majordome.utilities.MarkdownLinkStripper` utility to remove Markdown links from text. User can control whether to remove all links or only the entries corresponding to figures included in the text.

- Some type hinting and docstring improvements in `majordome.utilities`.

- Experimental support for JupyterLab extension `mdmagic` reintroduced to the project. This feature needs a JS developer contributor to be fully implemented and tested, but the groundwork has been laid in the codebase. The extension will allow users to write Markdown in code cells for use with `majordome.magic.MdMagic`.
