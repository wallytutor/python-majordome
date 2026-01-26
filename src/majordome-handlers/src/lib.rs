use pyo3::prelude::*;

mod core;
mod elmer;
mod su2;

#[pymodule(name = "_handlers")]
pub mod handlers {
    // #[pymodule_export]
    // use super::core;

    // #[pymodule_export]
    // use super::elmer;

    #[pymodule_export]
    use super::su2::su2;
}