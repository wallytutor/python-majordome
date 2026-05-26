use crate::coefficients::ArrheniusModifiedDiffusivity;
use crate::fvm::DiffusionField1D;
use crate::fvm::ImmersedNodeDomain1D;
use crate::fvm::fourier_number_delta_sq;
use crate::fvm::sherwood_number;
use majordome_calphad::mixture::FractionConverter;
use majordome_calphad::mixture::InterstitialConverter;
use majordome_numerical::linear_algebra::TridiagonalSolver;
use pyo3::prelude::*;

struct SurfaceBoundaryState {
    carbon_boundary: f64,
    nitrogen_boundary: f64,
    carbon_diffusivity: f64,
    nitrogen_diffusivity: f64,
    carbon_flux: f64,
    nitrogen_flux: f64,
}

pub struct CarbonitridingSolver {
    pub grid: ImmersedNodeDomain1D,
    pub carbon_field: DiffusionField1D,
    pub nitrogen_field: DiffusionField1D,
    pub num_points: usize,
    pub time_points: Vec<f64>,
    pub time_steps: Vec<f64>,

    pub max_nonlin_iter: usize,
    pub relaxation_factor: f64,
    pub absolute_tolerance: f64,
    pub relative_tolerance: f64,

    pub xc_tmp: Vec<f64>,
    pub xn_tmp: Vec<f64>,

    pub delta_w: Vec<f64>,
    pub delta_e: Vec<f64>,

    pub carbon_model: ArrheniusModifiedDiffusivity,
    pub nitrogen_model: ArrheniusModifiedDiffusivity,

    pub xc_results: Vec<Vec<f64>>,
    pub xn_results: Vec<Vec<f64>>,
    pub qc_results: Vec<f64>,
    pub qn_results: Vec<f64>,
    pub mass_intake: Vec<f64>,

    pub fraction_converter: FractionConverter,
    pub interstitial_converter: InterstitialConverter,

    pub external_temperature: Box<dyn Fn(f64) -> f64 + Send + Sync>,
    pub external_coefficients: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
    pub external_potential: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync>,
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

        let fraction_converter =
            FractionConverter::new(&["C".to_string(), "N".to_string(), "Fe".to_string()]).unwrap();

        let interstitial_converter = InterstitialConverter::new(0.055845, 7870.0);

        // Convert initial mass fractions to concentrations
        let mut c0 = vec![0.0; num_points];
        let mut n0 = vec![0.0; num_points];

        for i in 0..num_points {
            let y_c = y0_c[i];
            let y_n = y0_n[i];
            let y = vec![y_c, y_n, 1.0 - y_c - y_n];
            let x = fraction_converter.mass_to_mole_fraction(&y).unwrap();
            let c = interstitial_converter.mole_fraction_to_concentration(&x[0..2]);
            c0[i] = c[0];
            n0[i] = c[1];
        }

