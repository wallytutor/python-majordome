#![deny(clippy::unwrap_used)]
#![deny(clippy::expect_used)]
#![deny(clippy::panic)]
#![deny(unused_must_use)]
#![deny(warnings)]

use std::fmt;

/// Represents OpenFOAM field data (lists, vectors, scalars, compound items).
#[derive(Debug, Clone, PartialEq)]
pub struct FieldData {
    pub is_uniform: bool,
    pub field_type: Option<String>,
    pub count: Option<usize>,
    pub values: Vec<FoamValue>,
    pub has_semicolon: bool,
    pub compact_format: bool,
}

impl FieldData {
    /// Create a new uniform field.
    pub fn uniform(value: FoamValue, has_semicolon: bool) -> Self {
        Self {
            is_uniform: true,
            field_type: None,
            count: None,
            values: vec![value],
            has_semicolon,
            compact_format: false,
        }
    }

    /// Create a new non-uniform field or standalone data list.
    pub fn list(
        field_type: Option<String>,
        count: Option<usize>,
        values: Vec<FoamValue>,
        has_semicolon: bool,
        compact_format: bool,
    ) -> Self {
        Self {
            is_uniform: false,
            field_type,
            count,
            values,
            has_semicolon,
            compact_format,
        }
    }

    /// Format field data with proper indentation and OpenFOAM layout.
    pub fn to_foam_indent(&self, indent_level: usize) -> String {
        let pad = "    ".repeat(indent_level);

        // Uniform field branch: formats as single-line 'uniform <value>;'
        // (e.g. internalField in 0/p, 0/U, 0/k, or constant/g).
        if self.is_uniform {
            // Uniform fields hold exactly one scalar/vector quantity.
            let val_str = if let Some(v) = self.values.first() {
                v.to_string()
            } else {
                String::new()
            };

            // Entries in dictionary files require ';', while lists omit it.
            let semi = if self.has_semicolon { ";" } else { "" };

            return format!("uniform {}{}", val_str, semi);
        }

        let mut out = String::new();

        // Compact list branch: formats inline count and items, e.g.
        // face vertex indices '4(0 1 5 4)' in polyMesh/faces or
        // blocks in blockMeshDict.
        if self.compact_format {
            let count_str = self
                .count
                .map(|c| c.to_string())
                .unwrap_or_else(|| self.values.len().to_string());

            let items_str = self
                .values
                .iter()
                .map(|v| v.to_string())
                .collect::<Vec<_>>()
                .join(" ");

            let semi = if self.has_semicolon { ";" } else { "" };

            return format!("{}{}({}){}", pad, count_str, items_str, semi);
        }

        // Non-uniform field header: e.g. 'nonuniform List<scalar>'
        // in solution time-step field files (such as 1/p or 1/U).
        if let Some(ref ft) = self.field_type {
            out.push_str(&format!("{}nonuniform {}\n", pad, ft));
        }

        // Element count header: emits list length before opening '(',
        // standard across polyMesh files (points, faces, owner, neighbour).
        if let Some(count) = self.count {
            out.push_str(&format!("{}{}\n", pad, count));
        }

        out.push_str(&format!("{}(\n", pad));

        for val in &self.values {
            out.push_str(&format!("{}{}\n", pad, val));
        }

        let semi = if self.has_semicolon { ";" } else { "" };
        out.push_str(&format!("{}){}", pad, semi));

        out
    }
}

impl fmt::Display for FieldData {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.to_foam_indent(0))
    }
}

/// Represents primitive and structured values in an OpenFOAM dictionary.
#[derive(Debug, Clone, PartialEq)]
pub enum FoamValue {
    Scalar(f64),
    Int(i64),
    String(String),
    Bool(bool),
    Vector(Vec<f64>),
    DimensionSet(Vec<i32>),
    List(Vec<FoamValue>),
    Dict(FoamDict),
    MacroRef(String),
    Raw(String),
    Field(FieldData),
    Compound(Vec<FoamValue>),
}

