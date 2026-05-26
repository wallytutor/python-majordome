use majordome_numerical::autodiff::Numeric;

pub fn cp_shomate<T: Numeric>(a: T, b: T, c: T, d: T, e: T, t: T) -> T {
    let tt = t / T::from_f64(1000.0);
    let poly = a + tt * (b + tt * (c + tt * d));
    poly + e / (tt * tt)
}

pub fn enthalpy_shomate<T: Numeric>(a: T, b: T, c: T, d: T, e: T, f: T, t: T) -> T {
    let tt = t / T::from_f64(1000.0);
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let c4 = T::from_f64(1.0 / 4.0);
    let poly = f - e / tt + tt * (a + tt * (c2 * b + tt * (c3 * c + tt * (c4 * d))));
    T::from_f64(1000.0) * poly
}

pub fn entropy_shomate<T: Numeric>(a: T, b: T, c: T, d: T, e: T, g: T, t: T) -> T {
    let tt = t / T::from_f64(1000.0);
    let c2 = T::from_f64(1.0 / 2.0);
    let c3 = T::from_f64(1.0 / 3.0);
    let poly = g + a * tt.ln() - e / (T::from_f64(2.0) * tt * tt)
        + tt * (b + tt * (c2 * c + tt * (c3 * d)));
    poly
}
