#![deny(clippy::unwrap_used)]
#![deny(clippy::expect_used)]
#![deny(clippy::panic)]
#![deny(unused_must_use)]
#![deny(warnings)]

use majordome_numerical::prelude::*;
use majordome_utilities::prelude::*;
use pyo3::prelude::*;

// ---------------------------------------------------------------------------

/// A 1D computational domain discretized using the Finite Volume Method (FVM)
/// with immersed boundary nodes at the extremes.
///
/// The domain is defined by cell center coordinates (nodes) where the boundary
/// nodes lie exactly on the boundaries (extremes). The cell faces are computed
/// by averaging the neighbor node coordinates, so that they fall exactly mid-
/// way between the nodes.
#[pyclass(from_py_object)]
#[derive(Debug)]
pub struct ImmersedNodeDomain1D {
    /// Sizes of each finite volume cell.
    pub cell_sizes: Vec<f64>,
    /// Spacing distances between adjacent nodes.
    pub spacing: Vec<f64>,
    /// Coordinates of the interior cell centers.
    pub interior: Vec<f64>,
    /// West (left) boundary coordinate.
    pub west_boundary: f64,
    /// East (right) boundary coordinate.
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

        let z = self.to_array();
        let mut zf = Vec::with_capacity(n_total - 1);

        for i in 0..n_total - 1 {
            zf.push((z[i] + z[i + 1]) / 2.0);
        }

        // West boundary cell
        let zc_west = z[0];
        let dz_west = self.cell_sizes[0];

        lines.push(format!(
            "Cell {:04} at {}, Size = {}, Range = [{}; {}]",
            0,
            exponential_fmt(zc_west),
            exponential_fmt(dz_west),
            exponential_fmt(zc_west),
            exponential_fmt(zf[0])
        ));

        // Interior cells
        for i in 0..n_interior {
            let zc = self.interior[i];
            let dz = self.cell_sizes[i + 1];
            let z0 = zf[i];
            let z1 = zf[i + 1];

            lines.push(format!(
                "Cell {:04} at {}, Size = {}, Range = [{}; {}]",
                i + 1,
                exponential_fmt(zc),
                exponential_fmt(dz),
                exponential_fmt(z0),
                exponential_fmt(z1)
            ));
        }

        // East boundary cell
        let zc_east = z[n_total - 1];
        let dz_east = self.cell_sizes[n_total - 1];

        lines.push(format!(
            "Cell {:04} at {}, Size = {}, Range = [{}; {}]",
            n_total - 1,
            exponential_fmt(zc_east),
            exponential_fmt(dz_east),
            exponential_fmt(zf[n_total - 2]),
            exponential_fmt(zc_east)
        ));
        lines.push(String::new());

