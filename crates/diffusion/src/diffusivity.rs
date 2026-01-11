use pyo3::prelude::*;
use pyo3::types::PyAny;
use corelib::core_const::GAS_CONSTANT;

type PyObject = Py<PyAny>;

//////////////////////////////////////////////////////////////////////////////
// Define structures
//////////////////////////////////////////////////////////////////////////////

pub type RustCallback = fn(&[f64], f64) -> f64;

#[pyclass]
pub struct PreExponentialFactor {
    callback: Option<PyObject>,
    rust_callback: Option<RustCallback>,
}

#[pyclass]
pub struct ActivationEnergy {
    callback: Option<PyObject>,
    rust_callback: Option<RustCallback>,
}

#[pyclass]
pub struct ArrheniusModifiedDiffusivity {
    pre_exponential: PreExponentialFactor,
    activation_energy: ActivationEnergy,
}

//////////////////////////////////////////////////////////////////////////////
// Structure traits
//////////////////////////////////////////////////////////////////////////////

impl Clone for PreExponentialFactor {
    fn clone(&self) -> Self {
        PreExponentialFactor {
            callback: self.callback.as_ref().map(|cb| {
                Python::attach(|py| cb.clone_ref(py))
            }),
            rust_callback: self.rust_callback,
        }
    }
}

impl Clone for ActivationEnergy {
    fn clone(&self) -> Self {
        ActivationEnergy {
            callback: self.callback.as_ref().map(|cb| {
                Python::attach(|py| cb.clone_ref(py))
            }),
            rust_callback: self.rust_callback,
        }
    }
}

//////////////////////////////////////////////////////////////////////////////
// Structure implementations (pure Rust)
//////////////////////////////////////////////////////////////////////////////

impl PreExponentialFactor {
    pub fn from_rust_fn(rust_fn: RustCallback) -> Self {
        PreExponentialFactor { callback: None, rust_callback: Some(rust_fn) }
    }
}

impl ActivationEnergy {
    pub fn from_rust_fn(rust_fn: RustCallback) -> Self {
        ActivationEnergy { callback: None, rust_callback: Some(rust_fn) }
    }
}

impl ArrheniusModifiedDiffusivity {
    pub fn from_rust_fns(
        pre_exp_fn: RustCallback,
        act_eng_fn: RustCallback,
    ) -> Self {
        ArrheniusModifiedDiffusivity {
            pre_exponential: PreExponentialFactor::from_rust_fn(pre_exp_fn),
            activation_energy: ActivationEnergy::from_rust_fn(act_eng_fn),
        }
    }
}

//////////////////////////////////////////////////////////////////////////////
// Structure implementations (Python callable)
//////////////////////////////////////////////////////////////////////////////

#[pymethods]
impl PreExponentialFactor {
    #[new]
    fn new(callback: PyObject) -> PyResult<Self> {
        Python::attach(|py| {
            super::validate_callback_xt(callback.bind(py))?;
            Ok(PreExponentialFactor {
                callback: Some(callback),
                rust_callback: None,
            })
        })
    }

    fn __call__(&self, array: &Bound<'_, PyAny>, temperature: f64) -> PyResult<f64> {
        // Use Rust callback if available, otherwise use Python callback
        if let Some(rust_fn) = self.rust_callback {
            Python::attach(|_py| {
                super::validate_array_type(array)?;
                // Extract Vec<f64> from Python array
                let x: Vec<f64> = array.extract()?;
                Ok(rust_fn(&x, temperature))
            })
        } else if let Some(ref callback) = self.callback {
            Python::attach(|py| {
                super::validate_array_type(array)?;
                callback.call1(py, (array, temperature))?.extract(py)
            })
        } else {
            Err(PyErr::new::<pyo3::exceptions::PyRuntimeError, _>(
                "No callback available"
            ))
        }
    }
}

