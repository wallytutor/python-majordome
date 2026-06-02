use crate::VERSION;
use majordome_constants::prelude::*;
use majordome_utilities::prelude::*;
use majordome_utilities::*;
use pyo3::prelude::*;
use pyo3::types::{PyDict, PyModule};
use serde_json::json;

const DEFAULT_KERNEL_NAME: &str = "majordome";
const DEFAULT_DISPLAY_NAME: &str = "Majordome";

#[pyfunction]
#[pyo3(name = "majordome", signature = (args=None))]
pub fn entrypoint(args: Option<Vec<String>>) -> PyResult<()> {
    let mode = parse_mode(resolve_args(args));
    print_header!("Majordome IPython: {}\n", VERSION);

    Python::attach(|py| match mode {
        RunMode::Ipython(args) => {
            // XXX: if --help is passed, IPython returns a SystemExit
            // exception so we will not return the context manager state.
            let globals = start_globals(py)?;
            start_ipython(py, globals, args)
        }

        RunMode::Kernel(args) => {
            let globals = start_globals(py)?;
            start_ipykernel(py, globals, args)
        }

        RunMode::InstallKernel {
            kernel_name,
            display_name,
        } => install_jupyter_kernel(py, &kernel_name, &display_name),
    })?;

    Ok(())
}

#[derive(Debug, PartialEq, Eq)]
pub enum RunMode {
    Ipython(Vec<String>),
    Kernel(Vec<String>),
    InstallKernel {
        kernel_name: String,
        display_name: String,
    },
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
    println!(concat!(
        "Usage:\n",
        "  majordome [IPYTHON_ARGS...]\n",
        "  majordome --kernel -f <connection_file>\n",
        "  majordome --install-kernel",
        " [--kernel-name NAME]",
        " [--display-name NAME]",
        "\n\n---\n\n"
    ));
}

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

    globals.set_item("PI", PI)?;
    globals.set_item("AVOGADRO", AVOGADRO)?;
    globals.set_item("BOLTZMANN", BOLTZMANN)?;
    globals.set_item("ELECTRON_CHARGE", ELECTRON_CHARGE)?;
    globals.set_item("FARADAY", FARADAY)?;
    globals.set_item("GAS_CONSTANT", GAS_CONSTANT)?;
    globals.set_item("GRAVITY", GRAVITY)?;
    globals.set_item("PLANCK", PLANCK)?;
    globals.set_item("SPEED_OF_LIGHT", SPEED_OF_LIGHT)?;
    globals.set_item("STEFAN_BOLTZMANN", STEFAN_BOLTZMANN)?;
    globals.set_item("T_REFERENCE", T_REFERENCE)?;
    globals.set_item("T_NORMAL", T_NORMAL)?;
    globals.set_item("P_NORMAL", P_NORMAL)?;

    Ok(globals.into())
}

fn install_jupyter_kernel(py: Python<'_>, kernel_name: &str, display_name: &str) -> PyResult<()> {
    let executable = std::env::current_exe().map_err(to_runtime_error)?;

    let temporary_dir =
        create_temp_kernel_spec(executable, display_name).map_err(to_runtime_error)?;

    let install_result = (|| -> PyResult<String> {
        let kernelspec = PyModule::import(py, "jupyter_client.kernelspec")?;
        let manager = kernelspec.getattr("KernelSpecManager")?.call0()?;

        let kwargs = PyDict::new(py);
        kwargs.set_item("kernel_name", kernel_name)?;
        kwargs.set_item("user", true)?;

        let destination = manager.call_method(
            "install_kernel_spec",
            (temporary_dir.to_string_lossy().to_string(),),
            Some(&kwargs),
        )?;

        destination.extract()
    })();

    std::fs::remove_dir_all(&temporary_dir).map_err(to_runtime_error)?;

    let destination = install_result?;
    println!("Installed kernel '{kernel_name}' as '{display_name}' in {destination}");

    Ok(())
}

fn start_ipython(py: Python<'_>, globals: Py<PyDict>, args: Vec<String>) -> PyResult<()> {
    let kwargs = PyDict::new(py);
    kwargs.set_item("user_ns", globals)?;

    let ipython = PyModule::import(py, "IPython")?;
    ipython.call_method("start_ipython", (args,), Some(&kwargs))?;

    Ok(())
}

fn start_ipykernel(py: Python<'_>, globals: Py<PyDict>, args: Vec<String>) -> PyResult<()> {
    let kwargs = PyDict::new(py);
    kwargs.set_item("argv", args)?;
    kwargs.set_item("user_ns", globals)?;

    let kernelapp = PyModule::import(py, "ipykernel.kernelapp")?;
    let app = kernelapp.getattr("IPKernelApp")?;
    app.call_method("launch_instance", (), Some(&kwargs))?;

    Ok(())
}

fn create_temp_kernel_spec(
    executable: std::path::PathBuf,
    display_name: &str,
) -> std::io::Result<std::path::PathBuf> {
    let mut directory = std::env::temp_dir();

    let pid = std::process::id();
    let timestamp = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap_or_default()
        .as_millis();

    directory.push(format!("majordome-kernel-{pid}-{timestamp}"));
    std::fs::create_dir_all(&directory)?;

    let kernel_json = json!({
        "argv": [
            executable.to_string_lossy().to_string(),
            "--kernel",
            "-f",
            "{connection_file}"
        ],
        "display_name": display_name,
        "language": "python",
        "env": {
            "MPLBACKEND": "module://matplotlib_inline.backend_inline"
        },
        "metadata": {
            "debugger": true
        },
    });

    let kernel_path = directory.join("kernel.json");
    let content = serde_json::to_string_pretty(&kernel_json)?;
    std::fs::write(kernel_path, content)?;

    Ok(directory)
}

fn to_runtime_error(error: impl std::fmt::Display) -> PyErr {
    pyo3::exceptions::PyRuntimeError::new_err(error.to_string())
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn empty_args_default_to_ipython_without_banner() {
        assert_eq!(
            parse_mode(Vec::new()),
            RunMode::Ipython(vec!["--no-banner".to_string()])
        );
    }

    #[test]
    fn explicit_args_bypass_process_argv_lookup() {
        let args = vec![
            "--kernel".to_string(),
            "-f".to_string(),
            "conn.json".to_string(),
        ];

        assert_eq!(resolve_args(Some(args.clone())), args);
    }
}
