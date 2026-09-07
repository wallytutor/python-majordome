use super::coefficients::ActivationEnergy;
use super::coefficients::ArrheniusModifiedDiffusivity;
use super::coefficients::PreExponentialFactor;
use super::common::DiffusionField1D;
use super::common::fourier_number_delta_sq;
use super::common::sherwood_number;
use crate::domain1d::ImmersedNodeDomain1D;
use majordome_calphad::mixture::FractionConverter;
use majordome_calphad::mixture::InterstitialConverter;
use majordome_numerical::prelude::*;
use majordome_utilities::prelude::*;
use pyo3::prelude::*;

// ---------------------------------------------------------------------------

pub type DiffusivityCallbackFn = dyn Fn(usize, &[f64], f64) -> f64 + Send + Sync;
pub type TemperatureCallbackFn = dyn Fn(f64) -> f64 + Send + Sync;
pub type VectorCallbackFn = dyn Fn(f64) -> Vec<f64> + Send + Sync;

// ---------------------------------------------------------------------------

struct FvmParams<'a> {
    delta_w: &'a [f64],
    delta_e: &'a [f64],
    relaxation_factor: f64,
    absolute_tolerance: f64,
}

// ---------------------------------------------------------------------------

struct SurfaceBoundaryState {
    boundary_concentrations: Vec<f64>,
    diffusivities: Vec<f64>,
    fluxes: Vec<f64>,
}

// ---------------------------------------------------------------------------

#[pyclass(from_py_object, name = "ElementResults")]
#[derive(Clone, Debug)]
pub struct ElementResults {
    pub profile: Vec<Vec<f64>>,
    pub flux: Vec<f64>,
    pub mass_intake: Vec<f64>,
    pub mass_intake_from_profile: Vec<f64>,
}

#[pymethods]
impl ElementResults {
    #[getter]
    pub fn profile(&self) -> Vec<Vec<f64>> {
        self.profile.clone()
    }

    #[getter]
    pub fn flux(&self) -> Vec<f64> {
        self.flux.clone()
    }

    #[getter]
    pub fn mass_intake(&self) -> Vec<f64> {
        self.mass_intake.clone()
    }

    #[getter]
    pub fn mass_intake_from_profile(&self) -> Vec<f64> {
        self.mass_intake_from_profile.clone()
    }
}

// ---------------------------------------------------------------------------

pub struct NonlinearDiffusionSolverInput {
    pub grid: ImmersedNodeDomain1D,
    pub y0: Vec<Vec<f64>>,
    pub time_points: Vec<f64>,
    pub species_names: Vec<String>,
    pub molar_masses: Vec<f64>,
    pub diffusivity_callback: Box<DiffusivityCallbackFn>,
    pub external_temperature: Box<TemperatureCallbackFn>,
    pub external_coefficients: Box<VectorCallbackFn>,
    pub external_potential: Box<VectorCallbackFn>,
}

// ---------------------------------------------------------------------------

pub struct NonlinearDiffusionSolver {
    pub grid: ImmersedNodeDomain1D,
    pub fields: Vec<DiffusionField1D>,
    pub num_points: usize,
    pub time_points: Vec<f64>,

    pub max_nonlin_iter: usize,
    pub relaxation_factor: f64,
    pub absolute_tolerance: f64,
    pub relative_tolerance: f64,

    pub concentrations_tmp: Vec<Vec<f64>>,

    pub delta_w: Vec<f64>,
    pub delta_e: Vec<f64>,

    pub species_names: Vec<String>,
    pub molar_masses: Vec<f64>,
    pub results: Vec<ElementResults>,

    pub diffusivity_callback: Box<DiffusivityCallbackFn>,
    pub external_temperature: Box<TemperatureCallbackFn>,
    pub external_coefficients: Box<VectorCallbackFn>,
    pub external_potential: Box<VectorCallbackFn>,
}

