use pyo3::prelude::*;

// ---------------------------------------------------------------------------

pub const T_REF: f64 = 298.15;

pub const P_REF: f64 = 101325.0;

pub const R_GAS: f64 = 8.31446261815324;

use std::fmt;

// ---------------------------------------------------------------------------

/// A float wrapper that prints in scientific notation with:
/// - configurable total width and precision
/// - controlled exponent width and total width
/// - exponent always display a sign (+/-)
pub struct SciFmt {
    pub value: f64,
    pub precision: usize,
    pub total_width: usize,
    pub exponent_width: usize,
}

impl fmt::Display for SciFmt {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // 1) Format using Rust's scientific notation
        let raw = format!("{:.*e}", self.precision, self.value);

        // 2) Split mantissa and exponent
        let (mant, exp) = raw.split_once('e').unwrap();

        // 3) Parse exponent and reformat with +02 / -05 / +10
        let exp_val: i32 = exp.parse().unwrap();
        let exp_fixed = format!("{:+0width$}", exp_val, width = 1 + self.exponent_width);

        // 4) Reassemble
        let final_str = format!("{mant}e{exp_fixed}");

        // 5) Apply width/alignment from the struct
        let width = std::cmp::max(self.total_width, final_str.len());

        if self.value > 0.0 {
            write!(f, " {:>width$}", final_str, width = width)
        } else {
            write!(f, "{:>width$}", final_str, width = width)
        }
    }
}

pub fn exponential_fmt(value: f64) -> String {
    let fmt = SciFmt {
        value,
        precision: 8,
        total_width: 12,
        exponent_width: 2,
    };
    fmt.to_string()
}

// ---------------------------------------------------------------------------

pub mod autodiff {
    use pyo3::prelude::*;
    use std::ops::{Add, Div, Mul, Neg, Sub};

    // --------------------------------------------------------------------------------------------
    // AutoDiff - Forward Mode
    // --------------------------------------------------------------------------------------------

    #[derive(Debug, Clone, Copy, PartialEq)]
    pub struct Dual<T> {
        pub value: T,
        pub deriv: T,
    }

    impl<T> Dual<T> {
        pub fn new(value: T, deriv: T) -> Self {
            Self { value, deriv }
        }
    }

    impl Dual<f64> {
        pub fn constant(value: f64) -> Self {
            Self { value, deriv: 0.0 }
        }

        pub fn variable(value: f64) -> Self {
            Self { value, deriv: 1.0 }
        }

        pub fn pow(self, b: Dual<f64>) -> Self {
            let v = self.value.powf(b.value);
            let d = v * (b.deriv * self.value.ln() + b.value * self.deriv / self.value);
            Self { value: v, deriv: d }
        }

        pub fn powf(self, b: f64) -> Self {
            Self {
                value: self.value.powf(b),
                deriv: b * self.value.powf(b - 1.0) * self.deriv,
            }
        }

        pub fn f_pow(a: f64, b: Self) -> Self {
            let v = a.powf(b.value);
            Self {
                value: v,
                deriv: v * a.ln() * b.deriv,
            }
        }

        pub fn powi(self, n: i32) -> Self {
            if n == 0 {
                return Self::constant(1.0);
            }
            let v = self.value.powi(n);
            let d = (n as f64) * self.value.powi(n - 1) * self.deriv;
            Self { value: v, deriv: d }
        }

        pub fn sin(self) -> Self {
            Self {
                value: self.value.sin(),
                deriv: self.value.cos() * self.deriv,
            }
        }

        pub fn cos(self) -> Self {
            Self {
                value: self.value.cos(),
                deriv: -self.value.sin() * self.deriv,
            }
        }

        pub fn tan(self) -> Self {
            Self {
                value: self.value.tan(),
                deriv: self.deriv / (self.value.cos() * self.value.cos()),
            }
        }

        pub fn exp(self) -> Self {
            let v = self.value.exp();
            Self {
                value: v,
                deriv: v * self.deriv,
            }
        }

        pub fn ln(self) -> Self {
            Self {
                value: self.value.ln(),
                deriv: self.deriv / self.value,
            }
        }

        pub fn sqrt(self) -> Self {
            let v = self.value.sqrt();
            Self {
                value: v,
                deriv: self.deriv / (2.0 * v),
            }
        }

        pub fn sinh(self) -> Self {
            Self {
                value: self.value.sinh(),
                deriv: self.value.cosh() * self.deriv,
            }
        }

        pub fn cosh(self) -> Self {
            Self {
                value: self.value.cosh(),
                deriv: self.value.sinh() * self.deriv,
            }
        }

        pub fn tanh(self) -> Self {
            let t = self.value.tanh();
            Self {
                value: t,
                deriv: (1.0 - t * t) * self.deriv,
            }
        }
    }

    impl Neg for Dual<f64> {
        type Output = Self;
        fn neg(self) -> Self::Output {
            Self {
                value: -self.value,
                deriv: -self.deriv,
            }
        }
    }

    macro_rules! impl_op {
        ($trait:ident, $method:ident, $op_dual_dual:expr, $op_dual_f:expr, $op_f_dual:expr) => {
            impl $trait<Dual<f64>> for Dual<f64> {
                type Output = Dual<f64>;
                fn $method(self, rhs: Dual<f64>) -> Self::Output {
                    $op_dual_dual(self, rhs)
                }
            }

            impl $trait<f64> for Dual<f64> {
                type Output = Dual<f64>;
                fn $method(self, rhs: f64) -> Self::Output {
                    $op_dual_f(self, rhs)
                }
            }

            impl $trait<Dual<f64>> for f64 {
                type Output = Dual<f64>;
                fn $method(self, rhs: Dual<f64>) -> Self::Output {
                    $op_f_dual(self, rhs)
                }
            }
        };
    }

    impl_op!(
        Add,
        add,
        |a: Dual<f64>, b: Dual<f64>| Dual::new(a.value + b.value, a.deriv + b.deriv),
        |a: Dual<f64>, b: f64| Dual::new(a.value + b, a.deriv),
        |a: f64, b: Dual<f64>| Dual::new(a + b.value, b.deriv)
    );

    impl_op!(
        Sub,
        sub,
        |a: Dual<f64>, b: Dual<f64>| Dual::new(a.value - b.value, a.deriv - b.deriv),
        |a: Dual<f64>, b: f64| Dual::new(a.value - b, a.deriv),
        |a: f64, b: Dual<f64>| Dual::new(a - b.value, -b.deriv)
    );

    impl_op!(
        Mul,
        mul,
        |a: Dual<f64>, b: Dual<f64>| Dual::new(
            a.value * b.value,
            a.deriv * b.value + a.value * b.deriv
        ),
        |a: Dual<f64>, b: f64| Dual::new(a.value * b, a.deriv * b),
        |a: f64, b: Dual<f64>| Dual::new(a * b.value, a * b.deriv)
    );

    impl_op!(
        Div,
        div,
        |a: Dual<f64>, b: Dual<f64>| Dual::new(
            a.value / b.value,
            (a.deriv * b.value - a.value * b.deriv) / (b.value * b.value)
        ),
        |a: Dual<f64>, b: f64| Dual::new(a.value / b, a.deriv / b),
        |a: f64, b: Dual<f64>| Dual::new(a / b.value, (-a * b.deriv) / (b.value * b.value))
    );

    pub fn diff<F>(f: F, x: f64) -> f64
    where
        F: Fn(Dual<f64>) -> Dual<f64>,
    {
        let res = f(Dual::variable(x));
        res.deriv
    }

    // --------------------------------------------------------------------------------------------
    // Numeric Context & Generic Traits
    // --------------------------------------------------------------------------------------------

