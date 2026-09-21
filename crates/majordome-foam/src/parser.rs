#![deny(clippy::unwrap_used)]
#![deny(clippy::expect_used)]
#![deny(clippy::panic)]
#![deny(unused_must_use)]
#![deny(warnings)]

use crate::ast::{FieldData, FoamDict, FoamElement, FoamValue};
use std::fmt;

#[derive(Debug)]
pub struct FoamParseError {
    pub message: String,
    pub line: usize,
}

impl fmt::Display for FoamParseError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // 'return' used just to avoid Rust-analyzer type inference issues;
        return write!(f, "Parse error at line {}: {}", self.line, self.message);
    }
}

impl std::error::Error for FoamParseError {}

fn is_enclosed_in_parens(s: &str) -> bool {
    if !s.starts_with('(') || !s.ends_with(')') {
        return false;
    }
    let mut depth: usize = 0;
    for (i, ch) in s.char_indices() {
        if ch == '(' {
            depth += 1;
        } else if ch == ')' {
            if depth == 0 {
                return false;
            }
            depth -= 1;
            if depth == 0 && i + ch.len_utf8() < s.len() {
                return false;
            }
        }
    }
    depth == 0
}

fn parse_key_name(
    chars: &mut std::iter::Peekable<std::str::Chars<'_>>,
    line_num: &mut usize,
) -> String {
    let mut name = String::new();

    // Quoted key branch: handles explicit string keys (e.g. boundary patch
    // regular expression patterns like "inlet.*" or "wall_.*").
    if let Some(&'"') = chars.peek() {
        name.push('"');
        chars.next();
        let mut escaped = false;

        while let Some(&ch) = chars.peek() {
            name.push(ch);
            chars.next();

            if ch == '\n' {
                *line_num += 1;
            }

            // Handle backslash escape sequences inside double-quoted keys.
            if escaped {
                escaped = false;
            } else if ch == '\\' {
                escaped = true;
            } else if ch == '"' {
                break;
            }
        }
    } else {
        // Unquoted key branch: handles standard identifiers as well as keys
        // containing embedded mathematical functions and balanced parentheses
        // (e.g. div(phi,U), div(phi,Yi_h), div((nuEff*dev2(T(grad(U)))))).
        let mut paren_depth: usize = 0;

        while let Some(&ch) = chars.peek() {
            // Track parenthesis nesting depth to ensure spaces inside function
            // calls (such as 'div(phi, U)') do not prematurely split the key name.
            if ch == '(' {
                paren_depth += 1;
            } else if ch == ')' {
                if paren_depth > 0 {
                    paren_depth -= 1;
                }
            // Dictionary structural delimiters always terminate key tokens.
            } else if ch == ';' || ch == '{' || ch == '}' {
                break;
            // Whitespace terminates an unquoted key only when outside parentheses.
            } else if ch.is_whitespace() && paren_depth == 0 {
                break;
            }

            if ch == '\n' {
                *line_num += 1;
            }

            name.push(ch);
            chars.next();
        }
    }

    name
}

