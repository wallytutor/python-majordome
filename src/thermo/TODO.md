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

- [ ] Make species tabulation a default feature of substances. Goal to replace `species_tabulation.rs` and expose method in Python.

- [ ] Expose (in draft mode) the `evaluate_local_equilibrium` interface to Python so that `equilibrium_evaluation.rs` can be replaced by an API example.

## 2026-05-16

- [x] Create library file `lib.rs` and several entry points to expose rust sample applications. Each entry point exposes a single feature for human inspection.

- [x] Use Lua modules for database construction. This is accomplished by adding a data loader that exposes the data creation to Lua scripts.

- [x] Add PyO3 to be able to interact with python and test the module.

- [x] Create `devel.py` file and use it to add new data and check the use of automatic differentiation.
