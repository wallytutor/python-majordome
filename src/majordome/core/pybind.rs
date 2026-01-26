use pyo3::prelude::*;

pub use super::declarations::*;

#[pymodule]
pub mod constants {
    use pyo3::prelude::*;

    use super::{
        PI              as RUST_PI,
        AVOGADRO        as RUST_AVOGADRO,
        BOLTZMANN       as RUST_BOLTZMANN,
        ELECTRON_CHARGE as RUST_ELECTRON_CHARGE,
        FARADAY         as RUST_FARADAY,
        GAS_CONSTANT    as RUST_GAS_CONSTANT,
        GRAVITY         as RUST_GRAVITY,
        PLANCK          as RUST_PLANCK,
        SPEED_OF_LIGHT  as RUST_SPEED_OF_LIGHT,
        T_REFERENCE     as RUST_T_REFERENCE,
        T_NORMAL        as RUST_T_NORMAL,
        P_NORMAL        as RUST_P_NORMAL,
    };

    #[pymodule_export]
    pub const PI: f64 = RUST_PI;

    #[pymodule_export]
    pub const AVOGADRO: f64 = RUST_AVOGADRO;

    #[pymodule_export]
    pub const BOLTZMANN: f64 = RUST_BOLTZMANN;

    #[pymodule_export]
    pub const ELECTRON_CHARGE: f64 = RUST_ELECTRON_CHARGE;

    #[pymodule_export]
    pub const FARADAY: f64 = RUST_FARADAY;

    #[pymodule_export]
    pub const GAS_CONSTANT: f64 = RUST_GAS_CONSTANT;

    #[pymodule_export]
    pub const GRAVITY: f64 = RUST_GRAVITY;

    #[pymodule_export]
    pub const PLANCK: f64 = RUST_PLANCK;

    #[pymodule_export]
    pub const SPEED_OF_LIGHT: f64 = RUST_SPEED_OF_LIGHT;

    #[pymodule_export]
    pub const T_REFERENCE: f64 = RUST_T_REFERENCE;

    #[pymodule_export]
    pub const T_NORMAL: f64 = RUST_T_NORMAL;

    #[pymodule_export]
    pub const P_NORMAL: f64 = RUST_P_NORMAL;

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