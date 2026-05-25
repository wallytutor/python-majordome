/// Solves a linear system Ax = b using Gaussian elimination with partial pivoting.
/// Returns None if the matrix is singular.
pub fn dense_gaussian_solver(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let n = b.len();
    for i in 0..n {
        // Pivoting
        let mut max_row = i;
        for k in i + 1..n {
            if a[k][i].abs() > a[max_row][i].abs() {
                max_row = k;
            }
        }
        a.swap(i, max_row);
        b.swap(i, max_row);

        if a[i][i].abs() < 1e-12 {
            return None;
        }

        for k in i + 1..n {
            let factor = a[k][i] / a[i][i];
            b[k] -= factor * b[i];
            for j in i..n {
                a[k][j] -= factor * a[i][j];
            }
        }
    }

    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let mut sum = 0.0;
        for j in i + 1..n {
            sum += a[i][j] * x[j];
        }
        x[i] = (b[i] - sum) / a[i][i];
    }
    Some(x)
}

#[cfg(test)]
mod test {
    use super::dense_gaussian_solver;

    #[test]
    fn test_dense_gaussian_solver() {
        // Solve:
        //  2x +  y = 5
        //   x - 3y = -8
        // Solution: x = 1, y = 3
        let a = vec![vec![2.0, 1.0], vec![1.0, -3.0]];
        let b = vec![5.0, -8.0];
        let x = dense_gaussian_solver(a, b).unwrap();
        assert!((x[0] - 1.0).abs() < 1e-9);
        assert!((x[1] - 3.0).abs() < 1e-9);

        // Singular matrix
        let a_singular = vec![vec![1.0, 2.0], vec![2.0, 4.0]];
        let b_singular = vec![3.0, 6.0];
        assert!(dense_gaussian_solver(a_singular, b_singular).is_none());
    }
}
