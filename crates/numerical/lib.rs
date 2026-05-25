use pyo3::prelude::*;

pub mod autodiff;
pub mod linear_algebra;

#[pymodule]
pub mod numerical {
    #[pymodule_export]
    use super::autodiff::PyDual;
}
