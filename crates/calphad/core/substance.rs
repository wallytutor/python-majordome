use super::constant::T_REF;
use super::parameterization::{AggregationType, TemperatureRange};
use majordome_numerical::autodiff::{Numeric, PyDual};
use majordome_utilities::text::exponential_fmt;
use pyo3::prelude::*;
use std::collections::HashMap;

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
