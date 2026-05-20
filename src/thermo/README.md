# Thermodynamics solver with automatic differentiation

> **Status:** standalone Rust crate exposed to Python via PyO3.
> Not yet integrated into the core Majordome package.

## Capabilities

### Data layer

- Lua-based dynamic species registry with named-indexed loading.
- Supported parameterizations: **Maier-Kelley**, **NASA7**, **NASA9**,
  **Shomate**, **GibbsPolynomial**, **Compound** (linear combination with
  optional Gibbs deviation term).
- Automatic molar mass calculation from elemental composition.
- `DatabaseLoader` supports full-database or phase-subset loading.

### Thermodynamic engine

- Evaluation of Cp, H, S, G for all parameterization models.
- Generic over `f64` and `Dual<f64>` (automatic differentiation).
- Multi-range substances with correct range-boundary interpolation.
- Tabulation of thermodynamic properties over a temperature scan.

### Automatic differentiation

- Forward-mode autodiff via `Dual<f64>`.
- Exposed to Python as `Dual`; verified: `dG/dT = -S(T)`.

### System composition

- `SystemComposition` constructors:
  - `from_compound_moles` / `from_compound_masses`
  - `from_elemental_moles` / `from_elemental_masses`
- Internal normalization to one mole of atoms.
- Report formatter with elemental fractions.

### Equilibrium solver

- `equilibrate_stoichiometric`: support-based Gibbs minimization for
  stoichiometric phase assemblages.
- Handles gas phases with pressure correction `RT ln(p/p°)`.
- Exposed to Python as `equilibrate_stoichiometric(phases, comp, T, P)`.
- Returns `Equilibrium` with amounts, Gibbs energies and a report formatter.

### Validated examples (`usage.rs`)

| Example                   | System                       | Description                          |
|---------------------------|------------------------------|--------------------------------------|
| `loading_data`            | CaCO₃/CaO/CO₂ + Diaspore    | Report thermodynamic properties      |
| `autodiff_verification`   | Calcite                      | Verify dG/dT = -S via autodiff       |
| `species_tabulation_demo` | CaCO₃/CaO/CO₂ + Diaspore    | Property tabulation 298–1200 K       |
| `single_equilibrium_evaluation` | CaCO₃ + AlOOH          | Single-point Gibbs minimization      |
| `composition_tabulation`  | CaCO₃ + AlOOH                | Temperature scan 300–1200 K          |
| `hallstedt1990_scan`      | CaO–Al₂O₃ (Hallstedt 1990)  | Composition scan at 1400 K           |

## Data files

| Path                                  | Contents                                          |
|---------------------------------------|---------------------------------------------------|
| `data/sample/simple-calcination.lua`  | Calcite, Lime, CO₂, Diaspore, H₂O, Al₂O₃        |
| `data/hallstedt1990.lua`              | CaO–Al₂O₃ stoichiometric phases (Hallstedt 1990) |
| `data/hallstedt1990.tdb`              | Original CALPHAD TDB source (reference)           |
| `data/haas1981.lua`                   | Haas & Fisher (1981) data                         |
| `data/nasa.lua`                       | NASA gas-phase database (large)                   |

## Running

```bash
cargo run --bin usage
```
