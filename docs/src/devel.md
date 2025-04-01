# Majordome development

## Installation

A typical installation workflow include the following steps:

```bash
# Create a virtual environment:
python -m venv venv

# Activate virtual environment:
source venv/bin/activate

# XXX replace the above by the following under Windows:
# venv\Scripts\Activate.ps1 

# Ensure latest pip:
python -m pip install --upgrade pip

# Install documentation dependencies:
pip install sphinx sphinx_book_theme numpydoc myst_parser

# Install package in dev mode:
pip install -e .

# Generate documentation:
sphinx-build -b html -c docs/ docs/src/ docs/_build/
```

## Distribution

```bash
python -m pip install --upgrade twine
python -m pip install --upgrade build

python -m build
python -m twine upload --repository majordome dist/*
```
