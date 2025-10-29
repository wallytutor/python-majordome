# Kompanion

A portable toolbox setup for working in Scientific Computing under Windows.

## Usage

For installation of desired packages (before first use), run `. kompanion.ps1 -RebuildOnStart <Features>`.

The simplest way to isolate the environment for a single package is to proceed as per the following instructions; please notice that doing so you can have only a single VSCode instance running, as launching other instances affect the environment variables for all (breaking isolation).

1. Add this directory to your `PATH` environment variable.
1. In a PowerShell terminal, navigate to your working directory.
1. Source the environment with `. kompanion.ps1 <Features>`.
1. Call `Start-Kompanion` and keep the terminal open.

In the source phase, `<Features>` may take the following values:

| Flag              | Description |
|:------------------|:------------|
| `-RebuildOnStart` | Force rebuild/installation of packages
| `-EnableFull`     | Enable all supported features
| `-EnableLang`     | Enable all programming languages
| `-EnableSimu`     | Enable all simulation tools
| `-EnablePython`   | Enable Python
| `-EnableJulia`    | Enable Julia
| `-EnableHaskell`  | Enable Haskell
| `-EnableRacket`   | Enable Racket
| `-EnableElm`      | Enable Elm
| `-EnableLaTeX`    | Enable LaTeX (extended) toolkit
| `-EnableElmer`    | Enable Elmer Multiphysics
| `-EnableGmsh`     | Enable Gmsh

## To-do

The following aim at flattening the project of at least one level:

- [ ] Time to clean-up: currently the JSON file is not documented nor the attributes of the entries are standardized. Some reworking is desired. For instance, `elm` should be extracted to a subdirectory and that directory placed in the path, instead of expanding the file directly to the root. Other cases need to be investigated.
- [ ] Refactor documentation for new version.
- [ ] Update Git submodules at `.gitmodules` and under `.git` directory at relevant locations.
- [ ] Split the `Tested packages` of `docs/preamble.md` into sections for better management.

## How to add a new package?

- Create an entry under `"install"` dictionary of [kompanion.json](data/kompanion.json); for most software provided in compressed format that means simply something as:

```json
"packagename": {
    "name": "extractionname",
    "URL": "https://path/to/some/zip.zip",
    "saveAs": "temp/packagename.zip",
    "path": "bin/packagename"
},
```

- If the package has a conditional installation, add a `param` to the top of [kompanion.ps1](kompanion.ps1) for handling it if necessary; also think about updating the global flag handlers on the top of the file, if applicable.

- Create a `Initialize-PackageName()` function in [src/initialize.ps1](src/initialize.ps1); this must at least handle adding the package and relevant libraries to the path. Add a call to this initialization function call to `Initialize-Kompanion` in the same file.

- Add the package setup instructions to `Start-KompanionSetup` in [src/setup.ps1](src/setup.ps1); if the software has conditional installation, identify the right place depending on the flag it is associated to.
