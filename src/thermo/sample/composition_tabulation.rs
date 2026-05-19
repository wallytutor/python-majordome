use thermo::T_REF;
use thermo::core::{Substance, SystemComposition};
use thermo::data::DatabaseLoader;
use thermo::equil::equilibrate_stoichiometric;

fn main() {
    let db = DatabaseLoader::new("data/data.lua".to_string(), None).unwrap();

    let names = ["Calcite", "Lime", "CO2", "Diaspore", "H2O", "Al2O3"];
    let species_cloned: Vec<_> = names
        .iter()
        .map(|n| db.data.get(*n).unwrap().clone())
        .collect();
    let species: Vec<&Substance> = species_cloned.iter().collect();

    // Mix corresponding to 1 part CaCO3, 1 part Diaspore
    let mut proportions = std::collections::HashMap::new();
    proportions.insert("Calcite".to_string(), 1.0);
    proportions.insert("Diaspore".to_string(), 1.0);

    let comp = SystemComposition::from_compound_moles(species_cloned.clone(), proportions).unwrap();
    let elements_vec = comp.elements();
    let fractions = comp.fractions();
    let mut b_map = std::collections::HashMap::new();
    for i in 0..elements_vec.len() {
        b_map.insert(elements_vec[i].clone(), fractions[i]);
    }

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
    let p = 101325.0;

    // Compute reference state at T_REF (298.15 K)
    let phi_ref = equilibrate_stoichiometric(&species, &b_map, T_REF, p);
    let mut h_sys_ref = 0.0;
    let mut m_sys = 0.0; // Mass is constant across all temperatures
    for i in 0..species.len() {
        let s = &species[i];
        let h_i = s.enthalpy(T_REF);
        let amount = phi_ref.get(&s.name).copied().unwrap_or(0.0);
        h_sys_ref += amount * h_i;
        m_sys += amount * s.molar_mass;
    }

    let mut t = t_min;
    while t <= t_max {
        let phi = equilibrate_stoichiometric(&species, &b_map, t, p);

        let mut h_sys = 0.0;
        for i in 0..species.len() {
            let s = &species[i];
            let h_i = s.enthalpy(t);
            let amount = phi.get(&s.name).copied().unwrap_or(0.0);
            h_sys += amount * h_i;
        }
        let h_sys_mass_change = if m_sys > 0.0 {
            (h_sys - h_sys_ref) / m_sys
        } else {
            0.0
        };

        println!(
            "{:<10.2} | {:<12.6} | {:<12.6} | {:<12.6} | {:<14.6} | {:<12.6} | {:<12.6} | {:<14.2}",
            t,
            phi.get("Calcite").copied().unwrap_or(0.0),
            phi.get("Lime").copied().unwrap_or(0.0),
            phi.get("CO2").copied().unwrap_or(0.0),
            phi.get("Diaspore").copied().unwrap_or(0.0),
            phi.get("H2O").copied().unwrap_or(0.0),
            phi.get("Al2O3").copied().unwrap_or(0.0),
            h_sys_mass_change
        );
        t += t_inc;
    }
    println!();
}
