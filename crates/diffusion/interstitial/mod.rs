use crate::coefficients::ArrheniusModifiedDiffusivity;
use crate::fvm::DiffusionField1D;
use crate::fvm::fourier_number_delta_sq;
use crate::fvm::sherwood_number;
use majordome_calphad::mixture::FractionConverter;
use majordome_calphad::mixture::InterstitialConverter;
use majordome_fvm::ImmersedNodeDomain1D;
use majordome_numerical::linear_algebra::TridiagonalSolver;
use pyo3::prelude::*;

struct SurfaceBoundaryState {
    boundary_concentrations: Vec<f64>,
    diffusivities: Vec<f64>,
    fluxes: Vec<f64>,
}

#[pyclass(from_py_object, name = "ElementResults")]
#[derive(Clone, Debug)]
pub struct ElementResults {
    pub profile: Vec<Vec<f64>>,
    pub flux: Vec<f64>,
    pub mass_intake: Vec<f64>,
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
}

pub struct NonlinearDiffusionSolver {
    pub grid: ImmersedNodeDomain1D,
    pub fields: Vec<DiffusionField1D>,
    pub num_points: usize,
    pub time_points: Vec<f64>,
    pub time_steps: Vec<f64>,

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

    pub diffusivity_callback: Box<dyn Fn(usize, &[f64], f64) -> f64 + Send + Sync>,
    pub external_temperature: Box<dyn Fn(f64) -> f64 + Send + Sync>,
    pub external_coefficients: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
    pub external_potential: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
}

