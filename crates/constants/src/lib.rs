use pyo3::prelude::*;


/// This module provides various physical and mathematical constants.
///
#[pymodule]
pub mod constants {
    use pyo3::prelude::*;

    type Double = f64;

    #[pymodule_export]
    pub const VERSION: &str = env!("CARGO_PKG_VERSION");

    #[pymodule_export]
    pub const PI: Double = std::f64::consts::PI;

    #[pymodule_export]
    pub const GAS_CONSTANT: Double = 8.31446261815324;

    #[pymodule_export]
    pub const AVOGADRO: Double = 6.02214076e23;

    #[pymodule_export]
    pub const BOLTZMANN: Double = 1.380649e-23;

    #[pymodule_export]
    pub const ELECTRON_CHARGE: Double = 1.602176634e-19;
    #[pymodule_export]
    pub const PLANCK: Double = 6.62607015e-34;

    #[pymodule_export]
    pub const SPEED_OF_LIGHT: Double = 299792458.0;

    #[pymodule_export]
    pub const FARADAY: Double = 96485.33212;

    #[pymodule_export]
    pub const GRAVITY: Double = 9.80665;

    #[pymodule_export]
    pub const T_REFERENCE: Double = 298.15;

    #[pymodule_export]
    pub const T_NORMAL: Double = 273.15;

    #[pymodule_export]
    pub const P_NORMAL: Double = 101325.0;

    //=================================================================
    // DUMMY INTERFACES FOR DOCS
    //=================================================================

    /// Version of the Rust crate for majordome.constants.
    #[pyfunction]
    fn version() -> String {
        format!("{}", VERSION)
    }

    /// Mathematical constant π (pi).
    ///
    /// Functional alias for constants.PI.
    #[pyfunction]
    fn pi() -> Double {
        PI
    }

    /// Universal gas constant [J/(mol·K)].
    ///
    /// Functional alias for constants.GAS_CONSTANT.
    #[pyfunction]
    fn gas_constant() -> Double {
        GAS_CONSTANT
    }

    /// Avogadro's number [1/mol].
    ///
    /// Functional alias for constants.AVOGADRO.
    #[pyfunction]
    fn avogadro() -> Double {
        AVOGADRO
    }

    /// Boltzmann constant [J/K].
    ///
    /// Functional alias for constants.BOLTZMANN.
    #[pyfunction]
    fn boltzmann() -> Double {
        BOLTZMANN
    }

    /// Elementary charge [C].
    ///
    /// Functional alias for constants.ELECTRON_CHARGE.
    #[pyfunction]
    fn electron_charge() -> Double {
        ELECTRON_CHARGE
    }

    /// Planck constant [J·s].
    ///
    /// Functional alias for constants.PLANCK.
    #[pyfunction]
    fn planck() -> Double {
        PLANCK
    }

    /// Speed of light in vacuum [m/s].
    ///
    /// Functional alias for constants.SPEED_OF_LIGHT.
    #[pyfunction]
    fn speed_of_light() -> Double {
        SPEED_OF_LIGHT
    }

    /// Faraday constant [C/mol].
    ///
    /// Functional alias for constants.FARADAY.
    #[pyfunction]
    fn faraday() -> Double {
        FARADAY
    }

    /// Conventional gravitational acceleration on Earth [m/s²].
    ///
    /// Functional alias for constants.GRAVITY.
    #[pyfunction]
    fn gravity() -> Double {
        GRAVITY
    }

    /// Thermodynamic reference temperature [K].
    ///
    /// Functional alias for constants.T_REFERENCE.
    #[pyfunction]
    fn t_reference() -> Double {
        T_REFERENCE
    }

    /// Normal state reference temperature [K].
    ///
    /// Functional alias for constants.T_NORMAL.
    #[pyfunction]
    fn t_normal() -> Double {
        T_NORMAL
    }

    /// Normal state reference pressure [Pa].
    ///
    /// Functional alias for constants.P_NORMAL.
    #[pyfunction]
    fn p_normal() -> Double {
        P_NORMAL
    }

}
