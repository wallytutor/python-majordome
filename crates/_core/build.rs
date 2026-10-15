use std::process::{Command, Output};

fn main() {
    let output = get_git_output();

    let version = match output {
        Ok(output) if output.status.success() => {
            let tmp = String::from_utf8_lossy(&output.stdout)
                .trim().to_string();

            comply_pep440(&tmp)
        }

        Ok(_) => {
            eprintln!("\x1b[33m⚠ Git describe failed, using Cargo version\x1b[0m");
            get_cargo_version()
        }

        Err(e) => {
            eprintln!("\x1b[33m⚠ Git not available: {}\x1b[0m", e);
            get_cargo_version()
        }
    };

    // Set compile-time environment variable
    println!("cargo:rustc-env=GIT_VERSION={}", version);
    eprintln!("\x1b[32m✓ Version set to: {}\x1b[0m", version);

    // Build plug-flow extension on Linux if Cantera is available
    build_plug_flow();

    // Rebuild if git state changes
    println!("cargo:rerun-if-changed=../.git/HEAD");
    println!("cargo:rerun-if-changed=../.git/index");
    println!("cargo:rerun-if-changed=majordome/plug_flow/ct_pfr.pyx");
    println!("cargo:rerun-if-changed=majordome/plug_flow/src");
    println!("cargo:rerun-if-changed=majordome/plug_flow/_build.py");
}

fn build_plug_flow() {
    #[cfg(target_os = "linux")]
    {
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR")
            .unwrap_or_else(|_| ".".to_string());
        let build_script = std::path::Path::new(&manifest_dir)
            .join("majordome")
            .join("plug_flow")
            .join("_build.py");

        if !build_script.exists() {
            return;
        }

        let python = std::env::var("PYO3_PYTHON")
            .or_else(|_| std::env::var("PYTHON_SYS_EXECUTABLE"))
            .unwrap_or_else(|_| "python3".to_string());

        let res = Command::new(&python)
            .arg(&build_script)
            .current_dir(&manifest_dir)
            .status();

        match res {
            Ok(status) if status.success() => {
                eprintln!("\x1b[32m✓ Plug-flow build hook executed successfully\x1b[0m");
            }
            Ok(status) => {
                eprintln!("\x1b[33m⚠ Plug-flow build hook exited with code {}\x1b[0m", status);
            }
            Err(e) => {
                eprintln!("\x1b[33m⚠ Plug-flow build hook could not run Python: {}\x1b[0m", e);
            }
        }
    }
}

fn comply_pep440(version: &str) -> String {
    if !version.contains("-") {
        return version.to_string();
    }

    let parts: Vec<&str> = version.split('-').collect();

    if parts.len() < 3 {
        return version.to_string();
    }

    let base     = parts[0];
    let commits  = parts[1];
    let git_hash = parts[2];

    let dirty = if parts.len() > 3 && parts[3] == "dirty" {
        ".dirty"
    } else {
        ""
    };

    format!("{base}.post{commits}+{git_hash}{dirty}").to_string()
}

fn get_git_output() -> Result<Output, std::io::Error> {
    Command::new("git")
        .args(["describe", "--tags", "--always", "--dirty"])
        .output()
}

fn get_cargo_version() -> String {
    std::env::var("CARGO_PKG_VERSION").unwrap_or_else(|_| "unknown".to_string())
}