use pyo3::prelude::*;
use pyo3::types::{PyDict, PyModule};
use pyo3::types::{IntoPyDict};
use std::env;

fn main() -> PyResult<()> {
    majordome::print_header!("Majordome IPython Shell: {}\n",
                             majordome::handlers::VERSION);

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

    globals.set_item("PI",               majordome::constants::PI)?;
    globals.set_item("AVOGADRO",         majordome::constants::AVOGADRO)?;
    globals.set_item("BOLTZMANN",        majordome::constants::BOLTZMANN)?;
    globals.set_item("ELECTRON_CHARGE",  majordome::constants::ELECTRON_CHARGE)?;
    globals.set_item("FARADAY",          majordome::constants::FARADAY)?;
    globals.set_item("GAS_CONSTANT",     majordome::constants::GAS_CONSTANT)?;
    globals.set_item("GRAVITY",          majordome::constants::GRAVITY)?;
    globals.set_item("PLANCK",           majordome::constants::PLANCK)?;
    globals.set_item("SPEED_OF_LIGHT",   majordome::constants::SPEED_OF_LIGHT)?;
    globals.set_item("STEFAN_BOLTZMANN", majordome::constants::STEFAN_BOLTZMANN)?;
    globals.set_item("T_REFERENCE",      majordome::constants::T_REFERENCE)?;
    globals.set_item("T_NORMAL",         majordome::constants::T_NORMAL)?;
    globals.set_item("P_NORMAL",         majordome::constants::P_NORMAL)?;

    Ok(globals.into())
}

#[pyfunction]
fn hello() -> &'static str {
    "hello from rust"
}