/// Parse an OpenFOAM dictionary string into a `FoamDict` AST.
pub fn parse_foam_dict(input: &str) -> Result<FoamDict, FoamParseError> {
    let mut dict = FoamDict::new();
    let mut chars = input.chars().peekable();
    let mut line_num = 1;

    // Top-level token dispatcher loop across characters in the input stream.
    while let Some(&c) = chars.peek() {
        // Skip whitespace and track line count for parse error reporting.
        if c.is_whitespace() {
            if c == '\n' {
                line_num += 1;
            }

            chars.next();
            continue;
        }

        // Tolerant parser branch: skip redundant/stray semicolons commonly found
        // in user-edited OpenFOAM dictionaries.
        if c == ';' {
            chars.next();
            continue;
        }

        // Comment dispatcher: handles single-line and multi-line C++ comments.
        if c == '/' {
            chars.next();

            match chars.peek() {
                // Single-line comment: '// ... \n'.
                Some('/') => {
                    chars.next();
                    let mut comment = String::from("//");

                    for ch in chars.by_ref() {
                        if ch == '\n' {
                            line_num += 1;
                            break;
                        }

                        comment.push(ch);
                    }

                    dict.elements.push(FoamElement::Comment(comment));
                    continue;
                }

                // Multi-line block comment: '/* ... */'.
                Some('*') => {
                    chars.next();
                    let mut comment = String::from("/*");
                    let mut is_banner = false;

                    for ch in chars.by_ref() {
                        comment.push(ch);

                        if ch == '\n' {
                            line_num += 1;
                        }

                        // Header banner detection: distinguishes standard OpenFOAM
                        // copyright banner from arbitrary user block comments.
                        if comment.contains("OpenFOAM: The Open Source CFD Toolbox") {
                            is_banner = true;
                        }

                        if comment.ends_with("*/") {
                            break;
                        }
                    }

                    if is_banner {
                        dict.elements.push(FoamElement::HeaderBanner(comment));
                    } else {
                        dict.elements.push(FoamElement::Comment(comment));
                    }

                    continue;
                }

                // Isolated '/' character is invalid syntax outside comments.
                _ => {
                    return Err(FoamParseError {
                        message: "Unexpected '/' character".to_string(),
                        line: line_num,
                    });
                }
            }
        }

        // Preprocessor directive branch: e.g. #include, #includeEtc, #calc.
        if c == '#' {
            let mut directive = String::new();
            while let Some(&ch) = chars.peek() {
                if ch.is_whitespace() {
                    break;
                }

                directive.push(ch);
                chars.next();
            }

            skip_whitespace(&mut chars, &mut line_num);

            let mut val_str = String::new();
            while let Some(&ch) = chars.peek() {
                if ch == ';' || ch == '\n' {
                    if ch == ';' {
                        chars.next();
                    }

                    break;
                }

                val_str.push(ch);
                chars.next();
            }

            dict.elements.push(FoamElement::Directive {
                name: directive,
                value: val_str.trim().to_string(),
            });

            continue;
        }

        // Macro reference branch: e.g. '$species;' or '$defaultSchemes;'.
        if c == '$' {
            let mut macro_name = String::new();
            chars.next();

            while let Some(&ch) = chars.peek() {
                if ch == ';' || ch.is_whitespace() {
                    if ch == ';' {
                        chars.next();
                    }

                    break;
                }

                macro_name.push(ch);
                chars.next();
            }

            dict.elements.push(FoamElement::MacroRef(macro_name));
            continue;
        }

        // Standalone field data branch: detects top-level data lists
        // (such as coordinates in polyMesh/points or face indices in polyMesh/faces).
        if is_field_data_start(&chars) {
            let field_data = parse_standalone_field_data(&mut chars, &mut line_num)?;
            dict.elements.push(FoamElement::FieldData(field_data));
            continue;
        }

        let name = parse_key_name(&mut chars, &mut line_num);

        if name.is_empty() {
            chars.next();
            continue;
        }

        skip_whitespace(&mut chars, &mut line_num);

        // Subdictionary block branch: '{ ... }' detected following a key name.
        if let Some(&'{') = chars.peek() {
            chars.next();

            let inner_dict = parse_subdict(&mut chars, &mut line_num)?;

            // Check for optional trailing semicolon on block definitions
            // (e.g. named scheme sub-blocks in fvSchemes/divSchemes).
            let has_semicolon = if let Some(&';') = chars.peek() {
                chars.next();
                true
            } else {
                false
            };

            dict.elements.push(FoamElement::Block {
                name,
                dict: inner_dict,
                has_semicolon,
            });

            continue;
        }

        // Key-value entry branch: read raw value up to terminating ';' and parse AST node.
        let raw_val = parse_entry_value_raw(&mut chars, &mut line_num);
        let val_str = raw_val.trim();
        let value = parse_value_str(val_str);

        dict.elements.push(FoamElement::Entry { key: name, value });
    }

    Ok(dict)
}

fn parse_subdict(
    chars: &mut std::iter::Peekable<std::str::Chars<'_>>,
    line_num: &mut usize,
) -> Result<FoamDict, FoamParseError> {
    let mut dict = FoamDict::new();

    while let Some(&c) = chars.peek() {
        // Closing brace denotes end of subdictionary block.
        if c == '}' {
            chars.next();
            return Ok(dict);
        }

        // Whitespace handling: track line numbers on newline.
        if c.is_whitespace() {
            if c == '\n' {
                *line_num += 1;
            }

            chars.next();
            continue;
        }

        // Stray semicolons inside dictionary scope are ignored.
        if c == ';' {
            chars.next();
            continue;
        }

        // Comment handling: C++ single-line (//) or C block (/* ... */).
        if c == '/' {
            chars.next();

            match chars.peek() {
                Some('/') => {
                    // Line comment: consume until newline.
                    chars.next();
                    let mut comment = String::from("//");

                    for ch in chars.by_ref() {
                        if ch == '\n' {
                            *line_num += 1;
                            break;
                        }

                        comment.push(ch);
                    }

                    dict.elements.push(FoamElement::Comment(comment));
                    continue;
                }

                Some('*') => {
                    // Block comment: consume until closing delimiter "*/".
                    chars.next();
                    let mut comment = String::from("/*");

                    for ch in chars.by_ref() {
                        comment.push(ch);

                        if ch == '\n' {
                            *line_num += 1;
                        }

                        if comment.ends_with("*/") {
                            break;
                        }
                    }

                    dict.elements.push(FoamElement::Comment(comment));
                    continue;
                }

                _ => {
                    // Isolated '/' character not starting a comment.
                    return Err(FoamParseError {
                        message: "Unexpected '/' character".to_string(),
                        line: *line_num,
                    });
                }
            }
        }

        // Preprocessor directive (e.g. #include, #calc, #includeEtc).
        if c == '#' {
            let mut directive = String::new();

            while let Some(&ch) = chars.peek() {
                if ch.is_whitespace() {
                    break;
                }

                directive.push(ch);
                chars.next();
            }

            skip_whitespace(chars, line_num);

            let mut val_str = String::new();

            while let Some(&ch) = chars.peek() {
                if ch == ';' || ch == '\n' {
                    if ch == ';' {
                        chars.next();
                    }

                    break;
                }

                val_str.push(ch);
                chars.next();
            }

            dict.elements.push(FoamElement::Directive {
                name: directive,
                value: val_str.trim().to_string(),
            });

            continue;
        }

        // Macro variable substitution reference (e.g. $defaultMacro;).
        if c == '$' {
            let mut macro_name = String::new();
            chars.next();

            while let Some(&ch) = chars.peek() {
                if ch == ';' || ch.is_whitespace() {
                    if ch == ';' {
                        chars.next();
                    }

                    break;
                }

                macro_name.push(ch);
                chars.next();
            }

            dict.elements.push(FoamElement::MacroRef(macro_name));
            continue;
        }

        let name = parse_key_name(chars, line_num);

        if name.is_empty() {
            chars.next();
            continue;
        }

        skip_whitespace(chars, line_num);

        // Nested subdictionary block branch: '{ ... }'.
        if let Some(&'{') = chars.peek() {
            chars.next();

            let inner = parse_subdict(chars, line_num)?;

            // Optional trailing semicolon after nested subdictionary block.
            let has_semicolon = if let Some(&';') = chars.peek() {
                chars.next();
                true
            } else {
                false
            };

            dict.elements.push(FoamElement::Block {
                name,
                dict: inner,
                has_semicolon,
            });

            continue;
        }

        // Key-value entry branch: read raw value up to terminating ';'.
        let raw_val = parse_entry_value_raw(chars, line_num);
        let val_str = raw_val.trim();
        let value = parse_value_str(val_str);

        dict.elements.push(FoamElement::Entry { key: name, value });
    }

    Ok(dict)
}

