use pyo3::prelude::*;

mod domain1d;
pub use domain1d::*;

#[pymodule]
pub mod majordome_fvm {
    #[pymodule_export]
    use super::ImmersedNodeDomain1D;
}
