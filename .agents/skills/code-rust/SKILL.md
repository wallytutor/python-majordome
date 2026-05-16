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

- Rust crates live under the `src/` directory and each crate has its own `Cargo.toml` file.

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

- Lines are preferrably less than 80 characters long, with a maximum of 100 characters.
