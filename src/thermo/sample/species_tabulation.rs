use thermo::data::load_substances_from_lua;

fn main() {
    let db = load_substances_from_lua("data/data.lua").expect("Failed to load data.lua");
    
    let names = ["Calcite", "Lime", "CO2", "Diaspore", "H2O", "Al2O3"];
    let species: Vec<_> = names.iter().map(|n| db.get(*n).unwrap()).collect();

    println!("\n=== Species Thermodynamic Tabulation (300 K - 1200 K) ===");
    for s in species.iter() {
        println!("\n--- {} ---", s.name);
        println!(
            "{:<8} | {:<12} | {:<12} | {:<14} | {:<14}",
            "T (K)", "Cp", "S", "-(G-H298)/T", "H-H298"
        );
        println!(
            "{:-<8}-+-{:-<12}-+-{:-<12}-+-{:-<14}-+-{:-<14}-",
            "", "", "", "", ""
        );

        let mut t = 300.0;
        while t <= 1200.0 {
            let cp_val = s.cp(t);
            let h_val = s.enthalpy(t);
            let s_val = s.entropy(t);
            let g_val = s.gibbs(t);

            let h_ref = s.enthalpy(298.15);
            let free_energy_func = -(g_val - h_ref) / t;
            let h_diff = h_val - h_ref;

            println!(
                "{:<8.2} | {:<12.4} | {:<12.4} | {:<14.4} | {:<14.2}",
                t, cp_val, s_val, free_energy_func, h_diff
            );
            t += 100.0;
        }
    }
    println!();
}
