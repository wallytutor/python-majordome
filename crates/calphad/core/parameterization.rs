use super::constant::T_REF;
use super::substance::Substance;
use crate::parameters::*;
use majordome_numerical::prelude::*;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum AggregationType {
    Solid,
    Liquid,
    Gas,
}

#[derive(Debug, Clone)]
pub struct TemperatureRange {
    pub t_min: f64,
    pub t_max: f64,
    pub model: Parameterization,
}

#[derive(Debug, Clone)]
pub enum Parameterization {
    MaierKelley {
        a: f64,
        b: f64,
        c: f64,
        h_ref: f64,
        s_ref: f64,
    },

    NASA7 {
        a1: f64,
        a2: f64,
        a3: f64,
        a4: f64,
        a5: f64,
        a6: f64,
        a7: f64,
    },

    NASA9 {
        a1: f64,
        a2: f64,
        a3: f64,
        a4: f64,
        a5: f64,
        a6: f64,
        a7: f64,
        a8: f64,
        a9: f64,
    },

    Shomate {
        a: f64,
        b: f64,
        c: f64,
        d: f64,
        e: f64,
        f: f64,
        g: f64,
        h: f64,
    },

    GibbsPolynomial {
        a: f64,
        b: f64,
        c: f64,
        d: f64,
        e: f64,
        f: f64,
        g: f64,
    },

    Compound {
        components: Vec<(Box<Substance>, f64)>,
        deviation: Box<Parameterization>,
    },
}

impl Parameterization {
    pub fn cp<T: Numeric>(&self, t: T) -> T {
        match self {
            Parameterization::MaierKelley { a, b, c, .. } => {
                cp_maierkelley(T::from_f64(*a), T::from_f64(*b), T::from_f64(*c), t)
            }
            Parameterization::NASA7 {
                a1, a2, a3, a4, a5, ..
            } => cp_nasa7(
                T::from_f64(*a1),
                T::from_f64(*a2),
                T::from_f64(*a3),
                T::from_f64(*a4),
                T::from_f64(*a5),
                t,
            ),
            Parameterization::NASA9 {
                a1,
                a2,
                a3,
                a4,
                a5,
                a6,
                a7,
                ..
            } => cp_nasa9(
                T::from_f64(*a1),
                T::from_f64(*a2),
                T::from_f64(*a3),
                T::from_f64(*a4),
                T::from_f64(*a5),
                T::from_f64(*a6),
                T::from_f64(*a7),
                t,
            ),
            Parameterization::Shomate { a, b, c, d, e, .. } => cp_shomate(
                T::from_f64(*a),
                T::from_f64(*b),
                T::from_f64(*c),
                T::from_f64(*d),
                T::from_f64(*e),
                t,
            ),
            Parameterization::GibbsPolynomial { c, d, e, f, g, .. } => cp_gibbs_polynomial(
                T::from_f64(*c),
                T::from_f64(*d),
                T::from_f64(*e),
                T::from_f64(*f),
                T::from_f64(*g),
                t,
            ),
            Parameterization::Compound {
                components,
                deviation,
            } => {
                let mut cp = deviation.cp(t);
                for (substance, coeff) in components {
                    cp = cp + T::from_f64(*coeff) * substance.cp(t);
                }
                cp
            }
        }
    }

    pub fn enthalpy<T: Numeric>(&self, t: T) -> T {
        match self {
            Parameterization::MaierKelley { a, b, c, h_ref, .. } => enthalpy_maierkelley(
                T::from_f64(*a),
                T::from_f64(*b),
                T::from_f64(*c),
                t,
                T::from_f64(T_REF),
                T::from_f64(*h_ref),
            ),
            Parameterization::NASA7 {
                a1,
                a2,
                a3,
                a4,
                a5,
                a6,
                ..
            } => enthalpy_nasa7(
                T::from_f64(*a1),
                T::from_f64(*a2),
                T::from_f64(*a3),
                T::from_f64(*a4),
                T::from_f64(*a5),
                T::from_f64(*a6),
                t,
            ),
            Parameterization::NASA9 {
                a1,
                a2,
                a3,
                a4,
                a5,
                a6,
                a7,
                a8,
                ..
            } => enthalpy_nasa9(
                T::from_f64(*a1),
                T::from_f64(*a2),
                T::from_f64(*a3),
                T::from_f64(*a4),
                T::from_f64(*a5),
                T::from_f64(*a6),
                T::from_f64(*a7),
                T::from_f64(*a8),
                t,
            ),
            Parameterization::Shomate {
                a, b, c, d, e, f, ..
            } => enthalpy_shomate(
                T::from_f64(*a),
                T::from_f64(*b),
                T::from_f64(*c),
                T::from_f64(*d),
                T::from_f64(*e),
                T::from_f64(*f),
                t,
            ),
            Parameterization::GibbsPolynomial {
                a, c, d, e, f, g, ..
            } => enthalpy_gibbs_polynomial(
                T::from_f64(*a),
                T::from_f64(*c),
                T::from_f64(*d),
                T::from_f64(*e),
                T::from_f64(*f),
                T::from_f64(*g),
                t,
            ),
            Parameterization::Compound {
                components,
                deviation,
            } => {
                let mut h = deviation.enthalpy(t);
                for (substance, coeff) in components {
                    h = h + T::from_f64(*coeff) * substance.enthalpy(t);
                }
                h
            }
        }
    }

    pub fn entropy<T: Numeric>(&self, t: T) -> T {
        match self {
            Parameterization::MaierKelley { a, b, c, s_ref, .. } => entropy_maierkelley(
                T::from_f64(*a),
                T::from_f64(*b),
                T::from_f64(*c),
                t,
                T::from_f64(T_REF),
                T::from_f64(*s_ref),
            ),

            Parameterization::NASA7 {
                a1,
                a2,
                a3,
                a4,
                a5,
                a7,
                ..
            } => entropy_nasa7(
                T::from_f64(*a1),
                T::from_f64(*a2),
                T::from_f64(*a3),
                T::from_f64(*a4),
                T::from_f64(*a5),
                T::from_f64(*a7),
                t,
            ),
            Parameterization::NASA9 {
                a1,
                a2,
                a3,
                a4,
                a5,
                a6,
                a7,
                a9,
                ..
            } => entropy_nasa9(
                T::from_f64(*a1),
                T::from_f64(*a2),
                T::from_f64(*a3),
                T::from_f64(*a4),
                T::from_f64(*a5),
                T::from_f64(*a6),
                T::from_f64(*a7),
                T::from_f64(*a9),
                t,
            ),
            Parameterization::Shomate {
                a, b, c, d, e, g, ..
            } => entropy_shomate(
                T::from_f64(*a),
                T::from_f64(*b),
                T::from_f64(*c),
                T::from_f64(*d),
                T::from_f64(*e),
                T::from_f64(*g),
                t,
            ),
            Parameterization::GibbsPolynomial {
                b, c, d, e, f, g, ..
            } => entropy_gibbs_polynomial(
                T::from_f64(*b),
                T::from_f64(*c),
                T::from_f64(*d),
                T::from_f64(*e),
                T::from_f64(*f),
                T::from_f64(*g),
                t,
            ),
            Parameterization::Compound {
                components,
                deviation,
            } => {
                let mut s = deviation.entropy(t);
                for (substance, coeff) in components {
                    s = s + T::from_f64(*coeff) * substance.entropy(t);
                }
                s
            }
        }
    }
}