    pub trait Numeric:
        Sized
        + Clone
        + Copy
        + Add<Self, Output = Self>
        + Sub<Self, Output = Self>
        + Mul<Self, Output = Self>
        + Div<Self, Output = Self>
        + Neg<Output = Self>
    {
        fn from_f64(v: f64) -> Self;
        fn to_f64(self) -> f64;
        fn ln(self) -> Self;
        fn powi(self, n: i32) -> Self;
    }

    impl Numeric for f64 {
        fn from_f64(v: f64) -> Self {
            v
        }
        fn to_f64(self) -> f64 {
            self
        }
        fn ln(self) -> Self {
            f64::ln(self)
        }
        fn powi(self, n: i32) -> Self {
            f64::powi(self, n)
        }
    }

    impl Numeric for Dual<f64> {
        fn from_f64(v: f64) -> Self {
            Dual::constant(v)
        }
        fn to_f64(self) -> f64 {
            self.value
        }
        fn ln(self) -> Self {
            self.ln()
        }
        fn powi(self, n: i32) -> Self {
            self.powi(n)
        }
    }

    #[pyclass(name = "Dual", from_py_object)]
    #[derive(Debug, Clone, Copy, PartialEq)]
    pub struct PyDual {
        pub(crate) inner: Dual<f64>,
    }

    #[pymethods]
    impl PyDual {
        #[new]
        pub fn new(value: f64, deriv: f64) -> Self {
            PyDual {
                inner: Dual::new(value, deriv),
            }
        }

        #[staticmethod]
        pub fn constant(value: f64) -> Self {
            PyDual {
                inner: Dual::constant(value),
            }
        }

        #[staticmethod]
        pub fn variable(value: f64) -> Self {
            PyDual {
                inner: Dual::variable(value),
            }
        }

        #[getter]
        pub fn value(&self) -> f64 {
            self.inner.value
        }

        #[getter]
        pub fn deriv(&self) -> f64 {
            self.inner.deriv
        }

        pub fn __repr__(&self) -> String {
            format!(
                "Dual(value={}, deriv={})",
                self.inner.value, self.inner.deriv
            )
        }

        pub fn __str__(&self) -> String {
            self.__repr__()
        }

        pub fn __add__(&self, other: &Bound<'_, PyAny>) -> PyResult<Self> {
            if let Ok(other_dual) = other.extract::<PyDual>() {
                Ok(PyDual {
                    inner: self.inner + other_dual.inner,
                })
            } else if let Ok(other_f64) = other.extract::<f64>() {
                Ok(PyDual {
                    inner: self.inner + other_f64,
                })
            } else {
                Err(pyo3::exceptions::PyTypeError::new_err(
                    "Unsupported type for addition",
                ))
            }
        }

        pub fn __radd__(&self, other: f64) -> Self {
            PyDual {
                inner: other + self.inner,
            }
        }

        pub fn __sub__(&self, other: &Bound<'_, PyAny>) -> PyResult<Self> {
            if let Ok(other_dual) = other.extract::<PyDual>() {
                Ok(PyDual {
                    inner: self.inner - other_dual.inner,
                })
            } else if let Ok(other_f64) = other.extract::<f64>() {
                Ok(PyDual {
                    inner: self.inner - other_f64,
                })
            } else {
                Err(pyo3::exceptions::PyTypeError::new_err(
                    "Unsupported type for subtraction",
                ))
            }
        }

        pub fn __rsub__(&self, other: f64) -> Self {
            PyDual {
                inner: other - self.inner,
            }
        }

        pub fn __mul__(&self, other: &Bound<'_, PyAny>) -> PyResult<Self> {
            if let Ok(other_dual) = other.extract::<PyDual>() {
                Ok(PyDual {
                    inner: self.inner * other_dual.inner,
                })
            } else if let Ok(other_f64) = other.extract::<f64>() {
                Ok(PyDual {
                    inner: self.inner * other_f64,
                })
            } else {
                Err(pyo3::exceptions::PyTypeError::new_err(
                    "Unsupported type for multiplication",
                ))
            }
        }

        pub fn __rmul__(&self, other: f64) -> Self {
            PyDual {
                inner: other * self.inner,
            }
        }

        pub fn __truediv__(&self, other: &Bound<'_, PyAny>) -> PyResult<Self> {
            if let Ok(other_dual) = other.extract::<PyDual>() {
                Ok(PyDual {
                    inner: self.inner / other_dual.inner,
                })
            } else if let Ok(other_f64) = other.extract::<f64>() {
                Ok(PyDual {
                    inner: self.inner / other_f64,
                })
            } else {
                Err(pyo3::exceptions::PyTypeError::new_err(
                    "Unsupported type for division",
                ))
            }
        }

        pub fn __rtruediv__(&self, other: f64) -> Self {
            PyDual {
                inner: other / self.inner,
            }
        }

        pub fn __neg__(&self) -> Self {
            PyDual { inner: -self.inner }
        }
    }
}

pub mod functions {
    use crate::R_GAS;
    use crate::autodiff::Numeric;

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
        (-b) - c * (t.ln() + T::from_f64(1.0))
            - c2 * d * t
            - c3 * e * (t * t)
            - c4 * f * (t * t * t)
            + g / (t * t)
    }
}

pub mod core {
    use crate::T_REF;
    use crate::autodiff::Numeric;
    use crate::autodiff::PyDual;
    use crate::exponential_fmt;
    use crate::functions::*;
    use pyo3::prelude::*;
    use std::collections::HashMap;

    pub fn get_atomic_weight(symbol: &str) -> Option<f64> {
        match symbol {
            "H" => Some(1.008),
            "He" => Some(4.002602),
            "Li" => Some(6.94),
            "Be" => Some(9.0121831),
            "B" => Some(10.81),
            "C" => Some(12.011),
            "N" => Some(14.007),
            "O" => Some(15.999),
            "F" => Some(18.998403163),
            "Ne" => Some(20.1797),
            "Na" => Some(22.98976928),
            "Mg" => Some(24.305),
            "Al" => Some(26.9815384),
            "Si" => Some(28.085),
            "P" => Some(30.973761998),
            "S" => Some(32.06),
            "Cl" => Some(35.45),
            "Ar" => Some(39.95),
            "K" => Some(39.0983),
            "Ca" => Some(40.078),
            "Sc" => Some(44.955908),
            "Ti" => Some(47.867),
            "V" => Some(50.9415),
            "Cr" => Some(51.9961),
            "Mn" => Some(54.938043),
            "Fe" => Some(55.845),
            "Co" => Some(58.933194),
            "Ni" => Some(58.6934),
            "Cu" => Some(63.546),
            "Zn" => Some(65.38),
            "Ga" => Some(69.723),
            "Ge" => Some(72.630),
            "As" => Some(74.921595),
            "Se" => Some(78.971),
            "Br" => Some(79.904),
            "Kr" => Some(83.798),
            "Rb" => Some(85.4678),
            "Sr" => Some(87.62),
            "Y" => Some(88.90584),
            "Zr" => Some(91.224),
            "Nb" => Some(92.90637),
            "Mo" => Some(95.95),
            "Ru" => Some(101.07),
            "Rh" => Some(102.90549),
            "Pd" => Some(106.42),
            "Ag" => Some(107.8682),
            "Cd" => Some(112.414),
            "In" => Some(114.818),
            "Sn" => Some(118.710),
            "Sb" => Some(121.760),
            "Te" => Some(127.60),
            "I" => Some(126.90447),
            "Xe" => Some(131.293),
            "Cs" => Some(132.90545196),
            "Ba" => Some(137.327),
            "La" => Some(138.90547),
            "Ce" => Some(140.116),
            "Pr" => Some(140.90766),
            "Nd" => Some(144.242),
            "Sm" => Some(150.36),
            "Eu" => Some(151.964),
            "Gd" => Some(157.25),
            "Tb" => Some(158.925354),
            "Dy" => Some(162.500),
            "Ho" => Some(164.930328),
            "Er" => Some(167.259),
            "Tm" => Some(168.934218),
            "Yb" => Some(173.045),
            "Lu" => Some(174.9668),
            "Hf" => Some(178.49),
            "Ta" => Some(180.94788),
            "W" => Some(183.84),
            "Re" => Some(186.207),
            "Os" => Some(190.23),
            "Ir" => Some(192.217),
            "Pt" => Some(195.084),
            "Au" => Some(196.966570),
            "Hg" => Some(200.592),
            "Tl" => Some(204.38),
            "Pb" => Some(207.2),
            "Bi" => Some(208.98040),
            "Th" => Some(232.0377),
            "Pa" => Some(231.03588),
            "U" => Some(238.02891),
            _ => None,
        }
    }

    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
    pub enum AggregationType {
        Solid,
        Liquid,
        Gas,
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