        Self {
            grid,
            carbon_field: DiffusionField1D::from_concentration(&c0),
            nitrogen_field: DiffusionField1D::from_concentration(&n0),
            num_points,
            time_points,
            time_steps,
            max_nonlin_iter: 50,
            relaxation_factor: 0.75,
            absolute_tolerance: 1e-6,
            relative_tolerance: 1e-6,
            xc_tmp: c0,
            xn_tmp: n0,
            delta_w,
            delta_e,
            carbon_model,
            nitrogen_model,
            xc_results: vec![vec![0.0; num_points]; n_steps + 1],
            xn_results: vec![vec![0.0; num_points]; n_steps + 1],
            qc_results: vec![0.0; n_steps + 1],
            qn_results: vec![0.0; n_steps + 1],
            mass_intake: vec![0.0; n_steps + 1],
            fraction_converter,
            interstitial_converter,
            external_temperature,
            external_coefficients,
            external_potential,
        }
    }

    fn evaluate_diffusivity_at_concentration(
        &self,
        model: &ArrheniusModifiedDiffusivity,
        cc: f64,
        cn: f64,
        temp: f64,
    ) -> f64 {
        let x = self
            .interstitial_converter
            .concentration_to_mole_fraction(&[cc, cn]);
        model.evaluate(&x, temp)
    }

    fn solve_surface_boundary_state(
        &self,
        _tnow: f64,
        xc0: f64,
        xn0: f64,
        temp: f64,
        h_inf: &[f64],
        x_inf: &[f64],
    ) -> SurfaceBoundaryState {
        let dl0 = self.grid.spacing[0];
        let tol = self.absolute_tolerance;

        let mut xc_boundary = xc0;
        let mut xn_boundary = xn0;

        let mut carbon_diffusivity;
        let mut nitrogen_diffusivity;

        let mut delta_boundary = f64::INFINITY;
        let mut iteration = 0;

        while delta_boundary > tol && iteration < self.max_nonlin_iter {
            carbon_diffusivity = self.evaluate_diffusivity_at_concentration(
                &self.carbon_model,
                xc_boundary,
                xn_boundary,
                temp,
            );
            nitrogen_diffusivity = self.evaluate_diffusivity_at_concentration(
                &self.nitrogen_model,
                xc_boundary,
                xn_boundary,
                temp,
            );

            let sh_carbon = sherwood_number(h_inf[0], dl0, carbon_diffusivity);
            let sh_nitrogen = sherwood_number(h_inf[1], dl0, nitrogen_diffusivity);

            let xc_new = (xc0 + sh_carbon * x_inf[0]) / (1.0 + sh_carbon);
            let xn_new = (xn0 + sh_nitrogen * x_inf[1]) / (1.0 + sh_nitrogen);

            let change_c = (xc_new - xc_boundary).abs();
            let change_n = (xn_new - xn_boundary).abs();

            delta_boundary = change_c.max(change_n);
            xc_boundary = xc_new;
            xn_boundary = xn_new;
            iteration += 1;
        }

        carbon_diffusivity = self.evaluate_diffusivity_at_concentration(
            &self.carbon_model,
            xc_boundary,
            xn_boundary,
            temp,
        );

        nitrogen_diffusivity = self.evaluate_diffusivity_at_concentration(
            &self.nitrogen_model,
            xc_boundary,
            xn_boundary,
            temp,
        );

        SurfaceBoundaryState {
            carbon_boundary: xc_boundary,
            nitrogen_boundary: xn_boundary,
            carbon_diffusivity,
            nitrogen_diffusivity,
            carbon_flux: h_inf[0] * (xc_boundary - x_inf[0]),
            nitrogen_flux: h_inf[1] * (xn_boundary - x_inf[1]),
        }
    }

    fn update_diffusivities(
        num_points: usize,
        spacing: &[f64],
        x_c: &[f64],
        x_n: &[f64],
        model: &ArrheniusModifiedDiffusivity,
        field: &mut DiffusionField1D,
        temp: f64,
    ) {
        for i in 0..num_points {
            field.diffusivity[i] = model.evaluate(&[x_c[i], x_n[i]], temp);

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
        let y_inf = (self.external_potential)(tnow);
        let h_inf = (self.external_coefficients)(tnow);

        // Convert environment potential mass fractions [yc, yn] to concentrations
        let y_all = vec![y_inf[0], y_inf[1], 1.0 - y_inf[0] - y_inf[1]];
        let x_all = self
            .fraction_converter
            .mass_to_mole_fraction(&y_all)
            .unwrap();
        let x_inf = self
            .interstitial_converter
            .mole_fraction_to_concentration(&x_all[0..2]);

        let mut converged = false;
        let mut iteration = 0;
        let mut abs_err = f64::NEG_INFINITY;
        let mut rel_err = f64::NEG_INFINITY;

        while !converged && iteration < self.max_nonlin_iter {
            let x_c_n: Vec<(f64, f64)> = self
                .xc_tmp
                .iter()
                .zip(&self.xn_tmp)
                .map(|(&c, &n)| {
                    let x = self
                        .interstitial_converter
                        .concentration_to_mole_fraction(&[c, n]);
                    (x[0], x[1])
                })
                .collect();

            let x_c: Vec<f64> = x_c_n.iter().map(|pair| pair.0).collect();
            let x_n: Vec<f64> = x_c_n.iter().map(|pair| pair.1).collect();

            let b_state = self.solve_surface_boundary_state(
                tnow,
                self.xc_tmp[0],
                self.xn_tmp[0],
                temp,
                &h_inf,
                &x_inf,
            );

            self.carbon_field.surface_flux = b_state.carbon_flux;
            self.nitrogen_field.surface_flux = b_state.nitrogen_flux;

            Self::update_diffusivities(
                self.num_points,
                &self.grid.spacing,
                &x_c,
                &x_n,
                &self.carbon_model,
                &mut self.carbon_field,
                temp,
            );

            let (abs_c, rel_c) = Self::update_field_fvm(
                self.num_points,
                &self.delta_w,
                &self.delta_e,
                self.relaxation_factor,
                self.absolute_tolerance,
                &mut self.carbon_field,
                b_state.carbon_boundary,
                b_state.carbon_diffusivity,
                tau,
                &mut self.xc_tmp,
            );

            Self::update_diffusivities(
                self.num_points,
                &self.grid.spacing,
                &x_c,
                &x_n,
                &self.nitrogen_model,
                &mut self.nitrogen_field,
                temp,
            );

            let (abs_n, rel_n) = Self::update_field_fvm(
                self.num_points,
                &self.delta_w,
                &self.delta_e,
                self.relaxation_factor,
                self.absolute_tolerance,
                &mut self.nitrogen_field,
                b_state.nitrogen_boundary,
                b_state.nitrogen_diffusivity,
                tau,
                &mut self.xn_tmp,
            );

            abs_err = abs_c.max(abs_n);
            rel_err = rel_c.max(rel_n);
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

            for j in 0..self.num_points {
                self.xc_tmp[j] = self.carbon_field.concentration[j];
                self.xn_tmp[j] = self.nitrogen_field.concentration[j];

                self.carbon_field.solver.problem.d[j] = self.xc_tmp[j];
                self.nitrogen_field.solver.problem.d[j] = self.xn_tmp[j];
            }

            let (iteration, abs_err, rel_err, converged) = self.outer_loop(t, tau);

            for j in 0..self.num_points {
                self.carbon_field.concentration[j] = self.xc_tmp[j];
                self.nitrogen_field.concentration[j] = self.xn_tmp[j];
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

        for i in 1..self.mass_intake.len() {
            let dm = 0.5 * (self.mass_intake[i - 1] + self.mass_intake[i]);
            sigma_f += dm * self.time_steps[i - 1];
        }

        println!(
            "Integration complete, total mass intake: {:.1} g/m^2",
            sigma_f
        );
    }

    pub fn store_state(&mut self, idx: usize) {
        let molar_mass_c = 12.011;
        let molar_mass_n = 14.007;

        let mdot_c = -molar_mass_c * self.carbon_field.surface_flux;
        let mdot_n = -molar_mass_n * self.nitrogen_field.surface_flux;

        self.xc_results[idx] = self.carbon_field.concentration.clone();
        self.xn_results[idx] = self.nitrogen_field.concentration.clone();

        self.qc_results[idx] = mdot_c;
        self.qn_results[idx] = mdot_n;

        self.mass_intake[idx] = mdot_c + mdot_n;
    }

    pub fn get_reinitialization(&self) -> (Vec<f64>, Vec<f64>) {
        let xc_final = &self.carbon_field.concentration;
        let xn_final = &self.nitrogen_field.concentration;

        let mut yc_final = Vec::with_capacity(self.num_points);
        let mut yn_final = Vec::with_capacity(self.num_points);

        for i in 0..self.num_points {
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
        let num_steps = self.time_points.len();

        if idx >= num_steps {
            panic!("Out-of-bounds index {} for {} time points.", idx, num_steps);
        }

        (self.qc_results[idx], self.qn_results[idx])
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
    pub fn xc_results(&self) -> Vec<Vec<f64>> {
        self.solver.xc_results.clone()
    }

    #[getter]
    pub fn xn_results(&self) -> Vec<Vec<f64>> {
        self.solver.xn_results.clone()
    }

    #[getter]
    pub fn qc_results(&self) -> Vec<f64> {
        self.solver.qc_results.clone()
    }

    #[getter]
    pub fn qn_results(&self) -> Vec<f64> {
        self.solver.qn_results.clone()
    }

    #[getter]
    pub fn mass_intake(&self) -> Vec<f64> {
        self.solver.mass_intake.clone()
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

        assert_eq!(solver.xc_results.len(), 2);
        assert_eq!(solver.xn_results.len(), 2);
    }
}
