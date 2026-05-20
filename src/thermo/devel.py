# -*- coding: utf-8 -*-
import sys
import os

# Add current directory to path so we can import _calphad
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import _calphad

def main():
    print("=" * 80)
    print("                CALPHAD CHEMICAL EQUILIBRIUM SOLVER ENGINE")
    print("=" * 80)

    # 1. Initialize the DatabaseLoader and load the phases dict
    loader = _calphad.DatabaseLoader("data/data.lua")
    phases = loader.get_data()

    # 2. Define compound moles using a plain dictionary
    # Mixture representing 1.5 mol Calcite (CaCO3) + 2.0 mol Diaspore (AlOOH)
    proportions = {
        "Calcite": 1.5,
        "Diaspore": 2.0
    }

    # 3. Setup SystemComposition directly passing the phases dictionary!
    comp = _calphad.SystemComposition.from_compound_moles(phases, proportions)
    print("[*] Normalized System Composition:")
    print(comp.report().strip())

    # 4. Convert directly to the elemental fractions dictionary required by the solver
    b = comp.into_elemental_fractions()
    print("\n[*] Converted Target Elemental Fractions:")
    for el, val in sorted(b.items()):
        print(f"  - {el:<2} : {val:.6f}")

    # 5. Solve for equilibrium
    t_eval = 1173.15  # K (900 degC)
    p_eval = 101325.0  # Pa (1.0 bar)

    print(f"\n[*] Solving local equilibrium at T = {t_eval} K, P = {p_eval} Pa...")
    eq = _calphad.equilibrate_stoichiometric(list(phases.values()), b, t_eval, p_eval)

    # 6. Print the gorgeous, premium, highly detailed report!
    print()
    print(eq.report())

    # 7. Demonstrate direct elemental composition specification
    print("\n" + "=" * 80)
    print("      DEMONSTRATING DIRECT ELEMENTAL COMPOSITION SPECIFICATION")
    print("=" * 80)

    elem_moles = {"Ca": 1.0, "C": 1.0, "O": 3.0}
    comp_elem = _calphad.SystemComposition.from_elemental_moles(elem_moles)
    print("\n[*] Elemental Moles Specification ({'Ca': 1.0, 'C': 1.0, 'O': 3.0}):")
    print(comp_elem.report().strip())

if __name__ == "__main__":
    main()
