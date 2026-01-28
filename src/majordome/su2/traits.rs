// ---------------------------------------------------------------------------
// About boilerplate code
// ======================
// XXX notice that using &'static str in AsInput would be faster, as we avoid
// allocating a new String each time. However, this would require us to write
// out all the variants as string literals, which is more verbose and error-
// prone. Here we prefer maintainability over performance, as this code is not
// on a critical job; later on this could be optimized if needed.
// ---------------------------------------------------------------------------

use crate::utils::types::variant_name_upper;
use super::enums::*;

pub trait AsInput {
    fn type_name() -> &'static str;

    fn to_name(&self) -> String;

    fn to_value(&self) -> String;

    fn to_input(&self) -> String;
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

impl AsInput for InletType {
    fn type_name() -> &'static str { "INLET_TYPE" }

    fn to_name(&self) -> String {
        let val = match self {
            Self::TotalConditionsInlet(..) => "TOTAL_CONDITIONS_INLET",
            Self::MassFlowInlet(..)        => "MASS_FLOW_INLET",
            Self::IncVelocityInlet(..)     => "INC_VELOCITY_INLET",
            Self::IncPressureInlet(..)     => "INC_PRESSURE_INLET",
            Self::TurbulentSAInlet(..)     => "TURBULENT_SA_INLET",
            Self::SupersonicInlet(..)      => "SUPERSONIC_INLET"
        };
        val.to_string()
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
            Self::TurbulentSAInlet(marker)
                => marker.clone(),
            Self::SupersonicInlet(marker, t, p, u)
                => format!("( {}, {}, {}, {} )", marker, t, p, u)
        }
    }

    fn to_input(&self) -> String {
        format!("{}= {}", self.to_name(), self.to_value())
    }
}

impl std::fmt::Display for VelocityType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}, {}, {}", self.0, self.1, self.2)
    }
}

impl std::fmt::Display for SolverType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.to_name())
    }
}
