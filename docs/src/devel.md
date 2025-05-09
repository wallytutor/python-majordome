# Majordome development

## Development

For developing the package, consider doing so from within a virtual environment; that will makes things easier to check versions and pin them properly in package dependencies, as needed. Following the above snipped, install, activate, upgrade pip and make `majordome` ready for development.

```bash
python -m venv venv

venv\Scripts\Activate.ps1

python -m pip install --upgrade pip

pip install -e .
```

Please notice that Linux users may need to install `python-venv`; under Debian-based distributions that is done with `sudo apt install python-venv`, which requires admin rights. Also notice that activating an environment is done with `source venv/bin/activate` instead.

## Documentation

During development it is highly recommended to verify documentation build succeeds; in practice it is automatically generated and deployed by a [GitHub workflow](https://github.com/wallytutor/python-majordome/blob/main/.github/workflows/documentation.yml). From within a development environment created as per the previous section (and containing the package installed at least in development mode), run the following:

```bash
pip install sphinx sphinx_book_theme numpydoc myst_parser

sphinx-build -b html -c docs/ docs/src/ docs/_build/
```

## Distribution

For distribution, maintainers need to do the following:

```bash
python -m pip install --upgrade twine
python -m pip install --upgrade build

python -m build
python -m twine upload --repository majordome dist/*
```