    #[derive(Debug, Clone)]
    pub struct TemperatureRange {
        pub t_min: f64,
        pub t_max: f64,
        pub model: Parameterization,
    }

    #[pyclass(from_py_object)]
    #[derive(Debug, Clone)]
    pub struct Substance {
        pub name: String,
        pub molar_mass: f64,
        pub molar_volume: f64,
        pub s0: f64,
        pub ranges: Vec<TemperatureRange>,
        pub elements: HashMap<String, f64>,
        pub reference: String,
        pub aggregation_type: AggregationType,
    }

    impl Substance {
        pub fn get_range(&self, t: f64) -> &TemperatureRange {
            for r in &self.ranges {
                if t >= r.t_min && t <= r.t_max {
                    return r;
                }
            }
            if t < self.ranges[0].t_min {
                return &self.ranges[0];
            }
            self.ranges.last().unwrap()
        }

        pub fn cp<T: Numeric>(&self, t: T) -> T {
            let t_val = t.to_f64();
            let range = self.get_range(t_val);
            range.model.cp(t)
        }

        pub fn enthalpy<T: Numeric>(&self, t: T) -> T {
            let t_val = t.to_f64();
            let range = self.get_range(t_val);
            range.model.enthalpy(t)
        }

        pub fn entropy<T: Numeric>(&self, t: T) -> T {
            let t_val = t.to_f64();
            let range = self.get_range(t_val);
            range.model.entropy(t)
        }

        pub fn gibbs<T: Numeric>(&self, t: T) -> T {
            self.enthalpy(t) - t * self.entropy(t)
        }

        pub fn tabulate(
            &self,
            t_min: Option<f64>,
            t_max: Option<f64>,
            step: Option<f64>,
        ) -> String {
            let t_start = t_min.unwrap_or_else(|| self.ranges.first().unwrap().t_min);
            let t_end = t_max.unwrap_or_else(|| self.ranges.last().unwrap().t_max);
            let step_val = step.unwrap_or(100.0);

            let mut temps = Vec::new();
            temps.push(t_start);
            temps.push(t_end);

            if T_REF >= t_start && T_REF <= t_end {
                temps.push(T_REF);
            }

            for r in &self.ranges {
                if r.t_min >= t_start && r.t_min <= t_end {
                    temps.push(r.t_min);
                }
                if r.t_max >= t_start && r.t_max <= t_end {
                    temps.push(r.t_max);
                }
            }

            let first_multiple = (t_start / step_val).ceil() * step_val;
            let mut current = first_multiple;
            while current <= t_end {
                temps.push(current);
                current += step_val;
            }

            temps.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));

            let mut unique_temps = Vec::new();
            for &t in &temps {
                if unique_temps.is_empty() || (t - unique_temps.last().unwrap()).abs() > 1e-6 {
                    unique_temps.push(t);
                }
            }

            let mut lines = Vec::new();
            lines.push(format!(
                "--- {} ({:?}) ---\n",
                self.name, self.aggregation_type
            ));
            lines.push(format!(
                "{:<8} | {:<12} | {:<12} | {:<14} | {:<14}",
                "T (K)", "Cp", "S", "-(G-H298)/T", "H-H298"
            ));
            lines.push(format!(
                "{:-<8}-+-{:-<12}-+-{:-<12}-+-{:-<14}-+-{:-<14}-",
                "", "", "", "", ""
            ));

            let h_ref = self.enthalpy(T_REF);

            for t in unique_temps {
                let cp_val = self.cp(t);
                let h_val = self.enthalpy(t);
                let s_val = self.entropy(t);
                let g_val = self.gibbs(t);

                let free_energy_func = if t > 1e-6 { -(g_val - h_ref) / t } else { 0.0 };
                let h_diff = h_val - h_ref;

                lines.push(format!(
                    "{:<8.2} | {:<12.4} | {:<12.4} | {:<14.4} | {:<14.2}",
                    t, cp_val, s_val, free_energy_func, h_diff
                ));
            }