// ---------------------------------------------------------------------------
// Private

impl NonlinearDiffusionSolver {
    fn evaluate_diffusivity_at_concentration(
        &self,
        species_idx: usize,
        c: &[f64],
        temp: f64,
    ) -> f64 {
        (self.diffusivity_callback)(species_idx, c, temp)
    }

    fn solve_surface_boundary_state(
        &self,
        _tnow: f64,
        c0: &[f64],
        temp: f64,
        h_inf: &[f64],
        c_inf: &[f64],
    ) -> SurfaceBoundaryState {
        let dl0 = self.grid.spacing[0];
        let tol = self.absolute_tolerance;
        let num_species = c0.len();

        let mut c_boundary = c0.to_vec();
        let mut diffusivities = vec![0.0; num_species];

        let mut delta_boundary = f64::INFINITY;
        let mut iteration = 0;

        while delta_boundary > tol && iteration < self.max_nonlin_iter {
            let mut max_change = 0.0;

            for idx in 0..num_species {
                let d = self.evaluate_diffusivity_at_concentration(idx, &c_boundary, temp);
                diffusivities[idx] = d;

                let sh = sherwood_number(h_inf[idx], dl0, d);
                let c_new = (c0[idx] + sh * c_inf[idx]) / (1.0 + sh);

                let change = (c_new - c_boundary[idx]).abs();

                if change > max_change {
                    max_change = change;
                }

                c_boundary[idx] = c_new;
            }

            delta_boundary = max_change;
            iteration += 1;
        }

        let mut fluxes = vec![0.0; num_species];

        for idx in 0..num_species {
            let d = self.evaluate_diffusivity_at_concentration(idx, &c_boundary, temp);
            diffusivities[idx] = d;
            fluxes[idx] = h_inf[idx] * (c_boundary[idx] - c_inf[idx]);
        }

        SurfaceBoundaryState {
            boundary_concentrations: c_boundary,
            diffusivities,
            fluxes,
        }
    }

    fn update_diffusivities(
        num_points: usize,
        spacing: &[f64],
        species_idx: usize,
        concentrations: &[Vec<f64>],
        diffusivity_callback: &dyn Fn(usize, &[f64], f64) -> f64,
        field: &mut DiffusionField1D,
        temp: f64,
    ) {
        let num_species = concentrations.len();
        let mut node_c = vec![0.0; num_species];

        for i in 0..num_points {
            for s in 0..num_species {
                node_c[s] = concentrations[s][i];
            }

            field.diffusivity[i] = diffusivity_callback(species_idx, &node_c, temp);

            if i > 0 {
                let d_i = spacing[i - 1];
                let d_j = spacing[i];

                let diff_i = field.diffusivity[i - 1];
                let diff_j = field.diffusivity[i];

                let num = d_i + d_j;
                let den = d_i / diff_i + d_j / diff_j;

                field.face_diffusivity[i - 1] = num / den;
            }
        }
    }

