#![deny(clippy::unwrap_used)]
#![deny(clippy::expect_used)]
#![deny(clippy::panic)]
#![deny(unused_must_use)]
#![deny(warnings)]

use majordome_numerical::prelude::*;
use majordome_utilities::prelude::*;
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

impl TryFrom<&[f64]> for ImmersedNodeDomain1D {
    type Error = String;

    fn try_from(zf: &[f64]) -> Result<Self, Self::Error> {
        if zf.len() < 2 {
            return Err(format!(
                "Domain must contain at least 2 boundary coordinates (got {}).",
                zf.len()
            ));
        }
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
        let zf_last = zf.last().copied().unwrap_or(0.0);
        let zc_last = zc.last().copied().unwrap_or(0.0);
        let half_east = zf_last - zc_last;

        let mut spacing = Vec::with_capacity(dc.len() + 2);
        spacing.push(half_west);
        spacing.extend_from_slice(&dc);
        spacing.push(half_east);

        Ok(Self {
            cell_sizes: dz,
            spacing,
            interior: zc,
            west_boundary: zf[0],
            east_boundary: zf_last,
        })
    }
}

// ---------------------------------------------------------------------------

impl ImmersedNodeDomain1D {
    pub fn linear(depth: f64, n: usize, shift: Option<f64>) -> Result<Self, String> {
        let shift = shift.unwrap_or(0.0);
        let zf = linear_space(shift, shift + depth, n + 1);
        Self::try_from(zf.as_slice())
    }

    pub fn geometric(
        depth: f64,
        n: usize,
        d0: f64,
        d1: f64,
        shift: Option<f64>,
    ) -> Result<Self, String> {
        let shift = shift.unwrap_or(0.0);
        let zf = geometric_space(shift, shift + depth, n + 1, d0, d1)?;
        Self::try_from(zf.as_slice())
    }

    pub fn to_array(&self) -> Vec<f64> {
        let n_interior = self.interior.len();
        let n_total = n_interior + 2;

        let mut arr = vec![0.0; n_total];
        arr[0] = self.west_boundary;
        arr[n_total - 1] = self.east_boundary;
        arr[1..=n_interior].copy_from_slice(&self.interior);

        arr
    }

    pub fn len(&self) -> usize {
        self.interior.len() + 2
    }
}

// ---------------------------------------------------------------------------

#[pymethods]
impl ImmersedNodeDomain1D {
    #[new]
    #[pyo3(signature = (depth, n, *, shift=None, first_size=None, last_size=None))]
    fn new_py(
        depth: f64,
        n: usize,
        shift: Option<f64>,
        first_size: Option<f64>,
        last_size: Option<f64>,
    ) -> PyResult<Self> {
        let res = match (first_size, last_size) {
            (Some(d0), Some(d1)) => Self::geometric(depth, n, d0, d1, shift),
            (None, None) => Self::linear(depth, n, shift),
            _ => {
                majordome_utilities::print_warning!(
                    "Both first_size and last_size must be provided together. \
                     Falling back to linear as default."
                );
                Self::linear(depth, n, shift)
            }
        };

        res.map_err(pyo3::exceptions::PyValueError::new_err)
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
    fn cell_sizes(&self) -> &[f64] {
        &self.cell_sizes
    }

    #[getter]
    fn spacing(&self) -> &[f64] {
        &self.spacing
    }

    #[getter]
    fn interior(&self) -> &[f64] {
        &self.interior
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
