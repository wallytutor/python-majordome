use thermo::data::{get_calcite, get_co2, get_lime};

fn main() {
    println!("=== Thermodynamic Properties ===\n");

    let calcite = get_calcite();
    let lime = get_lime();
    let co2 = get_co2();

    let species = [&calcite, &lime, &co2];
    for (i, s) in species.iter().enumerate() {
        let names = ["Calcite", "Lime", "CO2"];
        println!("--- {} ---", names[i]);
        println!("Cp ...........: {:.6}", s.cp(298.15));
        println!("Enthalpy .....: {:.6}", s.enthalpy(300.0));
        println!("Entropy ......: {:.6}", s.entropy(300.0));
        println!("Gibbs ........: {:.6}\n", s.gibbs(300.0));
    }
}
