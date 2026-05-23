use pyo3::prelude::*;


macro_rules! define_constants {
    ($(
        $(#[$meta:meta])*
        $name:ident : $type:ty = $value:expr , $fn_name:ident ;
    )*) => {
        // 1. Declarative PyO3 module containing all constants and functions
        #[pymodule]
        pub mod constants {
            use super::*;

            $(
                $(#[$meta])*
                #[pymodule_export]
                pub const $name: $type = $value;

                $(#[$meta])*
                #[pyfunction]
                pub fn $fn_name() -> $type {
                    $name
                }
            )*
        }

        // 2. Re-export everything at the crate root for clean Rust-level access
        $(
            pub use constants::$name;
            pub use constants::$fn_name;
        )*
    };
}


define_constants! {
    /// Mathematical constant π (pi).
    PI: f64 = std::f64::consts::PI, pi;

    /// Avogadro's number [1/mol].
    AVOGADRO: f64 = 6.022_140_76e23, avogadro;

    /// Boltzmann constant [J/K].
    BOLTZMANN: f64 = 1.38_064_9e-23, boltzmann;

    /// Elementary charge [C].
    ELECTRON_CHARGE: f64 = 1.602_176_634e-19, electron_charge;

    /// Faraday constant [C/mol].
    FARADAY: f64 = 96_485.33_212, faraday;

    /// Universal gas constant [J/(mol·K)].
    GAS_CONSTANT: f64 = 8.314_462_618_153_24, gas_constant;

    /// Conventional gravitational acceleration on Earth [m/s²].
    GRAVITY: f64 = 9.806_65, gravity;

    /// Planck constant [J·s].
    PLANCK: f64 = 6.626_070_15e-34, planck;

    /// Speed of light in vacuum [m/s].
    SPEED_OF_LIGHT: f64 = 299_792_458.0, speed_of_light;

    /// Stefan-Boltzmann constant [W/(m²·K⁴)].
    STEFAN_BOLTZMANN: f64 = 5.670_374_419e-08, stefan_boltzmann;

    /// Thermodynamic reference temperature [K].
    T_REFERENCE: f64 = 298.15, t_reference;

    /// Normal state reference temperature [K].
    T_NORMAL: f64 = 273.15, t_normal;

    /// Normal state reference pressure [Pa].
    P_NORMAL: f64 = 101_325.0, p_normal;
}
