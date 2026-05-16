---@meta
---@diagnostic disable: undefined-global
---@global Substance   function
---@global MaierKelley function
---@global Range       function
---@global NASA7       function

local calcite = Substance {
    name             = "Calcite",
    molar_volume     = 36.934,
    s0               = 91.780,
    ranges           = {
        Range(
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
        Range(
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
        Range(
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
        Range(
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
    molar_volume     = 24465.402,
    s0               = 213.676,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.356774e+00,
                 8.984597e-03,
                -7.123563e-06,
                 2.459190e-09,
                -1.436995e-13,
                -4.837197e+04,
                 9.901052e+00
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                4.636595e+00,
                 2.741320e-03,
                -9.958285e-07,
                 1.603730e-10,
                -9.161035e-15,
                -4.902493e+04,
                -1.935349e+00
            }
        ),
    },
    elements         = {
        C = 1.0,
        O = 2.0,
    },
    reference        = "NASA/Cantera",
    aggregation_type = "Gas",
}

local h2o = Substance {
    name             = "H2O",
    molar_volume     = 24465.402,
    s0               = 188.726,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.198641e+00,
                -2.036434e-03,
                 6.520402e-06,
                -5.487971e-09,
                 1.771978e-12,
                -3.029373e+04,
                -8.490322e-01
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.677038e+00,
                 2.973183e-03,
                -7.737697e-07,
                 9.443367e-11,
                -4.269010e-15,
                -2.988589e+04,
                 6.882556e+00
            }
        ),
    },
    elements         = {
        H = 2.0,
        O = 1.0,
    },
    reference        = "NASA/Cantera",
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
