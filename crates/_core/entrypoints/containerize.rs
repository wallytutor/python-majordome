use majordome_utilities::prelude::*;
use majordome_utilities::*;
use pyo3::prelude::*;
use std::env;
use std::fs::File;
use std::path::Path;
use std::process::ExitStatus;
use std::process::exit;

#[pyfunction]
#[pyo3(name = "containerize",signature = (args=None))]
pub fn entrypoint(args: Option<Vec<String>>) {
    // TODO allow user to specify paths to container runtimes
    // const DEF_PATH_APPTAINER: &str = "/usr/bin/apptainer";
    // const DEF_PATH_DOCKER: &str = "/usr/bin/docker";
    // const DEF_PATH_PODMAN: &str = "/usr/bin/podman";
    if !cfg!(target_os = "linux") {
        print_error!("This tool only runs on Linux systems.");
        exit(1);
    }

    let config = ContainerConfig::from_args(resolve_args(args));
    config.print();

    let tar_name = config.tar_file();
    let sif_name = config.sif_file();

    let tar_file = Path::new(&tar_name);
    let sif_file = Path::new(&sif_name);

    let has_tar = tar_file.exists();
    let has_sif = sif_file.exists();

    if config.cleanup {
        remove_file_if_exists(tar_file);
        remove_file_if_exists(sif_file);
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
    generate_sif: bool,
}

impl ContainerConfig {
    fn early_exit(name: &str, message: &str) -> ! {
        let verbose = true; // TODO add a flag for this

        print_error!("{}", message);
        if verbose {
            ContainerConfig::usage(name);
        }
        exit(1);
    }

    fn from_args(args: Vec<String>) -> Self {
        let name = "containerize";

        let mut project: Option<&str> = None;
        let mut container = ContainerRuntime::Podman;
        let mut cleanup = false;
        let mut generate_tar = true;
        let mut generate_sif = true;
        let mut i = 0;

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

                    let runtime_name = args[i + 1].as_str();

                    match runtime_name {
                        "docker" => container = ContainerRuntime::Docker,
                        "podman" => container = ContainerRuntime::Podman,
                        _ => {
                            let msg = format!("unknown --container value '{runtime_name}'");
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
                        project = Some(arg);
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
            generate_sif,
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
        let usage = &format!(
            "
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
                ",
            name
        );

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

                run_command(
                    &logfile,
                    "docker",
                    &[
                        "build",
                        "--network=host",
                        "--build-arg",
                        "BUILDKIT_INLINE_CACHE=1",
                        "--progress=plain",
                        "-t",
                        &config.project,
                        "-f",
                        "Containerfile",
                        ".",
                    ],
                )
            }

            ContainerRuntime::Podman => run_command(
                &logfile,
                "podman",
                &["build", "-t", &config.project, "-f", "Containerfile", "."],
            ),
        }
    }

    fn dump(&self, config: &ContainerConfig) -> Result<ExitStatus, std::io::Error> {
        let logfile = File::create(format!("log.{}.dump", config.project))
            .expect("Failed to create log file");

        print_header!("\n→ Dumping container to tar...");
        print_header!("\n→ Check log.{}.dump for details\n", config.project);

        match self {
            ContainerRuntime::Docker => run_command(
                &logfile,
                "docker",
                &[
                    "save",
                    "-o",
                    &config.tar_file(),
                    &config.project.to_string(),
                ],
            ),

            ContainerRuntime::Podman => run_command(
                &logfile,
                "podman",
                &[
                    "save",
                    "-o",
                    &config.tar_file(),
                    &format!("localhost/{}", config.project),
                ],
            ),
        }
    }

    fn convert(&self, config: &ContainerConfig) -> Result<ExitStatus, std::io::Error> {
        let logfile = File::create(format!("log.{}.convert", config.project))
            .expect("Failed to create log file");

        print_header!("\n→ Converting to Apptainer SIF...");
        print_header!("\n→ Check log.{}.convert for details\n", config.project);

        run_command(
            &logfile,
            "apptainer",
            &[
                "build",
                &config.sif_file(),
                &format!("docker-archive://{}", config.tar_file()),
            ],
        )
    }
}

#[cfg(test)]
mod test {
    use super::{ContainerConfig, ContainerRuntime};

    #[test]
    fn parse_cli_args_without_program_name() {
        let config = ContainerConfig::from_args(vec![
            "my-project".to_string(),
            "--container".to_string(),
            "docker".to_string(),
            "--cleanup".to_string(),
            "--no-sif".to_string(),
        ]);

        assert_eq!(config.project, "my-project");
        assert!(matches!(config.container, ContainerRuntime::Docker));
        assert!(config.cleanup);
        assert!(config.generate_tar);
        assert!(!config.generate_sif);
    }
}
