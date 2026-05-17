use thermo::autodiff::{Dual, diff};
use thermo::data::DatabaseLoader;

fn main() {
    loading_data();
    autodiff_verification();
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