fn parse_entry_value_raw(
    chars: &mut std::iter::Peekable<std::str::Chars<'_>>,
    line_num: &mut usize,
) -> String {
    let mut raw_val = String::new();
    let mut paren_depth: usize = 0;
    let mut brace_depth: usize = 0;
    let mut in_string = false;
    let mut in_single_quote = false;
    let mut escaped = false;
    let mut in_line_comment = false;
    let mut in_block_comment = false;

    while let Some(&ch) = chars.peek() {
        // Line comment inside entry: consume until newline.
        if in_line_comment {
            if ch == '\n' {
                *line_num += 1;
                in_line_comment = false;
            }

            raw_val.push(ch);
            chars.next();
            continue;
        }

        // Block comment inside entry: consume until "*/".
        if in_block_comment {
            if ch == '\n' {
                *line_num += 1;
            }

            if raw_val.ends_with('*') && ch == '/' {
                in_block_comment = false;
            }

            raw_val.push(ch);
            chars.next();
            continue;
        }

        // Double-quoted string literal: ignore delimiters and semicolons.
        if in_string {
            if ch == '\n' {
                *line_num += 1;
            }

            if escaped {
                escaped = false;
            } else if ch == '\\' {
                escaped = true;
            } else if ch == '"' {
                in_string = false;
            }

            raw_val.push(ch);
            chars.next();
            continue;
        }

        // Single-quoted literal (e.g. regex patterns in boundary conditions).
        if in_single_quote {
            if ch == '\n' {
                *line_num += 1;
            }

            if escaped {
                escaped = false;
            } else if ch == '\\' {
                escaped = true;
            } else if ch == '\'' {
                in_single_quote = false;
            }

            raw_val.push(ch);
            chars.next();
            continue;
        }

        // Comment starter detection ('//' or '/*') within unquoted text.
        if ch == '/' {
            raw_val.push(ch);
            chars.next();

            if let Some(&next_ch) = chars.peek() {
                if next_ch == '/' {
                    in_line_comment = true;
                    raw_val.push(next_ch);
                    chars.next();
                } else if next_ch == '*' {
                    in_block_comment = true;
                    raw_val.push(next_ch);
                    chars.next();
                }
            }

            continue;
        }

        // Opening double quote.
        if ch == '"' {
            in_string = true;
            raw_val.push(ch);
            chars.next();
            continue;
        }

        // Opening single quote.
        if ch == '\'' {
            in_single_quote = true;
            raw_val.push(ch);
            chars.next();
            continue;
        }

        // Nested parentheses tracking (e.g. vector lists or fvSchemes terms).
        if ch == '(' {
            paren_depth += 1;
            raw_val.push(ch);
            chars.next();
            continue;
        }

        if ch == ')' {
            if paren_depth > 0 {
                paren_depth -= 1;
            }

            raw_val.push(ch);
            chars.next();
            continue;
        }

        // Nested brace tracking (e.g. inline dictionary features in snappyHexMesh).
        if ch == '{' {
            brace_depth += 1;
            raw_val.push(ch);
            chars.next();
            continue;
        }

        // Closing brace handling: exit if outermost level of subdict reached.
        if ch == '}' {
            if brace_depth > 0 {
                brace_depth -= 1;
                raw_val.push(ch);
                chars.next();
                continue;
            } else if paren_depth == 0 {
                break;
            }
        }

        // Semicolon terminating entry value when outside parens and braces.
        if ch == ';' && paren_depth == 0 && brace_depth == 0 {
            chars.next();
            break;
        }

        if ch == '\n' {
            *line_num += 1;
        }

        raw_val.push(ch);
        chars.next();
    }

    raw_val
}

fn skip_whitespace(chars: &mut std::iter::Peekable<std::str::Chars<'_>>, line_num: &mut usize) {
    while let Some(&ch) = chars.peek() {
        if ch.is_whitespace() {
            if ch == '\n' {
                *line_num += 1;
            }

            chars.next();
        } else {
            break;
        }
    }
}