            lines.join("\n")
        }
    }

    #[pymethods]
    impl Substance {
        #[getter]
        pub fn name(&self) -> String {
            self.name.clone()
        }

        #[getter]
        pub fn molar_mass(&self) -> f64 {
            self.molar_mass
        }

        #[getter]
        pub fn molar_volume(&self) -> f64 {
            self.molar_volume
        }

        #[getter]
        pub fn s0(&self) -> f64 {
            self.s0
        }

        #[getter]
        pub fn elements(&self) -> HashMap<String, f64> {
            self.elements.clone()
        }

        #[getter]
        pub fn reference(&self) -> String {
            self.reference.clone()
        }

        #[getter]
        pub fn aggregation_type(&self) -> String {
            format!("{:?}", self.aggregation_type)
        }

        #[getter]
        pub fn formation_enthalpy(&self) -> f64 {
            self.enthalpy(298.15)
        }

        #[pyo3(name = "cp")]
        pub fn cp_py<'py>(
            &self,
            py: Python<'py>,
            t: &Bound<'py, PyAny>,
        ) -> PyResult<Bound<'py, PyAny>> {
            if let Ok(dual_t) = t.extract::<PyDual>() {
                let res = self.cp(dual_t.inner);
                let bound = PyDual { inner: res }.into_pyobject(py)?;
                Ok(bound.into_any())
            } else if let Ok(f64_t) = t.extract::<f64>() {
                let res = self.cp(f64_t);
                let bound = res.into_pyobject(py)?;
                Ok(bound.into_any())
            } else {
                Err(pyo3::exceptions::PyTypeError::new_err(
                    "Expected f64 or Dual",
                ))
            }
        }

        #[pyo3(name = "enthalpy")]
        pub fn enthalpy_py<'py>(
            &self,
            py: Python<'py>,
            t: &Bound<'py, PyAny>,
        ) -> PyResult<Bound<'py, PyAny>> {
            if let Ok(dual_t) = t.extract::<PyDual>() {
                let res = self.enthalpy(dual_t.inner);
                let bound = PyDual { inner: res }.into_pyobject(py)?;
                Ok(bound.into_any())
            } else if let Ok(f64_t) = t.extract::<f64>() {
                let res = self.enthalpy(f64_t);
                let bound = res.into_pyobject(py)?;
                Ok(bound.into_any())
            } else {
                Err(pyo3::exceptions::PyTypeError::new_err(
                    "Expected f64 or Dual",
                ))
            }
        }

        #[pyo3(name = "entropy")]
        pub fn entropy_py<'py>(
            &self,
            py: Python<'py>,
            t: &Bound<'py, PyAny>,
        ) -> PyResult<Bound<'py, PyAny>> {
            if let Ok(dual_t) = t.extract::<PyDual>() {
                let res = self.entropy(dual_t.inner);
                let bound = PyDual { inner: res }.into_pyobject(py)?;
                Ok(bound.into_any())
            } else if let Ok(f64_t) = t.extract::<f64>() {
                let res = self.entropy(f64_t);
                let bound = res.into_pyobject(py)?;
                Ok(bound.into_any())
            } else {
                Err(pyo3::exceptions::PyTypeError::new_err(
                    "Expected f64 or Dual",
                ))
            }
        }

        #[pyo3(name = "gibbs")]
        pub fn gibbs_py<'py>(
            &self,
            py: Python<'py>,
            t: &Bound<'py, PyAny>,
        ) -> PyResult<Bound<'py, PyAny>> {
            if let Ok(dual_t) = t.extract::<PyDual>() {
                let res = self.gibbs(dual_t.inner);
                let bound = PyDual { inner: res }.into_pyobject(py)?;
                Ok(bound.into_any())
            } else if let Ok(f64_t) = t.extract::<f64>() {
                let res = self.gibbs(f64_t);
                let bound = res.into_pyobject(py)?;
                Ok(bound.into_any())
            } else {
                Err(pyo3::exceptions::PyTypeError::new_err(
                    "Expected f64 or Dual",
                ))
            }
        }

        pub fn report(&self, t: f64) -> String {
            let tabulate = |label: &str, units: &str, value: &str| {
                format!("{:15} | {:10} | {}", label, units, value)
            };

            let mut lines = Vec::new();
            lines.push(format!(
                "--- {} ({:?}) ---\n",
                self.name, self.aggregation_type
            ));

            lines.push(tabulate(
                "Molar mass",
                "g/mol",
                &exponential_fmt(self.molar_mass),
            ));

            lines.push(tabulate(
                "Molar volume",
                "cm³/mol",
                &exponential_fmt(self.molar_volume),
            ));

            lines.push(tabulate(
                "Entropy S0",
                "J/(mol.K)",
                &exponential_fmt(self.s0),
            ));
            lines.push(tabulate(
                "Delta-Hf298",
                "kJ/mol",
                exponential_fmt(self.formation_enthalpy() / 1000.0).as_str(),
            ));

            let mut sorted_elements: Vec<(&String, &f64)> = self.elements.iter().collect();
            sorted_elements.sort_by(|a, b| a.0.cmp(b.0));

            lines.push("\nElements:".to_string());

            for (el, coeff) in sorted_elements {
                lines.push(format!("  * {:>2}: {:.6}", el, coeff));
            }

            lines.push(format!("\nProperties at {:.2} K:", t));
            lines.push(tabulate(
                " Specific heat",
                "J/(mol.K)",
                exponential_fmt(self.cp(t)).as_str(),
            ));
            lines.push(tabulate(
                " Entropy",
                "J/(mol.K)",
                exponential_fmt(self.entropy(t)).as_str(),
            ));
            lines.push(tabulate(
                " Gibbs energy",
                "kJ/mol",
                exponential_fmt(self.gibbs(t) / 1000.0).as_str(),
            ));
            lines.push(tabulate(
                " Enthalpy",
                "kJ/mol",
                exponential_fmt(self.enthalpy(t) / 1000.0).as_str(),
            ));

            lines.push(format!("\nReference: {}", self.reference));
            lines.join("\n")
        }

        #[pyo3(name = "tabulate", signature = (t_min = None, t_max = None, step = None))]
        pub fn tabulate_py(
            &self,
            t_min: Option<f64>,
            t_max: Option<f64>,
            step: Option<f64>,
        ) -> String {
            self.tabulate(t_min, t_max, step)
        }
    }

    #[pyclass(from_py_object)]
    #[derive(Debug, Clone)]
    pub struct SystemComposition {
        pub(crate) elements: Vec<String>,
        pub(crate) fractions: Vec<f64>,
        pub(crate) input_method: String,
        pub(crate) input_proportions: HashMap<String, f64>,
    }

    #[pymethods]
    impl SystemComposition {
        #[staticmethod]
        pub fn from_compound_moles(compounds: Vec<(Substance, f64)>) -> PyResult<Self> {
            let mut element_moles = HashMap::new();
            let mut input_proportions = HashMap::new();

            for (substance, moles) in &compounds {
                input_proportions.insert(substance.name.clone(), *moles);
                for (el, coeff) in &substance.elements {
                    *element_moles.entry(el.clone()).or_insert(0.0) += moles * coeff;
                }
            }

            let mut elements: Vec<String> = element_moles.keys().cloned().collect();
            elements.sort();

            let total_moles: f64 = element_moles.values().sum();
            let fractions = if total_moles > 0.0 {
                elements
                    .iter()
                    .map(|el| element_moles.get(el).unwrap() / total_moles)
                    .collect()
            } else {
                vec![0.0; elements.len()]
            };

            Ok(Self {
                elements,
                fractions,
                input_method: "Compound Moles".to_string(),
                input_proportions,
            })
        }

        #[staticmethod]
        pub fn from_compound_masses(compounds: Vec<(Substance, f64)>) -> PyResult<Self> {
            let mut element_moles = HashMap::new();
            let mut input_proportions = HashMap::new();

            for (substance, mass) in &compounds {
                input_proportions.insert(substance.name.clone(), *mass);
                let moles = mass / substance.molar_mass;
                for (el, coeff) in &substance.elements {
                    *element_moles.entry(el.clone()).or_insert(0.0) += moles * coeff;
                }
            }

            let mut elements: Vec<String> = element_moles.keys().cloned().collect();
            elements.sort();

            let total_moles: f64 = element_moles.values().sum();
            let fractions = if total_moles > 0.0 {
                elements
                    .iter()
                    .map(|el| element_moles.get(el).unwrap() / total_moles)
                    .collect()
            } else {
                vec![0.0; elements.len()]
            };

            Ok(Self {
                elements,
                fractions,
                input_method: "Compound Masses".to_string(),
                input_proportions,
            })
        }

        #[staticmethod]
        pub fn from_elemental_moles(elements_in: Vec<(String, f64)>) -> PyResult<Self> {
            let mut element_moles = HashMap::new();
            let mut input_proportions = HashMap::new();

            for (el, moles) in elements_in {
                input_proportions.insert(el.clone(), moles);
                *element_moles.entry(el).or_insert(0.0) += moles;
            }

            let mut elements: Vec<String> = element_moles.keys().cloned().collect();
            elements.sort();

            let total_moles: f64 = element_moles.values().sum();
            let fractions = if total_moles > 0.0 {
                elements
                    .iter()
                    .map(|el| element_moles.get(el).unwrap() / total_moles)
                    .collect()
            } else {
                vec![0.0; elements.len()]
            };

            Ok(Self {
                elements,
                fractions,
                input_method: "Elemental Moles".to_string(),
                input_proportions,
            })
        }

        #[staticmethod]
        pub fn from_elemental_masses(elements_in: Vec<(String, f64)>) -> PyResult<Self> {
            let mut element_moles = HashMap::new();
            let mut input_proportions = HashMap::new();

            for (el, mass) in elements_in {
                input_proportions.insert(el.clone(), mass);
                let atomic_w = get_atomic_weight(&el).ok_or_else(|| {
                    pyo3::exceptions::PyValueError::new_err(format!(
                        "Unknown element symbol: '{}'",
                        el
                    ))
                })?;
                let moles = mass / atomic_w;
                *element_moles.entry(el).or_insert(0.0) += moles;
            }

            let mut elements: Vec<String> = element_moles.keys().cloned().collect();
            elements.sort();

            let total_moles: f64 = element_moles.values().sum();
            let fractions = if total_moles > 0.0 {
                elements
                    .iter()
                    .map(|el| element_moles.get(el).unwrap() / total_moles)
                    .collect()
            } else {
                vec![0.0; elements.len()]
            };

            Ok(Self {
                elements,
                fractions,
                input_method: "Elemental Masses".to_string(),
                input_proportions,
            })
        }

        #[getter]
        pub fn elements(&self) -> Vec<String> {
            self.elements.clone()
        }

        #[getter]
        pub fn fractions(&self) -> Vec<f64> {
            self.fractions.clone()
        }

        #[getter]
        pub fn input_method(&self) -> String {
            self.input_method.clone()
        }

        #[getter]
        pub fn input_proportions(&self) -> HashMap<String, f64> {
            self.input_proportions.clone()
        }

        pub fn report(&self) -> String {
            let mut lines = Vec::new();
            lines.push("=== System Composition Report ===".to_string());
            lines.push(format!("Input Method: {}", self.input_method));
            lines.push("\nInput Proportions:".to_string());

            let mut sorted_inputs: Vec<(&String, &f64)> = self.input_proportions.iter().collect();
            sorted_inputs.sort_by(|a, b| a.0.cmp(b.0));
            for (name, prop) in sorted_inputs {
                lines.push(format!("  * {}: {:.6}", name, prop));
            }

            lines.push(
                "\nComputed Elemental Mole Fractions (normalized to 1 mole of atoms):".to_string(),
            );
            for (i, el) in self.elements.iter().enumerate() {
                lines.push(format!("  * {:>2}: {:.6}", el, self.fractions[i]));
            }
            lines.join("\n")
        }
    }
}

