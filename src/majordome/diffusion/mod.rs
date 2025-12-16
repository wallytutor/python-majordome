use pyo3::prelude::*;
use pyo3::types::{PyAny, PyList};
use crate::majordome::constants::constants;

type PyObject = Py<PyAny>;

//////////////////////////////////////////////////////////////////////////////
// Define structures
//////////////////////////////////////////////////////////////////////////////

#[pyclass]
pub struct PreExponentialFactor {
    callback: PyObject,
}

#[pyclass]
pub struct ActivationEnergy {
    callback: PyObject,
}

#[pyclass]
pub struct ArrheniusModifiedDiffusivity {
    pre_exponential: PreExponentialFactor,
    activation_energy: ActivationEnergy,
}

//////////////////////////////////////////////////////////////////////////////
// Helper functions
//////////////////////////////////////////////////////////////////////////////

fn validate_callback_xt(callback: &Bound<'_, PyAny>) -> PyResult<()> {
    if !callback.is_callable() {
        return Err(PyErr::new::<pyo3::exceptions::PyTypeError, _>(
            "callback must be callable with signature: fn(x[], T)"
        ));
    }
    Ok(())
}

fn validate_array_type(array: &Bound<'_, PyAny>) -> PyResult<()> {
    let is_valid = array.is_instance_of::<PyList>()
        || array.hasattr("__array__").unwrap_or(false);

    if !is_valid {
        return Err(PyErr::new::<pyo3::exceptions::PyTypeError, _>(
            "array must be a list or numpy array"
        ));
    }
    Ok(())
}

//////////////////////////////////////////////////////////////////////////////
// Structure traits
//////////////////////////////////////////////////////////////////////////////

impl Clone for PreExponentialFactor {
    fn clone(&self) -> Self {
        Python::attach(|py| {
            PreExponentialFactor {
                callback: self.callback.clone_ref(py),
            }
        })
    }
}

impl Clone for ActivationEnergy {
    fn clone(&self) -> Self {
        Python::attach(|py| {
            ActivationEnergy {
                callback: self.callback.clone_ref(py),
            }
        })
    }
}

//////////////////////////////////////////////////////////////////////////////
// Structure implementations
//////////////////////////////////////////////////////////////////////////////

#[pymethods]
impl PreExponentialFactor {
    #[new]
    fn new(callback: PyObject) -> PyResult<Self> {
        Python::attach(|py| {
            validate_callback_xt(callback.bind(py))?;
            Ok(PreExponentialFactor { callback })
        })
    }

    fn __call__(&self, array: &Bound<'_, PyAny>, temperature: f64) -> PyResult<f64> {
        Python::attach(|py| {
            validate_array_type(array)?;
            self.callback.call1(py, (array, temperature))?.extract(py)
        })
    }
}

#[pymethods]
impl ActivationEnergy {
    #[new]
    fn new(callback: PyObject) -> PyResult<Self> {
        Python::attach(|py| {
            validate_callback_xt(callback.bind(py))?;
            Ok(ActivationEnergy { callback })
        })
    }

    fn __call__(&self, array: &Bound<'_, PyAny>, temperature: f64) -> PyResult<f64> {
        Python::attach(|py| {
            validate_array_type(array)?;
            self.callback.call1(py, (array, temperature))?.extract(py)
        })
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
    fn new(
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
            validate_array_type(array)?;

            let d0 = self.pre_exponential.__call__(array, temperature)?;
            let ea = self.activation_energy.__call__(array, temperature)?;
            let dc = d0 * (-ea / (constants::GAS_CONSTANT * temperature)).exp();

            Ok(dc)
        })
    }
}

//////////////////////////////////////////////////////////////////////////////
// Module definition
//////////////////////////////////////////////////////////////////////////////

#[pymodule]
pub mod diffusion {
    use pyo3::prelude::PyResult;
    use pyo3::prelude::pyfunction;

    #[pymodule_export]
    pub use super::PreExponentialFactor;

    #[pymodule_export]
    pub use super::ActivationEnergy;

    #[pymodule_export]
    pub use super::ArrheniusModifiedDiffusivity;

    #[pyfunction]
    fn sum_as_string(a: usize, b: usize) -> PyResult<String> {
        Ok((a + b).to_string())
    }
}

//////////////////////////////////////////////////////////////////////////////
// EOF
//////////////////////////////////////////////////////////////////////////////