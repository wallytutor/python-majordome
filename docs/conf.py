##############################################################################
# Configuration file for the Sphinx documentation builder.
# https://www.sphinx-doc.org/en/master/usage/configuration.html
##############################################################################

import re


def replace_citations(app, docname, source):
    """ Replace [@Key] with {cite:p}`Key` in the document source. """
    text = source[0]
    pattern = re.compile(r"\[@([A-Za-z0-9:_-]+)\]")
    text = pattern.sub(r"{cite:p}`\1`", text)
    source[0] = text


def setup(app):
    app.connect("source-read", replace_citations)


##############################################################################
# Project information
##############################################################################

project = "Majordome"

copyright = "2025, Walter Dal'Maz Silva"

author = "Walter Dal'Maz Silva"

##############################################################################
# General configuration
##############################################################################

# XXX: we are currently using myst_parser+nbsphinx but because of that the
# notebooks extension need to be replaced by .nbmd because of source register
# for parsing. An alternative that I could not get working yet is myst_nb
# https://myst-nb.readthedocs.io/en/v0.13.2/use/myst.html

extensions = [
    "myst_parser",              # Parse MyST Markdown
    "nbsphinx",                 # Render notebooks
    "sphinx.ext.mathjax",       # Math rendering
    "sphinxcontrib.bibtex",     # Citations from BibTeX
    "numpydoc",                 # NumPy style docstrings
    "sphinx.ext.duration",
    "sphinx.ext.doctest",
    "sphinx.ext.autodoc",
    "sphinx.ext.autosummary",
]

source_suffix = [".rst", ".md"]

templates_path = ["_templates"]

exclude_patterns = [
    "_build",
    "Thumbs.db",
    ".DS_Store",
    ".trash/*",              # In SMB disks this may appear here
    ".ipynb_checkpoints/*",  # Keep clean from notebook trash
    "_*.md",                 # Files intended for Pandoc docs
    "_*.py",                 # Python development files
    "*_.md",                 # Sync of .py notebooks
]

##############################################################################
# Options for HTML output
##############################################################################

html_theme = "sphinx_book_theme"

html_static_path = ["_static"]

# Optional: don’t scale linked images in HTML
html_scaled_image_link = False

# Optional: avoid .txt suffix in HTML source links
html_sourcelink_suffix = ""

##############################################################################
# Others
##############################################################################

# Disable the need to declare *Methods* for stubs in classes.
# https://stackoverflow.com/questions/65198998
autosummary_generate = False
autosummary_imported_members = False
numpydoc_show_inherited_class_members = False
numpydoc_show_class_members = False

##############################################################################
# MyST support to LaTeX
##############################################################################

# Unused: recommended by Copilot, if someday I get in trouble:
# mathjax_path = "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"
# myst_update_mathjax = False

myst_enable_extensions = [
    "dollarmath",  # Enables $...$ and $$...$$ syntax
    "amsmath"      # Enables {math} directive blocks
]

# Include references
bibtex_bibfiles = ["references.bib"]

##############################################################################
# Notebook samples support
##############################################################################

# Allow errors in notebooks without failing the build (optional)
# nbsphinx_allow_errors = True

# When to execute notebooks (always, never, or auto):
nbsphinx_execute = "always" 

# XXX: notebooks need to be stored with a special extension .nbmd because
# otherwise myst and nbsphinx parsers will conflict... because jupytext
# will not allow for editing them, this workaround has been dropped.
nbsphinx_custom_formats = {
    ".py": ["jupytext.reads", {"fmt": "py:percent"}],
    # ".nbmd": ["jupytext.reads", {"fmt": "md:myst"}],
}

##############################################################################
# EOF
##############################################################################