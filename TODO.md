# To-do Stack

## New Physics

- [ ] Implement the diffusional Grashof number in majordome.engineering.SutherlandFitting, which is related to mass transfer arising because of the buoyant force caused by concentration changes.

- [ ] Create a Maier-Kelley to NASA or Shomate translator for use with solids thermodynamics.

- [ ] Implement TPMS geometry generator to Majordome for generating meshes in 3D of porous media. Check import of generated files in Blender.

- [ ] Formal FVM version of PFR in Cantera with replica of PhD results; make an alternative version with AD support using the ongoing CasADi wrapper.

- [ ] Move all heat transfer coefficients currently in work project to Majordome for ease of extension and better support in the future; these can be reused in the 1-D thermocline model.

- [ ] Write 1-D thermocline model with generic heat exchange and thermal conductivity models.

- [ ] Support solids kinetics in full; integrate to the PFR and start by implementing known Kaolinite model

## Ansys Fluent support

- [ ] Create a data converter to create Ansys Fluent SCM files directly from Cantera YAML (species data and reactions).

- [ ] Add generation of TUI commands for Fluent expression generators and further expand to general Fluent setup.

## OpenFOAM support

- [ ] Automatic plotting of postprocessing folder with multiple restart points; support single domain as well as multiple regions cases (there is an ongoing draft in the heat-exchanger model).

## General code features

- [x] Fix launching of rust binaries in uv environments; test a branch of majordome simplified to a uv/maturin workflow Creating projects | uv Project Layout - Maturin User Guide before going further. Created a new project with uv init --python 3.12 --build-backend maturin majordome. Migration performed and project management became extremely simple compared to previous version.

- [ ] Migrate gpxpy usage to plain XML for better maintainability.

- [ ] Transform use_ methods of PFR into properties.

- [ ] Create a @safe_overwrite by checking file existence; it takes the function and the name of the argument to be verified in the register (decoration).

- [ ] Perform a code review and add __slots__ to all classes for better quality.

- [ ] Document aliases of gmsh API for ease of consultation; maybe write a tutorial for simple geometries in the documentation but first check how to display the graphics in notebooks in a reliable fashion, as gmsh will render to screen.

- [ ] Move walang into its own project based on uv/maturin. Changed my mind, just made a new script in Majordome for it. Think more about the type of framework to use in the backend; would it be better to have a pure symbolic kernel and another for numerical computations? Or using CasADi only would be better? This should be a minimal SageMath version for my basic research needs.

- [ ] Improve the speed of interpolation files parsing in parallel with something like the following.

```python
from itertools import islice

def read_slice(path, start, count):
    with open(path) as f:
        return list(islice(f, start, start + count))

def read_slice(path, start, count):
    with open(path) as f:
        for line in islice(f, start, start + count):
            yield line.rstrip("\n")
```

- [ ] Check if the following is of any use in the current context of Majordome:

```bash
$env:RUSTFLAGS = "-A warnings"
$env:RUST_BACKTRACE = 0
$env:SETUPTOOLS_RUST_CARGO_PROFILE = "dev"
$env:CARGO_INCREMENTAL = 1

if ($FlagRelease) {
    $env:RUSTFLAGS += " -C opt-level=3"
    $env:SETUPTOOLS_RUST_CARGO_PROFILE = "release"
}

if ($FlagBacktrace) {
    $env:RUST_BACKTRACE = 1
}

Write-Host ""
Write-Host "Environment variables set:"
Write-Host "RUSTFLAGS ....................: $env:RUSTFLAGS"
Write-Host "RUST_BACKTRACE ...............: $env:RUST_BACKTRACE"
Write-Host "SETUPTOOLS_RUST_CARGO_PROFILE : $env:SETUPTOOLS_RUST_CARGO_PROFILE"
Write-Host "CARGO_INCREMENTAL ............: $env:CARGO_INCREMENTAL"
Write-Host ""
```

- [ ]Create a helper script for reverting bad commits:

```bash
$newTag = '1.0.2'
git tag -d "v$newTag"
git push origin --delete "v$newTag"
# + edit Cargo.toml and pyproject.toml
```

## Bugs

- [ ] Chains of interpolation symbols fail in mdmagic: {h_geo}{l_geo}{d_geo} and get an extra dollar sign; it would be nice to have this fixed, as inline latex expressions would be simpler to type.
