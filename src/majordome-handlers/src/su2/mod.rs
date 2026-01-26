use pyo3::prelude::*;

mod enums;
mod traits;
mod pybind;

#[pymodule]
pub mod su2 {
    #[pymodule_export]
    use super::enums::SolverType;
}
