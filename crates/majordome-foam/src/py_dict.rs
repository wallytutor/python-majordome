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

    /// Check if dictionary represents or contains field data.
    pub fn has_field_data(&self) -> bool {
        self.inner.field_data().is_some()
    }

    /// Retrieve field data items as a Python list.
    pub fn get_data(&self, py: Python<'_>) -> PyResult<Option<Py<PyAny>>> {
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
        if let Some(fd) = self.inner.field_data() {
            let len = fd.values.len() as isize;
            let actual_idx = if index < 0 { len + index } else { index };

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

        if let Some(fd) = self.inner.field_data_mut() {
            let len = fd.values.len() as isize;
            let actual_idx = if index < 0 { len + index } else { index };

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
        if let Some(fd) = self.inner.field_data_mut() {
            let len = fd.values.len() as isize;
            let actual_idx = if index < 0 { len + index } else { index };

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
    if let Ok(b) = value.extract::<bool>() {
        return Ok(FoamValue::Bool(b));
    }

    if let Ok(i) = value.extract::<i64>() {
        return Ok(FoamValue::Int(i));
    }

    if let Ok(f) = value.extract::<f64>() {
        return Ok(FoamValue::Scalar(f));
    }

    if let Ok(s) = value.extract::<String>() {
        return Ok(FoamValue::String(s));
    }

    if let Ok(py_tuple) = value.cast::<pyo3::types::PyTuple>() {
        if let Ok(tuple) = py_tuple.extract::<(f64, f64, f64)>() {
            return Ok(FoamValue::Vector(vec![tuple.0, tuple.1, tuple.2]));
        }

        let mut vec = Vec::new();

        for item in py_tuple.iter() {
            vec.push(py_to_foam_value(&item)?);
        }

        return Ok(FoamValue::Compound(vec));
    }

    if let Ok(list) = value.extract::<Vec<Bound<'_, PyAny>>>() {
        let mut vec = Vec::new();

        for item in &list {
            vec.push(py_to_foam_value(item)?);
        }

        return Ok(FoamValue::List(vec));
    }

    if let Ok(dict) = value.extract::<PyRef<'_, PyFoamDict>>() {
        return Ok(FoamValue::Dict(dict.inner.clone()));
    }

    Err(PyValueError::new_err(format!(
        "Unsupported type for FoamValue: {}",
        value
    )))
}
