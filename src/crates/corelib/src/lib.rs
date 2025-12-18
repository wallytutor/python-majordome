use pyo3::prelude::*;

#[pymodule]
mod corelib {
    #[pymodule_export]
    const VERSION: &str = env!("CARGO_PKG_VERSION");

    // #[pymodule_export]
    // use crate::majordome::calphad::calphad;

    // #[pymodule_export]
    // use crate::majordome::constants::constants;

    // #[pymodule_export]
    // use crate::majordome::diffusion::diffusion;
}