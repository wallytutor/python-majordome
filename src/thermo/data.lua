-- Database for thermodynamic species
-- Constructors (MaierKelley, NASA7, Range, Substance) are provided by the Rust host.


local calcite = Substance {
    name = "Calcite",
    molar_mass = 100.087,
    molar_volume = 36.934,
    delta_gf = -1129109.0,
    delta_hf = -1207605.0,
    s0 = 91.780,
    ranges = {
        Range(298.15, 1200.0, MaierKelley(99.72, 0.02692, -2158000.0))
    },
    elements = { Ca = 1.0, C = 1.0, O = 3.0 },
    reference = "Robie et al. (1979)",
    aggregation_type = "Solid",
}


local lime = Substance {
    name = "Lime",
    molar_mass = 56.077,
    molar_volume = 16.760,
    delta_gf = -603296.0,
    delta_hf = -634920.0,
    s0 = 38.100,
    ranges = {
        Range(298.15, 1200.0, MaierKelley(51.86, 0.00244, -937000.0))
    },
    elements = { Ca = 1.0, O = 1.0 },
    reference = "",
    aggregation_type = "Solid",
}


local diaspore = Substance {
    name = "Diaspore",
    molar_mass = 59.988,
    molar_volume = 17.760,
    delta_gf = -922740.0,
    delta_hf = -1001300.0,
    s0 = 35.300,
    ranges = {
        Range(298.15, 1200.0, MaierKelley(49.809839326625806, 0.05858016915762718, -1243143.0926866678))
    },
    elements = { Al = 1.0, H = 1.0, O = 2.0 },
    reference = "",
    aggregation_type = "Solid",
}


local al2o3 = Substance {
    name = "Al2O3",
    molar_mass = 101.96,
    molar_volume = 25.575,
    delta_gf = -1582291.0,
    delta_hf = -1675711.0,
    s0 = 50.917,
    ranges = {
        Range(298.15, 1200.0, MaierKelley(108.74484689911188, 0.02076934906808082, -3319706.5166596076))
    },
    elements = { Al = 2.0, O = 3.0 },
    reference = "",
    aggregation_type = "Solid",
}


local co2 = Substance {
    name = "CO2",
    molar_mass = 44.0098,
    molar_volume = 25.300,
    delta_gf = -394373.0,
    delta_hf = -393510.0,
    s0 = 213.676,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.35677352, 8.98459677e-03, -7.12356269e-06, 2.45919022e-09, -1.43699548e-13, -4.83719697e+04, 9.90105222 }),
        Range(1000.0, 6000.0, NASA7 { 4.63659493, 2.74131991e-03, -9.95828531e-07, 1.60373011e-10, -9.16103468e-15, -4.90249341e+04, -1.93534855 }),
    },
    elements = { C = 1.0, O = 2.0 },
    reference = "NASA/Cantera",
    aggregation_type = "Gas",
}


local h2o = Substance {
    name = "H2O",
    molar_mass = 18.0153,
    molar_volume = 18.070,
    delta_gf = -228583.0,
    delta_hf = -241826.0,
    s0 = 188.726,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.19864056, -2.0364341e-03, 6.52040211e-06, -5.48797062e-09, 1.77197817e-12, -3.02937267e+04, -0.849032208 }),
        Range(1000.0, 6000.0, NASA7 { 2.67703787, 2.97318329e-03, -7.7376969e-07, 9.44336689e-11, -4.26900959e-15, -2.98858938e+04, 6.88255571 }),
    },
    elements = { H = 2.0, O = 1.0 },
    reference = "NASA/Cantera",
    aggregation_type = "Gas",
}


return {
    Calcite = calcite,
    Lime = lime,
    Diaspore = diaspore,
    Al2O3 = al2o3,
    CO2 = co2,
    H2O = h2o,
}