pub mod data {
    use crate::core::AggregationType;
    use crate::core::Parameterization;
    use crate::core::Substance;
    use crate::core::TemperatureRange;
    use crate::core::get_atomic_weight;
    use crate::{P_REF, R_GAS, T_REF};
    use mlua::prelude::*;
    use pyo3::prelude::*;
    use pyo3::types::PyDict;
    use std::collections::HashMap;
    use std::fs::read_to_string;

    impl FromLua for AggregationType {
        fn from_lua(value: LuaValue, _lua: &Lua) -> LuaResult<Self> {
            let s = value
                .as_string()
                .ok_or_else(|| LuaError::FromLuaConversionError {
                    from: "Value",
                    to: "AggregationType".to_string(),
                    message: Some("Expected string".to_string()),
                })?
                .to_str()?
                .to_string();

            match s.as_str() {
                "Solid" => Ok(AggregationType::Solid),
                "Liquid" => Ok(AggregationType::Liquid),
                "Gas" => Ok(AggregationType::Gas),
                _ => Err(LuaError::FromLuaConversionError {
                    from: "String",
                    to: "AggregationType".to_string(),
                    message: Some(format!("Unknown aggregation type: {}", s)),
                }),
            }
        }
    }

    impl FromLua for Parameterization {
        fn from_lua(value: LuaValue, _lua: &Lua) -> LuaResult<Self> {
            let table = value
                .as_table()
                .ok_or_else(|| LuaError::FromLuaConversionError {
                    from: "Value",
                    to: "Parameterization".to_string(),
                    message: Some("Expected table".to_string()),
                })?;

            let model_type: String = table.get("type")?;

            match model_type.as_str() {
                "MaierKelley" => Ok(Parameterization::MaierKelley {
                    a: table.get("a")?,
                    b: table.get("b")?,
                    c: table.get("c")?,
                    h_ref: table.get("h_ref")?,
                    s_ref: table.get("s_ref").unwrap_or(0.0),
                }),

                "NASA7" => Ok(Parameterization::NASA7 {
                    a1: table.get("a1")?,
                    a2: table.get("a2")?,
                    a3: table.get("a3")?,
                    a4: table.get("a4")?,
                    a5: table.get("a5")?,
                    a6: table.get("a6")?,
                    a7: table.get("a7")?,
                }),
                "NASA9" => Ok(Parameterization::NASA9 {
                    a1: table.get("a1")?,
                    a2: table.get("a2")?,
                    a3: table.get("a3")?,
                    a4: table.get("a4")?,
                    a5: table.get("a5")?,
                    a6: table.get("a6")?,
                    a7: table.get("a7")?,
                    a8: table.get("a8")?,
                    a9: table.get("a9")?,
                }),
                "Shomate" => Ok(Parameterization::Shomate {
                    a: table.get("a")?,
                    b: table.get("b")?,
                    c: table.get("c")?,
                    d: table.get("d")?,
                    e: table.get("e")?,
                    f: table.get("f")?,
                    g: table.get("g")?,
                    h: table.get("h")?,
                }),
                "GibbsPolynomial" => Ok(Parameterization::GibbsPolynomial {
                    a: table.get("a")?,
                    b: table.get("b")?,
                    c: table.get("c")?,
                    d: table.get("d")?,
                    e: table.get("e")?,
                    f: table.get("f")?,
                    g: table.get("g")?,
                }),
                "Compound" => {
                    let components_table: LuaTable = table.get("components")?;
                    let mut components = Vec::new();
                    for pair in components_table.sequence_values::<LuaTable>() {
                        let pair = pair?;
                        let substance: Substance = pair.get(1)?;
                        let coeff: f64 = pair.get(2)?;
                        components.push((Box::new(substance), coeff));
                    }
                    let deviation: Parameterization = table.get("deviation")?;
                    Ok(Parameterization::Compound {
                        components,
                        deviation: Box::new(deviation),
                    })
                }

                _ => Err(LuaError::FromLuaConversionError {
                    from: "Table",
                    to: "Parameterization".to_string(),
                    message: Some(format!("Unknown parameterization type: {}", model_type)),
                }),
            }
        }
    }

    impl FromLua for TemperatureRange {
        fn from_lua(value: LuaValue, _lua: &Lua) -> LuaResult<Self> {
            let table = value
                .as_table()
                .ok_or_else(|| LuaError::FromLuaConversionError {
                    from: "Value",
                    to: "TemperatureRange".to_string(),
                    message: Some("Expected table".to_string()),
                })?;

            Ok(TemperatureRange {
                t_min: table.get("t_min")?,
                t_max: table.get("t_max")?,
                model: table.get("model")?,
            })
        }
    }

    impl FromLua for Substance {
        fn from_lua(value: LuaValue, _lua: &Lua) -> LuaResult<Self> {
            let table = value
                .as_table()
                .ok_or_else(|| LuaError::FromLuaConversionError {
                    from: "Value",
                    to: "Substance".to_string(),
                    message: Some("Expected table".to_string()),
                })?;

            let name: String = table.get("name")?;
            let s0: f64 = table.get("s0").unwrap_or(0.0);
            let mut ranges: Vec<TemperatureRange> = table.get("ranges")?;
            // Propagate s0 to models that need it (like Maier-Kelley)

            for range in &mut ranges {
                if let Parameterization::MaierKelley { ref mut s_ref, .. } = range.model {
                    if *s_ref == 0.0 {
                        *s_ref = s0;
                    }
                }
            }

            let elements: HashMap<String, f64> = table.get("elements")?;
            let aggregation_type: AggregationType = table
                .get("aggregation_type")
                .unwrap_or(AggregationType::Solid);

            let mut molar_mass = 0.0;
            for (symbol, count) in &elements {
                let weight = get_atomic_weight(symbol).ok_or_else(|| {
                    LuaError::RuntimeError(format!("Unknown element symbol: {}", symbol))
                })?;
                molar_mass += weight * count;
            }

            let molar_volume = if aggregation_type == AggregationType::Gas {
                (R_GAS * T_REF / P_REF) * 1e6 // cm3/mol
            } else {
                table.get("molar_volume").unwrap_or(0.0)
            };

            Ok(Substance {
                name,
                molar_mass,
                molar_volume,
                s0: table.get("s0").unwrap_or(0.0),
                ranges: table.get("ranges")?,
                elements,
                reference: table.get("reference").unwrap_or_else(|_| "".to_string()),
                aggregation_type,
            })
        }
    }

