use pyo3::prelude::*;
use pyo3::types::{PyDict};
use serde_json::json;

pub const VERSION: &str = env!("GIT_VERSION");

// region: macros_colored_printing
#[macro_export]
macro_rules! print_header {
    ($($arg:tt)*) => {
        println!("\x1b[34m{}\x1b[0m", format!($($arg)*))
    };
}

#[macro_export]
macro_rules! print_success {
    ($($arg:tt)*) => {
        eprintln!("\x1b[32msuccess: {}\x1b[0m", format!($($arg)*))
    };
}

#[macro_export]
macro_rules! print_warning {
    ($($arg:tt)*) => {
        eprintln!("\x1b[33mwarning: {}\x1b[0m", format!($($arg)*))
    };
}

#[macro_export]
macro_rules! print_error {
    ($($arg:tt)*) => {
        eprintln!("\x1b[31merror: {}\x1b[0m", format!($($arg)*))
    };
}
// endregion: macros_colored_printing

// region: constants
#[pymodule]
pub mod constants {
    use pyo3::prelude::*;

    #[pymodule_export]
    pub const PI: f64 = std::f64::consts::PI;

    #[pymodule_export]
    pub const AVOGADRO: f64 = 6.022_140_76e23;

    #[pymodule_export]
    pub const BOLTZMANN: f64 = 1.38_064_9e-23;

    #[pymodule_export]
    pub const ELECTRON_CHARGE: f64 = 1.602_176_634e-19;

    #[pymodule_export]
    pub const FARADAY: f64 = 96_485.33_212;

    #[pymodule_export]
    pub const GAS_CONSTANT: f64 = 8.314_462_618_153_24;

    #[pymodule_export]
    pub const GRAVITY: f64 = 9.806_65;

    #[pymodule_export]
    pub const PLANCK: f64 = 6.626_070_15e-34;

    #[pymodule_export]
    pub const SPEED_OF_LIGHT: f64 = 299_792_458.0;

    #[pymodule_export]
    pub const STEFAN_BOLTZMANN: f64 = 5.670_374_419e-08;

    #[pymodule_export]
    pub const T_REFERENCE: f64 = 298.15;

    #[pymodule_export]
    pub const T_NORMAL: f64 = 273.15;

    #[pymodule_export]
    pub const P_NORMAL: f64 = 101_325.0;

    /// Mathematical constant π (pi).
    ///
    /// Functional alias for constants.PI.
    #[pyfunction]
    fn pi() -> f64 { PI }

    /// Avogadro's number [1/mol].
    ///
    /// Functional alias for constants.AVOGADRO.
    #[pyfunction]
    fn avogadro() -> f64 { AVOGADRO }

    /// Boltzmann constant [J/K].
    ///
    /// Functional alias for constants.BOLTZMANN.
    #[pyfunction]
    fn boltzmann() -> f64 { BOLTZMANN }

    /// Elementary charge [C].
    ///
    /// Functional alias for constants.ELECTRON_CHARGE.
    #[pyfunction]
    fn electron_charge() -> f64 { ELECTRON_CHARGE }

    /// Faraday constant [C/mol].
    ///
    /// Functional alias for constants.FARADAY.
    #[pyfunction]
    fn faraday() -> f64 { FARADAY }

    /// Universal gas constant [J/(mol·K)].
    ///
    /// Functional alias for constants.GAS_CONSTANT.
    #[pyfunction]
    fn gas_constant() -> f64 { GAS_CONSTANT }

    /// Conventional gravitational acceleration on Earth [m/s²].
    ///
    /// Functional alias for constants.GRAVITY.
    #[pyfunction]
    fn gravity() -> f64 { GRAVITY }

    /// Planck constant [J·s].
    ///
    /// Functional alias for constants.PLANCK.
    #[pyfunction]
    fn planck() -> f64 { PLANCK }

    /// Speed of light in vacuum [m/s].
    ///
    /// Functional alias for constants.SPEED_OF_LIGHT.
    #[pyfunction]
    fn speed_of_light() -> f64 { SPEED_OF_LIGHT }

    /// Stefan-Boltzmann constant [W/(m²·K⁴)].
    ///
    /// Functional alias for constants.STEFAN_BOLTZMANN.
    #[pyfunction]
    fn stefan_boltzmann() -> f64 { STEFAN_BOLTZMANN }

    /// Thermodynamic reference temperature [K].
    ///
    /// Functional alias for constants.T_REFERENCE.
    #[pyfunction]
    fn t_reference() -> f64 { T_REFERENCE }

    /// Normal state reference temperature [K].
    ///
    /// Functional alias for constants.T_NORMAL.
    #[pyfunction]
    fn t_normal() -> f64 { T_NORMAL }

    /// Normal state reference pressure [Pa].
    ///
    /// Functional alias for constants.P_NORMAL.
    #[pyfunction]
    fn p_normal() -> f64 { P_NORMAL }

}
// endregion: constants

// #region: install kernel
pub enum RunMode {
    Ipython(Vec<String>),
    Kernel(Vec<String>),
    InstallKernel { kernel_name: String, display_name: String }
}

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

// region: modules
pub mod utils;
pub mod calphad;
pub mod diffusion;
// endregion: modules

// region: pybind
#[pymodule(name = "_core")]
pub mod handlers {
    use pyo3::prelude::*;

    #[allow(non_upper_case_globals)]
    #[pymodule_export]
    pub const __version__: &str = super::VERSION;

    /// Version of majordome.
    #[pyfunction]
    fn version() -> String { format!("{}", super::VERSION) }

    #[pymodule_export]
    use super::constants;
}
// endregion: pybind
