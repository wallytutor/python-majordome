use pyo3::prelude::*;

use super::enums::SolverType;
use super::traits::AsInput;

#[pymethods]
impl SolverType {
    #[staticmethod]
    fn type_name() -> &'static str {
        <SolverType as AsInput>::type_name()
    }

    fn to_name(&self) -> String {
        AsInput::to_name(self)
    }

    fn to_input(&self) -> String {
        AsInput::to_input(self)
    }

    fn __str__(&self) -> String {
        self.to_name()
    }

}

#[pymodule]
pub mod su2 {
    #[pymodule_export]
    use super::SolverType;
}
