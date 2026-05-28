use majordome_numerical::prelude::*;

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
