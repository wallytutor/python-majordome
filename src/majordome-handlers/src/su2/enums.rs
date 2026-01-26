use pyo3::prelude::*;

#[pyclass]
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