impl NonlinearDiffusionSolver {
    pub fn new(
        grid: ImmersedNodeDomain1D,
        y0: &[Vec<f64>],
        time_points: Vec<f64>,
        time_steps: Vec<f64>,
        species_names: Vec<String>,
        molar_masses: Vec<f64>,
        diffusivity_callback: Box<dyn Fn(usize, &[f64], f64) -> f64 + Send + Sync>,
        external_temperature: Box<dyn Fn(f64) -> f64 + Send + Sync>,
        external_coefficients: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
        external_potential: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
    ) -> Self {
        let num_points = grid.interior.len();
        let mut delta_w = vec![0.0; num_points];
        let mut delta_e = vec![0.0; num_points];

        let delta = &grid.spacing[1..grid.spacing.len() - 1];

        delta_e[0] = delta[0] * grid.cell_sizes[0];
        delta_e[num_points - 1] = grid.cell_sizes[num_points - 1].powi(2) / 2.0;

        delta_w[0] = grid.cell_sizes[0].powi(2) / 2.0;
        delta_w[num_points - 1] = delta[num_points - 2] * grid.cell_sizes[num_points - 2];

        for i in 1..num_points - 1 {
            let l_i = grid.cell_sizes[i];
            delta_w[i] = l_i * delta[i - 1];
            delta_e[i] = l_i * delta[i];
        }

        let n_steps = time_steps.len();
        let num_species = species_names.len();

        let mut fields = Vec::with_capacity(num_species);
        let mut results = Vec::with_capacity(num_species);
        let mut concentrations_tmp = Vec::with_capacity(num_species);

        for s in 0..num_species {
            fields.push(DiffusionField1D::from_concentration(&y0[s]));
            concentrations_tmp.push(y0[s].clone());

            results.push(ElementResults {
                profile: vec![vec![0.0; num_points]; n_steps + 1],
                flux: vec![0.0; n_steps + 1],
                mass_intake: vec![0.0; n_steps + 1],
            });
        }

        Self {
            grid,
            fields,
            num_points,
            time_points,
            time_steps,
            max_nonlin_iter: 50,
            relaxation_factor: 0.75,
            absolute_tolerance: 1e-6,
            relative_tolerance: 1e-6,
            concentrations_tmp,
            delta_w,
            delta_e,
            species_names,
            molar_masses,
            results,
            diffusivity_callback,
            external_temperature,
            external_coefficients,
            external_potential,
        }
    }

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
        num_points: usize,
        delta_w: &[f64],
        delta_e: &[f64],
        relaxation_factor: f64,
        absolute_tolerance: f64,
        field: &mut DiffusionField1D,
        c_boundary: f64,
        boundary_diffusivity: f64,
        tau: f64,
        x_old: &mut [f64],
    ) -> (f64, f64) {
        let size = field.solver.problem.n;
        let mat = &mut field.solver.problem.matrix;

        let fo_b = fourier_number_delta_sq(boundary_diffusivity, tau, delta_w[0]);
        let fo_e = fourier_number_delta_sq(field.face_diffusivity[0], tau, delta_e[0]);

        mat.b[0] = 1.0 + 2.0 * fo_b + fo_e;
        mat.c[0] = -fo_e;

        field.solver.problem.d[0] = field.concentration[0] + 2.0 * fo_b * c_boundary;

        for i in 1..size - 1 {
            let d_w = field.face_diffusivity[i - 1];
            let d_e = field.face_diffusivity[i];

            let fo_w = fourier_number_delta_sq(d_w, tau, delta_w[i]);
            let fo_e = fourier_number_delta_sq(d_e, tau, delta_e[i]);

            mat.a[i] = -fo_w;
            mat.b[i] = 1.0 + fo_w + fo_e;
            mat.c[i] = -fo_e;
        }

        let n = size - 1;
        let fo_w = fourier_number_delta_sq(field.face_diffusivity[n - 1], tau, delta_e[n - 1]);

        mat.a[n] = -fo_w;
        mat.b[n] = 1.0 + fo_w;

        let x_new = field.solver.solve();
        let small = absolute_tolerance;
        let mut abs_change = 0.0;
        let mut rel_change = 0.0;

        for i in 0..num_points {
            let mut val_new = x_new[i];

            if relaxation_factor < 0.999 {
                let change_inc = relaxation_factor * (x_new[i] - x_old[i]);
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

        while !converged && iteration < self.max_nonlin_iter {
            let mut c0 = vec![0.0; num_species];

            for idx in 0..num_species {
                c0[idx] = self.concentrations_tmp[idx][0];
            }

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
                    self.num_points,
                    &self.delta_w,
                    &self.delta_e,
                    self.relaxation_factor,
                    self.absolute_tolerance,
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

    pub fn integrate(&mut self, every: usize) {
        self.store_state(0);

        let n_steps = self.time_steps.len();

        for i in 1..=n_steps {
            let t = self.time_points[i - 1];
            let tau = self.time_steps[i - 1];

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
                    "Step {:05}/{:05} (t = {:e} s) .. iters = {}, absErr = {:e}, relErr = {:e}",
                    i, n_steps, self.time_points[i], iteration, abs_err, rel_err
                );
            }
        }

        let mut sigma_f = 0.0;
        let tot_intake = self.get_total_mass_intake();

        if !tot_intake.is_empty() {
            sigma_f = *tot_intake.last().unwrap();
        }

        println!(
            "Integration complete, total mass intake: {:.1} g/m^2",
            sigma_f
        );
    }

    pub fn store_state(&mut self, idx: usize) {
        let num_species = self.fields.len();

        for s in 0..num_species {
            let mdot = -self.molar_masses[s] * self.fields[s].surface_flux;

            self.results[s].profile[idx] = self.fields[s].concentration.clone();
            self.results[s].flux[idx] = mdot;

            if idx == 0 {
                self.results[s].mass_intake[0] = 0.0;
            } else {
                let dt = self.time_steps[idx - 1];

                self.results[s].mass_intake[idx] = self.results[s].mass_intake[idx - 1]
                    + 0.5 * (self.results[s].flux[idx - 1] + self.results[s].flux[idx]) * dt;
            }
        }
    }

    pub fn get_total_mass_intake(&self) -> Vec<f64> {
        let num_steps = self.time_points.len();
        let mut total = vec![0.0; num_steps];

        for s in 0..self.fields.len() {
            for idx in 0..num_steps {
                total[idx] += self.results[s].mass_intake[idx];
            }
        }

        total
    }
}

pub struct CarbonitridingSolver {
    pub solver: NonlinearDiffusionSolver,
    pub fraction_converter: FractionConverter,
    pub interstitial_converter: InterstitialConverter,
}

impl CarbonitridingSolver {
    pub fn new(
        grid: ImmersedNodeDomain1D,
        y0_c: &[f64],
        y0_n: &[f64],
        time_points: Vec<f64>,
        time_steps: Vec<f64>,
        carbon_model: ArrheniusModifiedDiffusivity,
        nitrogen_model: ArrheniusModifiedDiffusivity,
        external_temperature: Box<dyn Fn(f64) -> f64 + Send + Sync>,
        external_coefficients: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
        external_potential: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
    ) -> Self {
        let num_points = grid.interior.len();

        let fraction_converter =
            FractionConverter::new(&["C".to_string(), "N".to_string(), "Fe".to_string()]).unwrap();

        let interstitial_converter = InterstitialConverter::new(0.055845, 7870.0);

        let mut c0_c = vec![0.0; num_points];
        let mut c0_n = vec![0.0; num_points];

        for i in 0..num_points {
            let y_c = y0_c[i];
            let y_n = y0_n[i];
            let y = vec![y_c, y_n, 1.0 - y_c - y_n];
            let x = fraction_converter.mass_to_mole_fraction(&y).unwrap();
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
                .unwrap();
            interstitial_converter_clone.mole_fraction_to_concentration(&x_all[0..2])
        });

        let y0 = vec![c0_c, c0_n];
        let species_names = vec!["Carbon".to_string(), "Nitrogen".to_string()];
        let molar_masses = vec![12.011, 14.007];

        let solver = NonlinearDiffusionSolver::new(
            grid,
            &y0,
            time_points,
            time_steps,
            species_names,
            molar_masses,
            diffusivity_callback,
            external_temperature,
            external_coefficients,
            external_potential_wrapper,
        );

        Self {
            solver,
            fraction_converter,
            interstitial_converter,
        }
    }

    pub fn integrate(&mut self, every: usize) {
        self.solver.integrate(every);
    }

    pub fn get_reinitialization(&self) -> (Vec<f64>, Vec<f64>) {
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
                .unwrap();

            yc_final.push(y[0]);
            yn_final.push(y[1]);
        }

        (yc_final, yn_final)
    }

    pub fn get_surface_fluxes(&self, idx: usize) -> (f64, f64) {
        let num_steps = self.solver.time_points.len();

        if idx >= num_steps {
            panic!("Out-of-bounds index {} for {} time points.", idx, num_steps);
        }

        (
            self.solver.results[0].flux[idx],
            self.solver.results[1].flux[idx],
        )
    }

    pub fn get_total_mass_intake(&self) -> Vec<f64> {
        self.solver.get_total_mass_intake()
    }
}

