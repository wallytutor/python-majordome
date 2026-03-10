use pyo3::prelude::*;
use pyo3::types::{PyDict, PyModule};
use pyo3::types::{IntoPyDict};

fn main() -> PyResult<()> {
    majordome::print_header!("Majordome IPython Shell\n");

    Python::attach(|py| {
        let globals = start_globals(py)?;

        start_ipython(py, globals)
    })
}

fn start_globals(py: Python<'_>) -> PyResult<Py<PyDict>> {
    // Create a persistent dictionary to hold the new globals injected
    // into the Python environment and import builtins to add the new
    // functions to it.
    let globals = PyDict::new(py);
    let builtins = PyModule::import(py, "builtins")?;

    builtins.add_function(wrap_pyfunction!(hello, py)?)?;

    Ok(globals.into())
}

fn start_ipython(py: Python<'_>, globals: Py<PyDict>) -> PyResult<()> {
    let args = vec!["--quick", "--colors=Linux"];
    let kwargs = [("user_ns", globals)].into_py_dict(py)?;

    let ipython = PyModule::import(py, "IPython")?;
    ipython.call_method("start_ipython", (args,), Some(&kwargs))?;

    Ok(())
}

#[pyfunction]
fn hello() -> &'static str {
    "hello from rust"
}