// Canonical OpenFOAM 2-digit scientific exponent formatting.
fn format_scientific_10(v: f64) -> String {
    let s = format!("{:.10e}", v);

    // Standardize exponent padding to 2 digits (e.g. 1.0000000000e-02).
    if let Some(pos) = s.find('e') {
        let (mantissa, exp_part) = s.split_at(pos);
        let exp_str = &exp_part[1..];
        // Preserve explicit '+' or '-' sign for the exponent.
        let (sign, exp_digits) = if let Some(stripped) = exp_str.strip_prefix('-') {
            ('-', stripped)
        } else if let Some(stripped) = exp_str.strip_prefix('+') {
            ('+', stripped)
        } else {
            ('+', exp_str)
        };

        if let Ok(exp_num) = exp_digits.parse::<i32>() {
            return format!("{}e{}{:02}", mantissa, sign, exp_num);
        }
    }

    s
}

// Switches between decimal notation and scientific format based on magnitude.
fn format_scalar(v: f64) -> String {
    // Preserve exact zero and non-finite floats (NaN, Inf) without exponent.
    if !v.is_finite() || v == 0.0 {
        return v.to_string();
    }

    let abs = v.abs();

    // Standard OpenFOAM magnitude thresholds for switching to scientific
    // notation (used for tolerances 1e-06, viscosities 1e-05, large coords).
    if abs < 1e-4 || abs >= 1e5 {
        format_scientific_10(v)
    } else {
        v.to_string()
    }
}

// Determines whether a string token requires explicit quoting.
fn is_string_literal(s: &str) -> bool {
    let trimmed = s.trim();

    // Already enclosed in double quotes: preserve quoted string literal.
    if trimmed.starts_with('"') && trimmed.ends_with('"') && trimmed.len() >= 2 {
        return true;
    }

    // Do not quote numeric strings or integers inside lists.
    if trimmed.parse::<f64>().is_ok() || trimmed.parse::<i64>().is_ok() {
        return false;
    }

    true
}

impl FoamValue {
    /// Format value into OpenFOAM text representation with indentation.
    pub fn to_foam_indent(&self, indent_level: usize) -> String {
        // Dispatches serialization across primitive and structured value types.
        match self {
            // Floating point scalar: formatted with threshold-based scientific logic.
            Self::Scalar(v) => format_scalar(*v),

            // Integer scalar: formatted as plain decimal digits.
            Self::Int(v) => v.to_string(),

            // Boolean flag: serialized as OpenFOAM 'true' or 'false' keywords.
            Self::Bool(v) => (if *v { "true" } else { "false" }).to_string(),

            // String parameter: raw token or path representation.
            Self::String(s) => s.clone(),

            // 3D Cartesian vector: formatted as '(x y z)' with scalar formatting.
            Self::Vector(vec) => format!(
                "({})",
                vec.iter()
                    .map(|x| format_scalar(*x))
                    .collect::<Vec<_>>()
                    .join(" ")
            ),

            // 7-component SI dimension set: '[kg m s K mol A cd]'.
            Self::DimensionSet(dims) => format!(
                "[{}]",
                dims.iter()
                    .map(|x| x.to_string())
                    .collect::<Vec<_>>()
                    .join(" ")
            ),

            // List of values: formatted compact or multi-line depending on contents.
            Self::List(items) => {
                // Empty list representation: '()'.
                if items.is_empty() {
                    return "()".to_string();
                }

                // Check for nested sub-lists (e.g. block definitions in blockMeshDict
                // or refinement level pairs in snappyHexMeshDict) or quoted string
                // literals (such as shared library lists 'libs' in controlDict).
                let has_nested = items.iter().any(|x| match x {
                    FoamValue::List(_) => true,
                    FoamValue::String(s) => is_string_literal(s),
                    _ => false,
                });

                // Flat primitive list: format compact single-line '(item1 item2 ...)'.
                if !has_nested {
                    return format!(
                        "({})",
                        items
                            .iter()
                            .map(|x| match x {
                                FoamValue::String(s) => {
                                    // Ensure strings requiring quotes are properly wrapped.
                                    if is_string_literal(s) {
                                        if s.starts_with('"') && s.ends_with('"') {
                                            s.clone()
                                        } else {
                                            format!("\"{}\"", s)
                                        }
                                    } else {
                                        s.clone()
                                    }
                                }
                                _ => x.to_foam_indent(indent_level),
                            })
                            .collect::<Vec<_>>()
                            .join(" ")
                    );
                }

                // Nested or complex list: format multi-line with indented elements.
                let pad = "    ".repeat(indent_level);
                let inner_pad = "    ".repeat(indent_level + 1);
                let mut out = String::from("(\n");

                for item in items {
                    let item_str = match item {
                        FoamValue::String(s) => {
                            // Quote string literal items in multi-line lists (e.g. libs).
                            if is_string_literal(s) {
                                if s.starts_with('"') && s.ends_with('"') {
                                    s.clone()
                                } else {
                                    format!("\"{}\"", s)
                                }
                            } else {
                                s.clone()
                            }
                        }
                        _ => item.to_foam_indent(indent_level + 1),
                    };

                    out.push_str(&format!("{}{}\n", inner_pad, item_str));
                }

                out.push_str(&format!("{})", pad));
                out
            }

            // Compound token: space-separated sequence without parentheses,
            // used for particle parcel records '(x y z) cellId parcelId' in
            // lagrangian cloud positions.
            Self::Compound(items) => items
                .iter()
                .map(|x| x.to_foam_indent(indent_level))
                .collect::<Vec<_>>()
                .join(" "),

            // Subdictionary block: nested '{ ... }' with child indentation.
            Self::Dict(d) => {
                let pad = "    ".repeat(indent_level);
                let inner = d.to_foam_indent(indent_level + 1);

                // Format empty sub-block as '{ }' on separate lines.
                if inner.is_empty() {
                    "{\n}".to_string()
                } else {
                    format!("{{\n{}\n{}}}", inner, pad)
                }
            }

            // Macro reference: serialized with leading '$' (e.g. '$species').
            Self::MacroRef(name) => format!("${}", name),

            // Raw unparsed token string.
            Self::Raw(raw) => raw.clone(),

            // Standalone or embedded field dataset.
            Self::Field(field) => field.to_foam_indent(indent_level),
        }
    }
}

