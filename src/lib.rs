use pyo3::prelude::*;

pub const VERSION: &str = env!("GIT_VERSION");

mod entrypoints;

#[pymodule(name = "_core")]
pub mod handlers {
    use pyo3::prelude::*;

    #[allow(non_upper_case_globals)]
    #[pymodule_export]
    pub const __version__: &str = super::VERSION;

    /// Version of majordome.
    #[pyfunction]
    fn version() -> String {
        format!("{}", super::VERSION)
    }

    // -----------------------------------------------------------------------

    #[pymodule_export]
    use majordome_constants::constants;

    #[pymodule_export]
    use majordome_numerical::numerical;

    #[pymodule_export]
    use majordome_calphad::calphad;

    // -----------------------------------------------------------------------

    #[pymodule_export]
    use super::entrypoints::majordome_entrypoint;

    #[pymodule_export]
    use super::entrypoints::containerize_entrypoint;
}
