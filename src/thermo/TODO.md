# To-Do

**Short-term goals:**

- Eliminate all Rust examples by exposing functionalities through Python API.

- Improve robustness of the optimization routines and document its behavior.

- Create a database of substances that I work on a regular basis for ease access.

**Long-term goals:**

- See *thermodynamics/calphad-devel* in knowledge-base repository.

## 2026-05-17

- [x] Provide a simple data loading interface with possibility of substance selection in Python.

- [x] Add a substance printer method to allow inspecting properties at a given state. Goal of replacing `thermo_evaluation.rs`.

- [x] Create a wrapper API allowing for specification of system composition in terms of compount mass or moles (or respective proportions) and internally normalizing the elemental composition to one mole of matter.

- [x] Export `autodiff` to Python and add example showing that Gibbs energy derivative with temperature matches entropy at reference state. Goal of replacing `autodiff_evaluation.rs`.

- [x] Make species tabulation a default feature of substances. Goal to replace `species_tabulation.rs` and expose method in Python.

- [x] Create module `linalg` for methods not related to the core equilibrium calculations (e.g. `dense_gaussian_solver`).

- [x] Rename local equilibrium solver to `equilibrate_stoichiometric` as it is dedicated to stoichiometric systems.

- [x] Expose `equilibrate_stoichiometric` to Python.

## 2026-05-20

- [x] Simplify `SystemComposition` constructors to take a `HashMap` database.

- [x] Add `into_elemental_fractions` helper to `SystemComposition`.

- [x] Implement the `Equilibrium` class with full thermodynamic details and a gorgeous report formatter.