impl fmt::Display for FoamValue {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.to_foam_indent(0))
    }
}

/// Represents individual elements contained in an OpenFOAM dictionary.
#[derive(Debug, Clone, PartialEq)]
pub enum FoamElement {
    Comment(String),
    HeaderBanner(String),
    Directive {
        name: String,
        value: String,
    },
    Entry {
        key: String,
        value: FoamValue,
    },
    Block {
        name: String,
        dict: FoamDict,
        has_semicolon: bool,
    },
    MacroRef(String),
    FieldData(FieldData),
}

/// Abstract Syntax Tree node for an OpenFOAM dictionary file or sub-dict.
#[derive(Debug, Clone, PartialEq, Default)]
pub struct FoamDict {
    pub elements: Vec<FoamElement>,
}

impl FoamDict {
    /// Construct a new empty `FoamDict`.
    pub fn new() -> Self {
        Self {
            elements: Vec::new(),
        }
    }

    /// Format dictionary into OpenFOAM text representation with indentation.
    pub fn to_foam_indent(&self, indent_level: usize) -> String {
        let pad = "    ".repeat(indent_level);
        let mut out = String::new();

        let mut max_key_len = 0;

        // Alignment pre-pass: determine longest single-line key name to pad
        // values into clean columns, matching OpenFOAM canonical dictionary style.
        for elem in &self.elements {
            match elem {
                FoamElement::Entry { key, value } => {
                    let val_str = value.to_foam_indent(indent_level);
                    // Multiline blocks (lists or dicts) are omitted from key width
                    // calculations so they do not artificially widen single-line entries.
                    let multiline_block = val_str.contains('\n')
                        && (val_str.starts_with('(') || val_str.starts_with('{'));

                    if !multiline_block && key.len() > max_key_len {
                        max_key_len = key.len();
                    }
                }

                // Directives (e.g. #include, #calc) are aligned alongside standard entries.
                FoamElement::Directive { name, .. } => {
                    if name.len() > max_key_len {
                        max_key_len = name.len();
                    }
                }

                _ => {}
            }
        }

        let align_width = if max_key_len > 0 { max_key_len + 2 } else { 0 };

        // Output pass: serialize each element with layout spacing and column alignment.
        for (idx, elem) in self.elements.iter().enumerate() {
            // Inter-element spacing: separate entries with blank lines, but preserve
            // consecutive comments or header banners without extra blank lines.
            if idx > 0 {
                out.push('\n');
                if !matches!(
                    self.elements[idx - 1],
                    FoamElement::Comment(_) | FoamElement::HeaderBanner(_)
                ) {
                    out.push('\n');
                }
            }

            match elem {
                // Comments: retain line indentation.
                FoamElement::Comment(c) => {
                    out.push_str(&format!("{}{}", pad, c));
                }

                // Header banner: verbatim preservation of OpenFOAM file header.
                FoamElement::HeaderBanner(b) => {
                    out.push_str(b);
                }

                // Directives: format with column alignment and trailing semicolon.
                FoamElement::Directive { name, value } => {
                    if value.is_empty() {
                        out.push_str(&format!("{}{};", pad, name));
                    } else if align_width > name.len() {
                        let spacing = " ".repeat(align_width - name.len());
                        out.push_str(&format!(
                            "{}{}{}{};",
                            pad, name, spacing, value
                        ));
                    } else {
                        out.push_str(&format!("{}{} {};", pad, name, value));
                    }
                }

                // Standard dictionary key-value entries.
                FoamElement::Entry { key, value } => {
                    match value {
                        // Field data branch: uniform values formatted single-line,
                        // while nonuniform lists are formatted with count and paren block.
                        FoamValue::Field(field_data) => {
                            if field_data.is_uniform {
                                let u_str = field_data.to_foam_indent(0);
                                if align_width > key.len() {
                                    let spacing = " ".repeat(align_width - key.len());
                                    out.push_str(&format!("{}{}{}{}", pad, key, spacing, u_str));
                                } else {
                                    out.push_str(&format!("{}{} {}", pad, key, u_str));
                                }
                            } else {
                                let prefix = if let Some(ref ft) = field_data.field_type {
                                    format!("nonuniform {}", ft)
                                } else {
                                    "nonuniform".to_string()
                                };

                                out.push_str(&format!("{}{}   {}\n", pad, key, prefix));

                                if let Some(count) = field_data.count {
                                    out.push_str(&format!("{}{}\n", pad, count));
                                }

                                out.push_str(&format!("{}(\n", pad));

                                for val in &field_data.values {
                                    out.push_str(&format!("{}{}\n", pad, val));
                                }

                                out.push_str(&format!("{});", pad));
                            }
                        }

                        // General values (scalars, strings, vectors, lists, sub-dicts).
                        _ => {
                            let val_str = value.to_foam_indent(indent_level);

                            // Multiline values require indentation handling and opening alignment.
                            if val_str.contains('\n') {
                                // Block starting with '(' or '{' begins on next indented line.
                                if val_str.starts_with('(') || val_str.starts_with('{') {
                                    out.push_str(&format!("{}{}\n{}{};", pad, key, pad, val_str));
                                } else {
                                    // Complex multiline inline entries (e.g. named subdictionaries
                                    // in fvSchemes: 'species Gauss multivariateSelection { ... }').
                                    let mut lines = val_str.lines();
                                    let first_line = lines.next().unwrap_or("").trim();

                                    if align_width > key.len() {
                                        let spacing = " ".repeat(align_width - key.len());
                                        out.push_str(&format!(
                                            "{}{}{}{}\n",
                                            pad, key, spacing, first_line
                                        ));
                                    } else {
                                        out.push_str(&format!("{}{} {}\n", pad, key, first_line));
                                    }

                                    let rest: Vec<&str> = lines.collect();
                                    let base_indent = rest
                                        .iter()
                                        .find(|l| l.contains('{'))
                                        .map(|l| {
                                            l.chars().take_while(|c| c.is_whitespace()).count()
                                        })
                                        .unwrap_or(0);

                                    let has_trailing_semicolon = val_str.trim_end().ends_with(';');

                                    for (l_idx, line) in rest.iter().enumerate() {
                                        let is_last = l_idx + 1 == rest.len();

                                        if line.trim().is_empty() {
                                            out.push('\n');
                                            continue;
                                        }

                                        let line_indent = line
                                            .chars()
                                            .take_while(|c| c.is_whitespace())
                                            .count();

                                        let content = if line_indent >= base_indent {
                                            &line[base_indent..]
                                        } else {
                                            line.trim_start()
                                        };

                                        if is_last
                                            && !has_trailing_semicolon
                                            && !content.ends_with(';')
                                        {
                                            out.push_str(&format!("{}{};\n", pad, content));
                                        } else {
                                            out.push_str(&format!("{}{}\n", pad, content));
                                        }
                                    }

                                    if out.ends_with('\n') {
                                        out.pop();
                                    }
                                }
                            // Single-line values: pad keys to align_width for neat column alignment.
                            } else if align_width > key.len() {
                                let spacing = " ".repeat(align_width - key.len());
                                out.push_str(&format!(
                                    "{}{}{}{};",
                                    pad, key, spacing, val_str
                                ));
                            } else {
                                out.push_str(&format!("{}{} {};", pad, key, val_str));
                            }
                        }
                    }
                }

                // Top-level field data block (e.g. standalone list in polyMesh files).
                FoamElement::FieldData(data) => {
                    out.push_str(&data.to_foam_indent(indent_level));
                }

                // Subdictionary block (e.g. 'solvers', 'SIMPLE', 'ddtSchemes').
                FoamElement::Block {
                    name,
                    dict,
                    has_semicolon,
                } => {
                    out.push_str(&format!("{}{}\n{}{{\n", pad, name, pad));
                    let inner = dict.to_foam_indent(indent_level + 1);

                    if !inner.is_empty() {
                        out.push_str(&inner);
                        out.push('\n');
                    }

                    out.push_str(&format!("{}}}", pad));

                    // Some subdictionaries (such as named schemes in fvSchemes) require ';'.
                    if *has_semicolon {
                        out.push(';');
                    }
                }

                // Top-level macro expansion statement (e.g. '$species;').
                FoamElement::MacroRef(m) => {
                    out.push_str(&format!("{}{};", pad, m));
                }
            }
        }

        out
    }