#[pyclass(name = "CarbonitridingSolver")]
pub struct CarbonitridingSolverPy {
    solver: CarbonitridingSolver,
}

#[pymethods]
impl CarbonitridingSolverPy {
    #[new]
    #[pyo3(signature = (
        grid,
        y0_c,
        y0_n,
        time_points,
        time_steps,
        carbon_model,
        nitrogen_model,
        external_temperature,
        external_coefficients,
        external_potential
    ))]
    pub fn new(
        py: Python<'_>,
        grid: ImmersedNodeDomain1D,
        y0_c: Vec<f64>,
        y0_n: Vec<f64>,
        time_points: Vec<f64>,
        time_steps: Vec<f64>,
        carbon_model: PyRef<'_, ArrheniusModifiedDiffusivity>,
        nitrogen_model: PyRef<'_, ArrheniusModifiedDiffusivity>,
        external_temperature: Bound<'_, PyAny>,
        external_coefficients: Bound<'_, PyAny>,
        external_potential: Bound<'_, PyAny>,
    ) -> Self {
        let temp_py = external_temperature.unbind();
        let temp_py_clone = temp_py.clone_ref(py);
        let external_temperature_rust = Box::new(move |t: f64| {
            let py = unsafe { Python::assume_attached() };
            let res = temp_py_clone.bind(py).call1((t,)).unwrap();
            res.extract::<f64>().unwrap()
        });

        let coef_py = external_coefficients.unbind();
        let coef_py_clone = coef_py.clone_ref(py);
        let external_coefficients_rust = Box::new(move |t: f64| {
            let py = unsafe { Python::assume_attached() };
            let res = coef_py_clone.bind(py).call1((t,)).unwrap();
            res.extract::<Vec<f64>>().unwrap()
        });

        let pot_py = external_potential.unbind();
        let pot_py_clone = pot_py.clone_ref(py);
        let external_potential_rust = Box::new(move |t: f64| {
            let py = unsafe { Python::assume_attached() };
            let res = pot_py_clone.bind(py).call1((t,)).unwrap();
            res.extract::<Vec<f64>>().unwrap()
        });

        let carbon_model_rust = ArrheniusModifiedDiffusivity {
            pre_exponential: crate::coefficients::PreExponentialFactor {
                callback: carbon_model
                    .pre_exponential
                    .callback
                    .as_ref()
                    .map(|cb| cb.clone_ref(py)),
                rust_callback: carbon_model.pre_exponential.rust_callback,
            },
            activation_energy: crate::coefficients::ActivationEnergy {
                callback: carbon_model
                    .activation_energy
                    .callback
                    .as_ref()
                    .map(|cb| cb.clone_ref(py)),
                rust_callback: carbon_model.activation_energy.rust_callback,
            },
        };

        let nitrogen_model_rust = ArrheniusModifiedDiffusivity {
            pre_exponential: crate::coefficients::PreExponentialFactor {
                callback: nitrogen_model
                    .pre_exponential
                    .callback
                    .as_ref()
                    .map(|cb| cb.clone_ref(py)),
                rust_callback: nitrogen_model.pre_exponential.rust_callback,
            },
            activation_energy: crate::coefficients::ActivationEnergy {
                callback: nitrogen_model
                    .activation_energy
                    .callback
                    .as_ref()
                    .map(|cb| cb.clone_ref(py)),
                rust_callback: nitrogen_model.activation_energy.rust_callback,
            },
        };

        let solver = CarbonitridingSolver::new(
            grid,
            &y0_c,
            &y0_n,
            time_points,
            time_steps,
            carbon_model_rust,
            nitrogen_model_rust,
            external_temperature_rust,
            external_coefficients_rust,
            external_potential_rust,
        );

        Self { solver }
    }

    #[pyo3(signature = (every=10))]
    pub fn integrate(&mut self, every: usize) {
        self.solver.integrate(every);
    }

    pub fn get_reinitialization(&self) -> (Vec<f64>, Vec<f64>) {
        self.solver.get_reinitialization()
    }

    pub fn get_surface_fluxes(&self, idx: usize) -> (f64, f64) {
        self.solver.get_surface_fluxes(idx)
    }

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

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_carbonitriding_solver() {
        let grid = ImmersedNodeDomain1D::linear(1e-3, 5, None);
        let y0_c = vec![0.001; 5];
        let y0_n = vec![0.0005; 5];
        let time_points = vec![0.0, 10.0];
        let time_steps = vec![10.0];

        let carbon_model =
            ArrheniusModifiedDiffusivity::from_rust_fns(|_x, _t| 1e-11, |_x, _t| 0.0);
        let nitrogen_model =
            ArrheniusModifiedDiffusivity::from_rust_fns(|_x, _t| 1e-12, |_x, _t| 0.0);

        let mut solver = CarbonitridingSolver::new(
            grid,
            &y0_c,
            &y0_n,
            time_points,
            time_steps,
            carbon_model,
            nitrogen_model,
            Box::new(|_t| 1000.0),
            Box::new(|_t| vec![1e-5, 1e-6]),
            Box::new(|_t| vec![0.002, 0.001]),
        );

        solver.integrate(1);

        assert_eq!(solver.solver.results[0].profile.len(), 2);
        assert_eq!(solver.solver.results[1].profile.len(), 2);
    }
}
