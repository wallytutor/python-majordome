use super::T_REF;
use super::exponential_fmt;
use super::functions::*;
use crate::num::autodiff::Numeric;
use crate::num::autodiff::PyDual;
use pyo3::prelude::*;
use std::collections::HashMap;

// ---------------------------------------------------------------------------

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

// ---------------------------------------------------------------------------

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum AggregationType {
    Solid,
    Liquid,
    Gas,
}

// ---------------------------------------------------------------------------

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

// ---------------------------------------------------------------------------

#[derive(Debug, Clone)]
pub struct TemperatureRange {
    pub t_min: f64,
    pub t_max: f64,
    pub model: Parameterization,
}

// ---------------------------------------------------------------------------
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

    pub fn tabulate(&self, t_min: Option<f64>, t_max: Option<f64>, step: Option<f64>) -> String {
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
    pub fn tabulate_py(&self, t_min: Option<f64>, t_max: Option<f64>, step: Option<f64>) -> String {
        self.tabulate(t_min, t_max, step)
    }
}

pub fn extract_elements(compounds: &[&Substance]) -> Vec<String> {
    let mut uniq = std::collections::HashSet::new();
    for s in compounds {
        for el in s.elements.keys() {
            uniq.insert(el.clone());
        }
    }
    let mut res: Vec<String> = uniq.into_iter().collect();
    res.sort();
    res
}

// ---------------------------------------------------------------------------

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
    pub fn from_compound_moles(
        species: HashMap<String, Substance>,
        proportions: HashMap<String, f64>,
    ) -> PyResult<Self> {
        let mut element_moles = HashMap::new();
        let mut input_proportions = HashMap::new();

        for (name, moles) in &proportions {
            let substance = species.get(name).ok_or_else(|| {
                pyo3::exceptions::PyValueError::new_err(format!(
                    "Substance '{}' specified in composition not found in species database",
                    name
                ))
            })?;
            input_proportions.insert(substance.name.clone(), *moles);
            for (el, coeff) in &substance.elements {
                *element_moles.entry(el.clone()).or_insert(0.0) += moles * coeff;
            }
        }

        let subs: Vec<&Substance> = species.values().collect();
        let elements = extract_elements(&subs);

        let total_moles: f64 = element_moles.values().sum();
        let fractions = if total_moles > 0.0 {
            elements
                .iter()
                .map(|el| element_moles.get(el).copied().unwrap_or(0.0) / total_moles)
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
    pub fn from_compound_masses(
        species: HashMap<String, Substance>,
        proportions: HashMap<String, f64>,
    ) -> PyResult<Self> {
        let mut element_moles = HashMap::new();
        let mut input_proportions = HashMap::new();

        for (name, mass) in &proportions {
            let substance = species.get(name).ok_or_else(|| {
                pyo3::exceptions::PyValueError::new_err(format!(
                    "Substance '{}' specified in composition not found in species database",
                    name
                ))
            })?;
            input_proportions.insert(substance.name.clone(), *mass);
            let moles = mass / substance.molar_mass;
            for (el, coeff) in &substance.elements {
                *element_moles.entry(el.clone()).or_insert(0.0) += moles * coeff;
            }
        }

        let subs: Vec<&Substance> = species.values().collect();
        let elements = extract_elements(&subs);

        let total_moles: f64 = element_moles.values().sum();
        let fractions = if total_moles > 0.0 {
            elements
                .iter()
                .map(|el| element_moles.get(el).copied().unwrap_or(0.0) / total_moles)
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

    #[pyo3(name = "into_elemental_fractions")]
    pub fn into_elemental_fractions(&self) -> HashMap<String, f64> {
        let mut map = HashMap::new();
        for (el, frac) in self.elements.iter().zip(self.fractions.iter()) {
            map.insert(el.clone(), *frac);
        }
        map
    }

    #[staticmethod]
    pub fn from_elemental_moles(elements_in: HashMap<String, f64>) -> PyResult<Self> {
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
    pub fn from_elemental_masses(elements_in: HashMap<String, f64>) -> PyResult<Self> {
        let mut element_moles = HashMap::new();
        let mut input_proportions = HashMap::new();

        for (el, mass) in elements_in {
            input_proportions.insert(el.clone(), mass);
            let atomic_w = get_atomic_weight(&el).ok_or_else(|| {
                pyo3::exceptions::PyValueError::new_err(format!("Unknown element symbol: '{}'", el))
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

// ---------------------------------------------------------------------------

#[cfg(test)]
mod core_test {
    use super::SystemComposition;
    use crate::calphad::data::load_substances_from_lua;
    use crate::num::autodiff::{Dual, diff};

    #[test]
    fn test_thermo_derivatives() {
        let db = load_substances_from_lua("data/sample/simple-calcination.lua").unwrap();
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
        let db = load_substances_from_lua("data/sample/simple-calcination.lua").unwrap();
        let h2o = db.get("H2O").unwrap();
        let val = h2o.cp(300.0);
        assert!(val > 0.0);
    }

    #[test]
    fn test_system_composition() {
        let db = load_substances_from_lua("data/sample/simple-calcination.lua").unwrap();

        let mut proportions = std::collections::HashMap::new();
        proportions.insert("Calcite".to_string(), 1.0);
        proportions.insert("Diaspore".to_string(), 1.0);

        let comp = SystemComposition::from_compound_moles(db, proportions).unwrap();
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

// ---------------------------------------------------------------------------
