use majordome_numerical::utilities::geometric_space;
use majordome_numerical::utilities::linear_space;
use majordome_utilities::text::exponential_fmt;
use pyo3::prelude::*;

// ---------------------------------------------------------------------------

#[pyclass(from_py_object)]
pub struct ImmersedNodeDomain1D {
    pub cell_sizes: Vec<f64>,
    pub spacing: Vec<f64>,
    pub interior: Vec<f64>,
    pub west_boundary: f64,
    pub east_boundary: f64,
}

// ---------------------------------------------------------------------------

impl Clone for ImmersedNodeDomain1D {
    fn clone(&self) -> Self {
        Self {
            cell_sizes: self.cell_sizes.clone(),
            spacing: self.spacing.clone(),
            interior: self.interior.clone(),
            west_boundary: self.west_boundary,
            east_boundary: self.east_boundary,
        }
    }
}

impl std::fmt::Display for ImmersedNodeDomain1D {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let n_interior = self.interior.len();
        let n_total = n_interior + 2;

        let mut lines = vec![
            format!("Total points ....: {}", n_total),
            format!("West boundary ...: {}", exponential_fmt(self.west_boundary)),
            format!("East boundary ...: {}", exponential_fmt(self.east_boundary)),
            String::new(),
        ];

        for i in 0..n_interior {
            let zc = self.interior[i];
            let dz = self.cell_sizes[i];
            let z0 = zc - dz / 2.0;
            let z1 = zc + dz / 2.0;

            lines.push(format!(
                "Cell {:04} at {}, Size = {}, Range = [{}; {}]",
                i,
                exponential_fmt(zc),
                exponential_fmt(dz),
                exponential_fmt(z0),
                exponential_fmt(z1)
            ));
        }

        lines.push(String::new());

        let coordinates = self.to_array();

        for i in 1..n_total {
            let delta = self.spacing[i - 1];
            let z0 = coordinates[i - 1];
            let z1 = coordinates[i];

            lines.push(format!(
                "Spacing {:04} is {}, Range = [{}; {}]",
                i - 1,
                exponential_fmt(delta),
                exponential_fmt(z0),
                exponential_fmt(z1)
            ));
        }

        f.write_str(&lines.join("\n"))
    }
}

// ---------------------------------------------------------------------------

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

    fn linear(depth: f64, n: usize, shift: Option<f64>) -> Self {
        let shift = shift.unwrap_or(0.0);
        let zf = linear_space(shift, shift + depth, n + 1);
        Self::create_from_coordinates(&zf)
    }

    fn geometric(depth: f64, n: usize, d0: f64, d1: f64, shift: Option<f64>) -> Self {
        let shift = shift.unwrap_or(0.0);
        let zf = geometric_space(shift, shift + depth, n + 1, d0, d1);
        Self::create_from_coordinates(&zf)
    }

    fn to_array(&self) -> Vec<f64> {
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

    fn len(&self) -> usize {
        self.interior.len() + 2
    }
}

// ---------------------------------------------------------------------------

#[pymethods]
impl ImmersedNodeDomain1D {
    #[staticmethod]
    #[pyo3(name = "linear", signature = (depth, n, shift=None))]
    fn linear_py(depth: f64, n: usize, shift: Option<f64>) -> Self {
        Self::linear(depth, n, shift)
    }

    #[staticmethod]
    #[pyo3(name = "geometric", signature = (depth, n, d0, d1, shift=None))]
    fn geometric_py(depth: f64, n: usize, d0: f64, d1: f64, shift: Option<f64>) -> Self {
        Self::geometric(depth, n, d0, d1, shift)
    }
}

// ---------------------------------------------------------------------------

#[pymethods]
impl ImmersedNodeDomain1D {
    #[pyo3(name = "to_array")]
    fn to_array_py(&self) -> Vec<f64> {
        self.to_array()
    }

    #[getter]
    fn cell_sizes(&self) -> Vec<f64> {
        self.cell_sizes.clone()
    }

    #[getter]
    fn spacing(&self) -> Vec<f64> {
        self.spacing.clone()
    }

    #[getter]
    fn interior(&self) -> Vec<f64> {
        self.interior.clone()
    }

    #[getter]
    fn west_boundary(&self) -> f64 {
        self.west_boundary
    }

    #[getter]
    fn east_boundary(&self) -> f64 {
        self.east_boundary
    }
}

// ---------------------------------------------------------------------------

#[pymethods]
impl ImmersedNodeDomain1D {
    fn __str__(&self) -> String {
        self.to_string()
    }

    fn __len__(&self) -> usize {
        self.len()
    }
}

// ---------------------------------------------------------------------------
