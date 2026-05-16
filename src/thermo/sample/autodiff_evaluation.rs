use thermo::autodiff::{Dual, diff};
use thermo::data::load_substances_from_lua;

fn main() {
    let db = load_substances_from_lua("data.lua").expect("Failed to load data.lua");
    let calcite = db.get("Calcite").unwrap();
    
    let g = |t: Dual<f64>| calcite.gibbs(t);

    let dg = diff(g, 300.0);
    println!("\nAutodiff Verification (Calcite):");
    println!("dG/dT = {:.6}", dg);
    println!("-S(T) = {:.6}", -calcite.entropy(300.0));
}
