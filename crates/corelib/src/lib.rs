use pyo3::prelude::*;

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

#[pymodule]
pub mod corelib {

    #[pymodule_export]
    pub const VERSION: &str = env!("CARGO_PKG_VERSION");
}