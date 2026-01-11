use pyo3::prelude::*;
use corelib::constants::constants::GAS_CONSTANT;
use super::diffusivity::ArrheniusModifiedDiffusivity;

fn composition_dependence(x: &[f64]) -> f64 {
    if x.len() != 2 { // XXX While we cannot enforce compile-time length!
        panic!("composition array must have at least two elements");
    }

    x[0] + 0.72 * x[1]
}

fn pre_exponential(x: &[f64]) -> f64 {
    let b = -320.0 / GAS_CONSTANT;
    (b * composition_dependence(x)).exp() / (1.0 - 5.0 * (x[0] + x[1]))
}

fn activation_modifier(x: &[f64]) -> f64 {
    570_000.0 * composition_dependence(x)
}

//////////////////////////////////////////////////////////////////////////////
// Factory functions for diffusivity models
//////////////////////////////////////////////////////////////////////////////

#[pyfunction]
pub fn create_carbon_diffusivity() -> ArrheniusModifiedDiffusivity {
    ArrheniusModifiedDiffusivity::from_rust_fns(
        |x, _t| 4.84e-05 * (1.0 - 5.0 * x[1]) * pre_exponential(&x),
        |x, _t| 155_000.0 - activation_modifier(&x),
    )
}

#[pyfunction]
pub fn create_nitrogen_diffusivity() -> ArrheniusModifiedDiffusivity {
    ArrheniusModifiedDiffusivity::from_rust_fns(
        |x, _t| 9.10e-05 * (1.0 - 5.0 * x[0]) * pre_exponential(&x),
        |x, _t| 168_600.0 - activation_modifier(&x),
    )
}

#[pymodule]
pub mod slycke {
    #[pymodule_export]
    pub use super::create_carbon_diffusivity;

    #[pymodule_export]
    pub use super::create_nitrogen_diffusivity;
}
