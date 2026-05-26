use pyo3::prelude::*;

mod parameters;

#[cfg(test)]
mod test;

pub mod core;
pub mod data;
pub mod equilibrium;
pub mod mixture;

#[pymodule]
pub mod calphad {
    #[pymodule_export]
    use super::core::Substance;

    #[pymodule_export]
    use super::core::SystemComposition;

    #[pymodule_export]
    use super::data::DatabaseLoader;

    #[pymodule_export]
    use super::data::add_data_directory_py as add_data_directory;

    #[pymodule_export]
    use super::data::list_data_directories_py as list_data_directories;

    #[pymodule_export]
    use super::equilibrium::Equilibrium;

    #[pymodule_export]
    use super::equilibrium::equilibrate_stoichiometric_py as equilibrate_stoichiometric;
}
