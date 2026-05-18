use thermo::core::{Substance, SystemComposition};
use thermo::data::DatabaseLoader;
use thermo::equil::equilibrate_stoichiometric;

fn main() {
    let db = DatabaseLoader::new("data/hallstedt1990.lua".to_string(), None)
        .expect("Failed to load hallstedt1990.lua");

    let names = ["HALITE", "CORUNDUM", "C3A1", "C1A1", "C1A2", "C1A6"];
    let species_cloned: Vec<_> = names
        .iter()
        .map(|n| db.data.get(*n).expect(&format!("{} not found", n)).clone())
        .collect();
    let species: Vec<&Substance> = species_cloned.iter().collect();

    let t_eval = 1400.0;
    let p_eval = 101325.0;

    println!("\n=== Hallstedt (1990) CaO-Al2O3 Phase Stability Scan ===");
    println!("Temperature: {:.1} K, Pressure: {:.1} Pa", t_eval, p_eval);
    println!();
    println!(
        "{:<10} | {:<10} | {:<10} | {:<10} | {:<10} | {:<10} | {:<10}",
        "x(Al2O3)", "HALITE", "C3A1", "C1A1", "C1A2", "C1A6", "CORUNDUM"
    );
    println!(
        "{:-<10}-+-{:-<10}-+-{:-<10}-+-{:-<10}-+-{:-<10}-+-{:-<10}-+-{:-<10}-",
        "", "", "", "", "", "", ""
    );

    let halite = db.data.get("HALITE").unwrap();
    let corundum = db.data.get("CORUNDUM").unwrap();

    let mut x = 0.0;
    while x <= 1.0001 {
        // System corresponds to (1-x) CaO + x Al2O3
        let mix = vec![(halite.clone(), 1.0 - x), (corundum.clone(), x)];

        let comp = SystemComposition::from_compound_moles(mix).unwrap();
        let elements_vec = comp.elements();
        let elements: Vec<&str> = elements_vec.iter().map(|s| s.as_str()).collect();
        let b = comp.fractions();

        let phi = equilibrate_stoichiometric(&species, &elements, &b, t_eval, p_eval);
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