    /// Serialize dictionary into canonical OpenFOAM string.
    pub fn to_foam(&self) -> String {
        self.to_foam_indent(0)
    }

    /// Retrieve an entry by slash-separated path (e.g. "solvers/p/tolerance").
    pub fn get_path(&self, key_path: &str) -> Option<FoamValue> {
        let parts: Vec<&str> = key_path.split('/').collect();

        self.get_recursive(&parts)
    }

    fn get_recursive(&self, parts: &[&str]) -> Option<FoamValue> {
        // Empty path: nothing to resolve.
        if parts.is_empty() {
            return None;
        }

        let head = parts[0];

        // Search top-level elements for the current path segment.
        for elem in &self.elements {
            match elem {
                // Entry match: if at the end of the path, return cloned value.
                FoamElement::Entry { key, value } if key == head => {
                    if parts.len() == 1 {
                        return Some(value.clone());
                    }
                }

                // Block match: if at the end of path, return entire sub-dictionary;
                // otherwise recurse into the child dictionary with remaining segments.
                FoamElement::Block { name, dict, .. } if name == head => {
                    if parts.len() == 1 {
                        return Some(FoamValue::Dict(dict.clone()));
                    }

                    return dict.get_recursive(&parts[1..]);
                }

                _ => {}
            }
        }

        None
    }

