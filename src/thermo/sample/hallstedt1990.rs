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


    let mut x = 0.0;
    while x <= 1.0001 {
        // System corresponds to (1-x) CaO + x Al2O3
        let mut proportions = std::collections::HashMap::new();
        proportions.insert("HALITE".to_string(), 1.0 - x);
        proportions.insert("CORUNDUM".to_string(), x);

        let comp = SystemComposition::from_compound_moles(species_cloned.clone(), proportions).unwrap();
        let elements_vec = comp.elements();
        let fractions = comp.fractions();
        let mut b_map = std::collections::HashMap::new();
        for i in 0..elements_vec.len() {
            b_map.insert(elements_vec[i].clone(), fractions[i]);
        }

        let phi = equilibrate_stoichiometric(&species, &b_map, t_eval, p_eval);
        let mut total_phi = 0.0;
        for name in &names {
            total_phi += phi.get(*name).copied().unwrap_or(0.0);
        }

        let get_norm = |name: &str| {
            if total_phi > 0.0 {
                phi.get(name).copied().unwrap_or(0.0) / total_phi
            } else {
                0.0
            }
        };

        println!(
            "{:<10.2} | {:<10.4} | {:<10.4} | {:<10.4} | {:<10.4} | {:<10.4} | {:<10.4}",
            x,
            get_norm("HALITE"),
            get_norm("C3A1"),
            get_norm("C1A1"),
            get_norm("C1A2"),
            get_norm("C1A6"),
            get_norm("CORUNDUM")
        );

        x += 0.05;
    }
    println!();
}