    fn update_field_fvm(
        params: &FvmParams<'_>,
        field: &mut DiffusionField1D,
        c_boundary: f64,
        boundary_diffusivity: f64,
        tau: f64,
        x_old: &mut [f64],
    ) -> (f64, f64) {
        let size = field.solver.problem.n;
        let mat = &mut field.solver.problem.matrix;

        let d_b = boundary_diffusivity;
        let delta_w = params.delta_w[0];
        let fo_b = fourier_number_delta_sq(d_b, tau, delta_w);

        let d_e = field.face_diffusivity[0];
        let delta_e = params.delta_e[0];
        let fo_e = fourier_number_delta_sq(d_e, tau, delta_e);

        mat.b[0] = 1.0 + 2.0 * fo_b + fo_e;
        mat.c[0] = -fo_e;

        field.solver.problem.d[0] = field.concentration[0] + 2.0 * fo_b * c_boundary;

        for i in 1..size - 1 {
            let d_w = field.face_diffusivity[i - 1];
            let d_e = field.face_diffusivity[i];

            let fo_w = fourier_number_delta_sq(d_w, tau, params.delta_w[i]);
            let fo_e = fourier_number_delta_sq(d_e, tau, params.delta_e[i]);

            mat.a[i] = -fo_w;
            mat.b[i] = 1.0 + fo_w + fo_e;
            mat.c[i] = -fo_e;
        }

        let n = size - 1;
        let d_w = field.face_diffusivity[n - 1];
        let delta_e = params.delta_e[n - 1];
        let fo_w = fourier_number_delta_sq(d_w, tau, delta_e);

        mat.a[n] = -fo_w;
        mat.b[n] = 1.0 + fo_w;

        let x_new = field.solver.solve();
        let small = params.absolute_tolerance;
        let mut abs_change = 0.0;
        let mut rel_change = 0.0;

        let num_points = x_old.len();
        for i in 0..num_points {
            let mut val_new = x_new[i];

            if params.relaxation_factor < 0.999 {
                let change_inc = params.relaxation_factor * (x_new[i] - x_old[i]);
                val_new = x_old[i] + change_inc;
            }

            let change_abs = (val_new - x_old[i]).abs();
            let change_rel = change_abs / (x_old[i].abs() + small);

            x_old[i] = val_new;

            if change_abs > abs_change {
                abs_change = change_abs;
            }

            if change_rel > rel_change {
                rel_change = change_rel;
            }
        }

        (abs_change, rel_change)
    }

    fn outer_loop(&mut self, t: f64, tau: f64) -> (usize, f64, f64, bool) {
        let tnow = t + tau;
        let temp = (self.external_temperature)(tnow);
        let c_inf = (self.external_potential)(tnow);
        let h_inf = (self.external_coefficients)(tnow);

        let mut converged = false;
        let mut iteration = 0;
        let mut abs_err = f64::NEG_INFINITY;
        let mut rel_err = f64::NEG_INFINITY;

        let num_species = self.fields.len();

        let params = FvmParams {
            delta_w: &self.delta_w,
            delta_e: &self.delta_e,
            relaxation_factor: self.relaxation_factor,
            absolute_tolerance: self.absolute_tolerance,
        };

        while !converged && iteration < self.max_nonlin_iter {
            let c0: Vec<f64> = (0..num_species)
                .map(|idx| self.concentrations_tmp[idx][0])
                .collect();

            let b_state = self.solve_surface_boundary_state(tnow, &c0, temp, &h_inf, &c_inf);

            let mut max_abs = 0.0;
            let mut max_rel = 0.0;

            for idx in 0..num_species {
                Self::update_diffusivities(
                    self.num_points,
                    &self.grid.spacing,
                    idx,
                    &self.concentrations_tmp,
                    &self.diffusivity_callback,
                    &mut self.fields[idx],
                    temp,
                );

                self.fields[idx].surface_flux = b_state.fluxes[idx];

                let (abs_c, rel_c) = Self::update_field_fvm(
                    &params,
                    &mut self.fields[idx],
                    b_state.boundary_concentrations[idx],
                    b_state.diffusivities[idx],
                    tau,
                    &mut self.concentrations_tmp[idx],
                );

                if abs_c > max_abs {
                    max_abs = abs_c;
                }

                if rel_c > max_rel {
                    max_rel = rel_c;
                }
            }

            abs_err = max_abs;
            rel_err = max_rel;
            iteration += 1;

            converged = abs_err < self.absolute_tolerance && rel_err < self.relative_tolerance;
        }

        (iteration, abs_err, rel_err, converged)
    }
}

// ---------------------------------------------------------------------------
// Public

