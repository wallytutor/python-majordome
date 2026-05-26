use pyo3::prelude::*;

pub mod autodiff;
pub mod linear_algebra;
pub mod utilities;

#[pymodule(name = "autodiff")]
pub mod autodiff_py {
    #[pymodule_export]
    use super::autodiff::PyDual;
}

#[pymodule]
pub mod numerical {
    #[pymodule_export]
    use super::autodiff_py;
}