fn is_field_data_start(chars: &std::iter::Peekable<std::str::Chars<'_>>) -> bool {
    let mut peek_iter = chars.clone();

    if let Some(&c) = peek_iter.peek() {
        // Direct list start '(' typical of points or faces lists.
        if c == '(' {
            return true;
        }

        // Count-prefixed field data (e.g. '10 (' or '10(').
        if c.is_ascii_digit() {
            while let Some(&ch) = peek_iter.peek() {
                if ch.is_ascii_digit() {
                    peek_iter.next();
                } else {
                    break;
                }
            }

            while let Some(&ch) = peek_iter.peek() {
                if ch.is_whitespace() {
                    peek_iter.next();
                } else {
                    break;
                }
            }

            if let Some(&'(') = peek_iter.peek() {
                return true;
            }
        }

        // Nonuniform field data keyword prefix (e.g. nonuniform List<scalar>).
        if c == 'n' {
            let mut word = String::new();

            while let Some(&ch) = peek_iter.peek() {
                if ch.is_ascii_alphanumeric() || ch == '_' {
                    word.push(ch);
                    peek_iter.next();
                } else {
                    break;
                }
            }

            if word == "nonuniform" {
                return true;
            }
        }
    }

    false
}

fn parse_standalone_field_data(
    chars: &mut std::iter::Peekable<std::str::Chars<'_>>,
    line_num: &mut usize,
) -> Result<FieldData, FoamParseError> {
    skip_whitespace(chars, line_num);

    let mut field_type: Option<String> = None;
    let mut count: Option<usize> = None;
    let mut compact_format = false;

    // Check if field data starts with "uniform" keyword (e.g. uniform 300;).
    let is_uniform = {
        let mut test_chars = chars.clone();
        let mut word = String::new();

        while let Some(&ch) = test_chars.peek() {
            if ch.is_ascii_alphanumeric() || ch == '_' {
                word.push(ch);
                test_chars.next();
            } else {
                break;
            }
        }

        word == "uniform"
    };

    // Uniform field branch: consume keyword and parse single inner value.
    if is_uniform {
        for _ in 0..7 {
            chars.next();
        }

        skip_whitespace(chars, line_num);
        let mut val_str = String::new();

        while let Some(&ch) = chars.peek() {
            if ch == ';' || ch == '\n' {
                if ch == ';' {
                    chars.next();
                }

                break;
            }

            val_str.push(ch);
            chars.next();
        }

        let inner_val = parse_value_str_inner(val_str.trim());

        return Ok(FieldData::uniform(inner_val, true));
    }

    // Check if field data starts with "nonuniform" keyword.
    let is_nonuniform = {
        let mut test_chars = chars.clone();
        let mut word = String::new();

        while let Some(&ch) = test_chars.peek() {
            if ch.is_ascii_alphanumeric() || ch == '_' {
                word.push(ch);
                test_chars.next();
            } else {
                break;
            }
        }

        word == "nonuniform"
    };

    // Nonuniform field branch: consume keyword and optional type (e.g. List<scalar>).
    if is_nonuniform {
        for _ in 0..10 {
            chars.next();
        }

        skip_whitespace(chars, line_num);

        if let Some(&c) = chars.peek() {
            if c != '(' && !c.is_ascii_digit() {
                let mut type_str = String::new();

                while let Some(&ch) = chars.peek() {
                    if ch.is_whitespace() || ch == '(' {
                        break;
                    }

                    type_str.push(ch);
                    chars.next();
                }

                if !type_str.is_empty() {
                    field_type = Some(type_str);
                }
            }
        }
    }

    skip_whitespace(chars, line_num);

    // Parse optional element count prefix (e.g. 10 (...)).
    if let Some(&c) = chars.peek() {
        if c.is_ascii_digit() {
            let mut num_str = String::new();

            while let Some(&ch) = chars.peek() {
                if ch.is_ascii_digit() {
                    num_str.push(ch);
                    chars.next();
                } else {
                    break;
                }
            }

            if let Ok(n) = num_str.parse::<usize>() {
                count = Some(n);
            }

            // Compact format indicator: '(' directly follows count without newline.
            if let Some(&'(') = chars.peek() {
                compact_format = true;
            }
        }
    }

    skip_whitespace(chars, line_num);

    // Expect '(' beginning the array of field data values.
    if let Some(&'(') = chars.peek() {
        chars.next();
    } else {
        return Err(FoamParseError {
            message: "Expected '(' in field data".to_string(),
            line: *line_num,
        });
    }

    let mut inside = String::new();
    let mut depth: usize = 1;

    // Read balanced parentheses content of field array.
    while let Some(&ch) = chars.peek() {
        if ch == '(' {
            depth += 1;
            inside.push(ch);
            chars.next();
        } else if ch == ')' {
            depth -= 1;

            if depth == 0 {
                chars.next();
                break;
            }

            inside.push(ch);
            chars.next();
        } else {
            if ch == '\n' {
                *line_num += 1;
            }

            inside.push(ch);
            chars.next();
        }
    }

    // Check for optional trailing semicolon after field data block.
    let mut has_semicolon = false;
    let mut check_chars = chars.clone();
    let mut check_line = *line_num;
    skip_whitespace(&mut check_chars, &mut check_line);

    if let Some(&';') = check_chars.peek() {
        skip_whitespace(chars, line_num);
        chars.next();
        has_semicolon = true;
    }

    let values = parse_field_items(&inside, compact_format);

    Ok(FieldData {
        is_uniform: false,
        field_type,
        count,
        values,
        has_semicolon,
        compact_format,
    })
}

