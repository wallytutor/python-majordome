---@meta
---@diagnostic disable: undefined-global

local calcite = Substance {
  name             = "Calcite",
  molar_volume     = 36.934,
  s0               = 91.780,
  ranges           = {
    TemperatureRange(
      298.15, 1200.00,
      MaierKelley(
         9.972000e+01,
         2.692000e-02,
        -2.158000e+06,
        -1.207605e+06
      )
    )
  },
  elements         = {
    Ca = 1.0,
    C  = 1.0,
    O  = 3.0,
  },
  reference        = "Robie et al. (1979)",
  aggregation_type = "Solid",
}

local lime = Substance {
  name             = "Lime",
  molar_volume     = 16.760,
  s0               = 38.100,
  ranges           = {
    TemperatureRange(
      298.15, 1200.00,
      MaierKelley(
         5.186000e+01,
         2.440000e-03,
        -9.370000e+05,
        -6.349200e+05
      )
    )
  },
  elements         = {
    Ca = 1.0,
    O  = 1.0,
  },
  reference        = "",
  aggregation_type = "Solid",
}

local diaspore = Substance {
  name             = "Diaspore",
  molar_volume     = 17.760,
  s0               = 35.300,
  ranges           = {
    TemperatureRange(
      298.15, 1200.00,
      MaierKelley(
         4.980984e+01,
         5.858017e-02,
        -1.243143e+06,
        -1.001300e+06
      )
    )
  },
  elements         = {
    Al = 1.0,
    H  = 1.0,
    O  = 2.0,
  },
  reference        = "",
  aggregation_type = "Solid",
}

local al2o3 = Substance {
  name             = "Al2O3",
  molar_volume     = 25.575,
  s0               = 50.917,
  ranges           = {
    TemperatureRange(
      298.15, 1200.00,
      MaierKelley(
         1.087448e+02,
         2.076935e-02,
        -3.319707e+06,
        -1.675711e+06
      )
    )
  },
  elements         = {
    Al = 2.0,
    O  = 3.0,
  },
  reference        = "",
  aggregation_type = "Solid",
}

local co2 = Substance {
  name             = "CO2",
  molar_volume     = 0.0,
  s0               = 213.780,
  ranges           = {
    TemperatureRange(
      200.00, 1000.00,
      NASA7(
         2.356773e+00,
         8.984596e-03,
        -7.123562e-06,
         2.459190e-09,
        -1.436995e-13,
        -4.837196e+04,
         9.901052e+00
      )
    ),
    TemperatureRange(
      1000.00, 3500.00,
      NASA7(
         3.857460e+00,
         4.414370e-03,
        -2.214814e-06,
         5.234903e-10,
        -4.720841e-14,
        -4.875916e+04,
         2.271638e+00
      )
    )
  },
  elements         = {
    C = 1.0,
    O = 2.0,
  },
  reference        = "NASA",
  aggregation_type = "Gas",
}

local h2o = Substance {
  name             = "H2O",
  molar_volume     = 0.0,
  s0               = 188.840,
  ranges           = {
    TemperatureRange(
      200.00, 1000.00,
      NASA7(
         4.198640e+00,
        -2.036434e-03,
         6.520406e-06,
        -5.487970e-09,
         1.771978e-12,
        -3.029373e+04,
        -8.490322e-01
      )
    ),
    TemperatureRange(
      1000.00, 3500.00,
      NASA7(
         3.033992e+00,
         2.176918e-03,
        -1.640725e-07,
        -9.704198e-11,
         1.682009e-14,
        -3.000305e+04,
         4.966168e+00
      )
    )
  },
  elements         = {
    H = 2.0,
    O = 1.0,
  },
  reference        = "NASA",
  aggregation_type = "Gas",
}

return {
  Calcite  = calcite,
  Lime     = lime,
  Diaspore = diaspore,
  Al2O3    = al2o3,
  CO2      = co2,
  H2O      = h2o,
}
