use pyo3::prelude::*;
use super::enums::*;

#[pymodule]
pub mod su2 {
    #[pymodule_export]
    use super::parse_cfg;

    #[pymodule_export]
    use super::{
        DirectionType,
        VelocityType,
        SolverType,
        InletType
    };
}
