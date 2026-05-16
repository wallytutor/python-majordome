use thermo::data::load_substances_from_lua;
use thermo::equil::compute_elemental_fractions;
use thermo::equil::evaluate_local_equilibrium;

fn main() {
    let db = load_substances_from_lua("data/data.lua").expect("Failed to load data.lua");
    
    let names = ["Calcite", "Lime", "CO2", "Diaspore", "H2O", "Al2O3"];
    let species: Vec<_> = names.iter().map(|n| db.get(*n).unwrap()).collect();
    
    let display_names = [
        "CaCO3(s)",
        "CaO(s)",
        "CO2(g)",
        "Diaspore(s)",
        "H2O(g)",
        "Al2O3(s)",
    ];
    let elements = ["Ca", "C", "O", "Al", "H"];

    let t = 1173.15_f64; // K
    let p_user = 1.0_f64; // bar

    // Mixture representing 1 mole of CaCO3 + 1 mole of Diaspore
    let calcite = db.get("Calcite").unwrap();
    let diaspore = db.get("Diaspore").unwrap();
    let mix = [(calcite, 1.0), (diaspore, 1.0)];
    let b = compute_elemental_fractions(&mix, &elements);

    println!("\n=== Generic CALPHAD Local Equilibrium ===");
    println!("T = {} K, P = {} bar", t, p_user);
    println!("System elements: {:?}", elements);
    println!("System composition: {:?}", b);

    let equilibrium_phi = evaluate_local_equilibrium(&species, &elements, &b, t, p_user);

    println!("\nEquilibrium amounts:");
    for i in 0..6 {
        println!("  {:<12}: {:.6} mol", display_names[i], equilibrium_phi[i]);
    }
}
