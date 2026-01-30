use std::fs;
use pyo3::prelude::*;
use pyo3::types::{PyModule, PyList, PyTuple, PyDict, PyString};
use pyo3::exceptions::{PyIOError};
use crate::{print_header, print_success};
use crate::utils::types::variant_name_upper;

//////////////////////////////////////////////////////////////////////////////
// parse_cfg function
//
// Please notice that for quick debugging, here is the equivalent Python code:
// the goal of having a rust version is just to simplify project structure.
//
// def parse_su2_cfg(fname):
//     """ Parse a SU2 configuration file into a dictionary. """
//     from configparser import ConfigParser
//     parser = ConfigParser(comment_prefixes=("%",))
//
//     with open(fname) as fp:
//         parser.read_string("[root]\n" + fp.read())
//
//     return {k.upper(): v for k, v in dict(parser["root"]).items()}
//////////////////////////////////////////////////////////////////////////////

#[pyfunction]
pub fn parse_cfg(py: Python, fname: &str) -> PyResult<Py<PyAny>> {
    print_header!("Parsing SU2 CFG file: {fname}");

    let kwargs = {
        let comment = PyTuple::new(py, &[
            PyString::new(py, "%")
        ])?;

        let kwargs = PyDict::new(py);
        kwargs.set_item("comment_prefixes", comment)?;
        kwargs
    };

    let config_parser = {
        let configparser = PyModule::import(py, "configparser")?;
        configparser.getattr("ConfigParser")?.call((), Some(&kwargs))?
    };

    let data = {
        // Read the file content
        let data = fs::read_to_string(fname)
            .map_err(|e| PyIOError::new_err(e.to_string()))?;

        // ConfigParser needs a section header, so we add a dummy one
        let data = format!("[root]\n{}", data);

        // Convert to PyString before calling read_string
        PyString::new(py, &data)
    };

    let root = {
        // Read the configuration from the string and get root section
        config_parser.call_method1("read_string", (data,))?;
        config_parser.get_item("root")?
    };

    let builtins = PyModule::import(py, "builtins")?;
    let pylist = builtins.getattr("list")?;

    let data = root.call_method0("items")?;
    let data = pylist.call1((data,))?;
    let items = data.cast::<PyList>()?;

    // Build a new dict with uppercased keys
    let result = PyDict::new(py);

    for item in items.iter() {
        let tuple = item.cast::<PyTuple>()?;

        let k = tuple.get_item(0)?;
        let v = tuple.get_item(1)?;
        result.set_item(k.to_string().to_uppercase(), v)?;
    }

    Ok(result.into())
}

//////////////////////////////////////////////////////////////////////////////
// AsInput Trait
//////////////////////////////////////////////////////////////////////////////

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
