use thermo::core::{Substance, SystemComposition};
use thermo::data::DatabaseLoader;
use thermo::equil::evaluate_local_equilibrium;

fn main() {
    let db = DatabaseLoader::new("data/data.lua".to_string(), None).unwrap();

    let names = ["Calcite", "Lime", "CO2", "Diaspore", "H2O", "Al2O3"];
    let species_cloned: Vec<_> = names
        .iter()
        .map(|n| db.data.get(*n).unwrap().clone())
        .collect();
    let species: Vec<&Substance> = species_cloned.iter().collect();

    let display_names = [
        "CaCO3(s)",
        "CaO(s)",
        "CO2(g)",
        "Diaspore(s)",
        "H2O(g)",
        "Al2O3(s)",
    ];

    let t = 1173.15_f64; // K
    let p_user = 1.0_f64; // bar

    // Mixture representing 1 mole of CaCO3 + 1 mole of Diaspore
    let calcite = db.data.get("Calcite").unwrap();
    let diaspore = db.data.get("Diaspore").unwrap();
    let mix = vec![(calcite.clone(), 1.0), (diaspore.clone(), 1.0)];

    let comp = SystemComposition::from_compound_moles(mix).unwrap();
    let elements_vec = comp.elements();
    let elements: Vec<&str> = elements_vec.iter().map(|s| s.as_str()).collect();
    let b = comp.fractions();

    println!("\n=== Generic CALPHAD Local Equilibrium ===");
    println!("T = {} K, P = {} bar", t, p_user);
    println!("{}", comp.report());

    let equilibrium_phi = evaluate_local_equilibrium(&species, &elements, &b, t, p_user);

    println!("\nEquilibrium amounts:");
    for i in 0..6 {
        println!("  {:<12}: {:.6} mol", display_names[i], equilibrium_phi[i]);
    }
}