    fn get_coeff(t: &LuaTable, i: usize, name: &str) -> LuaResult<f64> {
        match t.get::<f64>(i) {
            Ok(v) => Ok(v),
            Err(_) => t.get::<f64>(name),
        }
    }

    fn create_lua_maier_kelley(lua: &Lua) -> LuaResult<LuaFunction> {
        lua.create_function(|lua, args: LuaMultiValue| {
            let table = lua.create_table()?;
            table.set("type", "MaierKelley")?;
            if args.len() == 1 {
                if let Some(t) = args[0].as_table() {
                    table.set("a", get_coeff(t, 1, "a")?)?;
                    table.set("b", get_coeff(t, 2, "b")?)?;
                    table.set("c", get_coeff(t, 3, "c")?)?;
                    table.set("h_ref", get_coeff(t, 4, "h_ref")?)?;
                    return Ok(table);
                }
            }
            let mut iter = args.into_iter();
            table.set(
                "a",
                f64::from_lua(iter.next().unwrap_or(LuaValue::Nil), lua)?,
            )?;
            table.set(
                "b",
                f64::from_lua(iter.next().unwrap_or(LuaValue::Nil), lua)?,
            )?;
            table.set(
                "c",
                f64::from_lua(iter.next().unwrap_or(LuaValue::Nil), lua)?,
            )?;
            table.set(
                "h_ref",
                f64::from_lua(iter.next().unwrap_or(LuaValue::Nil), lua)?,
            )?;
            Ok(table)
        })
    }

    fn create_lua_nasa7(lua: &Lua) -> LuaResult<LuaFunction> {
        lua.create_function(|lua, args: LuaMultiValue| {
            let table = lua.create_table()?;
            table.set("type", "NASA7")?;
            if args.len() == 1 {
                if let Some(t) = args[0].as_table() {
                    for i in 1..=7 {
                        let name = format!("a{}", i);
                        table.set(name.clone(), get_coeff(t, i, &name)?)?;
                    }
                    return Ok(table);
                }
            }
            for (i, arg) in args.into_iter().enumerate() {
                if i < 7 {
                    table.set(format!("a{}", i + 1), f64::from_lua(arg, lua)?)?;
                }
            }
            Ok(table)
        })
    }

    fn create_lua_nasa9(lua: &Lua) -> LuaResult<LuaFunction> {
        lua.create_function(|lua, args: LuaMultiValue| {
            let table = lua.create_table()?;
            table.set("type", "NASA9")?;
            if args.len() == 1 {
                if let Some(t) = args[0].as_table() {
                    for i in 1..=9 {
                        let name = format!("a{}", i);
                        table.set(name.clone(), get_coeff(t, i, &name)?)?;
                    }
                    return Ok(table);
                }
            }
            for (i, arg) in args.into_iter().enumerate() {
                if i < 9 {
                    table.set(format!("a{}", i + 1), f64::from_lua(arg, lua)?)?;
                }
            }
            Ok(table)
        })
    }

    fn create_lua_shomate(lua: &Lua) -> LuaResult<LuaFunction> {
        lua.create_function(|lua, args: LuaMultiValue| {
            let table = lua.create_table()?;
            table.set("type", "Shomate")?;
            let keys = ["a", "b", "c", "d", "e", "f", "g", "h"];
            if args.len() == 1 {
                if let Some(t) = args[0].as_table() {
                    for (i, key) in keys.iter().enumerate() {
                        table.set(*key, get_coeff(t, i + 1, *key)?)?;
                    }
                    return Ok(table);
                }
            }
            for (i, arg) in args.into_iter().enumerate() {
                if i < 8 {
                    table.set(keys[i], f64::from_lua(arg, lua)?)?;
                }
            }
            Ok(table)
        })
    }

    fn create_lua_gibbs_polynomial(lua: &Lua) -> LuaResult<LuaFunction> {
        lua.create_function(|lua, args: LuaMultiValue| {
            let table = lua.create_table()?;
            table.set("type", "GibbsPolynomial")?;
            let keys = ["a", "b", "c", "d", "e", "f", "g"];
            if args.len() == 1 {
                if let Some(t) = args[0].as_table() {
                    for (i, key) in keys.iter().enumerate() {
                        table.set(*key, get_coeff(t, i + 1, *key)?)?;
                    }
                    return Ok(table);
                }
            }
            for (i, arg) in args.into_iter().enumerate() {
                if i < 7 {
                    table.set(keys[i], f64::from_lua(arg, lua)?)?;
                }
            }
            Ok(table)
        })
    }

    fn create_lua_compound(lua: &Lua) -> LuaResult<LuaFunction> {
        lua.create_function(|_lua, table: LuaTable| {
            if !table.contains_key("type")? {
                table.set("type", "Compound")?;
            }
            if !table.contains_key("deviation")? {
                let dev = _lua.create_table()?;
                dev.set("type", "GibbsPolynomial")?;
                dev.set("a", 0.0)?;
                dev.set("b", 0.0)?;
                dev.set("c", 0.0)?;
                dev.set("d", 0.0)?;
                dev.set("e", 0.0)?;
                dev.set("f", 0.0)?;
                dev.set("g", 0.0)?;
                table.set("deviation", dev)?;
            }
            Ok(table)
        })
    }

    fn create_lua_temperature_range(lua: &Lua) -> LuaResult<LuaFunction> {
        lua.create_function(|lua, (t_min, t_max, model): (f64, f64, LuaValue)| {
            let table = lua.create_table()?;
            table.set("t_min", t_min)?;
            table.set("t_max", t_max)?;
            table.set("model", model)?;
            Ok(table)
        })
    }

    fn create_lua_substance(lua: &Lua) -> LuaResult<LuaFunction> {
        lua.create_function(|_lua, table: LuaTable| {
            if !table.contains_key("reference")? {
                table.set("reference", "")?;
            }
            if !table.contains_key("aggregation_type")? {
                table.set("aggregation_type", "Solid")?;
            }
            Ok(table)
        })
    }

    pub fn load_substances_from_lua(path: &str) -> LuaResult<HashMap<String, Substance>> {
        let lua = Lua::new();
        let globals = lua.globals();

        let mk_fn = create_lua_maier_kelley(&lua)?;
        globals.set("MaierKelley", mk_fn)?;

        let nasa7_fn = create_lua_nasa7(&lua)?;
        globals.set("NASA7", nasa7_fn)?;

        let nasa9_fn = create_lua_nasa9(&lua)?;
        globals.set("NASA9", nasa9_fn)?;

        let shomate_fn = create_lua_shomate(&lua)?;
        globals.set("Shomate", shomate_fn)?;

        let gibbs_polynomial_fn = create_lua_gibbs_polynomial(&lua)?;
        globals.set("GibbsPolynomial", gibbs_polynomial_fn)?;

        let compound_fn = create_lua_compound(&lua)?;
        globals.set("Compound", compound_fn)?;

        let temperature_range_fn = create_lua_temperature_range(&lua)?;

        globals.set("TemperatureRange", temperature_range_fn.clone())?;
        globals.set("Range", temperature_range_fn)?;

        let substance_fn = create_lua_substance(&lua)?;
        globals.set("Substance", substance_fn)?;

        let content =
            read_to_string(path).map_err(|e| LuaError::ExternalError(std::sync::Arc::new(e)))?;

        let map: HashMap<String, Substance> = lua.load(&content).eval()?;
        Ok(map)
    }

    #[pyclass]
    pub struct DatabaseLoader {
        pub path: String,
        pub phases: Vec<String>,
        pub data: HashMap<String, Substance>,
    }

