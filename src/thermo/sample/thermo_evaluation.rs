use thermo::data::load_substances_from_lua;

fn main() {
    println!("=== Thermodynamic Properties ===\n");

    let db = load_substances_from_lua("data.lua").expect("Failed to load data.lua");
    let calcite = db.get("Calcite").unwrap();
    let lime = db.get("Lime").unwrap();
    let co2 = db.get("CO2").unwrap();

    let species = [calcite, lime, co2];
    for s in species.iter() {
        println!("--- {} ---", s.name);
        println!("Cp ...........: {:.6}", s.cp(298.15));
        println!("Enthalpy .....: {:.6}", s.enthalpy(300.0));
        println!("Entropy ......: {:.6}", s.entropy(300.0));
        println!("Gibbs ........: {:.6}\n", s.gibbs(300.0));
    }
}
