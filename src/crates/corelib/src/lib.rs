use pyo3::prelude::*;

#[pymodule]
mod calphad {
    #[pymodule_export]
    pub const VERSION: &str = env!("CARGO_PKG_VERSION");
}