# Changelog

## Ongoing Development

### 2026-09-17 - Fixed

- **String List Quoting:** Updated list formatting in `ast.rs` so that string items inside lists (such as library names in `libs`) are automatically enclosed in double quotes (`"..."`) and formatted across multiple lines with proper indentation. In `parser.rs`, unquoted identifier tokens within lists (e.g. `hex` in `blocks`) are preserved as raw unquoted tokens (`FoamValue::Raw`) to prevent keyword quotation in block definitions.

- **Named Dictionary Alignment & Indentation:** Fixed dictionary key entry formatting in `ast.rs` so that keys whose value is a named dictionary (such as `species Gauss multivariateSelection` in `fvSchemes`) place the dictionary name/header on the same line as the key, aligned with other dictionary values, with the subdictionary block `{ ... };` indented below it. Also updated `max_key_len` calculation so that keys with named dictionary headers participate in column width alignment.

- **Nested List Indentation:** Updated `FoamValue::to_foam_indent` in `ast.rs` to format all nested lists across multiple lines, indenting each nested list with respect to the parent indentation level. This preserves readable formatting in OpenFOAM dictionary files containing coordinate lists or nested blocks (such as `vertices` and `blocks` in `blockMeshDict`).

- **Sequence & Nested List Handling:** Replaced fragile 3-element vector heuristic and improper `Compound` conversion in `py_to_foam_value` with uniform, recursive sequence handling (`FoamValue::List`). All sequences (2D/3D vectors, tensors, coordinate pairs, nested lists, and lists of tuples) now retain their enclosing parentheses and type fidelity across arbitrary dimensions.

- **Generic Sequence Parsing:** Updated `parse_value_str_inner` with recursive balanced-parenthesis parsing, removing the 3-element vector length constraint and allowing multidimensional vectors, tensors, and nested lists (such as `levels ((dist0 level0) (dist1 level1));`) to be parsed directly into structured Python lists rather than raw strings.

### 2026-09-16 - Added

- **Field Data Parsing:** Added `FieldData` AST node and `FoamValue::Field` / `FoamValue::Compound` variants to support OpenFOAM field files, time-step solution results (e.g. `1/p` nonuniform lists), lagrangian cloud fields (`1/lagrangian/cloud/T`, `U`, `positions`), and standalone field lists (`constant/cloudPositions`).

- **Python Data Sequence Bindings:** Added PyO3 bindings on `PyFoamDict` (`has_field_data`, `get_data`, `set_data`, `data_len`, `get_data_item`, `set_data_item`, `append_data`, `extend_data`, `pop_data`, `clear_data`) allowing high-performance sequence manipulation directly from Python.

### 2026-09-15 - Fixed

- **Subdict Parsing Infinite Loop:** Fixed infinite loop in `parse_subdict` caused by not advancing the character iterator when encountering empty key names (e.g. stray semicolons `;`, double semicolons `;;`). Added explicit stray semicolon skipping, `#` directive and `$` macro reference parsing inside subdictionaries, and error handling for unexpected slash characters.

- **Expression Key Parsing:** Updated `parse_key_name` to track parenthesis nesting depth, allowing OpenFOAM mathematical expressions with spaces inside parentheses (e.g. `div(phi, U)`) to be parsed correctly without key truncation.

### 2026-09-09 - Fixed

- **Entry Value Parsing:** Resolved premature entry termination when encountering nested semicolons inside multiline lists or subdicts (e.g. `features ({ file "mainWalls.eMesh"; level 2; });`). The parser now tracks parentheses `()`, braces `{}`, string quotes (`"`, `'`), and comments (`//`, `/* */`) to ensure values are read until the outer terminating semicolon or closing subdict brace.

- **Block & Key Formatting:** Excluded multiline list/dict entries from single-line key column alignment (`max_key_len`) so multiline keys like `features` are formatted cleanly on their own line (`key\n(\n...\n);`) without trailing key padding.

- **Comment Spacing:** Updated `FoamDict::to_foam_indent` to skip adding extra empty lines after comment elements (`FoamElement::Comment` and `FoamElement::HeaderBanner`), ensuring comments remain directly adjacent to the elements they document.

- **Type Inference:** Refactored `FoamValue::fmt` match arms to return `write!` macro expressions directly without block scope statements.
