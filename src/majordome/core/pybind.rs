use pyo3::prelude::*;

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