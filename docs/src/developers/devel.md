# Development

## Linux

Both a `Containerfile` and `containerfile.sh` are provided in project root. After successfully running `containerfile.sh` (which requires both `podman` and `apptainer`) you should find yourself with a `majordome.sif` file in the project root. The following commands can be used to control this file as a local service:

```bash
# Start an instance for building:
apptainer instance start --bind $(pwd):/opt/app \
    --writable-tmpfs majordome.sif majordome

# Work in a shell within the instance:
apptainer shell instance://majordome

# Stop instance (after exiting)
apptainer instance stop majordome
```

## Windows

### Environment

For developing the package, consider doing so from within a virtual environment; that will makes things easier to check versions and pin them properly in package dependencies, as needed. You will also need Rust to be available for compiling the main library. Following the next snippet, install, activate, upgrade pip and make `majordome` ready for development.

```bash
python -m venv venv
venv/Scripts/Activate.ps1
python -m pip install --upgrade pip
pip install -e .[docs,extras,pdftools,vision]
```

Please notice that Linux users may need to install `python-venv`; under Debian-based distributions that is done with `sudo apt install python-venv`, which requires admin rights. Also notice that activating an environment is done with `source venv/bin/activate` instead.

For convenience, you find a `develop.ps1` script in project root.

### Documentation

During development it is highly recommended to verify documentation build succeeds; in practice it is automatically generated and deployed by a [GitHub workflow](https://github.com/wallytutor/python-majordome/blob/main/.github/workflows/documentation.yml). From within a development environment created as per the previous section (and containing the package installed at least in development mode), run the following:

```bash
pip install .[docs,pdftools,vision]
sphinx-build -E -b html -c docs/ docs/src/ docs/_build/
```

### Distribution

For distribution, maintainers need to do the following:

```bash
python -m pip install --upgrade twine
python -m pip install --upgrade build
python -m build
python -m twine upload --repository majordome dist/*
```

## Wishlist

- Implement diffusional Grashof number in `majordome.transport.SutherlandFitting`, which is related to mass transfer arising because of the buoyant force caused by the concentration inhomogeneities.

- Create a data converter to create Ansys Fluent SCM files directly from Cantera YAML (species data and reactions).

- Add generation of TUI commands for Fluent expression generator (and further expand to general Fluent setup).
