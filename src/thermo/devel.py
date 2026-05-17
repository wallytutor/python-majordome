# -*- coding: utf-8 -*-
import sys
import os

# Add current directory to path so we can import _calphad
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import _calphad


def main():
    print("========================================")
    print("DEMONSTRATING SYSTEM COMPOSITION SPECIFICATION")
    print("========================================\n")

    # 1. Load the database to retrieve Substances
    db_path = "data/data.lua"
    loader = _calphad.DatabaseLoader(db_path)
    data = loader.get_data()

    calcite = data["Calcite"]
    diaspore = data["Diaspore"]

    # ---------------------------------------------------------
    # Method 1: Compound Moles (mole proportions of substances)
    # ---------------------------------------------------------
    print("1. Specification by Compound Moles (1.5 mol Calcite + 2.0 mol Diaspore):")
    comp_moles = _calphad.SystemComposition.from_compound_moles(
        [(calcite, 1.5), (diaspore, 2.0)]
    )
    print(comp_moles.report())
    print("-" * 40 + "\n")

    # ---------------------------------------------------------
    # Method 2: Compound Masses (mass proportions of substances)
    # ---------------------------------------------------------
    print("2. Specification by Compound Masses (100.0 g Calcite + 120.0 g Diaspore):")
    comp_masses = _calphad.SystemComposition.from_compound_masses(
        [(calcite, 100.0), (diaspore, 120.0)]
    )
    print(comp_masses.report())
    print("-" * 40 + "\n")

    # ---------------------------------------------------------
    # Method 3: Elemental Moles (mole proportions of elements)
    # ---------------------------------------------------------
    print("3. Specification by Elemental Moles (1.0 mol Ca, 1.0 mol C, 3.0 mol O):")
    elem_moles = _calphad.SystemComposition.from_elemental_moles(
        [("Ca", 1.0), ("C", 1.0), ("O", 3.0)]
    )
    print(elem_moles.report())
    print("-" * 40 + "\n")

    # ---------------------------------------------------------
    # Method 4: Elemental Masses (mass proportions of elements)
    # ---------------------------------------------------------
    print("4. Specification by Elemental Masses (40.078 g Ca, 12.011 g C, 47.997 g O):")
    elem_masses = _calphad.SystemComposition.from_elemental_masses(
        [("Ca", 40.078), ("C", 12.011), ("O", 47.997)]
    )
    print(elem_masses.report())
    print("-" * 40 + "\n")

    # ---------------------------------------------------------
    # Verifying Getters
    # ---------------------------------------------------------
    print("5. Verifying Python API Getters on SystemComposition:")
    print(f"  elements:           {comp_moles.elements}")
    print(f"  fractions:          {comp_moles.fractions}")
    print(f"  input_method:       {comp_moles.input_method}")
    print(f"  input_proportions:  {comp_moles.input_proportions}")
    print("========================================")


if __name__ == "__main__":
    main()
