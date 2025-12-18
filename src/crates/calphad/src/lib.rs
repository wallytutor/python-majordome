use pyo3::prelude::*;

#[pymodule]
pub mod calphad {
    #[pymodule_export]
    pub const VERSION: &str = env!("CARGO_PKG_VERSION");
}