impl NonlinearDiffusionSolver {
    pub fn new(input: NonlinearDiffusionSolverInput) -> Self {
        let num_points = input.grid.interior.len();
        let mut delta_w = vec![0.0; num_points];
        let mut delta_e = vec![0.0; num_points];

        let delta = &input.grid.spacing[1..input.grid.spacing.len() - 1];

        delta_e[0] = delta[0] * input.grid.cell_sizes[1];
        delta_e[num_points - 1] = input.grid.cell_sizes[num_points].powi(2) / 2.0;

        delta_w[0] = input.grid.cell_sizes[1].powi(2) / 2.0;
        delta_w[num_points - 1] = delta[num_points - 2] * input.grid.cell_sizes[num_points - 1];

        for i in 1..num_points - 1 {
            let l_i = input.grid.cell_sizes[i + 1];
            delta_w[i] = l_i * delta[i - 1];
            delta_e[i] = l_i * delta[i];
        }

        let n_steps = input.time_points.len().saturating_sub(1);
        let num_species = input.species_names.len();

        let mut fields = Vec::with_capacity(num_species);
        let mut results = Vec::with_capacity(num_species);
        let mut concentrations_tmp = Vec::with_capacity(num_species);

        for y0_s in input.y0.iter().take(num_species) {
            fields.push(DiffusionField1D::from_concentration(y0_s));
            concentrations_tmp.push(y0_s.clone());

            results.push(ElementResults {
                profile: vec![vec![0.0; num_points]; n_steps + 1],
                flux: vec![0.0; n_steps + 1],
                mass_intake: vec![0.0; n_steps + 1],
                mass_intake_from_profile: vec![0.0; n_steps + 1],
            });
        }

        Self {
            grid: input.grid,
            fields,
            num_points,
            time_points: input.time_points,
            max_nonlin_iter: 50,
            relaxation_factor: 0.75,
            absolute_tolerance: 1e-6,
            relative_tolerance: 1e-6,
            concentrations_tmp,
            delta_w,
            delta_e,
            species_names: input.species_names,
            molar_masses: input.molar_masses,
            results,
            diffusivity_callback: input.diffusivity_callback,
            external_temperature: input.external_temperature,
            external_coefficients: input.external_coefficients,
            external_potential: input.external_potential,
        }
    }

    pub fn species_names(&self) -> &[String] {
        &self.species_names
    }

    pub fn integrate(&mut self, every: usize) {
        self.store_state(0);

        let n_steps = self.time_points.len().saturating_sub(1);

        for i in 1..=n_steps {
            let t = self.time_points[i - 1];
            let tau = self.time_points[i] - self.time_points[i - 1];

            for s in 0..self.fields.len() {
                for j in 0..self.num_points {
                    self.concentrations_tmp[s][j] = self.fields[s].concentration[j];
                    self.fields[s].solver.problem.d[j] = self.concentrations_tmp[s][j];
                }
            }

            let (iteration, abs_err, rel_err, converged) = self.outer_loop(t, tau);

            for s in 0..self.fields.len() {
                for j in 0..self.num_points {
                    self.fields[s].concentration[j] = self.concentrations_tmp[s][j];
                }
            }

            self.store_state(i);

            if !converged {
                println!(
                    "Warning: solver did not converge at time {:e} .. iters = {}, absErr = {:e}, relErr = {:e}",
                    t, iteration, abs_err, rel_err
                );
            }

            if i % every == 0 || i == n_steps {
                println!(
                    "Step {:05}/{:05} (t = {} s) .. iters = {}, absErr = {}, relErr = {}",
                    i,
                    n_steps,
                    exponential_fmt(self.time_points[i]),
                    iteration,
                    exponential_fmt(abs_err),
                    exponential_fmt(rel_err)
                );
            }
        }

        let mut sigma_f = 0.0;
        let tot_intake = self.get_total_mass_intake();

        if let Some(&val) = tot_intake.last() {
            sigma_f = val;
        }

        println!(
            "Integration complete, total mass intake: {:.1} g/m^2",
            sigma_f
        );
    }

