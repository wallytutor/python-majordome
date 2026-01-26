use pyo3::prelude::*;

#[pymodule(name = "_handlers")]
pub mod handlers {
    // #[pymodule_export]
    // use super::core;

    // #[pymodule_export]
    // use super::elmer;

    #[pymodule_export]
    use crate::su2::pybind::su2;
}
