use pyo3::prelude::*;

// List crate modules:
pub mod macros;
pub mod textfile;
pub mod constants;

// Re-export for external use
pub use textfile::dedent;

#[pymodule]
pub mod corelib {
    #[pymodule_export]
    pub const VERSION: &str = env!("CARGO_PKG_VERSION");

    #[pymodule_export]
    use crate::constants::constants;
}
