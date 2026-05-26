use majordome_numerical::linear_algebra::TridiagonalSolverNonDestroying;
use majordome_numerical::utilities::{geometric_space, linear_space};
use pyo3::prelude::*;

#[pyclass]
#[derive(Debug, Clone)]
pub struct ImmersedNodeDomain1D {
    pub cell_sizes: Vec<f64>,
    pub spacing: Vec<f64>,
    pub interior: Vec<f64>,
    pub west_boundary: f64,
    pub east_boundary: f64,
}

#[pymethods]
impl ImmersedNodeDomain1D {
    #[staticmethod]
    #[pyo3(signature = (depth, n, shift=None))]
    pub fn linear(depth: f64, n: usize, shift: Option<f64>) -> Self {
        let shift = shift.unwrap_or(0.0);
        let zf = linear_space(shift, shift + depth, n + 1);

        Self::create_from_coordinates(&zf)
    }

    #[staticmethod]
    #[pyo3(signature = (depth, n, d0, d1, shift=None))]
    pub fn geometric(depth: f64, n: usize, d0: f64, d1: f64, shift: Option<f64>) -> Self {
        let shift = shift.unwrap_or(0.0);
        let zf = geometric_space(shift, shift + depth, n + 1, d0, d1);

        Self::create_from_coordinates(&zf)
    }

    pub fn to_array(&self) -> Vec<f64> {
        let n_interior = self.interior.len();
        let n_total = n_interior + 2;
        let mut arr = vec![0.0; n_total];

        arr[0] = self.west_boundary;
        arr[n_total - 1] = self.east_boundary;

        for i in 1..=n_interior {
            arr[i] = self.interior[i - 1];
        }

        arr
    }

    pub fn print_info(&self) -> String {
        let n_interior = self.interior.len();
        let n_total = n_interior + 2;

        let mut lines = vec![
            format!("Total points ....: {}", n_total),
            format!("West boundary ...: {:e}", self.west_boundary),
            format!("East boundary ...: {:e}", self.east_boundary),
            String::new(),
        ];

        for i in 0..n_interior {
            let zc = self.interior[i];
            let dz = self.cell_sizes[i];
            let z0 = zc - dz / 2.0;
            let z1 = zc + dz / 2.0;

            lines.push(format!(
                "Cell {:04} at {:e}, Size = {:e}, Range = [{:e}; {:e}]",
                i, zc, dz, z0, z1
            ));
        }

        lines.push(String::new());

        let coordinates = self.to_array();

        for i in 1..n_total {
            let delta = self.spacing[i - 1];
            let z0 = coordinates[i - 1];
            let z1 = coordinates[i];

            lines.push(format!(
                "Spacing {:04} is {:e}, Range = [{:e}; {:e}]",
                i - 1,
                delta,
                z0,
                z1
            ));
        }

        lines.join("\n")
    }

    #[getter]
    pub fn cell_sizes(&self) -> Vec<f64> {
        self.cell_sizes.clone()
    }

    #[getter]
    pub fn spacing(&self) -> Vec<f64> {
        self.spacing.clone()
    }

    #[getter]
    pub fn interior(&self) -> Vec<f64> {
        self.interior.clone()
    }

    #[getter]
    pub fn west_boundary(&self) -> f64 {
        self.west_boundary
    }

    #[getter]
    pub fn east_boundary(&self) -> f64 {
        self.east_boundary
    }
}

impl ImmersedNodeDomain1D {
    fn create_from_coordinates(zf: &[f64]) -> Self {
        let mut dz = Vec::with_capacity(zf.len() - 1);
        let mut zc = Vec::with_capacity(zf.len() - 1);

        for i in 0..zf.len() - 1 {
            dz.push(zf[i + 1] - zf[i]);
            zc.push((zf[i] + zf[i + 1]) / 2.0);
        }

        let mut dc = Vec::with_capacity(zc.len() - 1);

        for i in 0..zc.len() - 1 {
            dc.push(zc[i + 1] - zc[i]);
        }

        let half_west = zc[0] - zf[0];
        let half_east = zf.last().unwrap() - zc.last().unwrap();

        let mut spacing = Vec::with_capacity(dc.len() + 2);
        spacing.push(half_west);
        spacing.extend_from_slice(&dc);
        spacing.push(half_east);

        Self {
            cell_sizes: dz,
            spacing,
            interior: zc,
            west_boundary: zf[0],
            east_boundary: *zf.last().unwrap(),
        }
    }
}

pub struct DiffusionField1D {
    pub solver: TridiagonalSolverNonDestroying,
    pub diffusivity: Vec<f64>,
    pub concentration: Vec<f64>,
    pub face_diffusivity: Vec<f64>,
    pub surface_flux: f64,
}

impl DiffusionField1D {
    pub fn new(num_points: usize) -> Self {
        Self {
            solver: TridiagonalSolverNonDestroying::new(num_points),
            diffusivity: vec![0.0; num_points],
            concentration: vec![0.0; num_points],
            face_diffusivity: vec![0.0; num_points.saturating_sub(1)],
            surface_flux: 0.0,
        }
    }

    pub fn from_concentration(concentration: &[f64]) -> Self {
        let num_points = concentration.len();

        Self {
            solver: TridiagonalSolverNonDestroying::new(num_points),
            diffusivity: vec![0.0; num_points],
            concentration: concentration.to_vec(),
            face_diffusivity: vec![0.0; num_points.saturating_sub(1)],
            surface_flux: 0.0,
        }
    }
}

#[derive(Debug, Clone)]
pub struct NumericalOptions {
    pub relaxation: f64,
    pub max_nonlin_iter: usize,
    pub relative_tolerance: f64,
    pub absolute_tolerance: f64,
}

impl Default for NumericalOptions {
    fn default() -> Self {
        Self {
            relaxation: 0.75,
            max_nonlin_iter: 50,
            relative_tolerance: 1e-06,
            absolute_tolerance: 1e-10,
        }
    }
}

pub fn fourier_number_delta_sq(d: f64, t: f64, l2: f64) -> f64 {
    d * t / l2
}

pub fn fourier_number(d: f64, t: f64, l1: f64) -> f64 {
    d * t / (l1 * l1)
}

pub fn sherwood_number(h: f64, l: f64, d: f64) -> f64 {
    h * l / d
}
