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

fn parse_key_name(
    chars: &mut std::iter::Peekable<std::str::Chars<'_>>,
    line_num: &mut usize,
) -> String {
    let mut name = String::new();

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

            if escaped {
                escaped = false;
            } else if ch == '\\' {
                escaped = true;
            } else if ch == '"' {
                break;
            }
        }
    } else {
        let mut paren_depth: usize = 0;

        while let Some(&ch) = chars.peek() {
            if ch == '(' {
                paren_depth += 1;
            } else if ch == ')' {
                if paren_depth > 0 {
                    paren_depth -= 1;
                }
            } else if ch == ';' || ch == '{' || ch == '}' {
                break;
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

    while let Some(&c) = chars.peek() {
        if c.is_whitespace() {
            if c == '\n' {
                line_num += 1;
            }

            chars.next();
            continue;
        }

        if c == ';' {
            chars.next();
            continue;
        }

        if c == '/' {
            chars.next();

            match chars.peek() {
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

                Some('*') => {
                    chars.next();
                    let mut comment = String::from("/*");
                    let mut is_banner = false;

                    for ch in chars.by_ref() {
                        comment.push(ch);

                        if ch == '\n' {
                            line_num += 1;
                        }

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

                _ => {
                    return Err(FoamParseError {
                        message: "Unexpected '/' character".to_string(),
                        line: line_num,
                    });
                }
            }
        }

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

        if let Some(&'{') = chars.peek() {
            chars.next();

            let inner_dict = parse_subdict(&mut chars, &mut line_num)?;

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
        if c == '}' {
            chars.next();
            return Ok(dict);
        }

        if c.is_whitespace() {
            if c == '\n' {
                *line_num += 1;
            }

            chars.next();
            continue;
        }

        if c == ';' {
            chars.next();
            continue;
        }

        if c == '/' {
            chars.next();

            match chars.peek() {
                Some('/') => {
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
                    return Err(FoamParseError {
                        message: "Unexpected '/' character".to_string(),
                        line: *line_num,
                    });
                }
            }
        }

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

        if let Some(&'{') = chars.peek() {
            chars.next();

            let inner = parse_subdict(chars, line_num)?;

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
        if in_line_comment {
            if ch == '\n' {
                *line_num += 1;
                in_line_comment = false;
            }
            raw_val.push(ch);
            chars.next();
            continue;
        }

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

        if ch == '"' {
            in_string = true;
            raw_val.push(ch);
            chars.next();
            continue;
        }

        if ch == '\'' {
            in_single_quote = true;
            raw_val.push(ch);
            chars.next();
            continue;
        }

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

        if ch == '{' {
            brace_depth += 1;
            raw_val.push(ch);
            chars.next();
            continue;
        }

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
        if c == '(' {
            return true;
        }

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

            if let Some(&'(') = chars.peek() {
                compact_format = true;
            }
        }
    }

    skip_whitespace(chars, line_num);

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

    if trimmed.is_empty() {
        return items;
    }

    if trimmed.contains('(') {
        let mut chars = trimmed.chars().peekable();

        while let Some(&c) = chars.peek() {
            if c.is_whitespace() {
                chars.next();
                continue;
            }

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
                let mut token = String::new();

                while let Some(&ch) = chars.peek() {
                    if ch == '(' || ch.is_whitespace() {
                        break;
                    }

                    token.push(ch);
                    chars.next();
                }

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

    if let Some(rest) = s_clean.strip_prefix("uniform") {
        let rest_clean = rest.trim();

        if !rest_clean.is_empty() {
            let inner_val = parse_value_str_inner(rest_clean);

            return Some(FieldData::uniform(inner_val, true));
        }
    }

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
        if c.is_whitespace() {
            chars.next();
            continue;
        }

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
        } else {
            let mut token = String::new();

            while let Some(&ch) = chars.peek() {
                if ch.is_whitespace() || ch == '(' || ch == ')' || ch == ';' {
                    break;
                }

                token.push(ch);
                chars.next();
            }

            if !token.is_empty() {
                items.push(parse_value_str_inner(&token));
            }
        }
    }

    items
}

fn parse_value_str_inner(s: &str) -> FoamValue {
    let s_clean = s.trim();

    if s_clean.is_empty() {
        return FoamValue::String(String::new());
    }

    if s_clean == "true" || s_clean == "on" || s_clean == "yes" {
        return FoamValue::Bool(true);
    }

    if s_clean == "false" || s_clean == "off" || s_clean == "no" {
        return FoamValue::Bool(false);
    }

    if let Ok(i) = s_clean.parse::<i64>() {
        return FoamValue::Int(i);
    }

    if let Ok(f) = s_clean.parse::<f64>() {
        return FoamValue::Scalar(f);
    }

    if s_clean.starts_with('(') && s_clean.ends_with(')') {
        let inner = s_clean[1..s_clean.len() - 1].trim();

        if inner.is_empty() {
            return FoamValue::List(Vec::new());
        }

        if !inner.contains('{') {
            return FoamValue::List(parse_list_items(inner));
        }
    }

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

    if let Some(rest) = s_clean.strip_prefix('$') {
        return FoamValue::MacroRef(rest.to_string());
    }

    FoamValue::String(s_clean.to_string())
}

fn parse_value_str(s: &str) -> FoamValue {
    let s_clean = s.trim();

    if s_clean.is_empty() {
        return FoamValue::String(String::new());
    }

    if let Some(fd) = parse_field_data_from_str(s_clean) {
        return FoamValue::Field(fd);
    }

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
            Some(&FoamValue::String("distance".to_string()))
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
                panic!("Expected inner list");
            }

            if let FoamValue::List(ref inner1) = outer[1] {
                assert_eq!(inner1.len(), 2);
                assert_eq!(inner1[0], FoamValue::Scalar(0.118));
                assert_eq!(inner1[1], FoamValue::Int(1));
            } else {
                panic!("Expected inner list");
            }
        } else {
            panic!("Expected outer list");
        }

        let two_d = dict.get_path("twoDVector");
        assert_eq!(
            two_d,
            Some(&FoamValue::List(vec![FoamValue::Int(0), FoamValue::Int(1)]))
        );

        let tensor = dict.get_path("tensor9");
        assert!(matches!(tensor, Some(FoamValue::List(v)) if v.len() == 9));

        let empty = dict.get_path("emptyList");
        assert_eq!(empty, Some(&FoamValue::List(Vec::new())));

        let serialized = dict.to_foam();
        assert!(serialized.contains("levels  ((0.059 2) (0.118 1));"));
        assert!(serialized.contains("twoDVector  (0 1);"));
        assert!(serialized.contains("tensor9     (1 0 0 0 1 0 0 0 1);"));

        Ok(())
    }
}
