use pyo3::prelude::pymodule;

#[pymodule]
pub mod calphad {
    use pyo3::prelude::PyResult;
    use pyo3::prelude::pyfunction;

    #[pyfunction]
    fn sum_as_string(a: usize, b: usize) -> PyResult<String> {
        Ok((a + b).to_string())
    }
}
