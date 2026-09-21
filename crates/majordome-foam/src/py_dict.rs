#![deny(clippy::unwrap_used)]
#![deny(clippy::expect_used)]
#![deny(clippy::panic)]
#![deny(unused_must_use)]
#![deny(warnings)]

use crate::ast::{FieldData, FoamDict, FoamValue};
use crate::parser::parse_foam_dict;
use pyo3::exceptions::{PyIndexError, PyKeyError, PyValueError};
use pyo3::prelude::*;
use pyo3::types::PyList;
use pyo3::Py;
use std::fs;

/// Python class wrapper for OpenFOAM dictionary manipulation.
#[pyclass(name = "FoamDict")]
pub struct PyFoamDict {
    pub inner: FoamDict,
}

#[pymethods]
impl PyFoamDict {
    /// Create a new empty OpenFOAM dictionary.
    #[new]
    pub fn new() -> Self {
        Self {
            inner: FoamDict::new(),
        }
    }
}

impl Default for PyFoamDict {
    fn default() -> Self {
        Self::new()
    }
}

#[pymethods]
impl PyFoamDict {

    /// Parse OpenFOAM dictionary text into a `FoamDict` instance.
    #[staticmethod]
    pub fn parse(content: &str) -> PyResult<Self> {
        let dict = parse_foam_dict(content)
            .map_err(|e| PyValueError::new_err(e.to_string()))?;

        Ok(Self { inner: dict })
    }

    /// Load and parse OpenFOAM dictionary from a file path.
    #[staticmethod]
    pub fn from_file(path: &str) -> PyResult<Self> {
        let content = fs::read_to_string(path)
            .map_err(|e| PyValueError::new_err(e.to_string()))?;

        Self::parse(&content)
    }

    /// Serialize dictionary into canonical OpenFOAM format string.
    pub fn to_foam(&self) -> String {
        self.inner.to_foam()
    }

    /// Write dictionary to a file.
    pub fn save(&self, path: &str) -> PyResult<()> {
        fs::write(path, self.to_foam())
            .map_err(|e| PyValueError::new_err(e.to_string()))
    }

    /// Get value by slash-separated key path (e.g. "solvers/p/tolerance").
    pub fn get(
        &self,
        py: Python<'_>,
        key_path: &str,
    ) -> PyResult<Option<Py<PyAny>>> {
        // Query AST dictionary tree; convert value to Python object if found.
        match self.inner.get_path(key_path) {
            Some(val) => {
                let py_obj = foam_value_to_py(py, &val)?;
                Ok(Some(py_obj))
            }
            None => Ok(None),
        }
    }

    /// Set value by slash-separated key path.
    pub fn set(
        &mut self,
        key_path: &str,
        value: &Bound<'_, PyAny>,
    ) -> PyResult<()> {
        let foam_val = py_to_foam_value(value)?;
        self.inner.set_path(key_path, foam_val);

        Ok(())
    }

    /// Remove entry by slash-separated key path.
    pub fn delete(&mut self, key_path: &str) -> bool {
        self.inner.delete_path(key_path)
    }

    /// Check if key path exists in dictionary.
    pub fn contains(&self, key_path: &str) -> bool {
        self.inner.get_path(key_path).is_some()
    }

    /// Add `#include "filename"` directive to the dictionary.
    pub fn add_include(&mut self, filename: &str) {
        self.inner.add_include(filename);
    }

    /// Add `#includeEtc "filename"` directive to the dictionary.
    pub fn add_include_etc(&mut self, filename: &str) {
        self.inner.add_include_etc(filename);
    }

    /// Return list of top-level keys in dictionary.
    pub fn keys(&self) -> Vec<String> {
        self.inner.keys()
    }

    /// Return list of (key, value) pairs in original AST declaration order.
    pub fn items(&self, py: Python<'_>) -> PyResult<Vec<(String, Py<PyAny>)>> {
        let mut items = Vec::new();

        for elem in &self.inner.elements {
            match elem {
                crate::ast::FoamElement::Entry { key, value } => {
                    let py_val = foam_value_to_py(py, value)?;
                    items.push((key.clone(), py_val));
                }

                crate::ast::FoamElement::Block { name, dict, .. } => {
                    let py_dict = PyFoamDict {
                        inner: dict.clone(),
                    };
                    let py_obj = py_dict.into_pyobject(py)?.into_any().unbind();
                    items.push((name.clone(), py_obj));
                }

                crate::ast::FoamElement::Directive { name, value } => {
                    let clean_val = value
                        .trim()
                        .trim_matches('"')
                        .trim_matches('<')
                        .trim_matches('>');
                    let py_val = clean_val
                        .into_pyobject(py)?
                        .to_owned()
                        .into_any()
                        .unbind();
                    items.push((name.clone(), py_val));
                }

                crate::ast::FoamElement::MacroRef(m) => {
                    let key = format!("${}", m);
                    items.push((key, py.None()));
                }

                crate::ast::FoamElement::FieldData(fd) => {
                    if fd.is_uniform {
                        let val_str = if let Some(first) = fd.values.first() {
                            format!("uniform {}", first)
                        } else {
                            "uniform".to_string()
                        };
                        let py_val = val_str
                            .into_pyobject(py)?
                            .to_owned()
                            .into_any()
                            .unbind();
                        items.push(("internalField".to_string(), py_val));
                    } else {
                        let py_list = PyList::empty(py);
                        for item in &fd.values {
                            py_list.append(foam_value_to_py(py, item)?)?;
                        }
                        items.push((
                            "internalField".to_string(),
                            py_list.into_any().unbind(),
                        ));
                    }
                }

                _ => {}
            }
        }

        Ok(items)
    }

