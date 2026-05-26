pub fn run_command(
    log: &std::fs::File,
    cmd: &str,
    args: &[&str],
) -> Result<std::process::ExitStatus, std::io::Error> {
    std::process::Command::new(cmd)
        .args(args)
        .stdout(std::process::Stdio::from(log.try_clone().unwrap()))
        .stderr(std::process::Stdio::from(log.try_clone().unwrap()))
        .status()
}

/// Resolve entrypoint arguments from Python wrappers or process CLI.
///
/// Contract: returned vector contains CLI arguments only (no program name).
pub fn resolve_args(args: Option<Vec<String>>) -> Vec<String> {
    args.unwrap_or_else(|| std::env::args().skip(1).collect())
}
