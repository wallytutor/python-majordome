use majordome_constants::{GAS_CONSTANT, P_NORMAL, T_REFERENCE};
use pyo3::prelude::*;
use std::fmt;
use std::path::{Path, PathBuf};
use std::sync::RwLock;

// ---------------------------------------------------------------------------

pub const T_REF: f64 = T_REFERENCE;
pub const P_REF: f64 = P_NORMAL;
pub const R_GAS: f64 = GAS_CONSTANT;

// ---------------------------------------------------------------------------

/// Global list of directories searched when loading data files by relative path.
static DATA_DIRS: RwLock<Vec<PathBuf>> = RwLock::new(Vec::new());

/// Register an additional directory to search when resolving data-file paths.
///
/// Call this before `DatabaseLoader::new` (or `load_substances_from_lua`) so
/// that relative paths such as `"data/sample/simple-calcination.lua"` are
/// looked up inside every registered directory in the order they were added.
pub fn add_data_directory_rs(dir: impl AsRef<Path>) {
    let path = dir.as_ref().to_path_buf();
    DATA_DIRS.write().unwrap().push(path);
}

/// Resolve a (possibly relative) file path against the global data-directory
/// registry.  Returns the first match that exists on disk; if none matches,
/// returns the original path unchanged so callers get a meaningful OS error.
pub fn resolve_data_path(path: &str) -> PathBuf {
    let p = Path::new(path);
    if p.is_absolute() {
        return p.to_path_buf();
    }
    let dirs = DATA_DIRS.read().unwrap();
    for dir in dirs.iter() {
        let candidate = dir.join(p);
        if candidate.exists() {
            return candidate;
        }
    }
    // Fallback: let the caller get a natural "file not found" error.
    p.to_path_buf()
}

/// Python-facing wrapper: register a search directory for data files.
///
/// # Example (Python)
///
/// ```text
/// import majordome.calphad as calphad
/// calphad.add_data_directory("/path/to/my/data")
/// db = calphad.DatabaseLoader("my-phases.lua")
/// ```
#[pyfunction(name = "add_data_directory")]
pub fn add_data_directory_py(path: String) {
    add_data_directory_rs(path);
}

// ---------------------------------------------------------------------------

/// A float wrapper that prints in scientific notation with:
/// - configurable total width and precision
/// - controlled exponent width and total width
/// - exponent always display a sign (+/-)
pub struct SciFmt {
    pub value: f64,
    pub precision: usize,
    pub total_width: usize,
    pub exponent_width: usize,
}

impl fmt::Display for SciFmt {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // 1) Format using Rust's scientific notation
        let raw = format!("{:.*e}", self.precision, self.value);

        // 2) Split mantissa and exponent
        let (mant, exp) = raw.split_once('e').unwrap();

        // 3) Parse exponent and reformat with +02 / -05 / +10
        let exp_val: i32 = exp.parse().unwrap();
        let exp_fixed = format!("{:+0width$}", exp_val, width = 1 + self.exponent_width);

        // 4) Reassemble
        let final_str = format!("{mant}e{exp_fixed}");

        // 5) Apply width/alignment from the struct
        let width = std::cmp::max(self.total_width, final_str.len());

        if self.value > 0.0 {
            write!(f, " {:>width$}", final_str, width = width)
        } else {
            write!(f, "{:>width$}", final_str, width = width)
        }
    }
}

pub fn exponential_fmt(value: f64) -> String {
    let fmt = SciFmt {
        value,
        precision: 8,
        total_width: 12,
        exponent_width: 2,
    };
    fmt.to_string()
}

// ---------------------------------------------------------------------------

pub mod core;
pub mod data;
pub mod equil;
pub mod functions;

// ---------------------------------------------------------------------------
