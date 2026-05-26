use majordome_numerical::autodiff::Numeric;

pub fn cp_maierkelley<T: Numeric>(a: T, b: T, c: T, t: T) -> T {
    a + b * t + c / (t * t)
}

pub fn enthalpy_maierkelley<T: Numeric>(a: T, b: T, c: T, t: T, t_ref: T, h_ref: T) -> T {
    let half = T::from_f64(0.5);
    let delta_h = a * (t - t_ref) + half * b * (t * t - t_ref * t_ref)
        - c * (T::from_f64(1.0) / t - T::from_f64(1.0) / t_ref);
    h_ref + delta_h
}

pub fn entropy_maierkelley<T: Numeric>(a: T, b: T, c: T, t: T, t_ref: T, s_ref: T) -> T {
    let half = T::from_f64(0.5);
    let delta_s = a * (t / t_ref).ln() + b * (t - t_ref)
        - half * c * (T::from_f64(1.0) / (t * t) - T::from_f64(1.0) / (t_ref * t_ref));
    s_ref + delta_s
}
