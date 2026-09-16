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

        if self.is_uniform {
            let val_str = if let Some(v) = self.values.first() {
                v.to_string()
            } else {
                String::new()
            };

            let semi = if self.has_semicolon { ";" } else { "" };

            return format!("uniform {}{}", val_str, semi);
        }

        let mut out = String::new();

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

        if let Some(ref ft) = self.field_type {
            out.push_str(&format!("{}nonuniform {}\n", pad, ft));
        }

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

impl fmt::Display for FoamValue {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Scalar(v) => write!(f, "{}", v),
            Self::Int(v) => write!(f, "{}", v),
            Self::String(v) => write!(f, "{}", v),
            Self::Bool(v) => write!(f, "{}", if *v { "true" } else { "false" }),
            Self::Vector(vec) => write!(
                f,
                "({})",
                vec.iter()
                    .map(|x| x.to_string())
                    .collect::<Vec<_>>()
                    .join(" ")
            ),
            Self::DimensionSet(dims) => write!(
                f,
                "[{}]",
                dims.iter()
                    .map(|x| x.to_string())
                    .collect::<Vec<_>>()
                    .join(" ")
            ),
            Self::List(items) => write!(
                f,
                "({})",
                items
                    .iter()
                    .map(|x| x.to_string())
                    .collect::<Vec<_>>()
                    .join(" ")
            ),
            Self::Compound(items) => write!(
                f,
                "{}",
                items
                    .iter()
                    .map(|x| x.to_string())
                    .collect::<Vec<_>>()
                    .join(" ")
            ),
            Self::Dict(d) => write!(f, "{}", d.to_foam_indent(0)),
            Self::MacroRef(name) => write!(f, "${}", name),
            Self::Raw(raw) => write!(f, "{}", raw),
            Self::Field(field) => write!(f, "{}", field),
        }
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

        for elem in &self.elements {
            match elem {
                FoamElement::Entry { key, value } => {
                    let val_str = value.to_string();
                    if !val_str.contains('\n') && key.len() > max_key_len {
                        max_key_len = key.len();
                    }
                }

                FoamElement::Directive { name, .. } => {
                    if name.len() > max_key_len {
                        max_key_len = name.len();
                    }
                }

                _ => {}
            }
        }

        let align_width = if max_key_len > 0 { max_key_len + 2 } else { 0 };

        for (idx, elem) in self.elements.iter().enumerate() {
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
                FoamElement::Comment(c) => {
                    out.push_str(&format!("{}{}", pad, c));
                }

                FoamElement::HeaderBanner(b) => {
                    out.push_str(b);
                }

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

                FoamElement::Entry { key, value } => {
                    match value {
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

                        _ => {
                            let val_str = value.to_string();
                            if val_str.contains('\n') {
                                if val_str.starts_with('(') || val_str.starts_with('{') {
                                    out.push_str(&format!("{}{}\n{}{};", pad, key, pad, val_str));
                                } else {
                                    out.push_str(&format!("{}{}\n{}", pad, key, val_str));
                                    if !val_str.ends_with(';') {
                                        out.push(';');
                                    }
                                }
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

                FoamElement::FieldData(data) => {
                    out.push_str(&data.to_foam_indent(indent_level));
                }

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

                    if *has_semicolon {
                        out.push(';');
                    }
                }

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
        if parts.is_empty() {
            return None;
        }

        let head = parts[0];

        for elem in &self.elements {
            match elem {
                FoamElement::Entry { key, value } if key == head => {
                    if parts.len() == 1 {
                        return Some(value.clone());
                    }
                }

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

        for elem in &mut self.elements {
            match elem {
                FoamElement::Block { name, dict, .. } if name == head => {
                    dict.set_recursive(&parts[1..], value);
                    return;
                }
                _ => {}
            }
        }

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

        if parts.len() == 1 {
            let orig_len = self.elements.len();
            self.elements.retain(|e| match e {
                FoamElement::Entry { key, .. } => key != head,
                FoamElement::Block { name, .. } => name != head,
                _ => true,
            });

            return self.elements.len() < orig_len;
        }

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
    /// Checks top-level `FieldData` elements first, then `internalField`.
    pub fn field_data(&self) -> Option<&FieldData> {
        for elem in &self.elements {
            if let FoamElement::FieldData(fd) = elem {
                return Some(fd);
            }
        }

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
        for elem in &mut self.elements {
            if let FoamElement::FieldData(fd) = elem {
                *fd = data;
                return;
            }
        }

        for elem in &mut self.elements {
            if let FoamElement::Entry { key, value } = elem {
                if key == "internalField" {
                    *value = FoamValue::Field(data);
                    return;
                }
            }
        }

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
