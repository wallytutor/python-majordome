use super::enums::SolverType;

pub trait SU2InputEntry {
    fn to_su2_input(&self) -> String;
}

impl std::fmt::Display for SolverType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SolverType::Euler
                => write!(f, "EULER"),
            SolverType::NavierStokes
                => write!(f, "NAVIER_STOKES"),
            SolverType::Rans
                => write!(f, "RANS"),
            SolverType::IncEuler
                => write!(f, "INC_EULER"),
            SolverType::IncNavierStokes
                => write!(f, "INC_NAVIER_STOKES"),
            SolverType::IncRans
                => write!(f, "INC_RANS"),
            SolverType::NemoEuler
                => write!(f, "NEMO_EULER"),
            SolverType::NemoNavierStokes
                => write!(f, "NEMO_NAVIER_STOKES"),
            SolverType::FemEuler
                => write!(f, "FEM_EULER"),
            SolverType::FemNavierStokes
                => write!(f, "FEM_NAVIER_STOKES"),
            SolverType::FemRans
                => write!(f, "FEM_RANS"),
            SolverType::FemLes
                => write!(f, "FEM_LES"),
            SolverType::HeatEquationFvm
                => write!(f, "HEAT_EQUATION_FVM"),
            SolverType::Elasticity
                => write!(f, "ELASTICITY"),
        }
    }
}

impl SU2InputEntry for SolverType {
    fn to_su2_input(&self) -> String {
        format!("SOLVER= {}", self)
    }
}