use pyo3::prelude::*;
use pyo3::types::{PyDict, PyModule};

use majordome::{print_header, VERSION};
use majordome::constants::*;
use majordome::kernels::{
    RunMode,
    install_jupyter_kernel,
    start_ipython,
    start_ipykernel
};

const DEFAULT_KERNEL_NAME: &str = "majordome";
const DEFAULT_DISPLAY_NAME: &str = "Majordome";

// #region: main and mode parsing
fn main() -> PyResult<()> {
    let mode = parse_mode(std::env::args().skip(1).collect());
    print_header!("Majordome IPython: {}\n", VERSION);

    Python::attach(|py| match mode {
        RunMode::Ipython(args) => {
            // XXX: if --help is passed, IPython returns a SystemExit
            // exception so we will not return the context manager state.
            let globals = start_globals(py)?;
            start_ipython(py, globals, args)
        },
        RunMode::Kernel(args) => {
            let globals = start_globals(py)?;
            start_ipykernel(py, globals, args)
        },
        RunMode::InstallKernel { kernel_name, display_name } => {
            install_jupyter_kernel(py, &kernel_name, &display_name)
        }
    })?;

    Ok(())
}

fn parse_mode(args: Vec<String>) -> RunMode {
    if args.iter().any(|arg| arg == "--install-kernel") {
        return parse_install_mode(args);
    }

    if let Some(index) = args.iter().position(|arg| arg == "--kernel") {
        let mut kernel_args = args;
        kernel_args.remove(index);
        return RunMode::Kernel(kernel_args);
    }

    if args.iter().any(|arg| arg == "--help" || arg == "-h") {
        print_usage();
    }

    let mut ipython_args = args;
    if !ipython_args.iter().any(|arg| arg == "--no-banner") {
        ipython_args.push("--no-banner".to_string());
    }

    RunMode::Ipython(ipython_args)
}

fn parse_install_mode(args: Vec<String>) -> RunMode {
    let mut kernel_name = DEFAULT_KERNEL_NAME.to_string();
    let mut display_name = DEFAULT_DISPLAY_NAME.to_string();

    let mut index = 0;

    while index < args.len() {
        match args[index].as_str() {
            "--install-kernel" => {
                index += 1;
            }

            "--kernel-name" => {
                if index + 1 >= args.len() {
                    eprintln!("--kernel-name requires a value");
                    std::process::exit(2);
                }
                kernel_name = args[index + 1].clone();
                index += 2;
            }

            "--display-name" => {
                if index + 1 >= args.len() {
                    eprintln!("--display-name requires a value");
                    std::process::exit(2);
                }
                display_name = args[index + 1].clone();
                index += 2;
            }

            "--help" | "-h" => {
                print_usage();
                std::process::exit(0);
            }

            other => {
                eprintln!("Unknown option for kernel installation: {other}");
                print_usage();
                std::process::exit(2);
            }
        }
    }

    RunMode::InstallKernel {
        kernel_name,
        display_name,
    }
}

fn print_usage() {
    println!(
        concat!(
            "Usage:\n",
            "  majordome [IPYTHON_ARGS...]\n",
            "  majordome --kernel -f <connection_file>\n",
            "  majordome --install-kernel",
            " [--kernel-name NAME]",
            " [--display-name NAME]",
            "\n\n---\n\n"
        )
    );
}
// #endregion: main and mode parsing

// #region: start globals
fn start_globals(py: Python<'_>) -> PyResult<Py<PyDict>> {
    // Create a persistent dictionary to hold the new globals injected
    // into the Python environment and import builtins to add the new
    // functions to it.
    let globals = PyDict::new(py);
    // let builtins = PyModule::import(py, "builtins")?;

    // #[pyfunction]
    // fn hello() -> &'static str { "hello from rust" }
    // builtins.add_function(wrap_pyfunction!(hello, py)?)?;

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
// #endregion: start globals