        for i in 1..n_total {
            let delta = self.spacing[i - 1];
            let z0 = z[i - 1];
            let z1 = z[i];

            lines.push(format!(
                "Spacing {:04} is {}, Centers = [{}; {}]",
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

    /// Construct a 1D domain using node coordinates (cell centers including boundaries at the extremes).
    fn try_from(zc: &[f64]) -> Result<Self, Self::Error> {
        if zc.len() < 2 {
            return Err(format!(
                "Domain must contain at least 2 boundary coordinates (got {}).",
                zc.len()
            ));
        }
        let n = zc.len();

        let mut spacing = Vec::with_capacity(n - 1);
        let mut zf = Vec::with_capacity(n - 1);
        let mut dz = Vec::with_capacity(n);

        for i in 0..n - 1 {
            spacing.push(zc[i + 1] - zc[i]);
        }

        for i in 0..n - 1 {
            zf.push((zc[i] + zc[i + 1]) / 2.0);
        }

        dz.push(zf[0] - zc[0]);
        for i in 0..n - 2 {
            dz.push(zf[i + 1] - zf[i]);
        }
        dz.push(zc[n - 1] - zf[n - 2]);

        let interior = zc[1..n - 1].to_vec();
        let west_boundary = zc[0];
        let east_boundary = zc[n - 1];

        Ok(Self {
            cell_sizes: dz,
            spacing,
            interior,
            west_boundary,
            east_boundary,
        })
    }
}

// ---------------------------------------------------------------------------

impl ImmersedNodeDomain1D {
    /// Create a new 1D domain with uniform/linear spacing.
    ///
    /// Parameters
    /// ----------
    /// depth : float
    ///     The total depth/span of the domain.
    /// n : int
    ///     The total number of nodes (cells), including the boundaries.
    /// shift : float, optional
    ///     The starting offset/coordinate of the domain (defaults to 0.0).
    pub fn linear(depth: f64, n: usize, shift: Option<f64>) -> Result<Self, String> {
        let shift = shift.unwrap_or(0.0);
        let zc = linear_space(shift, shift + depth, n);
        Self::try_from(zc.as_slice())
    }

    /// Create a new 1D domain with geometric spacing.
    ///
    /// Parameters
    /// ----------
    /// depth : float
    ///     The total depth/span of the domain.
    /// n : int
    ///     The total number of nodes (cells), including the boundaries.
    /// d0 : float
    ///     The size of the first cell.
    /// d1 : float
    ///     The size of the last cell.
    /// shift : float, optional
    ///     The starting offset/coordinate of the domain (defaults to 0.0).
    pub fn geometric(
        depth: f64,
        n: usize,
        d0: f64,
        d1: f64,
        shift: Option<f64>,
    ) -> Result<Self, String> {
        let shift = shift.unwrap_or(0.0);
        let zc = geometric_space(shift, shift + depth, n, d0, d1)?;
        Self::try_from(zc.as_slice())
    }

    /// Return the full array of node coordinates, including boundaries.
    pub fn to_array(&self) -> Vec<f64> {
        let n_interior = self.interior.len();
        let n_total = n_interior + 2;

        let mut arr = vec![0.0; n_total];
        arr[0] = self.west_boundary;
        arr[n_total - 1] = self.east_boundary;
        arr[1..=n_interior].copy_from_slice(&self.interior);

        arr
    }

    /// Get the total number of points in the domain.
    pub fn len(&self) -> usize {
        self.interior.len() + 2
    }

    /// Check if the domain is empty.
    pub fn is_empty(&self) -> bool {
        self.len() == 0
    }
}

// ---------------------------------------------------------------------------

#[pymethods]
impl ImmersedNodeDomain1D {
    /// Create a new 1D computational domain with immersed boundary nodes.
    ///
    /// Parameters
    /// ----------
    /// depth : float
    ///     The total depth/span of the domain.
    /// n : int
    ///     The total number of nodes (cells), including the boundaries.
    /// shift : float, optional
    ///     The starting offset/coordinate of the domain (defaults to 0.0).
    /// first_size : float, optional
    ///     The spacing between the first two nodes (must be provided with
    ///     last_size for geometric spacing).
    /// last_size : float, optional
    ///     The spacing between the last two nodes (must be provided with
    ///     first_size for geometric spacing).
    #[new]
    #[pyo3(signature = (
        depth,
        n,
        *,
        shift=None,
        first_size=None,
        last_size=None,
    ))]
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
    /// Return the full array of node coordinates.
    #[pyo3(name = "to_array")]
    fn to_array_py(&self) -> Vec<f64> {
        self.to_array()
    }

    /// Sizes of each finite volume cell.
    #[getter]
    fn cell_sizes(&self) -> &[f64] {
        &self.cell_sizes
    }

    /// Spacing distances between adjacent nodes.
    #[getter]
    fn spacing(&self) -> &[f64] {
        &self.spacing
    }

    /// Coordinates of the interior cell centers.
    #[getter]
    fn interior(&self) -> &[f64] {
        &self.interior
    }

    /// West (left) boundary coordinate.
    #[getter]
    fn west_boundary(&self) -> f64 {
        self.west_boundary
    }

    /// East (right) boundary coordinate.
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
