use pyo3::prelude::*;

pub mod prelude;

mod autodiff;
mod linear_algebra;
mod utilities;

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
