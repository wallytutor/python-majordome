use pyo3::prelude::pymodule;

#[pymodule]
pub mod constants {

    #[pymodule_export]
    const PI: f64 = std::f64::consts::PI;

    #[pymodule_export]
    const GAS_CONSTANT: f64 = 8.31446261815324;

    #[pymodule_export]
    const AVOGADRO: f64 = 6.02214076e23;

    #[pymodule_export]
    const BOLTZMANN: f64 = 1.380649e-23;

    #[pymodule_export]
    const ELECTRON_CHARGE: f64 = 1.602176634e-19;

    #[pymodule_export]
    const PLANCK: f64 = 6.62607015e-34;

    #[pymodule_export]
    const SPEED_OF_LIGHT: f64 = 299792458.0;

    #[pymodule_export]
    const FARADAY: f64 = 96485.33212;

    /// Conventional gravitational acceleration on Earth [m/s²].
    #[pymodule_export]
    const GRAVITY: f64 = 9.80665;

    /// Thermodynamic reference temperature [K].
    #[pymodule_export]
    const T_REFERENCE: f64 = 298.15;

    /// Normal state reference temperature [K].
    #[pymodule_export]
    const T_NORMAL: f64 = 273.15;

    /// Normal state reference pressure [Pa].
    #[pymodule_export]
    const P_NORMAL: f64 = 101325.0;
}