fn parse_field_items(input: &str, _compact: bool) -> Vec<FoamValue> {
    let mut items = Vec::new();
    let trimmed = input.trim();

    // Return empty list if input has no non-whitespace characters.
    if trimmed.is_empty() {
        return items;
    }

    // Branch: items contain parentheses (e.g. vectors, compounds, or sublists).
    if trimmed.contains('(') {
        let mut chars = trimmed.chars().peekable();

        while let Some(&c) = chars.peek() {
            // Skip whitespace separators between field items.
            if c.is_whitespace() {
                chars.next();
                continue;
            }

            // Skip line comments inside field lists.
            if c == '/' {
                chars.next();

                if let Some(&'/') = chars.peek() {
                    for ch in chars.by_ref() {
                        if ch == '\n' {
                            break;
                        }
                    }

                    continue;
                }
            }

            // Vector or tuple element starting with '('.
            if c == '(' {
                chars.next();
                let mut paren_content = String::new();
                let mut depth = 1;

                while let Some(&ch) = chars.peek() {
                    if ch == '(' {
                        depth += 1;
                        paren_content.push(ch);
                        chars.next();
                    } else if ch == ')' {
                        depth -= 1;

                        if depth == 0 {
                            chars.next();
                            break;
                        }

                        paren_content.push(ch);
                        chars.next();
                    } else {
                        paren_content.push(ch);
                        chars.next();
                    }
                }

                let inner_nums: Vec<f64> = paren_content
                    .split_whitespace()
                    .filter_map(|s| s.parse::<f64>().ok())
                    .collect();

                let vector_val = FoamValue::Vector(inner_nums);

                // Collect trailing tokens on the same line (e.g. cell indices).
                let mut trailing_line = String::new();

                while let Some(&ch) = chars.peek() {
                    if ch == '\n' {
                        chars.next();
                        break;
                    }

                    if ch == '(' {
                        break;
                    }

                    trailing_line.push(ch);
                    chars.next();
                }

                let trailing_tokens: Vec<&str> =
                    trailing_line.split_whitespace().collect();

                // Standalone vector vs compound (vector + trailing scalars/ints).
                if trailing_tokens.is_empty() {
                    items.push(vector_val);
                } else {
                    let mut comp = vec![vector_val];

                    for tok in trailing_tokens {
                        if let Ok(i) = tok.parse::<i64>() {
                            comp.push(FoamValue::Int(i));
                        } else if let Ok(f) = tok.parse::<f64>() {
                            comp.push(FoamValue::Scalar(f));
                        } else {
                            comp.push(FoamValue::String(tok.to_string()));
                        }
                    }

                    items.push(FoamValue::Compound(comp));
                }
            } else {
                // Token preceding nested parens (e.g. face size '4(0 1 2 3)').
                let mut token = String::new();

                while let Some(&ch) = chars.peek() {
                    if ch == '(' || ch.is_whitespace() {
                        break;
                    }

                    token.push(ch);
                    chars.next();
                }

                // If followed by '(', parse sub-items list (e.g. face indices).
                if let Some(&'(') = chars.peek() {
                    chars.next();
                    let mut paren_content = String::new();
                    let mut depth = 1;

                    while let Some(&ch) = chars.peek() {
                        if ch == '(' {
                            depth += 1;
                            paren_content.push(ch);
                            chars.next();
                        } else if ch == ')' {
                            depth -= 1;

                            if depth == 0 {
                                chars.next();
                                break;
                            }

                            paren_content.push(ch);
                            chars.next();
                        } else {
                            paren_content.push(ch);
                            chars.next();
                        }
                    }

                    let sub_items: Vec<FoamValue> = paren_content
                        .split_whitespace()
                        .map(|s| {
                            if let Ok(i) = s.parse::<i64>() {
                                FoamValue::Int(i)
                            } else if let Ok(f) = s.parse::<f64>() {
                                FoamValue::Scalar(f)
                            } else {
                                FoamValue::String(s.to_string())
                            }
                        })
                        .collect();

                    items.push(FoamValue::List(sub_items));
                } else if !token.is_empty() {
                    // Standalone integer, scalar, or string token.
                    if let Ok(i) = token.parse::<i64>() {
                        items.push(FoamValue::Int(i));
                    } else if let Ok(f) = token.parse::<f64>() {
                        items.push(FoamValue::Scalar(f));
                    } else {
                        items.push(FoamValue::String(token));
                    }
                }
            }
        }
    } else {
        // Flat list branch: whitespace-separated numbers or strings without '('.
        for token in trimmed.split_whitespace() {
            if let Ok(i) = token.parse::<i64>() {
                items.push(FoamValue::Int(i));
            } else if let Ok(f) = token.parse::<f64>() {
                items.push(FoamValue::Scalar(f));
            } else {
                items.push(FoamValue::String(token.to_string()));
            }
        }
    }

    items
}