    /// Check if dictionary represents or contains field data.
    pub fn has_field_data(&self) -> bool {
        self.inner.field_data().is_some()
    }

    /// Retrieve field data items as a Python list.
    pub fn get_data(&self, py: Python<'_>) -> PyResult<Option<Py<PyAny>>> {
        // Return Python list if dictionary contains field data; otherwise None.
        if let Some(fd) = self.inner.field_data() {
            let py_list = PyList::empty(py);

            for item in &fd.values {
                py_list.append(foam_value_to_py(py, item)?)?;
            }

            return Ok(Some(py_list.into_any().unbind()));
        }

        Ok(None)
    }

    /// Set field data items from a Python sequence.
    pub fn set_data(&mut self, values: &Bound<'_, PyAny>) -> PyResult<()> {
        let list = values.extract::<Vec<Bound<'_, PyAny>>>()?;
        let mut new_vals = Vec::new();

        for item in &list {
            new_vals.push(py_to_foam_value(item)?);
        }

        let count = Some(new_vals.len());

        // Update existing field data block if present; otherwise instantiate new.
        if let Some(fd) = self.inner.field_data_mut() {
            fd.values = new_vals;
            fd.count = count;
            fd.is_uniform = false;
        } else {
            let fd = FieldData::list(None, count, new_vals, false, false);
            self.inner.set_field_data(fd);
        }

        Ok(())
    }

    /// Return length of field data items.
    pub fn data_len(&self) -> usize {
        self.inner
            .field_data()
            .map(|fd| fd.values.len())
            .unwrap_or(0)
    }

    /// Get field data item by index.
    pub fn get_data_item(
        &self,
        py: Python<'_>,
        index: isize,
    ) -> PyResult<Py<PyAny>> {
        // Access field data elements with Python-style negative index wrap.
        if let Some(fd) = self.inner.field_data() {
            let len = fd.values.len() as isize;
            let actual_idx = if index < 0 { len + index } else { index };

            // Bounds check resolved index.
            if actual_idx >= 0 && (actual_idx as usize) < fd.values.len() {
                return foam_value_to_py(py, &fd.values[actual_idx as usize]);
            }

            return Err(PyIndexError::new_err("Index out of bounds"));
        }

        Err(PyIndexError::new_err("No field data in file"))
    }

    /// Set field data item by index.
    pub fn set_data_item(
        &mut self,
        index: isize,
        value: &Bound<'_, PyAny>,
    ) -> PyResult<()> {
        let foam_val = py_to_foam_value(value)?;

        // Mutate field data element with Python-style negative index wrap.
        if let Some(fd) = self.inner.field_data_mut() {
            let len = fd.values.len() as isize;
            let actual_idx = if index < 0 { len + index } else { index };

            // Bounds check resolved index.
            if actual_idx >= 0 && (actual_idx as usize) < fd.values.len() {
                fd.values[actual_idx as usize] = foam_val;
                return Ok(());
            }

            return Err(PyIndexError::new_err("Index out of bounds"));
        }

        Err(PyIndexError::new_err("No field data in file"))
    }

    /// Append an item to field data.
    pub fn append_data(&mut self, value: &Bound<'_, PyAny>) -> PyResult<()> {
        let foam_val = py_to_foam_value(value)?;

        // Append to existing field data, or initialize new list with element.
        if let Some(fd) = self.inner.field_data_mut() {
            fd.values.push(foam_val);
            fd.count = Some(fd.values.len());
        } else {
            let fd = FieldData::list(None, Some(1), vec![foam_val], false, false);
            self.inner.set_field_data(fd);
        }

        Ok(())
    }

    /// Extend field data with an iterable sequence.
    pub fn extend_data(&mut self, items: &Bound<'_, PyAny>) -> PyResult<()> {
        let list = items.extract::<Vec<Bound<'_, PyAny>>>()?;

        for item in &list {
            self.append_data(item)?;
        }

        Ok(())
    }

    /// Pop item from field data by index.
    pub fn pop_data(
        &mut self,
        py: Python<'_>,
        index: isize,
    ) -> PyResult<Py<PyAny>> {
        // Remove field data element with Python-style negative index wrap.
        if let Some(fd) = self.inner.field_data_mut() {
            let len = fd.values.len() as isize;
            let actual_idx = if index < 0 { len + index } else { index };

            // Bounds check resolved index.
            if actual_idx >= 0 && (actual_idx as usize) < fd.values.len() {
                let removed = fd.values.remove(actual_idx as usize);
                fd.count = Some(fd.values.len());
                return foam_value_to_py(py, &removed);
            }

            return Err(PyIndexError::new_err("Index out of bounds"));
        }

        Err(PyIndexError::new_err("No field data in file"))
    }

