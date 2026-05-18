# -*- coding: utf-8 -*-
import sys
import os

# Add current directory to path so we can import _calphad
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import _calphad

def main():
    print("=" * 60)
    print("  STOICHIOMETRIC CHEMICAL EQUILIBRIUM SOLVER (CALPHAD ENGINE)")
    print("=" * 60)

    # 1. Initialize the DatabaseLoader
    loader = _calphad.DatabaseLoader("data/data.lua")

    # 2. Select species
    species_names = ["Calcite", "Lime", "CO2", "Diaspore", "H2O", "Al2O3"]
    species = [loader.load_compound(name) for name in species_names]

    # 3. Define target elemental composition as a clean dict (HashMap)
    # 1.0 mol CaCO3 + 1.0 mol AlOOH
    b = {
        "Ca": 1.0,
        "C": 1.0,
        "Al": 1.0,
        "H": 1.0,
        "O": 5.0
    }

    t_eval = 1173.15  # K (900 degC)
    p_eval = 1.0      # bar
    
    print(f"[*] Solving equilibrium at T = {t_eval} K, P = {p_eval} bar")

    # 4. Solve directly! No need to extract or order elements!
    phi = _calphad.equilibrate_stoichiometric(species, b, t_eval, p_eval)

    print("\nEquilibrium amounts:")
    for name, amount in phi.items():
        print(f"  - {name:<10}: {amount:.6f} mol")
    print("=" * 60)

if __name__ == "__main__":
    main()
