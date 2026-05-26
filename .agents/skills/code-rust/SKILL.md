---
name: code-rust
description: Provides directives for generating and modifying Rust code.
---

# Coding in Rust

## When to use this skill

- Use this when writing or modifying Rust code.

- Do not use this skill for other programming languages.

## How to use this skill

- This project uses PyO3 to wrap Rust code in Python modules.

- Rust crates live under the `src/` or `crates/` directory and each crate has its own `Cargo.toml` file. Crates living under `crates/` have the `lib.rs` at the root of the crate directory (same as `Cargo.toml`) to avoid unnecessary nesting of directories in the tree.

- Public code exported from submodule must be always explicitly listed in `mod.rs` files so that user code does not import from deep within the tree. For instance, using `use majordome_numerical::linear_algebra::tridiagonal::TridiagonalSolver;` is not allowed. Instead, use `use majordome_numerical::linear_algebra::TridiagonalSolver;`, where `TridiagonalSolver` is exposed by `linear_algebra::mod.rs`. In other words, the path inside the crate must be as short as possible. So, if a submodule is not meant to be used directly, it should not be exposed in `mod.rs`.

- Not all crates are meant to be used directly. Some are internal implementation details.

- Always place new Rust code in the most appropriate file and create new modules when needed.

- Add documentation comments (`///`) and examples for all public APIs.

- Each module must be fully unit tested with tests under the `#[cfg(test)]` attribute.

- Include integration tests in `tests/` when appropriate.

- Ensure all tests pass with `cargo test` before proposing a change.

- Although you are coding in Rust, the author has Irlen syndrome and needs code to be extremely readable.

- Instead of using Rust typical guidelines for style, stick to PEP8 adapted for Rust whenever possible.

- Use a blank line before if, match, for, while, and loop keywords.

- Use 2 blank lines between functions and 2 blank lines between methods in a struct/enum.

- Inside `impl` and `[#pymethods] impl` blocks override the requirement for 2 blank lines between functions and use a single line, as in Python classes.

- Whenever reasonable, allow aligning `=>` in matches so that it remains *tabular*.

- For any non-trivial match, use braces and indent the code block (no-inline).

- Lines are preferrably less than 80 characters long, with a maximum of 100 characters.

### Python bindings with PyO3

- Do not use direct *in-struct* attribute PyO3 annotations, i.e., keep the python API logic completely disconnected from Rust structure. All elements to be exposed shall be given a dedicated interface in the `[#pymethods] impl` block.

- Do not use attributes to bypass any warning, such as `skip_from_py_object`. Instead, implement the new recommended approach so that the code base is already compliant with new standards.

- When creating Python API's, do not use `py_` naming schemes. Any created API must look native as they are the primary goal. Find alternatives in the code structure.