fn parse_field_data_from_str(s: &str) -> Option<FieldData> {
    let s_clean = s.trim();

    // Uniform field value branch (e.g. uniform (0 0 0);).
    if let Some(rest) = s_clean.strip_prefix("uniform") {
        let rest_clean = rest.trim();

        if !rest_clean.is_empty() {
            let inner_val = parse_value_str_inner(rest_clean);

            return Some(FieldData::uniform(inner_val, true));
        }
    }

    // Detect nonuniform or count-prefixed field patterns (e.g. 10 (...)).
    let is_field = s_clean.starts_with("nonuniform")
        || s_clean.starts_with("List<")
        || {
            let first_token = s_clean.split_whitespace().next().unwrap_or("");

            if let Some(pos) = first_token.find('(') {
                pos > 0
                    && first_token[..pos]
                        .chars()
                        .all(|c| c.is_ascii_digit())
            } else if !first_token.is_empty()
                && first_token.chars().all(|c| c.is_ascii_digit())
            {
                let after = s_clean[first_token.len()..].trim_start();
                after.starts_with('(')
            } else {
                false
            }
        };

    // Parse detected field data block.
    if is_field {
        let mut chars = s_clean.chars().peekable();
        let mut line_num = 1;

        if let Ok(mut fd) = parse_standalone_field_data(&mut chars, &mut line_num) {
            fd.has_semicolon = true;

            return Some(fd);
        }
    }

    None
}

fn parse_list_items(inner: &str) -> Vec<FoamValue> {
    let mut items = Vec::new();
    let mut chars = inner.chars().peekable();

    while let Some(&c) = chars.peek() {
        // Skip whitespace between list elements.
        if c.is_whitespace() {
            chars.next();
            continue;
        }

        // Skip line comments (//) inside list definitions.
        if c == '/' {
            let mut clone = chars.clone();
            clone.next();

            if let Some('/') = clone.peek() {
                chars.next();
                chars.next();

                for ch in chars.by_ref() {
                    if ch == '\n' {
                        break;
                    }
                }

                continue;
            }
        }

        // Block dictionary element enclosed in braces '{...}'
        if c == '{' {
            chars.next();
            let mut line_num = 1;
            let subdict = parse_subdict(&mut chars, &mut line_num).unwrap_or_default();
            items.push(FoamValue::Dict(subdict));
            continue;
        }

        // Sublist or vector enclosed in parentheses '(...)'
        if c == '(' {
            chars.next();
            let mut sub_content = String::new();
            let mut depth = 1;

            while let Some(&ch) = chars.peek() {
                if ch == '(' {
                    depth += 1;
                    sub_content.push(ch);
                    chars.next();
                } else if ch == ')' {
                    depth -= 1;
                    chars.next();

                    if depth == 0 {
                        break;
                    }

                    sub_content.push(ch);
                } else {
                    sub_content.push(ch);
                    chars.next();
                }
            }

            let sub_val = parse_value_str_inner(
                &format!("({})", sub_content.trim())
            );

            items.push(sub_val);
        // Quoted string literal branch (preserving exact string content).
        } else if c == '"' || c == '\'' {
            let quote = c;
            chars.next();
            let mut s = String::new();

            while let Some(&ch) = chars.peek() {
                chars.next();

                if ch == quote {
                    break;
                }

                s.push(ch);
            }

            items.push(FoamValue::String(s));
        // Unquoted token branch (number, bool, or unquoted identifier / named sub-block).
        } else {
            let mut token = String::new();

            while let Some(&ch) = chars.peek() {
                if ch.is_whitespace() || ch == '(' || ch == ')' || ch == '{' || ch == '}' || ch == ';' {
                    break;
                }

                token.push(ch);
                chars.next();
            }

            if !token.is_empty() {
                // Check if next non-whitespace char is '{' (named sub-block inside list, e.g. solid { ... })
                let mut is_named_block = false;
                while let Some(&next_c) = chars.peek() {
                    if next_c.is_whitespace() {
                        chars.next();
                    } else if next_c == '{' {
                        is_named_block = true;
                        chars.next();
                        break;
                    } else {
                        break;
                    }
                }

                if is_named_block {
                    let mut line_num = 1;
                    let inner_dict = parse_subdict(&mut chars, &mut line_num).unwrap_or_default();
                    let mut d = FoamDict::new();
                    d.elements.push(FoamElement::Block {
                        name: token,
                        dict: inner_dict,
                        has_semicolon: false,
                    });
                    items.push(FoamValue::Dict(d));
                } else {
                    let parsed = parse_value_str_inner(&token);

                    // Preserve non-numeric unquoted identifiers as Raw tokens.
                    if let FoamValue::String(s) = parsed {
                        items.push(FoamValue::Raw(s));
                    } else {
                        items.push(parsed);
                    }
                }
            } else {
                chars.next();
            }
        }
    }

    items
}

