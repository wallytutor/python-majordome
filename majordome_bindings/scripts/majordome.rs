use pyo3::prelude::*;
use pyo3::types::{PyDict, PyModule};
use pyo3::types::{IntoPyDict};
use std::env;

use majordome::{print_header, VERSION};
use majordome::constants::*;

fn main() -> PyResult<()> {
    print_header!("Majordome IPython Shell: {}\n", VERSION);

    let mut args: Vec<String> = env::args().skip(1).collect();

    if !args.contains(&"--no-banner".to_string()) {
        args.push("--no-banner".to_string());
    }

    Python::attach(|py| {
        let globals = start_globals(py)?;
        let kwargs = [("user_ns", globals)].into_py_dict(py)?;

        let ipython = PyModule::import(py, "IPython")?;
        ipython.call_method("start_ipython", (args,), Some(&kwargs))?;

        Ok(())
    })
}

fn start_globals(py: Python<'_>) -> PyResult<Py<PyDict>> {
    // Create a persistent dictionary to hold the new globals injected
    // into the Python environment and import builtins to add the new
    // functions to it.
    let globals = PyDict::new(py);
    let builtins = PyModule::import(py, "builtins")?;

    builtins.add_function(wrap_pyfunction!(hello, py)?)?;

    let py_majordome = PyModule::import(py, "majordome")?;
    globals.set_item("mj", py_majordome)?;

    globals.set_item("PI",               PI)?;
    globals.set_item("AVOGADRO",         AVOGADRO)?;
    globals.set_item("BOLTZMANN",        BOLTZMANN)?;
    globals.set_item("ELECTRON_CHARGE",  ELECTRON_CHARGE)?;
    globals.set_item("FARADAY",          FARADAY)?;
    globals.set_item("GAS_CONSTANT",     GAS_CONSTANT)?;
    globals.set_item("GRAVITY",          GRAVITY)?;
    globals.set_item("PLANCK",           PLANCK)?;
    globals.set_item("SPEED_OF_LIGHT",   SPEED_OF_LIGHT)?;
    globals.set_item("STEFAN_BOLTZMANN", STEFAN_BOLTZMANN)?;
    globals.set_item("T_REFERENCE",      T_REFERENCE)?;
    globals.set_item("T_NORMAL",         T_NORMAL)?;
    globals.set_item("P_NORMAL",         P_NORMAL)?;

    Ok(globals.into())
}

#[pyfunction]
fn hello() -> &'static str {
    "hello from rust"
}