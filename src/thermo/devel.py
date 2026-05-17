# -*- coding: utf-8 -*-
import sys
import os

# Add current directory to path so we can import _calphad
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import _calphad


def main():
    print("==================================================")
    print("DEMONSTRATING SPECIES THERMODYNAMIC TABULATION")
    print("==================================================")

    # 1. Load the database to retrieve Substances
    db_path = "data/data.lua"
    loader = _calphad.DatabaseLoader(db_path)
    data = loader.get_data()

    # Get Calcite and Diaspore
    calcite = data["Calcite"]
    diaspore = data["Diaspore"]

    # 2. Tabulate with default bounds and step (100 K)
    print("\n--- 1. Default Tabulation for Calcite ---")
    print(calcite.tabulate())

    # 3. Tabulate with custom bounds and step (e.g. t_min=237.0, t_max=1200.0, step=100.0)
    # This shows the specific requirement: starting at 237, then T_REF (298.15), 300, 400...
    print("\n--- 2. Custom Tabulation for Calcite (T_min = 237 K, T_max = 1200 K, Step = 100 K) ---")
    print(calcite.tabulate(t_min=237.0, t_max=1200.0, step=100.0))

    # 4. Tabulate Diaspore (shows different range bounds)
    print("\n--- 3. Default Tabulation for Diaspore ---")
    print(diaspore.tabulate())

    # 5. Automatic Differentiation Verification
    print("\n==================================================")
    print("DEMONSTRATING AUTOMATIC DIFFERENTIATION (Dual)")
    print("==================================================")

    # Instantiate Dual for temperature at 300 K with deriv = 1.0 (dx/dx)
    t = _calphad.Dual.variable(300.0)

    # Evaluate Gibbs energy using the Substance dynamic method
    g = calcite.gibbs(t)

    # Compute direct entropy at 300.0 K
    s = calcite.entropy(300.0)

    print(f"Gibbs energy of Calcite at T = {t.value:.2f} K (Dual):")
    print(f"  G(T)             = {g.value:.6f} J/mol")
    print(f"  dG/dT (autodiff) = {g.deriv:.6f} J/(mol.K)")
    print(f"  -S(T) (computed) = {-s:.6f} J/(mol.K)")
    print(f"  Difference       = {abs(g.deriv - (-s)):.6e} J/(mol.K)")
    print("==================================================")


if __name__ == "__main__":
    main()
