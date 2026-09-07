use majordome_constants::prelude::GAS_CONSTANT;
use pyo3::prelude::*;
use pyo3::types::{PyAny, PyList};

type RustCallback = fn(&[f64], f64) -> f64;

fn validate_array_type(array: &Bound<'_, PyAny>) -> PyResult<()> {
    let is_valid = array.is_instance_of::<PyList>() || array.hasattr("__array__").unwrap_or(false);

    if !is_valid {
        return Err(PyErr::new::<pyo3::exceptions::PyTypeError, _>(
            "array must be a list or numpy array",
        ));
    }

    Ok(())
}

fn validate_callback(callback: &Bound<'_, PyAny>) -> PyResult<()> {
    if !callback.is_callable() {
        return Err(PyErr::new::<pyo3::exceptions::PyTypeError, _>(
            "callback must be callable with signature: fn(x[], T)",
        ));
    }

    Ok(())
}

pub struct PreExponentialFactor {
    pub callback: Option<Py<PyAny>>,
    pub rust_callback: Option<RustCallback>,
}

pub struct ActivationEnergy {
    pub callback: Option<Py<PyAny>>,
    pub rust_callback: Option<RustCallback>,
}

#[pyclass]
pub struct ArrheniusModifiedDiffusivity {
    pub pre_exponential: PreExponentialFactor,
    pub activation_energy: ActivationEnergy,
}

impl PreExponentialFactor {
    pub fn from_rust_fn(rust_fn: RustCallback) -> Self {
        Self {
            callback: None,
            rust_callback: Some(rust_fn),
        }
    }

    pub fn call(
        &self,
        py: Python<'_>,
        array: &Bound<'_, PyAny>,
        temperature: f64,
    ) -> PyResult<f64> {
        if let Some(rust_fn) = self.rust_callback {
            let x: Vec<f64> = array.extract()?;

            Ok(rust_fn(&x, temperature))
        } else if let Some(ref cb) = self.callback {
            cb.bind(py).call1((array, temperature))?.extract()
        } else {
            Err(PyErr::new::<pyo3::exceptions::PyRuntimeError, _>(
                "No callback",
            ))
        }
    }
}

impl ActivationEnergy {
    pub fn from_rust_fn(rust_fn: RustCallback) -> Self {
        Self {
            callback: None,
            rust_callback: Some(rust_fn),
        }
    }

    pub fn call(
        &self,
        py: Python<'_>,
        array: &Bound<'_, PyAny>,
        temperature: f64,
    ) -> PyResult<f64> {
        if let Some(rust_fn) = self.rust_callback {
            let x: Vec<f64> = array.extract()?;

            Ok(rust_fn(&x, temperature))
        } else if let Some(ref cb) = self.callback {
            cb.bind(py).call1((array, temperature))?.extract()
        } else {
            Err(PyErr::new::<pyo3::exceptions::PyRuntimeError, _>(
                "No callback",
            ))
        }
    }
}

impl ArrheniusModifiedDiffusivity {
    pub fn from_rust_fns(pre_exp_fn: RustCallback, act_eng_fn: RustCallback) -> Self {
        Self {
            pre_exponential: PreExponentialFactor::from_rust_fn(pre_exp_fn),
            activation_energy: ActivationEnergy::from_rust_fn(act_eng_fn),
        }
    }

    pub fn evaluate(&self, x: &[f64], temperature: f64) -> f64 {
        if let (Some(pre_fn), Some(act_fn)) = (
            self.pre_exponential.rust_callback,
            self.activation_energy.rust_callback,
        ) {
            let d0 = pre_fn(x, temperature);
            let ea = act_fn(x, temperature);

            d0 * (-ea / (GAS_CONSTANT * temperature)).exp()
        } else {
            // TODO recheck this...
            let py = unsafe { Python::assume_attached() };
            let py_array = PyList::new(py, x)
                .map(|list| list.into_any())
                .unwrap_or_else(|_| py.None().bind(py).clone());

            let d0 = self
                .pre_exponential
                .call(py, &py_array, temperature)
                .unwrap_or(0.0);
            let ea = self
                .activation_energy
                .call(py, &py_array, temperature)
                .unwrap_or(0.0);

            d0 * (-ea / (GAS_CONSTANT * temperature)).exp()
        }
    }
}

#[pymethods]
impl ArrheniusModifiedDiffusivity {
    #[new]
    #[pyo3(signature = (pre_exponential_func, activation_energy_func))]
    pub fn new(
        py: Python<'_>,
        pre_exponential_func: Py<PyAny>,
        activation_energy_func: Py<PyAny>,
    ) -> PyResult<Self> {
        validate_callback(pre_exponential_func.bind(py))?;
        validate_callback(activation_energy_func.bind(py))?;

        Ok(Self {
            pre_exponential: PreExponentialFactor {
                callback: Some(pre_exponential_func),
                rust_callback: None,
            },
            activation_energy: ActivationEnergy {
                callback: Some(activation_energy_func),
                rust_callback: None,
            },
        })
    }

    #[pyo3(signature = (array, temperature))]
    fn __call__(
        &self,
        py: Python<'_>,
        array: &Bound<'_, PyAny>,
        temperature: f64,
    ) -> PyResult<f64> {
        validate_array_type(array)?;
        let d0 = self.pre_exponential.call(py, array, temperature)?;
        let ea = self.activation_energy.call(py, array, temperature)?;

        Ok(d0 * (-ea / (GAS_CONSTANT * temperature)).exp())
    }
}