    /// Set an entry value by slash-separated path.
    pub fn set_path(&mut self, key_path: &str, value: FoamValue) {
        let parts: Vec<&str> = key_path.split('/').collect();

        self.set_recursive(&parts, value);
    }

    fn set_recursive(&mut self, parts: &[&str], value: FoamValue) {
        if parts.is_empty() {
            return;
        }

        let head = parts[0];

        // Target segment reached: update existing entry in-place or append new one.
        if parts.len() == 1 {
            for elem in &mut self.elements {
                match elem {
                    FoamElement::Entry { key, value: v } if key == head => {
                        *v = value;
                        return;
                    }
                    _ => {}
                }
            }

            self.elements.push(FoamElement::Entry {
                key: head.to_string(),
                value,
            });

            return;
        }

        // Intermediate segment: search for existing sub-block to recurse into.
        for elem in &mut self.elements {
            match elem {
                FoamElement::Block { name, dict, .. } if name == head => {
                    dict.set_recursive(&parts[1..], value);
                    return;
                }
                _ => {}
            }
        }

        // Sub-block does not exist: dynamically create intermediate FoamDict block.
        let mut new_dict = FoamDict::new();
        new_dict.set_recursive(&parts[1..], value);

        self.elements.push(FoamElement::Block {
            name: head.to_string(),
            dict: new_dict,
            has_semicolon: false,
        });
    }

    /// Remove an entry or sub-block by slash-separated key path.
    pub fn delete_path(&mut self, key_path: &str) -> bool {
        let parts: Vec<&str> = key_path.split('/').collect();

        self.delete_recursive(&parts)
    }

    fn delete_recursive(&mut self, parts: &[&str]) -> bool {
        if parts.is_empty() {
            return false;
        }

        let head = parts[0];

        // Target segment reached: remove matching entry or sub-block.
        if parts.len() == 1 {
            let orig_len = self.elements.len();
            self.elements.retain(|e| match e {
                FoamElement::Entry { key, .. } => key != head,
                FoamElement::Block { name, .. } => name != head,
                _ => true,
            });

            return self.elements.len() < orig_len;
        }

        // Intermediate segment: find child block and recurse deletion.
        for elem in &mut self.elements {
            match elem {
                FoamElement::Block { name, dict, .. } if name == head => {
                    return dict.delete_recursive(&parts[1..]);
                }
                _ => {}
            }
        }

        false
    }