fn parse_value_str_inner(s: &str) -> FoamValue {
    let s_clean = s.trim();

    // Empty string representation.
    if s_clean.is_empty() {
        return FoamValue::String(String::new());
    }

    // Boolean true aliases: "true", "on", "yes".
    if s_clean == "true" || s_clean == "on" || s_clean == "yes" {
        return FoamValue::Bool(true);
    }

    // Boolean false aliases: "false", "off", "no".
    if s_clean == "false" || s_clean == "off" || s_clean == "no" {
        return FoamValue::Bool(false);
    }

    // 64-bit signed integer parse.
    if let Ok(i) = s_clean.parse::<i64>() {
        return FoamValue::Int(i);
    }

    // 64-bit IEEE floating-point scalar parse.
    if let Ok(f) = s_clean.parse::<f64>() {
        return FoamValue::Scalar(f);
    }

    // Parenthesized list or vector branch: '( ... )'.
    if is_enclosed_in_parens(s_clean) {
        let inner = s_clean[1..s_clean.len() - 1].trim();

        if inner.is_empty() {
            return FoamValue::List(Vec::new());
        }

        return FoamValue::List(parse_list_items(inner));
    }

    // Table property function branch: 'table ( ... )'.
    if let Some(after) = s_clean.strip_prefix("table") {
        let after_clean = after.trim();
        if is_enclosed_in_parens(after_clean) {
            let inner = after_clean[1..after_clean.len() - 1].trim();
            if inner.starts_with("#include") {
                let inc_val = inner
                    .strip_prefix("#include")
                    .unwrap_or("")
                    .trim()
                    .trim_matches(';')
                    .trim()
                    .trim_matches('"');
                let mut d = FoamDict::new();
                d.add_include(inc_val);
                let mut wrap = FoamDict::new();
                wrap.elements.push(FoamElement::Block {
                    name: "table".to_string(),
                    dict: d,
                    has_semicolon: false,
                });
                return FoamValue::Dict(wrap);
            } else {
                let table_items = parse_list_items(inner);
                let mut d = FoamDict::new();
                d.elements.push(FoamElement::Entry {
                    key: "table".to_string(),
                    value: FoamValue::List(table_items),
                });
                return FoamValue::Dict(d);
            }
        }
    }



    // Dimension set branch: bracketed 7-element vector '[0 2 -1 0 0 0 0]'.
    if s_clean.starts_with('[') && s_clean.ends_with(']') {
        let inner = s_clean[1..s_clean.len() - 1].trim();
        let parts: Vec<&str> = inner.split_whitespace().collect();

        if let Ok(dims) = parts
            .iter()
            .map(|p| p.parse::<i32>())
            .collect::<Result<Vec<i32>, _>>()
        {
            return FoamValue::DimensionSet(dims);
        }
    }

    // Macro reference variable substitution branch (e.g. $internalField).
    if let Some(rest) = s_clean.strip_prefix('$') {
        return FoamValue::MacroRef(rest.to_string());
    }

    // Fallback: unquoted or quoted string.
    FoamValue::String(s_clean.to_string())
}