    pub fn store_state(&mut self, idx: usize) {
        let num_species = self.fields.len();

        for s in 0..num_species {
            let factor = 4.0 * self.grid.spacing[0] / self.grid.cell_sizes[1];
            let mdot = -self.molar_masses[s] * self.fields[s].surface_flux * factor;

            self.results[s].profile[idx] = self.fields[s].concentration.clone();
            self.results[s].flux[idx] = mdot;

            if idx == 0 {
                self.results[s].mass_intake[0] = 0.0;
                self.results[s].mass_intake_from_profile[0] = 0.0;

            } else {
                let dt = self.time_points[idx] - self.time_points[idx - 1];

                self.results[s].mass_intake[idx] = self.results[s].mass_intake[idx - 1]
                    + 0.5 * (self.results[s].flux[idx - 1] + self.results[s].flux[idx]) * dt;

                let mut sum_diff = 0.0;

                for i in 0..self.num_points {
                    let diff = self.results[s].profile[idx][i] - self.results[s].profile[0][i];
                    sum_diff += diff * self.grid.cell_sizes[i + 1];
                }

                self.results[s].mass_intake_from_profile[idx] = sum_diff * self.molar_masses[s];
            }
        }
    }

    pub fn get_total_mass_intake(&self) -> Vec<f64> {
        let num_steps = self.time_points.len();
        let mut total = vec![0.0; num_steps];

        for s in 0..self.fields.len() {
            for (tot, &val) in total.iter_mut().zip(&self.results[s].mass_intake) {
                *tot += val;
            }
        }

        total
    }

    pub fn get_total_mass_intake_from_profile(&self) -> Vec<f64> {
        let num_steps = self.time_points.len();
        let mut total = vec![0.0; num_steps];

        for s in 0..self.fields.len() {

            for (tot, &val) in total.iter_mut().zip(&self.results[s].mass_intake_from_profile) {
                *tot += val;
            }
        }

        total
    }
}

// ---------------------------------------------------------------------------

#[pyclass(get_all, set_all, from_py_object)]
#[derive(Clone, Debug)]
pub struct CarbonitridingInput {
    pub grid: ImmersedNodeDomain1D,
    pub carbon_mass_fraction: Vec<f64>,
    pub nitrogen_mass_fraction: Vec<f64>,
    pub time_points: Vec<f64>,
}

// ---------------------------------------------------------------------------
// Constructor

#[pymethods]
impl CarbonitridingInput {
    #[new]
    pub fn new(
        grid: ImmersedNodeDomain1D,
        carbon_mass_fraction: Vec<f64>,
        nitrogen_mass_fraction: Vec<f64>,
        time_points: Vec<f64>,
    ) -> Self {
        Self {
            grid,
            carbon_mass_fraction,
            nitrogen_mass_fraction,
            time_points,
        }
    }
}

// ---------------------------------------------------------------------------

pub struct CarbonitridingSolver {
    pub solver: NonlinearDiffusionSolver,
    pub fraction_converter: FractionConverter,
    pub interstitial_converter: InterstitialConverter,
}

// ---------------------------------------------------------------------------