    /// Add an `#include` directive to the dictionary.
    pub fn add_include(&mut self, filename: &str) {
        self.elements.insert(
            0,
            FoamElement::Directive {
                name: "#include".to_string(),
                value: format!("\"{}\"", filename),
            },
        );
    }

    /// Add an `#includeEtc` directive to the dictionary.
    pub fn add_include_etc(&mut self, filename: &str) {
        self.elements.insert(
            0,
            FoamElement::Directive {
                name: "#includeEtc".to_string(),
                value: format!("\"{}\"", filename),
            },
        );
    }

    /// Return top-level entry/block keys in dictionary order.
    pub fn keys(&self) -> Vec<String> {
        let mut keys = Vec::new();

        for elem in &self.elements {
            match elem {
                FoamElement::Entry { key, .. } => keys.push(key.clone()),
                FoamElement::Block { name, .. } => keys.push(name.clone()),
                _ => {}
            }
        }

        keys
    }

    /// Retrieve reference to field data in dictionary if present.
    ///
    /// Checks top-level `FieldData` elements first (for standalone lists like
    /// points or faces in polyMesh), then `internalField` entry (for volume
    /// and surface fields like 0/p, 0/U).
    pub fn field_data(&self) -> Option<&FieldData> {
        // Standalone data list check (e.g. polyMesh files).
        for elem in &self.elements {
            if let FoamElement::FieldData(fd) = elem {
                return Some(fd);
            }
        }

        // Solution field file check: looks for 'internalField' entry.
        for elem in &self.elements {
            if let FoamElement::Entry {
                key,
                value: FoamValue::Field(fd),
            } = elem
            {
                if key == "internalField" {
                    return Some(fd);
                }
            }
        }

        None
    }

    /// Retrieve mutable reference to field data in dictionary if present.
    pub fn field_data_mut(&mut self) -> Option<&mut FieldData> {
        let mut target_idx = None;

        // Find index of top-level FieldData or internalField entry.
        for (idx, elem) in self.elements.iter().enumerate() {
            match elem {
                FoamElement::FieldData(_) => {
                    target_idx = Some(idx);
                    break;
                }

                FoamElement::Entry {
                    key,
                    value: FoamValue::Field(_),
                } if key == "internalField" => {
                    target_idx = Some(idx);
                    break;
                }

                _ => {}
            }
        }

        // Return mutable reference from matched index.
        if let Some(idx) = target_idx {
            match self.elements.get_mut(idx) {
                Some(FoamElement::FieldData(fd)) => return Some(fd),
                Some(FoamElement::Entry {
                    value: FoamValue::Field(fd),
                    ..
                }) => return Some(fd),
                _ => {}
            }
        }

        None
    }

    /// Set or replace field data in the dictionary.
    pub fn set_field_data(&mut self, data: FieldData) {
        // Update top-level FieldData if present.
        for elem in &mut self.elements {
            if let FoamElement::FieldData(fd) = elem {
                *fd = data;
                return;
            }
        }

        // Update 'internalField' entry if present.
        for elem in &mut self.elements {
            if let FoamElement::Entry { key, value } = elem {
                if key == "internalField" {
                    *value = FoamValue::Field(data);
                    return;
                }
            }
        }

        // If neither exists, append new top-level FieldData element.
        self.elements.push(FoamElement::FieldData(data));
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_to_foam_indent_comment_spacing() {
        let mut dict = FoamDict::new();
        dict.elements.push(FoamElement::Comment("// Boundary field section".to_string()));
        dict.elements.push(FoamElement::Entry {
            key: "internalField".to_string(),
            value: FoamValue::String("uniform (0 0 0)".to_string()),
        });
        dict.elements.push(FoamElement::Entry {
            key: "dimensions".to_string(),
            value: FoamValue::String("[0 1 -1 0 0 0 0]".to_string()),
        });

        let output = dict.to_foam();
        let expected = "// Boundary field section\ninternalField  uniform (0 0 0);\n\ndimensions     [0 1 -1 0 0 0 0];";
        assert_eq!(output, expected);
    }
}
