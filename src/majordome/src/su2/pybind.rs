use pyo3::prelude::*;

use super::enums::SolverType;
use super::traits::SU2InputEntry;

#[pymethods]
impl SolverType {
    fn __str__(&self) -> String {
        self.to_string()
    }

    fn to_su2_input(&self) -> String {
        SU2InputEntry::to_su2_input(self)
    }
}

#[pymodule]
pub mod su2 {
    #[pymodule_export]
    use super::SolverType;
}
