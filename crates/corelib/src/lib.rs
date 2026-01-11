use pyo3::prelude::*;

// List crate modules:
mod macros;
mod textfile;

// Re-export for external use
pub use textfile::dedent;

#[pymodule]
pub mod corelib {
    #[pymodule_export]
    pub const VERSION: &str = env!("CARGO_PKG_VERSION");
}