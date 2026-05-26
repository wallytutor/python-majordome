pub mod coefficients;
pub mod fvm;
pub mod interstitial;
pub mod slycke;

use pyo3::prelude::*;

#[pymodule]
pub mod diffusion {
    #[pymodule_export]
    use super::slycke::slycke_py;

    #[pymodule_export]
    use super::fvm::ImmersedNodeDomain1D;

    #[pymodule_export]
    use super::interstitial::CarbonitridingSolverPy as CarbonitridingSolver;

    #[pymodule_export]
    use super::interstitial::ElementResults;
}
