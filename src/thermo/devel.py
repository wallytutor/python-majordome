# -*- coding: utf-8 -*-
import sys
import os

# Add current directory to path so we can import _calphad
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import _calphad

def main():
    print("=" * 70)
    print("  STOICHIOMETRIC CHEMICAL EQUILIBRIUM SOLVER (CALPHAD ENGINE)")
    print("=" * 70)

    # 1. Initialize the DatabaseLoader
    db_path = "data/data.lua"
    print(f"[*] Loading thermodynamic database: {db_path}")
    loader = _calphad.DatabaseLoader(db_path)

    # 2. Select species for our stoichiometric system
    species_names = ["Calcite", "Lime", "CO2", "Diaspore", "H2O", "Al2O3"]
    species = [loader.load_compound(name) for name in species_names]
    
    print("\n[*] Species in the system:")
    for s in species:
        print(f"  - {s.name:<10} | Molar Mass: {s.molar_mass:7.3f} g/mol")

    # 3. Standardized Element Extraction using the new Python API
    elements = _calphad.extract_elements(species)
    print(f"\n[*] Standardized Extracted Elements (Sorted): {elements}")

    # 4. Define system composition and conditions
    # Mixture representing: 1.0 mol CaCO3 + 1.0 mol AlOOH
    # Element amounts:
    #   Ca: 1.0
    #   C:  1.0
    #   Al: 1.0
    #   H:  1.0
    #   O:  5.0 (3 from CaCO3, 2 from AlOOH)
    b_dict = {
        "Ca": 1.0,
        "C": 1.0,
        "Al": 1.0,
        "H": 1.0,
        "O": 5.0
    }
    
    # Order elemental abundances according to the standardized sorted elements list
    b = [b_dict[el] for el in elements]
    
    t_eval = 1173.15  # K (900 degC)
    p_eval = 1.0      # bar (converted to Pa inside solver if gas phase)
    
    print(f"\n[*] Solving Equilibrium at T = {t_eval} K, P = {p_eval} bar")
    print(f"    Target Elemental Abundances:")
    for el, val in zip(elements, b):
        print(f"      {el:<2}: {val:.3f} mol")

    # 5. Solve using the new equilibrate_stoichiometric Python API
    phi = _calphad.equilibrate_stoichiometric(species, elements, b, t_eval, p_eval)

    print("\n" + "=" * 55)
    print(f"  EQUILIBRIUM PHASE ASSEMBLAGE AT {t_eval} K")
    print("=" * 55)
    print(f"  {'Species Name':<15} | {'Chemical Formula':<16} | {'Amount (mol)':<15}")
    print("-" * 55)
    
    formulas = {
        "Calcite": "CaCO3(s)",
        "Lime": "CaO(s)",
        "CO2": "CO2(g)",
        "Diaspore": "AlOOH(s)",
        "H2O": "H2O(g)",
        "Al2O3": "Al2O3(s)"
    }
    
    for s, amount in zip(species, phi):
        formula = formulas.get(s.name, s.name)
        print(f"  {s.name:<15} | {formula:<16} | {amount:>12.6f}")
    print("=" * 55)

if __name__ == "__main__":
    main()
