# Changelog

## Ongoing Development

### 2026-09-09 - Fixed

- **Entry Value Parsing:** Resolved premature entry termination when encountering nested semicolons inside multiline lists or subdicts (e.g. `features ({ file "mainWalls.eMesh"; level 2; });`). The parser now tracks parentheses `()`, braces `{}`, string quotes (`"`, `'`), and comments (`//`, `/* */`) to ensure values are read until the outer terminating semicolon or closing subdict brace.

- **Block & Key Formatting:** Excluded multiline list/dict entries from single-line key column alignment (`max_key_len`) so multiline keys like `features` are formatted cleanly on their own line (`key\n(\n...\n);`) without trailing key padding.

- **Comment Spacing:** Updated `FoamDict::to_foam_indent` to skip adding extra empty lines after comment elements (`FoamElement::Comment` and `FoamElement::HeaderBanner`), ensuring comments remain directly adjacent to the elements they document.

- **Type Inference:** Refactored `FoamValue::fmt` match arms to return `write!` macro expressions directly without block scope statements.
