use pyo3::prelude::pymodule;

pub mod diffusion;

#[pymodule]
pub mod majordome {
    // XXX: keep this empty! Submodules are exposed on the top of this
    // module. but they must be implemented in subfolders to avoid clutter.
}
