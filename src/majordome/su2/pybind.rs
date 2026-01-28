use pyo3::prelude::*;
use super::enums::*;
use super::traits::AsInput;

#[pymethods]
impl VelocityType {
    #[new]
    pub fn new(x: f64, y: f64, z: f64) -> Self {
        VelocityType(x, y, z)
    }
}

#[pymethods]
impl SolverType {
    #[staticmethod]
    fn type_name() -> &'static str {
        <Self as AsInput>::type_name()
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

#[pymethods]
impl InletType {
   #[staticmethod]
    fn type_name() -> &'static str {
        <Self as AsInput>::type_name()
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
    use super::{
        VelocityType,
        SolverType,
        InletType
    };
}
