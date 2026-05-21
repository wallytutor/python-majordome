use crate::constants::{GAS_CONSTANT, P_NORMAL, T_REFERENCE};
use pyo3::prelude::*;
use std::fmt;

// ---------------------------------------------------------------------------

pub const T_REF: f64 = T_REFERENCE;
pub const P_REF: f64 = P_NORMAL;
pub const R_GAS: f64 = GAS_CONSTANT;

// ---------------------------------------------------------------------------

/// A float wrapper that prints in scientific notation with:
/// - configurable total width and precision
/// - controlled exponent width and total width
/// - exponent always display a sign (+/-)
pub struct SciFmt {
    pub value: f64,
    pub precision: usize,
    pub total_width: usize,
    pub exponent_width: usize,
}

impl fmt::Display for SciFmt {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // 1) Format using Rust's scientific notation
        let raw = format!("{:.*e}", self.precision, self.value);

        // 2) Split mantissa and exponent
        let (mant, exp) = raw.split_once('e').unwrap();

        // 3) Parse exponent and reformat with +02 / -05 / +10
        let exp_val: i32 = exp.parse().unwrap();
        let exp_fixed = format!("{:+0width$}", exp_val, width = 1 + self.exponent_width);

        // 4) Reassemble
        let final_str = format!("{mant}e{exp_fixed}");

        // 5) Apply width/alignment from the struct
        let width = std::cmp::max(self.total_width, final_str.len());

        if self.value > 0.0 {
            write!(f, " {:>width$}", final_str, width = width)
        } else {
            write!(f, "{:>width$}", final_str, width = width)
        }
    }
}

pub fn exponential_fmt(value: f64) -> String {
    let fmt = SciFmt {
        value,
        precision: 8,
        total_width: 12,
        exponent_width: 2,
    };
    fmt.to_string()
}

// ---------------------------------------------------------------------------

pub mod core;
pub mod data;
pub mod equil;
pub mod functions;

// ---------------------------------------------------------------------------

#[pymodule(name = "calphad")]
pub mod calphad {
    #[pymodule_export]
    use super::data::DatabaseLoader;

    #[pymodule_export]
    use super::core::Substance;

    #[pymodule_export]
    use super::core::SystemComposition;

    #[pymodule_export]
    use crate::num::autodiff::PyDual;

    #[pymodule_export]
    use super::equil::Equilibrium;

    #[pymodule_export]
    use super::equil::equilibrate_stoichiometric_py as equilibrate_stoichiometric;
}