#[pymethods]
impl ActivationEnergy {
    #[new]
    fn new(callback: PyObject) -> PyResult<Self> {
        Python::attach(|py| {
            super::validate_callback_xt(callback.bind(py))?;
            Ok(ActivationEnergy {
                callback: Some(callback),
                rust_callback: None,
            })
        })
    }

    fn __call__(&self, array: &Bound<'_, PyAny>, temperature: f64) -> PyResult<f64> {
        // Use Rust callback if available, otherwise use Python callback
        if let Some(rust_fn) = self.rust_callback {
            Python::attach(|_py| {
                super::validate_array_type(array)?;
                // Extract Vec<f64> from Python array
                let x: Vec<f64> = array.extract()?;
                Ok(rust_fn(&x, temperature))
            })
        } else if let Some(ref callback) = self.callback {
            Python::attach(|py| {
                super::validate_array_type(array)?;
                callback.call1(py, (array, temperature))?.extract(py)
            })
        } else {
            Err(PyErr::new::<pyo3::exceptions::PyRuntimeError, _>(
                "No callback available"
            ))
        }
    }
}

#[pymethods]
impl ArrheniusModifiedDiffusivity {
    #[new]
    #[pyo3(signature = (
        pre_exponential_factor = None,
        activation_energy      = None,
        pre_exponential_func   = None,
        activation_energy_func = None
    ))]
    pub fn new(
        pre_exponential_factor: Option<&PreExponentialFactor>,
        activation_energy: Option<&ActivationEnergy>,
        pre_exponential_func: Option<PyObject>,
        activation_energy_func: Option<PyObject>,
    ) -> PyResult<Self> {
        let pre_exp_obj = pre_exponential_factor;
        let act_eng_obj = activation_energy;
        let pre_exp_fun = pre_exponential_func;
        let act_eng_fun = activation_energy_func;

        match (pre_exp_obj, act_eng_obj, pre_exp_fun, act_eng_fun) {
            // Case 1: Both objects provided
            (Some(pre_exp_obj), Some(act_eng_obj), None, None) => {
                Ok(ArrheniusModifiedDiffusivity {
                    pre_exponential: pre_exp_obj.clone(),
                    activation_energy: act_eng_obj.clone(),
                })
            }

            // Case 2: Both functions provided
            (None, None, Some(pre_exp_fun), Some(act_eng_fun)) => {
                Ok(ArrheniusModifiedDiffusivity {
                    pre_exponential: PreExponentialFactor::new(pre_exp_fun)?,
                    activation_energy: ActivationEnergy::new(act_eng_fun)?,
                })
            }

            // Case 3: Object + function
            (Some(pre_exp_obj), None, None, Some(act_eng_fun)) => {
                Ok(ArrheniusModifiedDiffusivity {
                    pre_exponential: pre_exp_obj.clone(),
                    activation_energy: ActivationEnergy::new(act_eng_fun)?,
                })
            }

            // Case 4: Function + object
            (None, Some(act_eng_obj), Some(pre_exp_fun), None) => {
                Ok(ArrheniusModifiedDiffusivity {
                    pre_exponential: PreExponentialFactor::new(pre_exp_fun)?,
                    activation_energy: act_eng_obj.clone(),
                })
            }

            // Error: invalid combination
            _ => Err(PyErr::new::<pyo3::exceptions::PyValueError, _>(
                "Must provide either (pre_exponential, activation_energy) objects \
                 or (pre_exponential_func, activation_energy_func) functions"
            ))
        }
    }

    fn __call__(&self, array: &Bound<'_, PyAny>, temperature: f64) -> PyResult<f64> {
        Python::attach(|_py| {
            super::validate_array_type(array)?;

            let d0 = self.pre_exponential.__call__(array, temperature)?;
            let ea = self.activation_energy.__call__(array, temperature)?;
            let dc = d0 * (-ea / (GAS_CONSTANT * temperature)).exp();

            Ok(dc)
        })
    }
}

//////////////////////////////////////////////////////////////////////////////
// EOF
//////////////////////////////////////////////////////////////////////////////
