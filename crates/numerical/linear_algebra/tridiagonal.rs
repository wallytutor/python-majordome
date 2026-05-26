pub fn tdma_non_destroying_with_memory(
    a: &[f64],
    b: &[f64],
    c: &[f64],
    d: &[f64],
    c_prime: &mut [f64],
    d_prime: &mut [f64],
    x: &mut [f64],
    n: usize,
) {
    if n == 0 {
        return;
    }

    c_prime[0] = c[0] / b[0];
    d_prime[0] = d[0] / b[0];

    for i in 1..n - 1 {
        let m = b[i] - a[i] * c_prime[i - 1];
        c_prime[i] = c[i] / m;
        d_prime[i] = (d[i] - a[i] * d_prime[i - 1]) / m;
    }

    if n > 1 {
        let m = b[n - 1] - a[n - 1] * c_prime[n - 2];
        d_prime[n - 1] = (d[n - 1] - a[n - 1] * d_prime[n - 2]) / m;
    }

    x[n - 1] = d_prime[n - 1];

    if n > 1 {
        for i in (0..n - 1).rev() {
            x[i] = d_prime[i] - c_prime[i] * x[i + 1];
        }
    }
}

pub fn tdma_destroying_with_memory(
    a: &[f64],
    b: &mut [f64],
    c: &mut [f64],
    d: &mut [f64],
    x: &mut [f64],
    n: usize,
) {
    if n == 0 {
        return;
    }

    c[0] = c[0] / b[0];
    d[0] = d[0] / b[0];

    for i in 1..n - 1 {
        let m = b[i] - a[i] * c[i - 1];
        c[i] = c[i] / m;
        d[i] = (d[i] - a[i] * d[i - 1]) / m;
    }

    if n > 1 {
        let m = b[n - 1] - a[n - 1] * c[n - 2];
        d[n - 1] = (d[n - 1] - a[n - 1] * d[n - 2]) / m;
    }

    x[n - 1] = d[n - 1];

    if n > 1 {
        for i in (0..n - 1).rev() {
            x[i] = d[i] - c[i] * x[i + 1];
        }
    }
}

pub struct TridiagonalMatrix {
    pub a: Vec<f64>,
    pub b: Vec<f64>,
    pub c: Vec<f64>,
}

impl TridiagonalMatrix {
    pub fn new(n: usize) -> Self {
        Self {
            a: vec![0.0; n],
            b: vec![0.0; n],
            c: vec![0.0; n],
        }
    }
}

pub struct TridiagonalProblem {
    pub matrix: TridiagonalMatrix,
    pub d: Vec<f64>,
    pub n: usize,
}

impl TridiagonalProblem {
    pub fn new(n: usize) -> Self {
        Self {
            matrix: TridiagonalMatrix::new(n),
            d: vec![0.0; n],
            n,
        }
    }
}

pub struct TridiagonalMemory {
    pub c_prime: Vec<f64>,
    pub d_prime: Vec<f64>,
    pub x: Vec<f64>,
}

impl TridiagonalMemory {
    pub fn new(n: usize) -> Self {
        Self {
            c_prime: vec![0.0; n],
            d_prime: vec![0.0; n],
            x: vec![0.0; n],
        }
    }
}

pub trait TridiagonalSolver {
    fn problem(&mut self) -> &mut TridiagonalProblem;
    fn memory(&mut self) -> &mut TridiagonalMemory;
    fn solve(&mut self) -> &[f64];
}

pub struct TridiagonalSolverDestroying {
    pub problem: TridiagonalProblem,
    pub memory: TridiagonalMemory,
}

impl TridiagonalSolverDestroying {
    pub fn new(n: usize) -> Self {
        Self {
            problem: TridiagonalProblem::new(n),
            memory: TridiagonalMemory::new(n),
        }
    }
}

impl TridiagonalSolver for TridiagonalSolverDestroying {
    fn problem(&mut self) -> &mut TridiagonalProblem {
        &mut self.problem
    }

    fn memory(&mut self) -> &mut TridiagonalMemory {
        &mut self.memory
    }

    fn solve(&mut self) -> &[f64] {
        tdma_destroying_with_memory(
            &self.problem.matrix.a,
            &mut self.problem.matrix.b,
            &mut self.problem.matrix.c,
            &mut self.problem.d,
            &mut self.memory.x,
            self.problem.n,
        );
        &self.memory.x
    }
}

pub struct TridiagonalSolverNonDestroying {
    pub problem: TridiagonalProblem,
    pub memory: TridiagonalMemory,
}

impl TridiagonalSolverNonDestroying {
    pub fn new(n: usize) -> Self {
        Self {
            problem: TridiagonalProblem::new(n),
            memory: TridiagonalMemory::new(n),
        }
    }
}

impl TridiagonalSolver for TridiagonalSolverNonDestroying {
    fn problem(&mut self) -> &mut TridiagonalProblem {
        &mut self.problem
    }

    fn memory(&mut self) -> &mut TridiagonalMemory {
        &mut self.memory
    }

    fn solve(&mut self) -> &[f64] {
        tdma_non_destroying_with_memory(
            &self.problem.matrix.a,
            &self.problem.matrix.b,
            &self.problem.matrix.c,
            &self.problem.d,
            &mut self.memory.c_prime,
            &mut self.memory.d_prime,
            &mut self.memory.x,
            self.problem.n,
        );
        &self.memory.x
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_tdma() {
        let mut solver = TridiagonalSolverNonDestroying::new(4);
        let p = solver.problem();

        p.matrix.a = vec![0.0, -1.0, -1.0, -1.0];
        p.matrix.b = vec![2.0, 2.0, 2.0, 2.0];
        p.matrix.c = vec![-1.0, -1.0, -1.0, 0.0];
        p.d = vec![1.0, 0.0, 0.0, 1.0];

        let x = solver.solve();
        assert!((x[0] - 1.0).abs() < 1.0e-10);
        assert!((x[1] - 1.0).abs() < 1.0e-10);
        assert!((x[2] - 1.0).abs() < 1.0e-10);
        assert!((x[3] - 1.0).abs() < 1.0e-10);
    }
}
