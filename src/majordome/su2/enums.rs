use pyo3::prelude::*;
use crate::utils::types::variant_name_upper;

pub trait AsInput {
    fn type_name() -> &'static str;

    fn to_name(&self) -> String;

    fn to_value(&self) -> String;

    fn to_input(&self) -> String;
}

//////////////////////////////////////////////////////////////////////////////
// DirectionType
//////////////////////////////////////////////////////////////////////////////

#[pyclass]
#[derive(Debug, Clone)]
pub struct DirectionType(pub f64, pub f64, pub f64);

impl std::fmt::Display for DirectionType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}, {}, {}", self.0, self.1, self.2)
    }
}

#[pymethods]
impl DirectionType {
    #[new]
    pub fn new(x: f64, y: f64, z: f64) -> Self {
        let absv = (x*x + y*y + z*z).sqrt();
        DirectionType(x / absv, y / absv, z / absv)
    }

    fn __str__(&self) -> String {
        self.to_string()
    }
}

//////////////////////////////////////////////////////////////////////////////
// VelocityType
//////////////////////////////////////////////////////////////////////////////

#[pyclass]
#[derive(Debug, Clone)]
pub struct VelocityType(pub f64, pub f64, pub f64);

impl std::fmt::Display for VelocityType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}, {}, {}", self.0, self.1, self.2)
    }
}

#[pymethods]
impl VelocityType {
    #[new]
    pub fn new(x: f64, y: f64, z: f64) -> Self {
        VelocityType(x, y, z)
    }

    fn __str__(&self) -> String {
        self.to_string()
    }
}

//////////////////////////////////////////////////////////////////////////////
// SolverType
//////////////////////////////////////////////////////////////////////////////

#[pyclass]
#[derive(Debug)]
pub enum SolverType {
    Euler,
    NavierStokes,
    Rans,
    IncEuler,
    IncNavierStokes,
    IncRans,
    NemoEuler,
    NemoNavierStokes,
    FemEuler,
    FemNavierStokes,
    FemRans,
    FemLes,
    HeatEquationFvm,
    Elasticity
}

#[pymethods]
impl SolverType {
    #[staticmethod]
    fn type_name() -> &'static str {
        <Self as AsInput>::type_name()
    }

    fn to_name(&self) -> String {
        AsInput::to_name(self)
    }

    fn to_input(&self) -> String {
        AsInput::to_input(self)
    }

    fn __str__(&self) -> String {
        self.to_name()
    }
}

impl std::fmt::Display for SolverType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.to_name())
    }
}

impl AsInput for SolverType {
    fn type_name() -> &'static str { "SOLVER" }

    fn to_name(&self) -> String {
        variant_name_upper(&self)
    }

    fn to_input(&self) -> String {
        format!("{}= {}", Self::type_name(), self.to_name())
    }

    fn to_value(&self) -> String {
        self.to_name()
    }
}

//////////////////////////////////////////////////////////////////////////////
// InletType
//////////////////////////////////////////////////////////////////////////////

// pub struct InletTupleA {
//     pub marker: String,
//     pub t: f64,
//     pub p: f64,
//     pub u: VelocityType,
// }

// pub struct InletTupleB {
//     pub marker: String,
//     pub t: f64,
//     pub p: f64,
//     pub u: f64,
//     pub dir: DirectionType,
// }


#[pyclass]
#[derive(Debug)]
pub enum InletType {
    TotalConditionsInlet(String),
    MassFlowInlet(String),
    IncVelocityInlet(String),
    IncPressureInlet(String),
    SupersonicInlet(String, f64, f64, VelocityType),
    // TurbulentSAInlet(String),
}

#[pymethods]
impl InletType {
   #[staticmethod]
    fn type_name() -> &'static str {
        <Self as AsInput>::type_name()
    }

    fn to_name(&self) -> String {
        AsInput::to_name(self)
    }

    fn to_input(&self) -> String {
        AsInput::to_input(self)
    }

    fn __str__(&self) -> String {
        self.to_name()
    }
}

impl AsInput for InletType {
    fn type_name() -> &'static str { "INLET_TYPE" }

    fn to_name(&self) -> String {
        match self {
            Self::TotalConditionsInlet(..) => "TOTAL_CONDITIONS",
            Self::MassFlowInlet(..)        => "MASS_FLOW",
            Self::IncVelocityInlet(..)     => "VELOCITY",
            Self::IncPressureInlet(..)     => "PRESSURE_INLET",
            Self::SupersonicInlet(..)      => "MARKER_SUPERSONIC_INLET"
            // Self::TurbulentSAInlet(..)     => "TURBULENT_SA_INLET",
        }.to_string()
    }

    fn to_value(&self) -> String {
        match self {
            Self::TotalConditionsInlet(marker)
                => marker.clone(),
            Self::MassFlowInlet(marker)
                => marker.clone(),
            Self::IncVelocityInlet(marker)
                => marker.clone(),
            Self::IncPressureInlet(marker)
                => marker.clone(),
            Self::SupersonicInlet(marker, t, p, u)
                => format!("( {}, {}, {}, {} )", marker, t, p, u)
            // Self::TurbulentSAInlet(marker)
            //     => marker.clone(),
        }
    }

    fn to_input(&self) -> String {
        match self {
            Self::SupersonicInlet(..) => {
                format!("{}= {}", self.to_name(), self.to_value())
            },

            _ => {
                format!("\
                    {}= {}

                    MARKER_INLET= {}",
                    Self::type_name(), self.to_name(), self.to_value())
            }
        }
    }
}