fn parse_value_str(s: &str) -> FoamValue {
    let s_clean = s.trim();

    if s_clean.is_empty() {
        return FoamValue::String(String::new());
    }

    // Prioritize parsing as field data (uniform, nonuniform, or list data).
    if let Some(fd) = parse_field_data_from_str(s_clean) {
        return FoamValue::Field(fd);
    }

    // Fallback to standard scalar/list/string parsing.
    parse_value_str_inner(s_clean)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::Path;

    #[test]
    fn test_parse_entry_with_nested_semicolons() -> Result<(), FoamParseError> {
        let input = r#"
castellatedMeshControls
{
    features
    (
        { file "mainWalls.eMesh"; level 2; }
        { file "wallsReactor.eMesh"; level 2; }
    );
    minRefinementCells 10;
}
"#;
        let dict = parse_foam_dict(input)?;
        assert_eq!(dict.keys(), vec!["castellatedMeshControls"]);
        let serialized = dict.to_foam();
        assert!(serialized.contains("castellatedMeshControls"));
        assert!(serialized.contains("features"));
        assert!(serialized.contains("minRefinementCells"));
        assert!(serialized.trim().ends_with('}'));

        Ok(())
    }

    #[test]
    fn test_parse_subdict_with_stray_semicolons_and_comments() -> Result<(), FoamParseError> {
        let input = r#"
divSchemes
{
    default         none;
    ;
    // Comment with semicolon;
    div(phi,U)      Gauss linearUpwind grad(U);;
    div(phi, U)     Gauss linear;
    div((nuEff*dev2(T(grad(U))))) Gauss linear;
    $defaultMacro;
    #include "subDictInclude"
}
"#;
        let d = parse_foam_dict(input)?;
        assert_eq!(d.keys(), vec!["divSchemes"]);
        assert!(d.get_path("divSchemes/default").is_some());
        assert!(d.get_path("divSchemes/div(phi,U)").is_some());
        assert!(d.get_path("divSchemes/div(phi, U)").is_some());
        assert!(d.get_path("divSchemes/div((nuEff*dev2(T(grad(U)))))").is_some());

        Ok(())
    }

    #[test]
    fn test_parse_pitz_daily_fv_schemes() -> Result<(), Box<dyn std::error::Error>> {
        let path = Path::new("../../docs/data/foam/cases/01-pitzDaily/system/fvSchemes");

        if path.exists() {
            let content = std::fs::read_to_string(path)?;
            let dict = parse_foam_dict(&content)?;
            assert!(dict.keys().contains(&"divSchemes".to_string()));
            assert!(dict.get_path("divSchemes/default").is_some());
            assert!(dict.get_path("divSchemes/div(phi,U)").is_some());
            assert!(dict.get_path("divSchemes/div((nuEff*dev2(T(grad(U)))))").is_some());
        }

        Ok(())
    }

    #[test]
    fn test_parse_lagrangian_cloud_t() -> Result<(), Box<dyn std::error::Error>> {
        let path = Path::new("../../docs/data/foam/cases/01-pitzDaily/1/lagrangian/cloud/T");

        if path.exists() {
            let content = std::fs::read_to_string(path)?;
            let dict = parse_foam_dict(&content)?;
            let fd = dict.field_data().expect("Expected field data in cloud/T");
            assert_eq!(fd.count, Some(1));
            assert_eq!(fd.values.len(), 1);
            assert!(matches!(fd.values[0], FoamValue::Scalar(s) if (s - 1908.595286).abs() < 1e-5));
            assert!(dict.to_foam().contains("1(1908.595286)"));
        }

        Ok(())
    }

    #[test]
    fn test_parse_lagrangian_cloud_u() -> Result<(), Box<dyn std::error::Error>> {
        let path = Path::new("../../docs/data/foam/cases/01-pitzDaily/1/lagrangian/cloud/U");

        if path.exists() {
            let content = std::fs::read_to_string(path)?;
            let dict = parse_foam_dict(&content)?;
            let fd = dict.field_data().expect("Expected field data in cloud/U");
            assert_eq!(fd.count, Some(1));
            assert_eq!(fd.values.len(), 1);
            assert!(matches!(&fd.values[0], FoamValue::Vector(v) if v.len() == 3));
            assert!(dict.to_foam().contains("1((0 0 0))"));
        }

        Ok(())
    }

    #[test]
    fn test_parse_lagrangian_cloud_positions() -> Result<(), Box<dyn std::error::Error>> {
        let path = Path::new("../../docs/data/foam/cases/01-pitzDaily/1/lagrangian/cloud/positions");

        if path.exists() {
            let content = std::fs::read_to_string(path)?;
            let dict = parse_foam_dict(&content)?;
            let fd = dict.field_data().expect("Expected field data in cloud/positions");
            assert_eq!(fd.count, Some(1));
            assert_eq!(fd.values.len(), 1);
            assert!(dict.to_foam().contains("1098 2653 1"));
        }

        Ok(())
    }

    #[test]
    fn test_parse_pitz_daily_1_p() -> Result<(), Box<dyn std::error::Error>> {
        let path = Path::new("../../docs/data/foam/cases/01-pitzDaily/1/p");

        if path.exists() {
            let content = std::fs::read_to_string(path)?;
            let dict = parse_foam_dict(&content)?;
            let internal = dict.get_path("internalField");
            assert!(internal.is_some());

            if let Some(FoamValue::Field(fd)) = internal {
                assert_eq!(fd.count, Some(2197));
                assert_eq!(fd.values.len(), 2197);
                assert!(matches!(fd.values[0], FoamValue::Scalar(s) if (s - 66494.89347).abs() < 1e-4));
            } else {
                panic!("internalField should be FoamValue::Field");
            }

            let walls_val = dict.get_path("boundaryField/walls/value");
            assert!(walls_val.is_some());

            if let Some(FoamValue::Field(fd)) = walls_val {
                assert_eq!(fd.count, Some(1014));
                assert_eq!(fd.values.len(), 1014);
            } else {
                panic!("walls value should be FoamValue::Field");
            }
        }

        Ok(())
    }

    #[test]
    fn test_parse_nested_and_multidimensional_lists() -> Result<(), FoamParseError> {
        let input = r#"
refinementCylinderTip
{
    mode    distance;
    levels  ((0.059 2) (0.118 1));
}
twoDVector (0 1);
tensor9 (1 0 0 0 1 0 0 0 1);
emptyList ();
"#;
        let dict = parse_foam_dict(input)?;
        assert_eq!(
            dict.get_path("refinementCylinderTip/mode"),
            Some(FoamValue::String("distance".to_string()))
        );

        let levels = dict.get_path("refinementCylinderTip/levels");
        assert!(levels.is_some());

        if let Some(FoamValue::List(outer)) = levels {
            assert_eq!(outer.len(), 2);

            if let FoamValue::List(ref inner0) = outer[0] {
                assert_eq!(inner0.len(), 2);
                assert_eq!(inner0[0], FoamValue::Scalar(0.059));
                assert_eq!(inner0[1], FoamValue::Int(2));
            } else {
                return Err(FoamParseError {
                    message: "Expected inner list".to_string(),
                    line: 0,
                });
            }

            if let FoamValue::List(ref inner1) = outer[1] {
                assert_eq!(inner1.len(), 2);
                assert_eq!(inner1[0], FoamValue::Scalar(0.118));
                assert_eq!(inner1[1], FoamValue::Int(1));
            } else {
                return Err(FoamParseError {
                    message: "Expected inner list".to_string(),
                    line: 0,
                });
            }
        } else {
            return Err(FoamParseError {
                message: "Expected outer list".to_string(),
                line: 0,
            });
        }

        let two_d = dict.get_path("twoDVector");
        assert_eq!(
            two_d,
            Some(FoamValue::List(vec![FoamValue::Int(0), FoamValue::Int(1)]))
        );

        let tensor = dict.get_path("tensor9");
        assert!(matches!(tensor, Some(FoamValue::List(v)) if v.len() == 9));

        let empty = dict.get_path("emptyList");
        assert_eq!(empty, Some(FoamValue::List(Vec::new())));

        let serialized = dict.to_foam();
        assert!(serialized.contains("levels\n    (\n        (0.059 2)\n        (0.118 1)\n    );"));
        assert!(serialized.contains("twoDVector  (0 1);"));
        assert!(serialized.contains("tensor9     (1 0 0 0 1 0 0 0 1);"));

        Ok(())
    }
}
