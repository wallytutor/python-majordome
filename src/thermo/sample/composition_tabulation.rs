use thermo::core::T_REF;
use thermo::data::{get_al2o3, get_calcite, get_co2, get_diaspore, get_h2o, get_lime};
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
    let elements = ["Ca", "C", "O", "Al", "H"];

    // Mix corresponding to 1 part CaCO3, 1 part Diaspore
    let mix = [(&calcite, 1.0), (&diaspore, 1.0)];
    let b = compute_elemental_fractions(&mix, &elements);

    println!("\n=== Composition Tabulation (300 K - 1200 K) ===");
    println!(
        "{:<10} | {:<12} | {:<12} | {:<12} | {:<14} | {:<12} | {:<12} | {:<14}",
        "T (K)",
        "CaCO3 (mol)",
        "CaO (mol)",
        "CO2 (mol)",
        "Diaspore (mol)",
        "H2O (mol)",
        "Al2O3 (mol)",
        "Enthalpy (J/g)"
    );
    println!(
        "{:-<10}-+-{:-<12}-+-{:-<12}-+-{:-<12}-+-{:-<14}-+-{:-<12}-+-{:-<12}-+-{:-<14}-",
        "", "", "", "", "", "", "", ""
    );

    let t_min = 300.0;
    let t_max = 1200.0;
    let t_inc = 100.0;
    let p = 1.0;

    // Compute reference state at T_REF (298.15 K)
    let phi_ref = evaluate_local_equilibrium(&species, &elements, &b, T_REF, p);
    let mut h_sys_ref = 0.0;
    let mut m_sys = 0.0; // Mass is constant across all temperatures
    for i in 0..species.len() {
        let s = species[i];
        let h_i = s.enthalpy(T_REF);
        h_sys_ref += phi_ref[i] * h_i;
        m_sys += phi_ref[i] * s.molar_mass;
    }

    let mut t = t_min;
    while t <= t_max {
        let phi = evaluate_local_equilibrium(&species, &elements, &b, t, p);

        let mut h_sys = 0.0;
        for i in 0..species.len() {
            let s = species[i];
            let h_i = s.enthalpy(t);
            h_sys += phi[i] * h_i;
        }
        let h_sys_mass_change = if m_sys > 0.0 {
            (h_sys - h_sys_ref) / m_sys
        } else {
            0.0
        };

        println!(
            "{:<10.2} | {:<12.6} | {:<12.6} | {:<12.6} | {:<14.6} | {:<12.6} | {:<12.6} | {:<14.2}",
            t, phi[0], phi[1], phi[2], phi[3], phi[4], phi[5], h_sys_mass_change
        );
        t += t_inc;
    }
    println!();
}