    #[pymethods]
    impl DatabaseLoader {
        #[new]
        #[pyo3(signature = (path, phases = None))]
        pub fn new(path: String, phases: Option<Vec<String>>) -> PyResult<Self> {
            let mut raw_data = load_substances_from_lua(&path)
                .map_err(|e| pyo3::exceptions::PyValueError::new_err(e.to_string()))?;

            let phases = if let Some(ref selected_phases) = phases {
                raw_data.retain(|k, _| selected_phases.contains(k));
                selected_phases.clone()
            } else {
                raw_data.keys().cloned().collect::<Vec<String>>()
            };

            Ok(Self {
                path,
                phases,
                data: raw_data,
            })
        }

        #[getter]
        pub fn path(&self) -> String {
            self.path.clone()
        }

        #[getter]
        pub fn phases(&self) -> Vec<String> {
            self.phases.clone()
        }

        pub fn get_data<'py>(&self, py: Python<'py>) -> PyResult<Bound<'py, PyDict>> {
            let dict = PyDict::new(py);

            for (k, v) in &self.data {
                dict.set_item(k, v.clone())?;
            }

            Ok(dict)
        }

        pub fn load_compound(&self, name: String) -> PyResult<Substance> {
            let db = load_substances_from_lua(&self.path)
                .map_err(|e| pyo3::exceptions::PyValueError::new_err(e.to_string()))?;

            db.get(&name).cloned().ok_or_else(|| {
                pyo3::exceptions::PyKeyError::new_err(format!(
                    "Compound '{}' not found in database",
                    name
                ))
            })
        }
    }
}

pub mod equil {
    use super::R_GAS;
    use crate::core::AggregationType;
    use crate::core::Substance;

    /// Solves a linear system Ax = b using Gaussian elimination with partial pivoting.
    /// Returns None if the matrix is singular.
    pub fn solve_linear_system(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
        let n = b.len();
        for i in 0..n {
            // Pivoting
            let mut max_row = i;
            for k in i + 1..n {
                if a[k][i].abs() > a[max_row][i].abs() {
                    max_row = k;
                }
            }
            a.swap(i, max_row);
            b.swap(i, max_row);

            if a[i][i].abs() < 1e-12 {
                return None;
            }

            for k in i + 1..n {
                let factor = a[k][i] / a[i][i];
                b[k] -= factor * b[i];
                for j in i..n {
                    a[k][j] -= factor * a[i][j];
                }
            }
        }

        let mut x = vec![0.0; n];
        for i in (0..n).rev() {
            let mut sum = 0.0;
            for j in i + 1..n {
                sum += a[i][j] * x[j];
            }
            x[i] = (b[i] - sum) / a[i][i];
        }
        Some(x)
    }

    /// Find a particular solution to the mass balance equations A * phi = b.
    /// This uses a simple gradient descent on the squared error to find ANY solution
    /// that satisfies the elemental constraints, regardless of Gibbs energy.
    /// Used as a fallback when the support-based minimization fails.
    pub fn find_particular_solution(a: &[Vec<f64>], b: &[f64], n_s: usize, n_e: usize) -> Vec<f64> {
        let mut phi = vec![0.0; n_s];
        let lr = 0.01;
        for _ in 0..20000 {
            let mut grad = vec![0.0; n_s];
            for i in 0..n_e {
                let mut err = -b[i];
                for k in 0..n_s {
                    err += a[i][k] * phi[k];
                }
                for k in 0..n_s {
                    grad[k] += err * a[i][k];
                }
            }
            for k in 0..n_s {
                phi[k] -= lr * grad[k];
            }
        }
        phi
    }

    /// Evaluates the local chemical equilibrium by minimizing the total Gibbs energy.
    ///
    /// # Mathematical Formulation
    /// Minimize G(phi) = sum(phi_k * g_k)
    /// Subject to:
    ///   1. A * phi = b (Mass Balance)
    ///   2. phi_k >= 0  (Non-negativity)
    ///
    /// # Algorithm: Support-Based Brute Force (Linear Programming)
    /// Since the objective G(phi) is linear (for stoichiometric phases), the minimum
    /// always occurs at a "basic feasible solution" where at most rank(A) species are present.
    ///
    /// This implementation:
    /// 1. Iterates through all possible combinations (supports) of active species (2^n_s combinations).
    /// 2. For each combination, finds the mass-balance solution using gradient descent.
    /// 3. Validates feasibility (non-negativity and mass balance error).
    /// 4. Returns the feasible solution with the global minimum Gibbs energy.
    /// Evaluates the local chemical equilibrium using the Dual (Element Potential) Method.
    /// This solver is more robust and significantly faster than brute-force support search.
    pub fn evaluate_local_equilibrium(
        species: &[&Substance],
        elements: &[&str],
        b: &[f64],
        t: f64,
        p: f64,
    ) -> Vec<f64> {
        let n_s = species.len();
        let n_e = elements.len();

        // 1. Precompute molar Gibbs energies
        let mut g_0 = vec![0.0; n_s];
        for i in 0..n_s {
            let s = species[i];
            let mut g = s.gibbs(t);
            if s.aggregation_type == AggregationType::Gas {
                g += R_GAS * t * (p / 101325.0).ln();
            }
            g_0[i] = g;
        }

        // 2. Build stoichiometry matrix A (n_e x n_s)
        let mut a = vec![vec![0.0; n_s]; n_e];
        for i in 0..n_e {
            for j in 0..n_s {
                a[i][j] = species[j].elements.get(elements[i]).copied().unwrap_or(0.0);
            }
        }

        let mut best_phi = vec![0.0; n_s];
        let mut min_g = f64::INFINITY;
        let mut found_solution = false;

        // 3. Support-Based Solver
        // For stoichiometric phases, the equilibrium is a Basic Feasible Solution (BFS).
        // A BFS has at most rank(A) species.
        // Since n_s is small, we iterate through all subsets.

        for mask in 1..(1 << n_s) {
            let mut active = Vec::new();
            for k in 0..n_s {
                if (mask & (1 << k)) != 0 {
                    active.push(k);
                }
            }

            if active.len() > n_e {
                continue;
            }

            // Solve A_sub * phi_sub = b using Normal Equations for robustness:
            // (A_sub^T * A_sub) * phi_sub = A_sub^T * b
            let n_a = active.len();
            let mut m = vec![vec![0.0; n_a]; n_a];
            let mut rhs = vec![0.0; n_a];

            for i in 0..n_a {
                for j in 0..n_a {
                    let mut sum = 0.0;
                    for k in 0..n_e {
                        sum += a[k][active[i]] * a[k][active[j]];
                    }
                    m[i][j] = sum;
                }
                // Regularization to handle rank-deficiency in the support
                m[i][i] += 1e-9;

                let mut sum_rhs = 0.0;
                for k in 0..n_e {
                    sum_rhs += a[k][active[i]] * b[k];
                }
                rhs[i] = sum_rhs;
            }

            if let Some(x) = solve_linear_system(m, rhs) {
                let mut phi = vec![0.0; n_s];
                let mut valid = true;
                for (j, &val) in x.iter().enumerate() {
                    if val < -1e-6 {
                        valid = false;
                        break;
                    }
                    phi[active[j]] = val;
                }

                if valid {
                    // Check mass balance accuracy
                    let mut max_err: f64 = 0.0;
                    for i in 0..n_e {
                        let mut sum = 0.0;
                        for k in 0..n_s {
                            sum += a[i][k] * phi[k];
                        }
                        max_err = max_err.max((sum - b[i]).abs());
                    }

                    if max_err < 1e-5 {
                        let mut g = 0.0;
                        for k in 0..n_s {
                            g += phi[k] * g_0[k];
                        }
                        // Use a small epsilon to prefer smaller supports if Gibbs is same
                        let score = g + (active.len() as f64) * 1e-6;
                        if score < min_g {
                            min_g = score;
                            best_phi = phi;
                            found_solution = true;
                        }
                    }
                }
            }
        }

        if found_solution {
            best_phi
        } else {
            find_particular_solution(&a, b, n_s, n_e)
        }
    }
}

