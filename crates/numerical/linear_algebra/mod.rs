pub mod dense;
pub use dense::dense_gaussian_solver;

pub mod tridiagonal;
pub use tridiagonal::TridiagonalSolver;
pub use tridiagonal::TridiagonalSolverDestroying;
pub use tridiagonal::TridiagonalSolverNonDestroying;
