use thermo::autodiff::{Dual, diff};
use thermo::core::{Substance, SystemComposition};
use thermo::data::DatabaseLoader;
use thermo::equil::equilibrate_stoichiometric;

fn main() {
    loading_data();
    autodiff_verification();
    species_tabulation_demo();
    single_equilibrium_evaluation();
}

fn loading_data() {
    println!("=== Thermodynamic Properties ===\n");

    let db = DatabaseLoader::new("data/data.lua".to_string(), None).unwrap();

    for (_name, phase) in db.data.iter() {
        println!("{}\n", phase.report(300.0));
    }
}

fn autodiff_verification() {
    println!("=== Automatic Differentiation Verification ===\n");

    let db = DatabaseLoader::new("data/data.lua".to_string(), None).unwrap();
    let calcite = db.data.get("Calcite").unwrap();

    let t_eval = 300.0;
    let g = |t: Dual<f64>| calcite.gibbs(t);

    let dg = diff(g, t_eval);
    let neg_s = -calcite.entropy(t_eval);

    println!("Calcite at {:.2} K:", t_eval);
    println!("  dG/dT (autodiff) = {:.6} J/(mol.K)", dg);
    println!("  -S(T) (computed) = {:.6} J/(mol.K)", neg_s);
    println!("  Difference       = {:.6e} J/(mol.K)", (dg - neg_s).abs());
    println!();
}

fn species_tabulation_demo() {
    println!("=== Species Thermodynamic Tabulation ===\n");

    let db = DatabaseLoader::new("data/data.lua".to_string(), None).unwrap();
    let names = ["Calcite", "Lime", "CO2", "Diaspore", "H2O", "Al2O3"];

    for name in &names {
        if let Some(substance) = db.data.get(*name) {
            println!("{}\n", substance.tabulate(None, None, None));
        }
    }
}

fn single_equilibrium_evaluation() {
    let db = DatabaseLoader::new("data/data.lua".to_string(), None).unwrap();

    let names = ["Calcite", "Lime", "CO2", "Diaspore", "H2O", "Al2O3"];
    let species_cloned: Vec<_> = names
        .iter()
        .map(|n| db.data.get(*n).unwrap().clone())
        .collect();
    let species: Vec<&Substance> = species_cloned.iter().collect();

    let t = 1173.15_f64; // K
    let p_user = 101325.0_f64; // Pa

    // Mixture representing 1 mole of CaCO3 + 1 mole of Diaspore
    let mut proportions = std::collections::HashMap::new();
    proportions.insert("Calcite".to_string(), 1.0);
    proportions.insert("Diaspore".to_string(), 1.0);

    let comp = SystemComposition::from_compound_moles(db.data.clone(), proportions).unwrap();
    let elements_vec = comp.elements();
    let fractions = comp.fractions();
    let mut b_map = std::collections::HashMap::new();
    for i in 0..elements_vec.len() {
        b_map.insert(elements_vec[i].clone(), fractions[i]);
    }

    println!("\n=== Generic CALPHAD Local Equilibrium ===");
    println!("T = {} K, P = {} bar", t, p_user);
    println!("{}", comp.report());

    let eq = equilibrate_stoichiometric(&species, &b_map, t, p_user);

    println!("{}", eq.report());
}
