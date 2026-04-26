use pyo3::prelude::*;
use pyo3::types::{PyDict};
use serde_json::json;

pub enum RunMode {
    Ipython(Vec<String>),
    Kernel(Vec<String>),
    InstallKernel { kernel_name: String, display_name: String }
}

// #region: install kernel
pub fn install_jupyter_kernel(
        py: Python<'_>,
        kernel_name: &str,
        display_name: &str
    ) -> PyResult<()> {
    let executable = std::env::current_exe()
        .map_err(to_runtime_error)?;

    let temporary_dir = create_temp_kernel_spec(executable, display_name)
        .map_err(to_runtime_error)?;

    let install_result = (|| -> PyResult<String> {
        let kernelspec = PyModule::import(py, "jupyter_client.kernelspec")?;
        let manager = kernelspec.getattr("KernelSpecManager")?.call0()?;

        let kwargs = PyDict::new(py);
        kwargs.set_item("kernel_name", kernel_name)?;
        kwargs.set_item("user", true)?;
        kwargs.set_item("replace", true)?;

        let destination = manager.call_method(
            "install_kernel_spec",
            (temporary_dir.to_string_lossy().to_string(),),
            Some(&kwargs),
        )?;

        destination.extract()
    })();

    std::fs::remove_dir_all(&temporary_dir)
        .map_err(to_runtime_error)?;

    let destination = install_result?;
    println!(
        "Installed kernel '{kernel_name}' as '{display_name}' in {destination}"
    );

    Ok(())
}

fn create_temp_kernel_spec(
        executable: std::path::PathBuf,
        display_name: &str
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
// #endregion: install kernel

// #region: start kernels
pub fn start_ipython(
        py: Python<'_>,
        globals: Py<PyDict>,
        args: Vec<String>
    ) -> PyResult<()> {
    let kwargs = PyDict::new(py);
    kwargs.set_item("user_ns", globals)?;

    let ipython = PyModule::import(py, "IPython")?;
    ipython.call_method("start_ipython", (args,), Some(&kwargs))?;

    Ok(())
}

pub fn start_ipykernel(
        py: Python<'_>,
        globals: Py<PyDict>,
        args: Vec<String>
    ) -> PyResult<()> {
    let kwargs = PyDict::new(py);
    kwargs.set_item("argv", args)?;
    kwargs.set_item("user_ns", globals)?;

    let kernelapp = PyModule::import(py, "ipykernel.kernelapp")?;
    let app = kernelapp.getattr("IPKernelApp")?;
    app.call_method("launch_instance", (), Some(&kwargs))?;

    Ok(())
}
// #endregion: start kernels