impl CarbonitridingSolver {
    pub fn new(
        input: CarbonitridingInput,
        carbon_model: ArrheniusModifiedDiffusivity,
        nitrogen_model: ArrheniusModifiedDiffusivity,
        external_temperature: Box<dyn Fn(f64) -> f64 + Send + Sync>,
        external_coefficients: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
        external_potential: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
    ) -> Result<Self, String> {
        let num_points = input.grid.interior.len();

        let fraction_converter =
            FractionConverter::new(&["C".to_string(), "N".to_string(), "Fe".to_string()])
                .map_err(|e| format!("Failed to create FractionConverter: {}", e))?;

        let interstitial_converter = InterstitialConverter::new(0.055845, 7870.0);

        let mut c0_c = vec![0.0; num_points];
        let mut c0_n = vec![0.0; num_points];

        for i in 0..num_points {
            let y_c = input.carbon_mass_fraction[i];
            let y_n = input.nitrogen_mass_fraction[i];
            let y = vec![y_c, y_n, 1.0 - y_c - y_n];
            let x = fraction_converter
                .mass_to_mole_fraction(&y)
                .map_err(|e| format!("Failed mass_to_mole_fraction conversion: {}", e))?;
            let c = interstitial_converter.mole_fraction_to_concentration(&x[0..2]);
            c0_c[i] = c[0];
            c0_n[i] = c[1];
        }

        let carbon_model_arc = std::sync::Arc::new(carbon_model);
        let nitrogen_model_arc = std::sync::Arc::new(nitrogen_model);
        let fraction_converter_arc = std::sync::Arc::new(fraction_converter.clone());
        let interstitial_converter_arc = std::sync::Arc::new(interstitial_converter.clone());

        let carbon_model_clone = carbon_model_arc.clone();
        let nitrogen_model_clone = nitrogen_model_arc.clone();
        let interstitial_converter_clone = interstitial_converter_arc.clone();

        let diffusivity_callback = Box::new(move |species_idx: usize, c: &[f64], temp: f64| {
            let x = interstitial_converter_clone.concentration_to_mole_fraction(c);

            if species_idx == 0 {
                carbon_model_clone.evaluate(&x, temp)
            } else {
                nitrogen_model_clone.evaluate(&x, temp)
            }
        });

        let fraction_converter_clone = fraction_converter_arc.clone();
        let interstitial_converter_clone = interstitial_converter_arc.clone();

        let external_potential_wrapper = Box::new(move |t: f64| {
            let y_inf = (external_potential)(t);
            let y_all = vec![y_inf[0], y_inf[1], 1.0 - y_inf[0] - y_inf[1]];
            let x_all = fraction_converter_clone
                .mass_to_mole_fraction(&y_all)
                .unwrap_or_else(|_| vec![0.0; 3]);
            interstitial_converter_clone.mole_fraction_to_concentration(&x_all[0..2])
        });

        let y0 = vec![c0_c, c0_n];
        let species_names = vec!["Carbon".to_string(), "Nitrogen".to_string()];
        let molar_masses = vec![12.011, 14.007];

        let solver = NonlinearDiffusionSolver::new(NonlinearDiffusionSolverInput {
            grid: input.grid,
            y0,
            time_points: input.time_points,
            species_names,
            molar_masses,
            diffusivity_callback,
            external_temperature,
            external_coefficients,
            external_potential: external_potential_wrapper,
        });
        Ok(Self {
            solver,
            fraction_converter,
            interstitial_converter,
        })
    }

    pub fn integrate(&mut self, every: usize) {
        self.solver.integrate(every);
    }

    pub fn get_reinitialization(&self) -> Result<(Vec<f64>, Vec<f64>), String> {
        let num_points = self.solver.num_points;
        let xc_final = &self.solver.fields[0].concentration;
        let xn_final = &self.solver.fields[1].concentration;

        let mut yc_final = Vec::with_capacity(num_points);
        let mut yn_final = Vec::with_capacity(num_points);

        for i in 0..num_points {
            let x = self
                .interstitial_converter
                .concentration_to_mole_fraction(&[xc_final[i], xn_final[i]]);

            let x_all = vec![x[0], x[1], 1.0 - x[0] - x[1]];
            let y = self
                .fraction_converter
                .mole_to_mass_fraction(&x_all)
                .map_err(|e| format!("Failed mole_to_mass_fraction conversion: {}", e))?;

            yc_final.push(y[0]);
            yn_final.push(y[1]);
        }

        Ok((yc_final, yn_final))
    }

