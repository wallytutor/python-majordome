use pyo3::prelude::*;

mod domain1d;

#[pymodule(name = "domain1d")]
pub mod domain1d_py {
    #[pymodule_export]
    use super::domain1d::ImmersedNodeDomain1D;
}

#[pymodule]
pub mod majordome_fvm {
    #[pymodule_export]
    use super::domain1d_py;
}
