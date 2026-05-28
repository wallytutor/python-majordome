use majordome_numerical::prelude::*;

pub fn cp_gibbs_polynomial<T: Numeric>(c: T, d: T, e: T, f: T, g: T, t: T) -> T {
    // G = a + bT + cT ln T + dT^2 + eT^3 + fT^4 + g/T
    // S = -dG/dT = -b - c(ln T + 1) - 2dT - 3eT^2 - 4fT^3 + g/T^2
    // H = G + TS = a - cT + dT^2 + 2eT^3 + 3fT^4 + 2g/T
    // Cp = dH/dT = -c + 2dT + 6eT^2 + 12fT^3 - 2g/T^2
    let c2 = T::from_f64(2.0);
    let c6 = T::from_f64(6.0);
    let c12 = T::from_f64(12.0);
    (-c) + c2 * d * t + c6 * e * (t * t) + c12 * f * (t * t * t) - c2 * g / (t * t)
}

pub fn enthalpy_gibbs_polynomial<T: Numeric>(a: T, c: T, d: T, e: T, f: T, g: T, t: T) -> T {
    // H = a - cT + dT^2 + 2eT^3 + 3fT^4 + 2g/T
    let c2 = T::from_f64(2.0);
    let c3 = T::from_f64(3.0);
    a - c * t + d * (t * t) + c2 * e * (t * t * t) + c3 * f * (t * t * t * t) + c2 * g / t
}

pub fn entropy_gibbs_polynomial<T: Numeric>(b: T, c: T, d: T, e: T, f: T, g: T, t: T) -> T {
    // S = -b - c(ln T + 1) - 2dT - 3eT^2 - 4fT^3 + g/T^2
    let c2 = T::from_f64(2.0);
    let c3 = T::from_f64(3.0);
    let c4 = T::from_f64(4.0);
    (-b) - c * (t.ln() + T::from_f64(1.0)) - c2 * d * t - c3 * e * (t * t) - c4 * f * (t * t * t)
        + g / (t * t)
}
