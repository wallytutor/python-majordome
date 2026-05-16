use thermo::data::load_substances_from_lua;
use thermo::equil::compute_elemental_fractions;
use thermo::equil::evaluate_local_equilibrium;

fn main() {
    let db = load_substances_from_lua("data/hallstedt1990.lua").expect("Failed to load hallstedt1990.lua");

    let names = ["HALITE", "CORUNDUM", "C3A1", "C1A1", "C1A2", "C1A6"];
    let species: Vec<_> = names.iter().map(|n| db.get(*n).expect(&format!("{} not found", n))).collect();
    let elements = ["Ca", "Al", "O"];

    let t_eval = 1400.0;
    let p_eval = 101325.0;

    println!("\n=== Hallstedt (1990) CaO-Al2O3 Phase Stability Scan ===");
    println!("Temperature: {:.1} K, Pressure: {:.1} Pa", t_eval, p_eval);
    println!();
    println!(
        "{:<10} | {:<10} | {:<10} | {:<10} | {:<10} | {:<10} | {:<10}",
        "x(Al2O3)",
        "HALITE",
        "C3A1",
        "C1A1",
        "C1A2",
        "C1A6",
        "CORUNDUM"
    );
    println!(
        "{:-<10}-+-{:-<10}-+-{:-<10}-+-{:-<10}-+-{:-<10}-+-{:-<10}-+-{:-<10}-",
        "", "", "", "", "", "", ""
    );

    let halite = db.get("HALITE").unwrap();
    let corundum = db.get("CORUNDUM").unwrap();

    let mut x = 0.0;
    while x <= 1.0001 {
        // System corresponds to (1-x) CaO + x Al2O3
        // Note: compute_elemental_fractions takes a mix of substances and coefficients
        let mix = [(halite, 1.0 - x), (corundum, x)];
        let b = compute_elemental_fractions(&mix, &elements);

        let phi = evaluate_local_equilibrium(&species, &elements, &b, t_eval, p_eval);
        let total_phi: f64 = phi.iter().sum();
        let norm_phi: Vec<f64> = if total_phi > 0.0 {
            phi.iter().map(|&p| p / total_phi).collect()
        } else {
            phi
        };

        println!(
            "{:<10.2} | {:<10.4} | {:<10.4} | {:<10.4} | {:<10.4} | {:<10.4} | {:<10.4}",
            x, norm_phi[0], norm_phi[2], norm_phi[3], norm_phi[4], norm_phi[5], norm_phi[1]
        );

        x += 0.05;
    }
    println!();
}
