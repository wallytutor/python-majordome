use thermo::data::get_al2o3;
use thermo::data::get_calcite;
use thermo::data::get_co2;
use thermo::data::get_diaspore;
use thermo::data::get_h2o;
use thermo::data::get_lime;
use thermo::equil::compute_elemental_fractions;
use thermo::equil::evaluate_local_equilibrium;

fn main() {
    let calcite = get_calcite();
    let lime = get_lime();
    let co2 = get_co2();
    let diaspore = get_diaspore();
    let h2o = get_h2o();
    let al2o3 = get_al2o3();

    let species = [&calcite, &lime, &co2, &diaspore, &h2o, &al2o3];
    let names = [
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
    let mix = [(&calcite, 1.0), (&diaspore, 1.0)];
    let b = compute_elemental_fractions(&mix, &elements);

    println!("\n=== Generic CALPHAD Local Equilibrium ===");
    println!("T = {} K, P = {} bar", t, p_user);
    println!("System elements: {:?}", elements);
    println!("System composition: {:?}", b);

    let equilibrium_phi = evaluate_local_equilibrium(&species, &elements, &b, t, p_user);

    println!("\nEquilibrium amounts:");
    for i in 0..6 {
        println!("  {:<12}: {:.6} mol", names[i], equilibrium_phi[i]);
    }
}
