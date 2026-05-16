use thermo::data::get_al2o3;
use thermo::data::get_calcite;
use thermo::data::get_co2;
use thermo::data::get_diaspore;
use thermo::data::get_h2o;
use thermo::data::get_lime;

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

    println!("\n=== Species Thermodynamic Tabulation (300 K - 1200 K) ===");
    for (i, s) in species.iter().enumerate() {
        println!("\n--- {} ---", names[i]);
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

            let free_energy_func = -(g_val - s.delta_hf) / t;
            let h_diff = h_val - s.delta_hf;

            println!(
                "{:<8.2} | {:<12.4} | {:<12.4} | {:<14.4} | {:<14.2}",
                t, cp_val, s_val, free_energy_func, h_diff
            );
            t += 100.0;
        }
    }
    println!();
}
