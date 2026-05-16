use crate::core::Substance;

// VERY ROUGH

pub fn find_particular_solution(a: &[Vec<f64>], b: &[f64], n_s: usize, n_e: usize) -> Vec<f64> {
    let mut phi = vec![0.0; n_s];
    let lr = 0.01;
    for _ in 0..20000 {
        let mut grad = vec![0.0; n_s];
        for i in 0..n_e {
            let mut err = -b[i];
            for k in 0..n_s {
                err += a[i][k] * phi[k];
            }
            for k in 0..n_s {
                grad[k] += err * a[i][k];
            }
        }
        for k in 0..n_s {
            phi[k] -= lr * grad[k];
        }
    }
    phi
}

pub fn evaluate_local_equilibrium(
    species: &[&Substance],
    elements: &[&str],
    b: &[f64],
    t: f64,
    p: f64,
) -> Vec<f64> {
    let n_s = species.len();
    let n_e = elements.len();
    let r = 8.314_f64;

    // Compute g_k
    let mut g_k = vec![0.0; n_s];
    for i in 0..n_s {
        let s = species[i];
        let mut g = s.gibbs(t);
        if s.molar_volume > 20.0 {
            // Gas heuristic
            g += r * t * p.ln();
        }
        g_k[i] = g;
    }

    // Build stoichiometry matrix A
    let mut a = vec![vec![0.0; n_s]; n_e];
    for i in 0..n_e {
        for j in 0..n_s {
            a[i][j] = species[j].elements.get(elements[i]).copied().unwrap_or(0.0);
        }
    }

    let mut best_phi = vec![0.0; n_s];
    let mut min_g = f64::INFINITY;
    let mut found_solution = false;

    // We have a Linear Programming problem: Minimize g_k^T phi s.t. A phi = b, phi >= 0.
    // Basic feasible solutions have at most rank(A) non-zero variables.
    // For small n_s, we can just evaluate all possible combinations of active species (supports).
    let total_subsets = 1 << n_s;
    for mask in 1..total_subsets {
        let mut phi = vec![0.0; n_s];
        // initialize active ones
        for k in 0..n_s {
            if (mask & (1 << k)) != 0 {
                phi[k] = 1.0;
            }
        }

        let lr = 0.01;
        for _ in 0..10000 {
            let mut grad = vec![0.0; n_s];
            for i in 0..n_e {
                let mut err = -b[i];
                for k in 0..n_s {
                    err += a[i][k] * phi[k];
                }
                for k in 0..n_s {
                    grad[k] += err * a[i][k];
                }
            }
            for k in 0..n_s {
                if (mask & (1 << k)) != 0 {
                    phi[k] -= lr * grad[k];
                } else {
                    phi[k] = 0.0;
                }
            }
        }

        // check mass balance error
        let mut max_err = 0.0;
        for i in 0..n_e {
            let mut err = -b[i];
            for k in 0..n_s {
                err += a[i][k] * phi[k];
            }
            if err.abs() > max_err {
                max_err = err.abs();
            }
        }

        if max_err > 1e-4 {
            continue;
        }

        // check non-negativity
        let mut valid_non_negative = true;
        for k in 0..n_s {
            if phi[k] < -1e-4 {
                valid_non_negative = false;
                break;
            }
            phi[k] = phi[k].max(0.0);
        }

        if !valid_non_negative {
            continue;
        }

        // Calculate Gibbs for this support
        let mut g = 0.0;
        for k in 0..n_s {
            g += phi[k] * g_k[k];
        }

        if g < min_g {
            min_g = g;
            best_phi = phi.clone();
            found_solution = true;
        }
    }

    if found_solution {
        best_phi
    } else {
        // Fallback
        let phi_p = find_particular_solution(&a, b, n_s, n_e);
        phi_p.into_iter().map(|x| x.max(0.0)).collect()
    }
}

pub fn compute_elemental_fractions(mix: &[(&Substance, f64)], elements: &[&str]) -> Vec<f64> {
    let mut moles_of_elements = vec![0.0; elements.len()];

    for (substance, amount) in mix {
        for (i, &el) in elements.iter().enumerate() {
            if let Some(&moles_in_substance) = substance.elements.get(el) {
                moles_of_elements[i] += amount * moles_in_substance;
            }
        }
    }

    let total_moles: f64 = moles_of_elements.iter().sum();

    if total_moles > 0.0 {
        moles_of_elements
            .into_iter()
            .map(|m| m / total_moles)
            .collect()
    } else {
        moles_of_elements
    }
}