    pub fn get_surface_fluxes(&self, idx: usize) -> Result<(f64, f64), String> {
        let num_steps = self.solver.time_points.len();

        if idx >= num_steps {
            return Err(format!(
                "Out-of-bounds index {} for {} time points.",
                idx, num_steps
            ));
        }

        Ok((
            self.solver.results[0].flux[idx],
            self.solver.results[1].flux[idx],
        ))
    }

    pub fn get_total_mass_intake(&self) -> Vec<f64> {
        self.solver.get_total_mass_intake()
    }

    pub fn get_total_mass_intake_from_profile(&self) -> Vec<f64> {
        self.solver.get_total_mass_intake_from_profile()
    }
}

// ---------------------------------------------------------------------------

#[pyclass(name = "CarbonitridingSolver")]
pub struct CarbonitridingSolverPy {
    solver: CarbonitridingSolver,
}

// ---------------------------------------------------------------------------
// Constructor

#[pymethods]
impl CarbonitridingSolverPy {
    #[new]
    #[pyo3(signature = (
        input,
        carbon_model,
        nitrogen_model,
        external_temperature,
        external_coefficients,
        external_potential
    ))]
    pub fn new(
        py: Python<'_>,
        input: CarbonitridingInput,
        carbon_model: PyRef<'_, ArrheniusModifiedDiffusivity>,
        nitrogen_model: PyRef<'_, ArrheniusModifiedDiffusivity>,
        external_temperature: Bound<'_, PyAny>,
        external_coefficients: Bound<'_, PyAny>,
        external_potential: Bound<'_, PyAny>,
    ) -> PyResult<Self> {
        let temp_py = external_temperature.unbind();
        let temp_py_clone = temp_py.clone_ref(py);
        let external_temperature_rust = Box::new(move |t: f64| {
            let py = unsafe { Python::assume_attached() };
            temp_py_clone
                .bind(py)
                .call1((t,))
                .and_then(|res| res.extract::<f64>())
                .unwrap_or(0.0)
        });

        let coef_py = external_coefficients.unbind();
        let coef_py_clone = coef_py.clone_ref(py);
        let external_coefficients_rust = Box::new(move |t: f64| {
            let py = unsafe { Python::assume_attached() };
            coef_py_clone
                .bind(py)
                .call1((t,))
                .and_then(|res| res.extract::<Vec<f64>>())
                .unwrap_or_default()
        });

        let pot_py = external_potential.unbind();
        let pot_py_clone = pot_py.clone_ref(py);
        let external_potential_rust = Box::new(move |t: f64| {
            let py = unsafe { Python::assume_attached() };
            pot_py_clone
                .bind(py)
                .call1((t,))
                .and_then(|res| res.extract::<Vec<f64>>())
                .unwrap_or_default()
        });

        let carbon_model_rust = ArrheniusModifiedDiffusivity {
            pre_exponential: PreExponentialFactor {
                callback: carbon_model
                    .pre_exponential
                    .callback
                    .as_ref()
                    .map(|cb| cb.clone_ref(py)),
                rust_callback: carbon_model.pre_exponential.rust_callback,
            },
            activation_energy: ActivationEnergy {
                callback: carbon_model
                    .activation_energy
                    .callback
                    .as_ref()
                    .map(|cb| cb.clone_ref(py)),
                rust_callback: carbon_model.activation_energy.rust_callback,
            },
        };

        let nitrogen_model_rust = ArrheniusModifiedDiffusivity {
            pre_exponential: PreExponentialFactor {
                callback: nitrogen_model
                    .pre_exponential
                    .callback
                    .as_ref()
                    .map(|cb| cb.clone_ref(py)),
                rust_callback: nitrogen_model.pre_exponential.rust_callback,
            },
            activation_energy: ActivationEnergy {
                callback: nitrogen_model
                    .activation_energy
                    .callback
                    .as_ref()
                    .map(|cb| cb.clone_ref(py)),
                rust_callback: nitrogen_model.activation_energy.rust_callback,
            },
        };

        let solver = CarbonitridingSolver::new(
            input,
            carbon_model_rust,
            nitrogen_model_rust,
            external_temperature_rust,
            external_coefficients_rust,
            external_potential_rust,
        )
        .map_err(pyo3::exceptions::PyValueError::new_err)?;

        Ok(Self { solver })
    }
}

