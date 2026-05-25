use super::R_GAS;
use majordome_numerical::autodiff::Numeric;

pub fn cp_maierkelley<T: Numeric>(a: T, b: T, c: T, t: T) -> T {
    a + b * t + c / (t * t)
}

pub fn cp_nasa7<T: Numeric>(a1: T, a2: T, a3: T, a4: T, a5: T, t: T) -> T {
    let poly = a1 + t * (a2 + t * (a3 + t * (a4 + t * a5)));
    T::from_f64(self::R_GAS) * poly
}

pub fn cp_nasa9<T: Numeric>(a1: T, a2: T, a3: T, a4: T, a5: T, a6: T, a7: T, t: T) -> T {
    let poly = a1 / (t * t) + a2 / t + a3 + t * (a4 + t * (a5 + t * (a6 + t * a7)));
    T::from_f64(self::R_GAS) * poly
}

pub fn cp_shomate<T: Numeric>(a: T, b: T, c: T, d: T, e: T, t: T) -> T {
    let tt = t / T::from_f64(1000.0);
    let poly = a + tt * (b + tt * (c + tt * d));
    poly + e / (tt * tt)
}

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

pub fn enthalpy_maierkelley<T: Numeric>(a: T, b: T, c: T, t: T, t_ref: T, h_ref: T) -> T {
    let half = T::from_f64(0.5);
    let delta_h = a * (t - t_ref) + half * b * (t * t - t_ref * t_ref)
        - c * (T::from_f64(1.0) / t - T::from_f64(1.0) / t_ref);
    h_ref + delta_h
}

pub fn enthalpy_nasa7<T: Numeric>(a1: T, a2: T, a3: T, a4: T, a5: T, a6: T, t: T) -> T {
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let c4 = T::from_f64(1.0 / 4.0);
    let c5 = T::from_f64(1.0 / 5.0);
    let poly = a6 / t + a1 + t * (c2 * a2 + t * (c3 * a3 + t * (c4 * a4 + t * (c5 * a5))));
    T::from_f64(self::R_GAS) * poly * t
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

pub fn enthalpy_shomate<T: Numeric>(a: T, b: T, c: T, d: T, e: T, f: T, t: T) -> T {
    let tt = t / T::from_f64(1000.0);
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let c4 = T::from_f64(1.0 / 4.0);
    let poly = f - e / tt + tt * (a + tt * (c2 * b + tt * (c3 * c + tt * (c4 * d))));
    T::from_f64(1000.0) * poly
}

pub fn enthalpy_gibbs_polynomial<T: Numeric>(a: T, c: T, d: T, e: T, f: T, g: T, t: T) -> T {
    // H = a - cT + dT^2 + 2eT^3 + 3fT^4 + 2g/T
    let c2 = T::from_f64(2.0);
    let c3 = T::from_f64(3.0);
    a - c * t + d * (t * t) + c2 * e * (t * t * t) + c3 * f * (t * t * t * t) + c2 * g / t
}

pub fn entropy_maierkelley<T: Numeric>(a: T, b: T, c: T, t: T, t_ref: T, s_ref: T) -> T {
    let half = T::from_f64(0.5);
    let delta_s = a * (t / t_ref).ln() + b * (t - t_ref)
        - half * c * (T::from_f64(1.0) / (t * t) - T::from_f64(1.0) / (t_ref * t_ref));
    s_ref + delta_s
}

pub fn entropy_nasa7<T: Numeric>(a1: T, a2: T, a3: T, a4: T, a5: T, a7: T, t: T) -> T {
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let c4 = T::from_f64(1.0 / 4.0);
    let poly = a7 + a1 * t.ln() + t * (a2 + t * (c2 * a3 + t * (c3 * a4 + t * (c4 * a5))));
    T::from_f64(self::R_GAS) * poly
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

pub fn entropy_shomate<T: Numeric>(a: T, b: T, c: T, d: T, e: T, g: T, t: T) -> T {
    let tt = t / T::from_f64(1000.0);
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let poly = g + a * tt.ln() - e / (T::from_f64(2.0) * tt * tt)
        + tt * (b + tt * (c2 * c + tt * (c3 * d)));
    poly
}

pub fn entropy_gibbs_polynomial<T: Numeric>(b: T, c: T, d: T, e: T, f: T, g: T, t: T) -> T {
    // S = -b - c(ln T + 1) - 2dT - 3eT^2 - 4fT^3 + g/T^2
    let c2 = T::from_f64(2.0);
    let c3 = T::from_f64(3.0);
    let c4 = T::from_f64(4.0);
    (-b) - c * (t.ln() + T::from_f64(1.0)) - c2 * d * t - c3 * e * (t * t) - c4 * f * (t * t * t)
        + g / (t * t)
}
