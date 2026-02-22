use pyo3::prelude::*;

#[pymodule(name = "_majordome")]
pub mod handlers {
    use pyo3::prelude::*;

    #[pymodule_export]
    pub const VERSION: &str = env!("GIT_VERSION");

    /// Version of majordome.
    #[pyfunction]
    fn version() -> String { format!("{}", VERSION) }

    #[pymodule_export]
    use crate::core::pybind::constants;

    #[pymodule_export]
    use crate::su2::pybind::su2;
}
