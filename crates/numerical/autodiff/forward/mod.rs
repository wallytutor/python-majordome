use pyo3::prelude::*;

mod scalar;
pub use scalar::Dual;
pub use scalar::Numeric;
pub use scalar::diff;

#[pyclass(name = "Dual", from_py_object)]
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct PyDual {
    pub inner: Dual<f64>,
}

#[pymethods]
impl PyDual {
    #[new]
    pub fn new(value: f64, deriv: f64) -> Self {
        PyDual {
            inner: Dual::new(value, deriv),
        }
    }

    #[staticmethod]
    pub fn constant(value: f64) -> Self {
        PyDual {
            inner: Dual::constant(value),
        }
    }

    #[staticmethod]
    pub fn variable(value: f64) -> Self {
        PyDual {
            inner: Dual::variable(value),
        }
    }

    #[getter]
    pub fn value(&self) -> f64 {
        self.inner.value
    }

    #[getter]
    pub fn deriv(&self) -> f64 {
        self.inner.deriv
    }

    pub fn __repr__(&self) -> String {
        format!(
            "Dual(value={}, deriv={})",
            self.inner.value, self.inner.deriv
        )
    }

    pub fn __str__(&self) -> String {
        self.__repr__()
    }

    pub fn __add__(&self, other: &Bound<'_, PyAny>) -> PyResult<Self> {
        if let Ok(other_dual) = other.extract::<PyDual>() {
            Ok(PyDual {
                inner: self.inner + other_dual.inner,
            })
        } else if let Ok(other_f64) = other.extract::<f64>() {
            Ok(PyDual {
                inner: self.inner + other_f64,
            })
        } else {
            Err(pyo3::exceptions::PyTypeError::new_err(
                "Unsupported type for addition",
            ))
        }
    }

    pub fn __radd__(&self, other: f64) -> Self {
        PyDual {
            inner: other + self.inner,
        }
    }

    pub fn __sub__(&self, other: &Bound<'_, PyAny>) -> PyResult<Self> {
        if let Ok(other_dual) = other.extract::<PyDual>() {
            Ok(PyDual {
                inner: self.inner - other_dual.inner,
            })
        } else if let Ok(other_f64) = other.extract::<f64>() {
            Ok(PyDual {
                inner: self.inner - other_f64,
            })
        } else {
            Err(pyo3::exceptions::PyTypeError::new_err(
                "Unsupported type for subtraction",
            ))
        }
    }

    pub fn __rsub__(&self, other: f64) -> Self {
        PyDual {
            inner: other - self.inner,
        }
    }

    pub fn __mul__(&self, other: &Bound<'_, PyAny>) -> PyResult<Self> {
        if let Ok(other_dual) = other.extract::<PyDual>() {
            Ok(PyDual {
                inner: self.inner * other_dual.inner,
            })
        } else if let Ok(other_f64) = other.extract::<f64>() {
            Ok(PyDual {
                inner: self.inner * other_f64,
            })
        } else {
            Err(pyo3::exceptions::PyTypeError::new_err(
                "Unsupported type for multiplication",
            ))
        }
    }

    pub fn __rmul__(&self, other: f64) -> Self {
        PyDual {
            inner: other * self.inner,
        }
    }

    pub fn __truediv__(&self, other: &Bound<'_, PyAny>) -> PyResult<Self> {
        if let Ok(other_dual) = other.extract::<PyDual>() {
            Ok(PyDual {
                inner: self.inner / other_dual.inner,
            })
        } else if let Ok(other_f64) = other.extract::<f64>() {
            Ok(PyDual {
                inner: self.inner / other_f64,
            })
        } else {
            Err(pyo3::exceptions::PyTypeError::new_err(
                "Unsupported type for division",
            ))
        }
    }

    pub fn __rtruediv__(&self, other: f64) -> Self {
        PyDual {
            inner: other / self.inner,
        }
    }

    pub fn __neg__(&self) -> Self {
        PyDual { inner: -self.inner }
    }
}
