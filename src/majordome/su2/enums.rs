use pyo3::prelude::*;

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

#[pyclass]
#[derive(Debug)]
pub enum InletType {
    TotalConditionsInlet(String),
    MassFlowInlet(String),
    IncVelocityInlet(String),
    IncPressureInlet(String),
    TurbulentSAInlet(String),
    SuperSonicInlet(String),
}