    /// Clear all field data items.
    pub fn clear_data(&mut self) {
        // Reset field data values to empty list and count to zero.
        if let Some(fd) = self.inner.field_data_mut() {
            fd.values.clear();
            fd.count = Some(0);
        }
    }

    fn __getitem__(
        &self,
        py: Python<'_>,
        key_path: &str,
    ) -> PyResult<Py<PyAny>> {
        // Map missing key to Python KeyError.
        match self.get(py, key_path)? {
            Some(obj) => Ok(obj),
            None => {
                Err(PyKeyError::new_err(format!("Key not found: {}", key_path)))
            }
        }
    }

    fn __setitem__(
        &mut self,
        key_path: &str,
        value: &Bound<'_, PyAny>,
    ) -> PyResult<()> {
        self.set(key_path, value)
    }

    fn __contains__(&self, key_path: &str) -> bool {
        self.contains(key_path)
    }
}

fn foam_value_to_py(
    py: Python<'_>,
    val: &FoamValue,
) -> PyResult<Py<PyAny>> {
    // Convert Rust FoamValue AST enum variants into native Python types.
    match val {
        FoamValue::Scalar(v) => {
            Ok(v.into_pyobject(py)?.to_owned().into_any().unbind())
        }
        FoamValue::Int(v) => {
            Ok(v.into_pyobject(py)?.to_owned().into_any().unbind())
        }
        FoamValue::String(v) => {
            Ok(v.as_str().into_pyobject(py)?.to_owned().into_any().unbind())
        }
        FoamValue::Bool(v) => {
            Ok(v.into_pyobject(py)?.to_owned().into_any().unbind())
        }
        FoamValue::Vector(v) => {
            Ok(v.clone().into_pyobject(py)?.into_any().unbind())
        }
        FoamValue::DimensionSet(v) => {
            Ok(v.clone().into_pyobject(py)?.into_any().unbind())
        }

        FoamValue::List(items) => {
            let py_list = PyList::empty(py);

            for item in items {
                py_list.append(foam_value_to_py(py, item)?)?;
            }

            Ok(py_list.into_any().unbind())
        }

        FoamValue::Compound(items) => {
            let py_list = PyList::empty(py);

            for item in items {
                py_list.append(foam_value_to_py(py, item)?)?;
            }

            Ok(py_list.into_any().unbind())
        }

        FoamValue::Dict(d) => {
            let py_dict = PyFoamDict { inner: d.clone() };
            Ok(py_dict.into_pyobject(py)?.into_any().unbind())
        }

        FoamValue::MacroRef(m) => {
            Ok(m.as_str().into_pyobject(py)?.to_owned().into_any().unbind())
        }
        FoamValue::Raw(r) => {
            Ok(r.as_str().into_pyobject(py)?.to_owned().into_any().unbind())
        }

        FoamValue::Field(fd) => {
            // Uniform fields serialize as "uniform <val>"; nonuniform as list.
            if fd.is_uniform {
                let val_str = if let Some(first) = fd.values.first() {
                    format!("uniform {}", first)
                } else {
                    "uniform".to_string()
                };

                Ok(val_str.into_pyobject(py)?.to_owned().into_any().unbind())
            } else {
                let py_list = PyList::empty(py);

                for item in &fd.values {
                    py_list.append(foam_value_to_py(py, item)?)?;
                }

                Ok(py_list.into_any().unbind())
            }
        }
    }
}

fn py_to_foam_value(value: &Bound<'_, PyAny>) -> PyResult<FoamValue> {
    // Extract bool first because Python's bool is a subclass of int.
    if let Ok(b) = value.extract::<bool>() {
        return Ok(FoamValue::Bool(b));
    }

    // 64-bit integer conversion.
    if let Ok(i) = value.extract::<i64>() {
        return Ok(FoamValue::Int(i));
    }

    // Floating-point scalar conversion.
    if let Ok(f) = value.extract::<f64>() {
        return Ok(FoamValue::Scalar(f));
    }

    // String literal conversion.
    if let Ok(s) = value.extract::<String>() {
        return Ok(FoamValue::String(s));
    }

    // Sequence / list conversion (recursive elements).
    if let Ok(seq) = value.extract::<Vec<Bound<'_, PyAny>>>() {
        let mut vec = Vec::new();

        for item in &seq {
            vec.push(py_to_foam_value(item)?);
        }

        return Ok(FoamValue::List(vec));
    }

    // Subdictionary conversion.
    if let Ok(dict) = value.extract::<PyRef<'_, PyFoamDict>>() {
        return Ok(FoamValue::Dict(dict.inner.clone()));
    }

    // Error for unmapped Python types.
    Err(PyValueError::new_err(format!(
        "Unsupported type for FoamValue: {}",
        value
    )))
}
