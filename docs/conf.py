##############################################################################
# Configuration file for the Sphinx documentation builder.
# https://www.sphinx-doc.org/en/master/usage/configuration.html
##############################################################################

##############################################################################
# Project information
##############################################################################

project = "Majordome"

copyright = "2025, Walter Dal'Maz Silva"

author = "Walter Dal'Maz Silva"

##############################################################################
# General configuration
##############################################################################

extensions = [
    "sphinx.ext.duration",
    "sphinx.ext.doctest",
    "sphinx.ext.autodoc",
    "sphinx.ext.autosummary",
    "myst_parser",
    "numpydoc",
]

source_suffix = [".rst", ".md"]

templates_path = ["_templates"]

exclude_patterns = [
    "_build",
    "Thumbs.db",
    ".DS_Store",
    ".trash/*",
    "**/.ipynb_checkpoints/*",
]

##############################################################################
# Options for HTML output
##############################################################################

html_theme = "sphinx_book_theme"

html_static_path = ["_static"]

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
# EOF
##############################################################################