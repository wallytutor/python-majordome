use super::coefficients::ArrheniusModifiedDiffusivity;
use majordome_constants::prelude::GAS_CONSTANT;
use pyo3::prelude::*;

fn composition_dependence(x: &[f64]) -> f64 {
    let x0 = x.first().copied().unwrap_or(0.0);
    let x1 = x.get(1).copied().unwrap_or(0.0);
    x0 + 0.72 * x1
}

fn pre_exponential(x: &[f64]) -> f64 {
    let b = -320.0 / GAS_CONSTANT;
    let sum = x.first().copied().unwrap_or(0.0) + x.get(1).copied().unwrap_or(0.0);

    (b * composition_dependence(x)).exp() / (1.0 - 5.0 * sum)
}

fn activation_modifier(x: &[f64]) -> f64 {
    570_000.0 * composition_dependence(x)
}

#[pyfunction]
pub fn create_carbon_diffusivity() -> ArrheniusModifiedDiffusivity {
    ArrheniusModifiedDiffusivity::from_rust_fns(
        |x, _t| 4.84e-05 * (1.0 - 5.0 * x[1]) * pre_exponential(x),
        |x, _t| 155_000.0 - activation_modifier(x),
    )
}

#[pyfunction]
pub fn create_nitrogen_diffusivity() -> ArrheniusModifiedDiffusivity {
    ArrheniusModifiedDiffusivity::from_rust_fns(
        |x, _t| 9.10e-05 * (1.0 - 5.0 * x[0]) * pre_exponential(x),
        |x, _t| 168_600.0 - activation_modifier(x),
    )
}

#[pymodule(name = "slycke")]
pub mod slycke_py {
    #[pymodule_export]
    use super::create_carbon_diffusivity;

    #[pymodule_export]
    use super::create_nitrogen_diffusivity;
}
