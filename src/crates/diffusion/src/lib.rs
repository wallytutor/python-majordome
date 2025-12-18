use pyo3::prelude::*;
use pyo3::types::{PyAny, PyList};

mod diffusivity;
mod slycke;

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
// Module definition
//////////////////////////////////////////////////////////////////////////////

#[pymodule]
pub mod diffusion {
    #[pymodule_export]
    pub const VERSION: &str = env!("CARGO_PKG_VERSION");

    #[pymodule_export]
    pub use super::diffusivity::PreExponentialFactor;

    #[pymodule_export]
    pub use super::diffusivity::ActivationEnergy;

    #[pymodule_export]
    pub use super::diffusivity::ArrheniusModifiedDiffusivity;

    #[pymodule_export]
    pub use super::slycke::slycke;
}

//////////////////////////////////////////////////////////////////////////////
// EOF
//////////////////////////////////////////////////////////////////////////////