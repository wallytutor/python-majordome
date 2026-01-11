use std::fs;
use std::fs::File;
use std::path::Path;
use std::process::{Command, Stdio, exit};
use std::process::{ExitStatus};
use std::env;
use corelib::{dedent};

#[macro_use]
extern crate corelib;

//////////////////////////////////////////////////////////////////////////////
// UTILITY FUNCTIONS
//////////////////////////////////////////////////////////////////////////////

fn remove_file_if_exists(file_path: &Path) -> () {
    if file_path.exists() {
        fs::remove_file(file_path).expect("Failed to remove file");
        print_success!("removed existing {}", file_path.display());
    } else {
        print_warning!("no existing {} file found", file_path.display());
    }
}

fn run_command(log: &File, cmd: &str, args: &[&str]) -> Result<ExitStatus, std::io::Error> {
    Command::new(cmd)
        .args(args)
        .stdout(Stdio::from(log.try_clone().unwrap()))
        .stderr(Stdio::from(log.try_clone().unwrap()))
        .status()
}

//////////////////////////////////////////////////////////////////////////////
// STRUCTS & ENUMS
//////////////////////////////////////////////////////////////////////////////

enum ContainerRuntime {
    Docker,
    Podman,
}

struct Config {
    project: String,
    container: ContainerRuntime,
    cleanup: bool,
}

impl Config {
    fn from_args(args: Vec<String>) -> Self {
        let name = &args[0];

        let mut project: Option<&String> = None;
        let mut container = ContainerRuntime::Podman;
        let mut cleanup = false;

        let mut i = 1;

        while i < args.len() {
            match args[i].as_str() {
                // -----------------------------------------------------------
                // Handle --help/-h option
                // -----------------------------------------------------------

                "--help" | "-h" => {
                    Config::usage(name);
                }

                // -----------------------------------------------------------
                // Handle --container option
                // -----------------------------------------------------------

                "--container" => {
                    if i + 1 >= args.len() {
                        early_exit(name, "--container requires a value");
                    }

                    let name = args[i + 1].as_str();

                    match name {
                        "docker" => container = ContainerRuntime::Docker,
                        "podman" => container = ContainerRuntime::Podman,
                        _ => {
                            let msg = format!("unknown --container value '{name}'");
                            early_exit(name, &msg);
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
                // Handle project or unexpected option
                // -----------------------------------------------------------

                arg if !arg.starts_with("--") => {
                    if project.is_none() {
                        project = Some(&args[i]);
                    } else {
                        let msg = format!("unexpected argument '{arg}'");
                        early_exit(name, &msg);
                    }
                    i += 1;
                }

                // -----------------------------------------------------------
                // Handle unknown option
                // -----------------------------------------------------------

                _ => {
                    let msg = format!("unknown option '{}'", args[i]);
                    early_exit(name, &msg);
                }
            }
        }

        let project_name = match project {
            Some(p) => p,
            None => {
                early_exit(name, "missing project name");
            }
        };

        Config {
            project: project_name.to_string(),
            container,
            cleanup,
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
                --cleanup              Remove tar file before building (default: true)

            Examples:
                {0} science-devel
                {0} my-project --container docker
                {0} my-project --cleanup
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

    fn build(&self, config: &Config) -> Result<ExitStatus, std::io::Error> {
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

    fn dump(&self, config: &Config) -> Result<ExitStatus, std::io::Error> {
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

    fn convert(&self, config: &Config) -> Result<ExitStatus, std::io::Error> {
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

// TODO allow user to specify paths to container runtimes
// const DEF_PATH_APPTAINER: &str = "/usr/bin/apptainer";
// const DEF_PATH_DOCKER: &str = "/usr/bin/docker";
// const DEF_PATH_PODMAN: &str = "/usr/bin/podman";

fn early_exit(name: &str, message: &str) -> ! {
    let verbose = true; // TODO add a flag for this

    print_error!("{}", message);
    if verbose {
        Config::usage(&name);
    }
    exit(1);
}

//////////////////////////////////////////////////////////////////////////////
// SPECIFIC FUNCTIONS
//////////////////////////////////////////////////////////////////////////////

fn main() {
    if !cfg!(target_os = "linux") {
        print_error!("This tool only runs on Linux systems.");
        exit(1);
    }

    let config = Config::from_args(env::args().collect());
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
        if has_tar { print_warning!(" - {}", tar_file.display()); }
        if has_sif { print_warning!(" - {}", sif_file.display()); }
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
