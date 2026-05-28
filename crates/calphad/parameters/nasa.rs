use crate::core::R_GAS;
use majordome_numerical::prelude::*;

pub fn cp_nasa7<T: Numeric>(a1: T, a2: T, a3: T, a4: T, a5: T, t: T) -> T {
    let poly = a1 + t * (a2 + t * (a3 + t * (a4 + t * a5)));
    T::from_f64(self::R_GAS) * poly
}

pub fn enthalpy_nasa7<T: Numeric>(a1: T, a2: T, a3: T, a4: T, a5: T, a6: T, t: T) -> T {
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let c4 = T::from_f64(1.0 / 4.0);
    let c5 = T::from_f64(1.0 / 5.0);
    let poly = a6 / t + a1 + t * (c2 * a2 + t * (c3 * a3 + t * (c4 * a4 + t * (c5 * a5))));
    T::from_f64(self::R_GAS) * poly * t
}

pub fn entropy_nasa7<T: Numeric>(a1: T, a2: T, a3: T, a4: T, a5: T, a7: T, t: T) -> T {
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let c4 = T::from_f64(1.0 / 4.0);
    let poly = a7 + a1 * t.ln() + t * (a2 + t * (c2 * a3 + t * (c3 * a4 + t * (c4 * a5))));
    T::from_f64(self::R_GAS) * poly
}

// --------------------------------------------------------------------------

pub fn cp_nasa9<T: Numeric>(a1: T, a2: T, a3: T, a4: T, a5: T, a6: T, a7: T, t: T) -> T {
    let poly = a1 / (t * t) + a2 / t + a3 + t * (a4 + t * (a5 + t * (a6 + t * a7)));
    T::from_f64(self::R_GAS) * poly
}

pub fn enthalpy_nasa9<T: Numeric>(
    a1: T,
    a2: T,
    a3: T,
    a4: T,
    a5: T,
    a6: T,
    a7: T,
    a8: T,
    t: T,
) -> T {
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let c4 = T::from_f64(1.0 / 4.0);
    let c5 = T::from_f64(1.0 / 5.0);
    let poly = -a1 / (t * t)
        + a2 * t.ln() / t
        + a3
        + a4 * t * c2
        + a5 * (t * t) * c3
        + a6 * (t * t * t) * c4
        + a7 * (t * t * t * t) * c5
        + a8 / t;
    T::from_f64(self::R_GAS) * poly * t
}

pub fn entropy_nasa9<T: Numeric>(
    a1: T,
    a2: T,
    a3: T,
    a4: T,
    a5: T,
    a6: T,
    a7: T,
    a9: T,
    t: T,
) -> T {
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let c4 = T::from_f64(1.0 / 4.0);
    let poly = -a1 / (c2 * t * t) - a2 / t
        + a3 * t.ln()
        + a4 * t
        + a5 * (t * t) * c2
        + a6 * (t * t * t) * c3
        + a7 * (t * t * t * t) * c4
        + a9;
    T::from_f64(self::R_GAS) * poly
}
