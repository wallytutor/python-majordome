use pyo3::prelude::*;

pub fn variant_name_upper<T: std::fmt::Debug>(variant: &T) -> String {
    let dbg = format!("{:?}", variant);

    let mut s = String::new();

    for (i, c) in dbg.chars().enumerate() {
        if c.is_uppercase() && i > 0 {
            s.push('_');
        }
        s.push(c.to_ascii_uppercase());
    }
    s
}

pub fn dedent(s: &str) -> String {
    let lines: Vec<&str> = s.lines().collect();

    if lines.is_empty() {
        return String::new();
    }

    // Find minimum indentation (ignoring empty lines)
    let min_indent = lines.iter()
        .filter(|line| !line.trim().is_empty())
        .map(|line| line.chars().take_while(|c| c.is_whitespace()).count())
        .min()
        .unwrap_or(0);

    // Remove that indentation from all lines
    lines.iter()
        .map(|line| {
            if line.len() >= min_indent {
                &line[min_indent..]
            } else {
                line
            }
        })
        .collect::<Vec<_>>()
        .join("\n")
}

pub fn remove_file_if_exists(file_path: &std::path::Path) -> () {
    if file_path.exists() {
        std::fs::remove_file(file_path).expect("Failed to remove file");
        print_success!("removed existing {}", file_path.display());
    } else {
        print_warning!("no existing {} file found", file_path.display());
    }
}

pub fn run_command(
        log: &std::fs::File,
        cmd: &str,
        args: &[&str]
    ) -> Result<std::process::ExitStatus, std::io::Error> {
    std::process::Command::new(cmd)
        .args(args)
        .stdout(std::process::Stdio::from(log.try_clone().unwrap()))
        .stderr(std::process::Stdio::from(log.try_clone().unwrap()))
        .status()
}

pub fn resolve_args(args: Option<Vec<String>>) -> Vec<String> {
    args.unwrap_or_else(|| std::env::args().skip(1).collect())
}

pub fn to_runtime_error(error: impl std::fmt::Display) -> PyErr {
    pyo3::exceptions::PyRuntimeError::new_err(error.to_string())
}