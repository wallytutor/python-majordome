use super::enums::SolverType;
use super::traits::AsInput;

#[test]
fn test_solver_type_to_su2_input() {
    let solver = SolverType::Euler;
    let input = solver.to_input();
    assert_eq!(input, "SOLVER= EULER");
}