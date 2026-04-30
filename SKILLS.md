# SKILLS

This file defines project-specific skills for AI assistants (including Msty Studio) working in this repository.

## Project Identity

- Name: majordome
- Domain: scientific computing, simulation, utilities
- Primary languages: Python, Rust (PyO3), F#, Quarto/Markdown
- Python package root: `majordome/`
- Rust core module: `src/core/`
- Diffusion (F#) workspace: `src/Diffusion/`
- Documentation source: `docs/`, `devel/`, `reactors/`, `diffusion/`

## Skill: Python Package Work

### Use When

- Adding or refactoring features in `majordome/*.py`
- Fixing tests, imports, or entrypoints
- Updating project metadata and dependencies in `pyproject.toml`

### Key Files

- `pyproject.toml`
- `majordome/__init__.py`
- `majordome/entrypoints.py`
- `majordome/utilities.py`
- `majordome/*_test.py`

### Workflow

1. Read `pyproject.toml` for dependency and script constraints.
2. Make minimal, targeted edits in Python modules.
3. Keep public APIs stable unless explicitly changing interfaces.
4. Run tests for changed behavior.

### Validation

- `pytest -q`
- If entrypoints changed, verify import/call path still resolves:
  - `containerize = majordome.entrypoints:containerize`
  - `majordome = majordome.entrypoints:majordome`

## Skill: Rust/PyO3 Core Integration

### Use When

- Editing Rust bindings or internals in `src/core/`
- Adjusting build or packaging behavior with maturin
- Debugging Python extension load/runtime errors

### Key Files

- `Cargo.toml`
- `build.rs`
- `src/core/lib.rs`
- `pyproject.toml` (`[tool.maturin]`)

### Workflow

1. Keep crate name/module mapping aligned:
   - Rust lib name: `_core`
   - Python extension module: `majordome._core`
2. Preserve PyO3 ABI targeting (`abi3-py312`) unless intentionally changing support.
3. For Windows runtime issues, verify `pythonXY.dll` staging from `build.rs`.

### Validation

- `cargo test`
- `cargo check`
- Optional wheel sanity check:
  - `maturin develop`
  - `python -c "import majordome, majordome._core; print('ok')"`

### Windows Note

- If tests fail with `STATUS_DLL_NOT_FOUND (0xc0000135)`, ensure active interpreter discovery and DLL copy logic in `build.rs` remains intact.

## Skill: Diffusion/F# Codebase Maintenance

### Use When

- Working in F# projects under `src/Diffusion.*`
- Updating numerics, thermo, or tests in the diffusion stack

### Key Files

- `src/Diffusion/Directory.Build.props`
- `src/Diffusion.Core/*.fs`
- `src/Diffusion.Numerics/*.fs`
- `src/Diffusion.Thermo/*.fs`
- `src/Diffusion.*.Tests/*.fs`

### Workflow

1. Keep changes localized by project (`Core`, `Numerics`, `Thermo`, `Slycke`).
2. Update tests in matching `*.Tests` project when behavior changes.
3. Avoid broad renames unless all references are confirmed.

### Validation

- `dotnet build src/Diffusion/Diffusion.Core.fsproj`
- `dotnet test src/Diffusion/Diffusion.Core.Tests.fsproj`
- Repeat for changed projects.

## Skill: Documentation and Quarto Authoring

### Use When

- Editing docs in `docs/`, `devel/`, `reactors/`, `diffusion/`
- Updating technical notes, tutorials, or generated site content

### Key Files

- `docs/_quarto.yaml`
- `docs/*.qmd`
- `devel/*.qmd`
- `reactors/*.qmd`
- `diffusion/*.qmd`

### Workflow

1. Edit source `.qmd` files only.
2. Do not hand-edit generated output under `docs/_book/` unless explicitly requested.
3. Keep equations, code blocks, and cross-links consistent.

### Validation

- `quarto render docs`
- Spot-check changed pages in `docs/_book/*.html`

## Skill: Dependency and Release Hygiene

### Use When

- Bumping versions
- Changing Python or Rust dependencies
- Preparing release assets

### Key Files

- `pyproject.toml`
- `Cargo.toml`
- `CHANGELOG.md`
- `release.py`, `release.ps1`, `release.sh`
- `Containerfile`

### Workflow

1. Keep Python and Rust version metadata coherent (`1.1.0` currently).
2. Update changelog with user-visible behavior changes.
3. Prefer minimal dependency surface; justify new heavy scientific dependencies.

### Validation

- `cargo check`
- `pytest -q`
- Build packaging artifacts using existing release scripts only when needed.

## Global Guardrails for Assistants

- Prefer focused patches over broad rewrites.
- Preserve existing coding style and module structure.
- Add concise comments only where logic is non-obvious.
- Never modify generated docs (`docs/_book/`) unless user asks.
- Confirm behavior with the smallest relevant test/build command.
- If a command cannot be run (missing tool), report it and provide an equivalent alternative.

## Quick Command Reference

- Python tests: `pytest -q`
- Rust check: `cargo check`
- Rust tests: `cargo test`
- F# build: `dotnet build src/Diffusion/Diffusion.Core.fsproj`
- F# test: `dotnet test src/Diffusion/Diffusion.Core.Tests.fsproj`
- Docs render: `quarto render docs`
- Local extension dev (if needed): `cd extensions/jupyterlab-mdmagic && npm run build`

## Suggested Task Routing (For AI)

- Pure Python utility change -> Python Package Work
- CPython extension import/runtime issue -> Rust/PyO3 Core Integration
- Numerical diffusion algorithm/test updates -> Diffusion/F# Codebase Maintenance
- Doc/tutorial/site updates -> Documentation and Quarto Authoring
- Version bump/release prep -> Dependency and Release Hygiene
