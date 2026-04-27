use pyo3::prelude::*;

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

// region: modules
pub mod utils;
pub mod calphad;
pub mod diffusion;
// endregion: modules

// region: tool_majordome
mod tool_majordome {
    use serde_json::json;
    use pyo3::prelude::*;
    use pyo3::types::{PyDict, PyModule};
    use crate::{VERSION, constants::*, utils::*};

    const DEFAULT_KERNEL_NAME: &str = "majordome";
    const DEFAULT_DISPLAY_NAME: &str = "Majordome";

    #[pyfunction]
    #[pyo3(signature = (args=None))]
    pub fn majordome_entrypoint(args: Option<Vec<String>>) -> PyResult<()> {
        let mode = parse_mode(resolve_args(args));
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

    #[derive(Debug, PartialEq, Eq)]
    pub enum RunMode {
        Ipython(Vec<String>),
        Kernel(Vec<String>),
        InstallKernel { kernel_name: String, display_name: String }
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

    fn install_jupyter_kernel(
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

    fn start_ipython(
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

    fn start_ipykernel(
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
            let args = vec!["--kernel".to_string(), "-f".to_string(), "conn.json".to_string()];

            assert_eq!(resolve_args(Some(args.clone())), args);
        }
    }
}
// endregion: tool_majordome

// region: tool_containerize
mod tool_containerize {
    use std::fs::File;
    use std::path::Path;
    use std::process::exit;
    use std::process::{ExitStatus};
    use std::env;
    use pyo3::prelude::*;
    use crate::utils::*;

    #[pyfunction]
    pub fn containerize_entrypoint() {
        // TODO allow user to specify paths to container runtimes
        // const DEF_PATH_APPTAINER: &str = "/usr/bin/apptainer";
        // const DEF_PATH_DOCKER: &str = "/usr/bin/docker";
        // const DEF_PATH_PODMAN: &str = "/usr/bin/podman";
        if !cfg!(target_os = "linux") {
            print_error!("This tool only runs on Linux systems.");
            exit(1);
        }

        let config = ContainerConfig::from_args(env::args().collect());
        config.print();

        let tar_name = config.tar_file();
        let sif_name = config.sif_file();

        let tar_file = Path::new(&tar_name);
        let sif_file = Path::new(&sif_name);

        let has_tar = tar_file.exists();
        let has_sif = sif_file.exists();

        if config.cleanup {
            remove_file_if_exists(&tar_file);
            remove_file_if_exists(&sif_file);
        } else if has_tar || has_sif {
            print_warning!("existing files detected:");
            if config.generate_tar && has_tar {
                print_warning!(" - {}", tar_file.display());
            }
            if config.generate_sif && has_sif {
                print_warning!(" - {}", sif_file.display());
            }
            print_warning!("use --cleanup to remove existing files before building.");
            exit(1);
        } else {
            print_warning!("skipping cleanup of existing files");
        }

        match config.container.build(&config) {
            Ok(s) if s.success() => {
                print_success!("✓ Container built successfully");
            }

            Ok(s) => {
                print_error!("✗ Build failed with exit code: {:?}", s.code());
                exit(1);
            }

            Err(e) => {
                print_error!("✗ Failed to execute build command: {}", e);
                exit(1);
            }
        }

        if !config.generate_tar {
            print_success!("\n✓ Skipping tar file generation as per --no-tar flag");
            return;
        }

        match config.container.dump(&config) {
            Ok(s) if s.success() => {
                print_success!("✓ Saved {} file", tar_file.display())
            }

            Ok(s) => {
                print_error!("✗ Save failed with exit code: {:?}", s.code());
                exit(1);
            }

            Err(e) => {
                print_error!("✗ Failed to execute save command: {}", e);
                exit(1);
            }
        }

        if !config.generate_sif {
            print_success!("\n✓ Skipping SIF file generation as per --no-sif flag");
            return;
        }

        match config.container.convert(&config) {
            Ok(s) if s.success() => {
                print_success!("✓ Created {}", sif_file.display())
            }

            Ok(s) => {
                print_error!("✗ Conversion failed with exit code: {:?}", s.code());
                exit(1);
            }

            Err(e) => {
                print_error!("✗ Failed to execute apptainer command: {}", e);
                exit(1);
            }
        }

        print_success!("\n✓ Build complete: {}", tar_file.display());
        print_success!("\n✓ Build complete: {}", sif_file.display());
        print_success!("\nTo clean up:");
        print_success!("  rm {}.tar", tar_file.display());
        print_success!("  {} rmi {}", config.container.as_str(), config.project);
    }

    enum ContainerRuntime {
        Docker,
        Podman,
    }

    struct ContainerConfig {
        project: String,
        container: ContainerRuntime,
        cleanup: bool,
        generate_tar: bool,
        generate_sif: bool
    }

    impl ContainerConfig {
        fn early_exit(name: &str, message: &str) -> ! {
            let verbose = true; // TODO add a flag for this

            print_error!("{}", message);
            if verbose {
                ContainerConfig::usage(&name);
            }
            exit(1);
        }

        fn from_args(args: Vec<String>) -> Self {
            let name = &args[0];

            let mut project: Option<&String> = None;
            let mut container = ContainerRuntime::Podman;
            let mut cleanup = false;
            let mut generate_tar = true;
            let mut generate_sif = true;
            let mut i = 1;

            while i < args.len() {
                match args[i].as_str() {
                    // -----------------------------------------------------------
                    // Handle --help/-h option
                    // -----------------------------------------------------------

                    "--help" | "-h" => {
                        ContainerConfig::usage(name);
                    }

                    // -----------------------------------------------------------
                    // Handle --container option
                    // -----------------------------------------------------------

                    "--container" => {
                        if i + 1 >= args.len() {
                            Self::early_exit(name, "--container requires a value");
                        }

                        let name = args[i + 1].as_str();

                        match name {
                            "docker" => container = ContainerRuntime::Docker,
                            "podman" => container = ContainerRuntime::Podman,
                            _ => {
                                let msg = format!("unknown --container value '{name}'");
                                Self::early_exit(name, &msg);
                            }
                        }

                        i += 2;
                    }

                    // -----------------------------------------------------------
                    // Handle --cleanup option
                    // -----------------------------------------------------------

                    "--cleanup" => {
                        cleanup = true;
                        i += 1;
                    }

                    // -----------------------------------------------------------
                    // Handle --no-tar and --no-sif options
                    // -----------------------------------------------------------

                    "--no-dump" => {
                        generate_tar = false;
                        generate_sif = false;
                        i += 1;
                    }

                    "--no-sif" => {
                        generate_sif = false;
                        i += 1;
                    }

                    // -----------------------------------------------------------
                    // Handle project or unexpected option
                    // -----------------------------------------------------------

                    arg if !arg.starts_with("--") => {
                        if project.is_none() {
                            project = Some(&args[i]);
                        } else {
                            let msg = format!("unexpected argument '{arg}'");
                            Self::early_exit(name, &msg);
                        }
                        i += 1;
                    }

                    // -----------------------------------------------------------
                    // Handle unknown option
                    // -----------------------------------------------------------

                    _ => {
                        let msg = format!("unknown option '{}'", args[i]);
                        Self::early_exit(name, &msg);
                    }
                }
            }

            let project_name = match project {
                Some(p) => p,
                None => {
                    Self::early_exit(name, "missing project name");
                }
            };

            if !generate_tar {
                print_warning!("--no-tar specified; skipping tar file generation");
                generate_sif = false;
            }

            ContainerConfig {
                project: project_name.to_string(),
                container,
                cleanup,
                generate_tar,
                generate_sif
            }
        }

        fn print(&self) {
            let line = "-".repeat(68);
            let header = &format!("{line}\nPROJECT : {0}\n{line}", self.project);

            print_header!("{}", dedent(header));
            println!("\x1b[36mRuntime:\x1b[0m {}", self.container.as_str());
            println!("\x1b[36mCleanup:\x1b[0m {}", self.cleanup);
        }

        fn usage(name: &str) -> ! {
            let color = "\x1b[36m";
            let usage = &format!("
                usage: {0} <project-name> [OPTIONS]

                Options:
                    --help, -h             Show this help message and exit
                    --container <runtime>  Choose docker or podman (default: podman)
                    --cleanup              Remove TAR file before building (default: true)
                    --no-dump              Skip both TAR and SIF generation (default: false)
                    --no-sif               Skip SIF generation (default: false)

                Examples:
                    {0} science-devel
                    {0} my-project --container docker
                    {0} my-project --cleanup
                    {0} my-project science-devel --container podman --no-sif
                ", name);

            println!("{color}{}\x1b[0m", dedent(usage));
            exit(1);
        }

        fn tar_file(&self) -> String {
            format!("{}.tar", self.project)
        }

        fn sif_file(&self) -> String {
            format!("{}.sif", self.project)
        }
    }

    impl ContainerRuntime {
        fn as_str(&self) -> &str {
            match self {
                ContainerRuntime::Docker => "docker",
                ContainerRuntime::Podman => "podman",
            }
        }

        fn build(&self, config: &ContainerConfig) -> Result<ExitStatus, std::io::Error> {
            let logfile = File::create(format!("log.{}.build", config.project))
                .expect("Failed to create log file");

            print_header!("\n→ Building container image...");
            print_header!("\n→ Check log.{}.build for details\n", config.project);

            match self {
                ContainerRuntime::Docker => {
                    unsafe {
                        env::set_var("DOCKER_BUILDKIT", "1");
                    }

                    run_command(&logfile, "docker", &[
                            "build",
                            "--network=host",
                            "--build-arg", "BUILDKIT_INLINE_CACHE=1",
                            "--progress=plain",
                            "-t", &config.project,
                            "-f", "Containerfile",
                            "."
                        ])
                },

                ContainerRuntime::Podman => {
                    run_command(&logfile, "podman", &[
                            "build",
                            "-t", &config.project,
                            "-f", "Containerfile",
                            "."
                        ])
                }
            }
        }

        fn dump(&self, config: &ContainerConfig) -> Result<ExitStatus, std::io::Error> {
            let logfile = File::create(format!("log.{}.dump", config.project))
                .expect("Failed to create log file");

            print_header!("\n→ Dumping container to tar...");
            print_header!("\n→ Check log.{}.dump for details\n", config.project);

            match self {
                ContainerRuntime::Docker => {
                    run_command(&logfile, "docker", &[
                        "save",
                        "-o",
                        &config.tar_file(),
                        &config.project.to_string()
                    ])
                },

                ContainerRuntime::Podman => {
                    run_command(&logfile, "podman", &[
                        "save",
                        "-o",
                        &config.tar_file(),
                        &format!("localhost/{}", config.project)
                    ])
                }
            }
        }

        fn convert(&self, config: &ContainerConfig) -> Result<ExitStatus, std::io::Error> {
            let logfile = File::create(format!("log.{}.convert", config.project))
                .expect("Failed to create log file");

            print_header!("\n→ Converting to Apptainer SIF...");
            print_header!("\n→ Check log.{}.convert for details\n", config.project);

            run_command(&logfile, "apptainer", &[
                "build",
                &config.sif_file(),
                &format!("docker-archive://{}", config.tar_file())
            ])
        }
    }
}
// endregion: tool_containerize

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

    #[pymodule_export]
    use super::tool_majordome::majordome_entrypoint;

    #[pymodule_export]
    use super::tool_containerize::containerize_entrypoint;
}