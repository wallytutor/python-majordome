use pyo3::prelude::pymodule;
mod majordome;

#[pymodule]
mod _majordome {

    #[pymodule_export]
    use crate::majordome::diffusion::diffusion;
}
