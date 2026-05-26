use crate::core::get_atomic_weight;
use std::fmt;

// ---------------------------------------------------------------------------

#[derive(Debug)]
pub enum MixtureError {
    InvalidCompositionLength { expected: usize, found: usize },
    UnknownElement(String),
}

impl fmt::Display for MixtureError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            MixtureError::InvalidCompositionLength { expected, found } => {
                write!(
                    f,
                    "Invalid composition length: expected {}, found {}",
                    expected, found
                )
            }
            MixtureError::UnknownElement(el) => write!(f, "Unknown element: {}", el),
        }
    }
}

impl std::error::Error for MixtureError {}

// ---------------------------------------------------------------------------

pub struct FractionConverter {
    molar_masses: Vec<f64>,
}

impl FractionConverter {
    pub fn new(elements: &[String]) -> Result<Self, MixtureError> {
        let mut molar_masses = Vec::with_capacity(elements.len());

        for el in elements {
            if let Some(mass) = get_atomic_weight(el) {
                molar_masses.push(mass);
            } else {
                return Err(MixtureError::UnknownElement(el.clone()));
            }
        }
        Ok(Self { molar_masses })
    }

    fn validate(&self, comp: &[f64]) -> Result<(), MixtureError> {
        if comp.len() != self.molar_masses.len() {
            Err(MixtureError::InvalidCompositionLength {
                expected: self.molar_masses.len(),
                found: comp.len(),
            })
        } else {
            Ok(())
        }
    }

    fn mean_molar_mass_from_mass(&self, y: &[f64]) -> f64 {
        let sum: f64 = y
            .iter()
            .zip(&self.molar_masses)
            .map(|(yk, wk)| yk / wk)
            .sum();

        1.0 / sum
    }

    fn mean_molar_mass_from_mole(&self, x: &[f64]) -> f64 {
        let sum: f64 = x
            .iter()
            .zip(&self.molar_masses)
            .map(|(xk, wk)| xk * wk)
            .sum();

        sum
    }

    pub fn mass_to_mole_fraction(&self, y: &[f64]) -> Result<Vec<f64>, MixtureError> {
        self.validate(y)?;
        let m = self.mean_molar_mass_from_mass(y);

        Ok(y.iter()
            .zip(&self.molar_masses)
            .map(|(yk, wk)| m * yk / wk)
            .collect())
    }

    pub fn mole_to_mass_fraction(&self, x: &[f64]) -> Result<Vec<f64>, MixtureError> {
        self.validate(x)?;
        let m = self.mean_molar_mass_from_mole(x);

        Ok(x.iter()
            .zip(&self.molar_masses)
            .map(|(xk, wk)| xk * wk / m)
            .collect())
    }
}

// ---------------------------------------------------------------------------

pub struct InterstitialConverter {
    pub matrix_mean_molar_mass: f64,
    pub matrix_free_density: f64,
}

impl InterstitialConverter {
    pub fn new(matrix_mean_molar_mass: f64, matrix_free_density: f64) -> Self {
        Self {
            matrix_mean_molar_mass,
            matrix_free_density,
        }
    }

    pub fn mole_fraction_to_concentration(&self, x: &[f64]) -> Vec<f64> {
        let sum_x: f64 = x.iter().sum();
        let matrix_mole_fraction = 1.0 - sum_x;
        let matrix_concentration =
            self.matrix_free_density / (matrix_mole_fraction * self.matrix_mean_molar_mass);

        x.iter().map(|xi| xi * matrix_concentration).collect()
    }

    pub fn concentration_to_mole_fraction(&self, c: &[f64]) -> Vec<f64> {
        let matrix_concentration = self.matrix_free_density / self.matrix_mean_molar_mass;
        let sum_c: f64 = c.iter().sum();
        let total_concentration = sum_c + matrix_concentration;

        c.iter().map(|ci| ci / total_concentration).collect()
    }
}
