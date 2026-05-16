use thermo::autodiff::{Dual, diff};
use thermo::data::get_calcite;

fn main() {
    let calcite = get_calcite();
    let g = |t: Dual<f64>| calcite.gibbs(t);

    let dg = diff(g, 300.0);
    println!("\nAutodiff Verification (Calcite):");
    println!("dG/dT = {:.6}", dg);
    println!("-S(T) = {:.6}", -calcite.entropy(300.0));
}