// ---------------------------------------------------------------------------

#[cfg(test)]
mod autodiff_test {
    use crate::autodiff::*;

    fn assert_diff(f: impl Fn(Dual<f64>) -> Dual<f64>, df_analytical: impl Fn(f64) -> f64, x: f64) {
        let expected = df_analytical(x);
        let actual = diff(f, x);
        let diff = (expected - actual).abs();
        assert!(
            diff < 1e-9,
            "x={} | expected={}, actual={}, diff={}",
            x,
            expected,
            actual,
            diff
        );
    }

    #[test]
    fn test_unary_minus() {
        assert_diff(|x| -x, |_| -1.0, 2.0);
    }

    #[test]
    fn test_arithmetic() {
        let x0 = 2.0;
        assert_diff(|x| x + x, |_| 2.0, x0);
        assert_diff(|x| x + 3.0, |_| 1.0, x0);
        assert_diff(|x| 3.0 + x, |_| 1.0, x0);

        assert_diff(|x| x - x, |_| 0.0, x0);
        assert_diff(|x| x - 3.0, |_| 1.0, x0);
        assert_diff(|x| 3.0 - x, |_| -1.0, x0);

        assert_diff(|x| x * x, |x| 2.0 * x, x0);
        assert_diff(|x| x * 3.0, |_| 3.0, x0);
        assert_diff(|x| 3.0 * x, |_| 3.0, x0);

        assert_diff(|x| x / x, |_| 0.0, x0);
        assert_diff(|x| x / 3.0, |_| 1.0 / 3.0, x0);
        assert_diff(|x| 3.0 / x, |x| -3.0 / (x * x), x0);
    }

    #[test]
    fn test_power() {
        let x0 = 2.0;
        assert_diff(|x| x.pow(x), |x| (x.powf(x)) * (x.ln() + 1.0), x0);
        assert_diff(|x| x.powf(3.0), |x| 3.0 * (x.powf(2.0)), x0);
        assert_diff(
            |x| Dual::f_pow(3.0, x),
            |x| (3.0_f64.powf(x)) * 3.0_f64.ln(),
            x0,
        );
    }

    #[test]
    fn test_math_functions() {
        let x0 = 2.0;
        assert_diff(|x| x.sin(), |x| x.cos(), x0);
        assert_diff(|x| x.cos(), |x| -x.sin(), x0);
        assert_diff(|x| x.tan(), |x| 1.0 / (x.cos().powi(2)), x0);
        assert_diff(|x| x.exp(), |x| x.exp(), x0);
        assert_diff(|x| x.ln(), |x| 1.0 / x, x0);
        assert_diff(|x| x.sqrt(), |x| 0.5 / x.sqrt(), x0);
        assert_diff(|x| x.sinh(), |x| x.cosh(), x0);
        assert_diff(|x| x.cosh(), |x| x.sinh(), x0);
        assert_diff(|x| x.tanh(), |x| 1.0 - x.tanh().powi(2), x0);
    }

    #[test]
    fn test_calphad_example() {
        let g =
            |t: Dual<f64>| Dual::constant(10.0) + t * 2.5 - t * 3.0 * t.ln() + t.powf(2.0) * 0.5;
        let dg_analytical = |t: f64| 2.5 - 3.0 * (t.ln() + 1.0) + t;
        assert_diff(g, dg_analytical, 300.0);
    }
}

#[cfg(test)]
mod core_test {
    use crate::autodiff::{Dual, diff};
    use crate::data::load_substances_from_lua;

    #[test]
    fn test_thermo_derivatives() {
        let db = load_substances_from_lua("data/data.lua").unwrap();
        let calcite = db.get("Calcite").unwrap();
        let g = |t: Dual<f64>| calcite.gibbs(t);

        let expected = -calcite.entropy(300.0);
        let actual = diff(g, 300.0);
        assert!(
            (expected - actual).abs() < 1e-9,
            "expected={}, actual={}",
            expected,
            actual
        );
    }

    #[test]
    fn test_h2o_nasa7() {
        let db = load_substances_from_lua("data/data.lua").unwrap();
        let h2o = db.get("H2O").unwrap();
        let val = h2o.cp(300.0);
        assert!(val > 0.0);
    }

    #[test]
    fn test_system_composition() {
        use crate::core::SystemComposition;
        let db = load_substances_from_lua("data/data.lua").unwrap();
        let calcite = db.get("Calcite").unwrap();
        let diaspore = db.get("Diaspore").unwrap();
        let mix = vec![(calcite.clone(), 1.0), (diaspore.clone(), 1.0)];

        let comp = SystemComposition::from_compound_moles(mix).unwrap();
        let elements = comp.elements();
        assert_eq!(elements, vec!["Al", "C", "Ca", "H", "O"]);

        let b = comp.fractions();
        assert!((b[0] - 1.0 / 9.0).abs() < 1e-9);
        assert!((b[1] - 1.0 / 9.0).abs() < 1e-9);
        assert!((b[2] - 1.0 / 9.0).abs() < 1e-9);
        assert!((b[3] - 1.0 / 9.0).abs() < 1e-9);
        assert!((b[4] - 5.0 / 9.0).abs() < 1e-9);

        let rep = comp.report();
        assert!(rep.contains("Input Method: Compound Moles"));
    }
}

#[cfg(test)]
mod data_test {
    use crate::core::AggregationType;
    use crate::data::*;

    #[test]
    fn test_load_from_lua() {
        let result = load_substances_from_lua("data/data.lua");
        assert!(
            result.is_ok(),
            "Failed to load from lua: {:?}",
            result.err()
        );
        let map = result.unwrap();
        assert!(map.len() >= 6);
        assert!(map.contains_key("Calcite"));
        assert!(map.contains_key("CO2"));
        assert_eq!(
            map.get("Calcite").unwrap().aggregation_type,
            AggregationType::Solid
        );
        assert_eq!(
            map.get("CO2").unwrap().aggregation_type,
            AggregationType::Gas
        );
    }

    #[test]
    fn test_database_loader() {
        let loader = DatabaseLoader::new("data/data.lua".to_string(), None).unwrap();
        assert_eq!(loader.path, "data/data.lua");
        assert!(loader.phases.len() >= 6);
        assert!(loader.phases.contains(&"Calcite".to_string()));

        let data = loader.data;
        assert!(data.len() >= 6);
        assert!(data.contains_key("Calcite"));

        // Test loading phase list filtering
        let loader_filtered = DatabaseLoader::new(
            "data/data.lua".to_string(),
            Some(vec!["Calcite".to_string(), "CO2".to_string()]),
        )
        .unwrap();
        assert_eq!(loader_filtered.data.len(), 2);
        assert!(loader_filtered.data.contains_key("Calcite"));
        assert!(loader_filtered.data.contains_key("CO2"));
        assert!(!loader_filtered.data.contains_key("Lime"));

        // Test load_compound retrieving new data
        let compound = loader_filtered.load_compound("Lime".to_string()).unwrap();
        assert_eq!(compound.name, "Lime");
    }
}

// ---------------------------------------------------------------------------

#[pymodule(name = "_calphad")]
pub mod calphad {
    #[pymodule_export]
    use crate::data::DatabaseLoader;

    #[pymodule_export]
    use crate::core::Substance;

    #[pymodule_export]
    use crate::core::SystemComposition;

    #[pymodule_export]
    use crate::autodiff::PyDual;
}

// ---------------------------------------------------------------------------
