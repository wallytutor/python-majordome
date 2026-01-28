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

    fn to_input(&self) -> String;
}

impl AsInput for SolverType {
    fn type_name() -> &'static str {
        "SOLVER"
    }

    fn to_name(&self) -> String {
        variant_name_upper(&self)
    }

    fn to_input(&self) -> String {
        format!("{}= {}", Self::type_name(), self.to_name())
    }
}

impl std::fmt::Display for SolverType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.to_name())
    }
}
