# Majordome

General utilities for scientific Python and numerical simulation.

- [Majordome docs](https://wallytutor.github.io/python-majordome/)
<!-- - [Majordome on PyPI](https://pypi.org/project/majordome/) -->

## Kompanion

This section describes how to get Kompanion automatically sourced in your user profile for all PowerShell sessions.

Start by creating an environment variable `KOMPANION_SOURCE` pointing to the *full-path* of file `src\kompanion\main.ps1`.

For instance, if you are called like me and cloned this repository at `GitHub\python-majordome` under your profile, then its value should be `C:\Users\walter\GitHub\python-majordome\src\kompanion\main.ps1`

Next, start PowerShell and identify the path to your user profile:

```ps1
echo $PROFILE
```

If that file does not exist, create it with:

```ps1
New-Item -ItemType File -Path $PROFILE -Force
```

Now you can run `notepad $PROFILE` to open it and append the following lines:

```ps1
if (Test-Path $env:KOMPANION_SOURCE) {
    . $env:KOMPANION_SOURCE

    # Uncomment the following if you want the terminal to start at
    # the root of this repository; useful for development.
    # cd "$env:KOMPANION_DIR"
} else {
    Write-Host "KOMPANION_SOURCE not found at '$env:KOMPANION_SOURCE'"
}
```

## Development

### Linux

For convenience, the full workflow has been added to `develop.sh`, which handles environment creation, activation, and package compilation. By default build is done within a `podman` container, which can be replaced by `docker` by configuring `CONTAINER` variable in the script. Upon execution the script build/activate a container and leaves the user at a Bash shell; there you can manage the project or simply call the script again to launch a build.

Please, when adding new dependencies to `pyproject.toml`, make sure to also add them to  `src/configuration/requirements.txt` so that container builds are more efficient (as no packages are installed temporarily when running the container in interactive mode). The build environment is maintained at `src/configuration/Containerfile`.

### Windows

For convenience, you find a `develop.ps1` script in project root, or you can adopt manual builds as described below.

For developing the package, consider doing so from within a virtual environment; that will makes things easier to check versions and pin them properly in package dependencies, as needed. You will also need Rust to be available for compiling the main library. Following the next snippet, install, activate, upgrade pip and make `majordome` ready for development.

```bash
python -m venv venv
venv/Scripts/Activate.ps1
python -m pip install --upgrade pip
pip install -e .[docs,extras]
```

During development it is highly recommended to verify documentation build succeeds; in practice it is automatically generated and deployed by a [GitHub workflow](https://github.com/wallytutor/python-majordome/blob/main/.github/workflows/documentation.yml). From within a development environment created as per the previous section (and containing the package installed at least in development mode), run the following:

```bash
pip install .[docs]
sphinx-build -E -b html -c docs/ docs/src/ docs/_build/
```

## Distribution

**Note** for now the distribution of binaries is being done only through GitHub. Once a stable version is reached, consider updating this section for PyPI.

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

- Migrate `gpxpy` usage to plain XML for better maintenability.
