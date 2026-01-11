use pyo3::prelude::pymodule;

// List crate modules:
pub mod macros;
pub mod textfile;
pub mod constants;

// Re-export for Rust usage (flatten the nested structure)
pub use constants::constants as core_const;
pub use textfile::dedent;

#[pymodule]
pub mod corelib {
    use pyo3::prelude::pyfunction;

    #[pymodule_export]
    pub const VERSION: &str = env!("CARGO_PKG_VERSION");

    /// Version of majordome.corelib.
    #[pyfunction]
    fn version() -> String {
        format!("{}", VERSION)
    }

    #[pymodule_export]
    use super::core_const as constants;
}