// ---------------------------------------------------------------------------
// Methods

#[pymethods]
impl CarbonitridingSolverPy {
    #[pyo3(signature = (every=10))]
    pub fn integrate(&mut self, every: usize) {
        self.solver.integrate(every);
    }

    pub fn get_reinitialization(&self) -> PyResult<(Vec<f64>, Vec<f64>)> {
        self.solver
            .get_reinitialization()
            .map_err(pyo3::exceptions::PyValueError::new_err)
    }

    pub fn get_surface_fluxes(&self, idx: usize) -> PyResult<(f64, f64)> {
        self.solver
            .get_surface_fluxes(idx)
            .map_err(pyo3::exceptions::PyIndexError::new_err)
    }
}

// ---------------------------------------------------------------------------
// Getters/setters

#[pymethods]
impl CarbonitridingSolverPy {
    #[getter]
    pub fn carbon_results(&self) -> ElementResults {
        self.solver.solver.results[0].clone()
    }

    #[getter]
    pub fn nitrogen_results(&self) -> ElementResults {
        self.solver.solver.results[1].clone()
    }

    #[getter]
    pub fn total_mass_intake(&self) -> Vec<f64> {
        self.solver.get_total_mass_intake()
    }

    #[getter]
    pub fn total_mass_intake_from_profile(&self) -> Vec<f64> {
        self.solver.get_total_mass_intake_from_profile()
    }

    #[getter]
    pub fn absolute_tolerance(&self) -> f64 {
        self.solver.solver.absolute_tolerance
    }

    #[setter]
    pub fn set_absolute_tolerance(&mut self, val: f64) {
        self.solver.solver.absolute_tolerance = val;
    }

    #[getter]
    pub fn relative_tolerance(&self) -> f64 {
        self.solver.solver.relative_tolerance
    }

    #[setter]
    pub fn set_relative_tolerance(&mut self, val: f64) {
        self.solver.solver.relative_tolerance = val;
    }

    #[getter]
    pub fn relaxation_factor(&self) -> f64 {
        self.solver.solver.relaxation_factor
    }

    #[setter]
    pub fn set_relaxation_factor(&mut self, val: f64) {
        self.solver.solver.relaxation_factor = val;
    }
}

// ---------------------------------------------------------------------------

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_carbonitriding_solver() -> Result<(), String> {
        let grid = ImmersedNodeDomain1D::linear(1e-3, 5, None)?;

        let y0_c = vec![0.001; 5];
        let y0_n = vec![0.0005; 5];
        let time_points = vec![0.0, 10.0];

        let carbon_model =
            ArrheniusModifiedDiffusivity::from_rust_fns(|_x, _t| 1e-11, |_x, _t| 0.0);
        let nitrogen_model =
            ArrheniusModifiedDiffusivity::from_rust_fns(|_x, _t| 1e-12, |_x, _t| 0.0);

        let input = CarbonitridingInput {
            grid,
            carbon_mass_fraction: y0_c,
            nitrogen_mass_fraction: y0_n,
            time_points,
        };

        let mut solver = CarbonitridingSolver::new(
            input,
            carbon_model,
            nitrogen_model,
            Box::new(|_t| 1000.0),
            Box::new(|_t| vec![1e-5, 1e-6]),
            Box::new(|_t| vec![0.002, 0.001]),
        )?;

        solver.integrate(1);

        assert_eq!(solver.solver.results[0].profile.len(), 2);
        assert_eq!(solver.solver.results[1].profile.len(), 2);

        Ok(())
    }
}

// ---------------------------------------------------------------------------
