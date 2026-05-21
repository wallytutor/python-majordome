---@meta
---@diagnostic disable: undefined-global
-- These are provided by the Rust host:
---@global Substance   function
---@global MaierKelley function
---@global Range       function
---@global NASA7       function
--
-- NASA Polynomial Database for thermodynamic species
-- Automatically generated from Cantera YAML data.

local s_AL_cr_ = Substance {
    name             = "AL(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 933.61,
            NASA7 {
                 1.010402e+00,
                 1.207697e-02,
                -2.620836e-05,
                 2.642824e-08,
                -9.019165e-12,
                -6.544542e+02,
                -5.004713e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_AL_L_ = Substance {
    name             = "AL(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            933.61, 6000.00,
            NASA7 {
                 3.818626e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.496518e+01,
                -1.752297e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_ALBr3_s_ = Substance {
    name             = "ALBr3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 370.60,
            NASA7 {
                 5.844796e+00,
                 2.092633e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.417051e+04,
                -1.787690e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Br = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ALBr3_L_ = Substance {
    name             = "ALBr3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            370.60, 5000.00,
            NASA7 {
                 1.502975e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.478373e+04,
                -6.079910e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Br = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_ALCL3_s_ = Substance {
    name             = "ALCL3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 465.70,
            NASA7 {
                 7.809337e+00,
                 1.057098e-02,
                -3.285925e-09,
                 0.000000e+00,
                 0.000000e+00,
                -8.766678e+04,
                -3.450172e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ALCL3_L_ = Substance {
    name             = "ALCL3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            465.70, 5000.00,
            NASA7 {
                 1.509668e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -8.566208e+04,
                -6.521842e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_ALF3_a_ = Substance {
    name             = "ALF3(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 728.00,
            NASA7 {
                -3.083527e+00,
                 7.035032e-02,
                -1.224940e-04,
                 7.624136e-08,
                 1.584369e-12,
                -1.829403e+05,
                 9.357068e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ALF3_b_ = Substance {
    name             = "ALF3(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            728.00, 1000.00,
            NASA7 {
                 9.503450e+00,
                 5.130251e-03,
                -3.711676e-06,
                 1.205236e-09,
                 0.000000e+00,
                -1.846955e+05,
                -4.773615e+01,
            }
        ),
        Range(
            1000.00, 2523.00,
            NASA7 {
                 1.041947e+01,
                 2.337650e-03,
                -8.808308e-07,
                 2.855788e-10,
                -3.460726e-14,
                -1.849220e+05,
                -5.237140e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ALF3_L_ = Substance {
    name             = "ALF3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2523.00, 5000.00,
            NASA7 {
                 1.509668e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.799869e+05,
                -8.004910e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_ALI3_s_ = Substance {
    name             = "ALI3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 464.14,
            NASA7 {
                 8.524160e+00,
                 1.125780e-02,
                 1.644300e-07,
                 0.000000e+00,
                 0.000000e+00,
                -3.947667e+04,
                -2.834460e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        I  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ALI3_L_ = Substance {
    name             = "ALI3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            464.14, 5000.00,
            NASA7 {
                 1.459346e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.916333e+04,
                -5.624832e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        I  = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_ALN_s_ = Substance {
    name             = "ALN(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.545003e+00,
                 2.763225e-02,
                -4.353946e-05,
                 3.309267e-08,
                -9.801052e-12,
                -3.868861e+04,
                 4.649282e+00,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 4.084121e+00,
                 3.188150e-03,
                -1.902976e-06,
                 5.252341e-10,
                -5.513307e-14,
                -3.978184e+04,
                -2.219015e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_AL2O3_a_ = Substance {
    name             = "AL2O3(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -4.913831e+00,
                 7.939844e-02,
                -1.323792e-04,
                 1.044675e-07,
                -3.156633e-11,
                -2.026262e+05,
                 1.547807e+01,
            }
        ),
        Range(
            1000.00, 2327.00,
            NASA7 {
                 1.183367e+01,
                 3.770888e-03,
                -1.786319e-07,
                -5.600881e-10,
                 1.407682e-13,
                -2.057113e+05,
                -6.359983e+01,
            }
        )
    },
    elements         = {
        Al = 2.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_AL2O3_L_ = Substance {
    name             = "AL2O3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2327.00, 6000.00,
            NASA7 {
                 2.314824e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.114052e+05,
                -1.386020e+02,
            }
        )
    },
    elements         = {
        Al = 2.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_AL2SiO5_an_ = Substance {
    name             = "AL2SiO5(an)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -9.286634e+00,
                 1.347672e-01,
                -2.323700e-04,
                 1.876092e-07,
                -5.738148e-11,
                -3.132766e+05,
                 3.271586e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 1.735174e+01,
                 8.743813e-03,
                -3.708472e-06,
                 1.068828e-09,
                -1.176395e-13,
                -3.179415e+05,
                -9.173874e+01,
            }
        )
    },
    elements         = {
        Al = 2.0,
        Si = 1.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_AL6Si2O13_s_ = Substance {
    name             = "AL6Si2O13(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.103467e+01,
                 2.667564e-01,
                -4.152476e-04,
                 3.137697e-07,
                -9.249760e-11,
                -8.256587e+05,
                 3.225479e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 4.523836e+01,
                 2.766142e-02,
                -1.467551e-05,
                 3.888585e-09,
                -3.666048e-13,
                -8.368642e+05,
                -2.373956e+02,
            }
        )
    },
    elements         = {
        Al = 6.0,
        Si = 2.0,
        O  = 13.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_B_b_ = Substance {
    name             = "B(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -1.159317e+00,
                 1.137771e-02,
                -1.069860e-05,
                 2.761064e-09,
                 7.317470e-13,
                -7.133392e+01,
                 4.364399e+00,
            }
        ),
        Range(
            1000.00, 2350.00,
            NASA7 {
                 1.834941e+00,
                 1.791987e-03,
                -7.978795e-07,
                 2.027645e-10,
                -1.920283e-14,
                -7.832029e+02,
                -1.064333e+01,
            }
        )
    },
    elements         = {
        B = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_B_L_ = Substance {
    name             = "B(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2350.00, 6000.00,
            NASA7 {
                 3.818626e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 3.360993e+03,
                -2.073265e+01,
            }
        )
    },
    elements         = {
        B = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BN_s_ = Substance {
    name             = "BN(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -6.928277e-01,
                 1.179844e-02,
                -3.393398e-06,
                -7.141370e-09,
                 4.771621e-12,
                -3.045390e+04,
                 2.413612e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.687399e+00,
                 4.246743e-03,
                -1.928177e-06,
                 3.601707e-10,
                -2.367061e-14,
                -3.146301e+04,
                -1.541877e+01,
            }
        )
    },
    elements         = {
        B = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_B2O3_L_ = Substance {
    name             = "B2O3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.143327e+01,
                -2.157804e-01,
                 6.405799e-04,
                -7.057242e-07,
                 2.650915e-10,
                -1.549014e+05,
                -1.280388e+02,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.560011e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.568445e+05,
                -8.312644e+01,
            }
        )
    },
    elements         = {
        B = 2.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_B3O3H3_cr_ = Substance {
    name             = "B3O3H3(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 8.159514e+00,
                -7.066834e-03,
                 9.249247e-05,
                -1.028339e-07,
                 3.501506e-11,
                -1.545696e+05,
                -2.752540e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                -1.284705e+01,
                 9.195813e-02,
                -8.106094e-05,
                 3.273228e-08,
                -5.016119e-12,
                -1.511097e+05,
                 7.015362e+01,
            }
        )
    },
    elements         = {
        B = 3.0,
        H = 3.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ba_cr_ = Substance {
    name             = "Ba(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.773344e+00,
                 2.037522e-03,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.174338e+02,
                -8.909706e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ba_L_ = Substance {
    name             = "Ba(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.810867e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.920624e+02,
                -2.000276e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BaBr2_s_ = Substance {
    name             = "BaBr2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 8.498223e+00,
                 2.513922e-03,
                 2.439066e-07,
                -2.969544e-10,
                 1.287499e-13,
                -9.378224e+04,
                -3.131273e+01,
            }
        ),
        Range(
            1000.00, 1130.00,
            NASA7 {
                 8.213592e+00,
                 3.114372e-03,
                -2.401163e-07,
                 0.000000e+00,
                 0.000000e+00,
                -9.368498e+04,
                -2.977181e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BaBr2_L_ = Substance {
    name             = "BaBr2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1130.00, 5000.00,
            NASA7 {
                 1.261093e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.293642e+04,
                -5.391667e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BaCL2_a_ = Substance {
    name             = "BaCL2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.720247e+00,
                 6.922418e-03,
                -1.096093e-05,
                 9.699162e-09,
                -2.619844e-12,
                -1.057920e+05,
                -3.076831e+01,
            }
        ),
        Range(
            1000.00, 1198.00,
            NASA7 {
                 1.109640e+01,
                -1.113500e-03,
                -8.180194e-07,
                -2.365138e-10,
                 1.832684e-12,
                -1.069378e+05,
                -4.892675e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BaCL2_b_ = Substance {
    name             = "BaCL2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1198.00, 1235.00,
            NASA7 {
                 1.489559e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.099414e+05,
                -7.527270e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BaCL2_L_ = Substance {
    name             = "BaCL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1235.00, 5000.00,
            NASA7 {
                 1.308397e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.057806e+05,
                -6.081865e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BaF2_a_ = Substance {
    name             = "BaF2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.320329e+00,
                 2.762615e-02,
                -5.943035e-05,
                 6.063015e-08,
                -2.211079e-11,
                -1.474525e+05,
                -1.912192e+01,
            }
        ),
        Range(
            1000.00, 1480.00,
            NASA7 {
                -2.843929e+00,
                -2.199721e-02,
                 4.420106e-05,
                 5.582469e-09,
                -1.390691e-11,
                -1.378992e+05,
                 4.447293e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BaF2_b_c_ = Substance {
    name             = "BaF2(b,c)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1480.00, 1641.00,
            NASA7 {
                 1.294809e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.503318e+05,
                -6.538366e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BaF2_L_ = Substance {
    name             = "BaF2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1641.00, 5000.00,
            NASA7 {
                 1.200655e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.459771e+05,
                -5.670128e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BaO_s_ = Substance {
    name             = "BaO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.920007e+00,
                 8.911565e-03,
                -1.253128e-05,
                 9.186870e-09,
                -2.612907e-12,
                -6.739437e+04,
                -1.584247e+01,
            }
        ),
        Range(
            1000.00, 2286.00,
            NASA7 {
                 5.597057e+00,
                 1.724286e-03,
                -6.024951e-07,
                 1.740002e-10,
                -1.859479e-14,
                -6.771969e+04,
                -2.384852e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BaO_L_ = Substance {
    name             = "BaO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2286.00, 5000.00,
            NASA7 {
                 8.051671e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.322374e+04,
                -3.681860e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BaO2H2_s_ = Substance {
    name             = "BaO2H2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 681.15,
            NASA7 {
                -1.542917e-01,
                 7.510874e-02,
                -1.491507e-04,
                 1.346251e-07,
                -4.271541e-11,
                -1.160355e+05,
                -3.107508e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BaO2H2_L_ = Substance {
    name             = "BaO2H2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            681.15, 5000.00,
            NASA7 {
                 1.695883e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.179750e+05,
                -8.335161e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BaS_s_ = Substance {
    name             = "BaS(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.365868e+00,
                 1.241828e-03,
                 3.980459e-06,
                -6.621543e-09,
                 2.967890e-12,
                -5.743627e+04,
                -2.163810e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 5.909663e+00,
                 1.159356e-03,
                -1.927981e-07,
                 6.660901e-11,
                -8.328041e-15,
                -5.762454e+04,
                -2.471074e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Be_a_ = Substance {
    name             = "Be(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                -1.347749e+00,
                 1.923408e-02,
                -3.541634e-05,
                 3.088951e-08,
                -1.008147e-11,
                -1.964460e+02,
                 4.408358e+00,
            }
        ),
        Range(
            1000.00, 1543.00,
            NASA7 {
                 8.060365e-01,
                 5.373259e-03,
                -4.862418e-06,
                 2.398340e-09,
                -4.371866e-13,
                -4.105251e+02,
                -4.799617e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Be_b_ = Substance {
    name             = "Be(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1543.00, 1563.00,
            NASA7 {
                 3.608150e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -8.522292e+02,
                -2.002910e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Be_L_ = Substance {
    name             = "Be(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1563.00, 6000.00,
            NASA7 {
                 3.545609e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 2.074756e+02,
                -1.895341e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BeAL2O4_s_ = Substance {
    name             = "BeAL2O4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -8.054738e+00,
                 1.135724e-01,
                -1.878273e-04,
                 1.480686e-07,
                -4.480728e-11,
                -2.779804e+05,
                 2.713572e+01,
            }
        ),
        Range(
            1000.00, 2146.00,
            NASA7 {
                 2.026556e+01,
                -1.046665e-02,
                 2.304395e-05,
                -1.549368e-08,
                 3.602494e-12,
                -2.833630e+05,
                -1.074722e+02,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Al = 2.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeAL2O4_L_ = Substance {
    name             = "BeAL2O4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2146.00, 5000.00,
            NASA7 {
                 2.963629e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.805698e+05,
                -1.711695e+02,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Al = 2.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BeBr2_s_ = Substance {
    name             = "BeBr2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.855106e+00,
                 7.299176e-03,
                 1.267804e-06,
                -9.178110e-09,
                 4.830677e-12,
                -4.484048e+04,
                -2.344489e+01,
            }
        ),
        Range(
            1000.00, 1500.00,
            NASA7 {
                -2.271833e+00,
                 3.718508e-02,
                -4.332164e-05,
                 2.305801e-08,
                -4.574964e-12,
                -4.297125e+04,
                 1.670887e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeCL2_s_ = Substance {
    name             = "BeCL2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 688.00,
            NASA7 {
                 3.006575e+00,
                 1.953956e-02,
                -4.891360e-06,
                -2.960416e-08,
                 2.353486e-11,
                -6.072210e+04,
                -1.257977e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeCL2_L_ = Substance {
    name             = "BeCL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            688.00, 5000.00,
            NASA7 {
                 1.460372e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.449842e+04,
                -7.644878e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BeF2_Lqz_ = Substance {
    name             = "BeF2(Lqz)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 500.00,
            NASA7 {
                 2.059377e+01,
                -6.639693e-02,
                -1.203240e-04,
                 8.980056e-07,
                -9.666926e-10,
                -1.269371e+05,
                -9.178511e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeF2_hqz_ = Substance {
    name             = "BeF2(hqz)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            500.00, 825.00,
            NASA7 {
                 5.696558e+00,
                 4.025836e-03,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.252888e+05,
                -2.709139e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeF2_L_ = Substance {
    name             = "BeF2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            825.00, 1000.00,
            NASA7 {
                 7.742336e+00,
                -6.968007e-04,
                 2.674341e-06,
                 3.126254e-09,
                -2.545628e-12,
                -1.254653e+05,
                -3.744030e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 6.048964e+00,
                 4.332850e-03,
                 1.875440e-07,
                -3.601948e-10,
                 9.133882e-14,
                -1.251136e+05,
                -2.902625e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BeI2_s_ = Substance {
    name             = "BeI2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 753.00,
            NASA7 {
                 2.677230e+00,
                 2.692309e-02,
                -2.889520e-05,
                 4.007660e-09,
                 6.405170e-12,
                -2.444697e+04,
                -7.553092e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeI2_L_ = Substance {
    name             = "BeI2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            753.00, 5000.00,
            NASA7 {
                 1.358720e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.599331e+04,
                -6.331357e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BeO_a_ = Substance {
    name             = "BeO(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -3.069952e+00,
                 3.220994e-02,
                -4.851414e-05,
                 3.512631e-08,
                -9.826009e-12,
                -7.332023e+04,
                 1.140950e+01,
            }
        ),
        Range(
            1000.00, 2373.00,
            NASA7 {
                 3.223755e+00,
                 4.892762e-03,
                -3.058326e-06,
                 9.914014e-10,
                -1.234426e-13,
                -7.451408e+04,
                -1.852396e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeO_b_ = Substance {
    name             = "BeO(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2373.00, 2821.22,
            NASA7 {
                 1.239335e+01,
                -1.032231e-02,
                 6.527336e-06,
                -1.730939e-09,
                 1.709865e-13,
                -7.817596e+04,
                -7.054176e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeO_L_ = Substance {
    name             = "BeO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2821.22, 6000.00,
            NASA7 {
                 9.561232e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.420164e+04,
                -5.806354e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_BeO2H2_b_ = Substance {
    name             = "BeO2H2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -7.016832e+00,
                 8.300565e-02,
                -1.415203e-04,
                 1.142166e-07,
                -3.510554e-11,
                -1.095071e+05,
                 2.661606e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_BeS_s_ = Substance {
    name             = "BeS(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -2.873000e+00,
                 3.807870e-02,
                -6.250671e-05,
                 4.890428e-08,
                -1.463858e-11,
                -2.855518e+04,
                 1.184292e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 3.478704e+00,
                 6.510623e-03,
                -4.131404e-06,
                 1.244993e-09,
                -1.382195e-13,
                -2.956653e+04,
                -1.739133e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Be2C_s_ = Substance {
    name             = "Be2C(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 2400.00,
            NASA7 {
                 4.437417e+00,
                 2.569454e-03,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.550732e+04,
                -2.408612e+01,
            }
        )
    },
    elements         = {
        Be = 2.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Be2C_L_ = Substance {
    name             = "Be2C(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2400.00, 5000.00,
            NASA7 {
                 1.107090e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.496964e+04,
                -6.577512e+01,
            }
        )
    },
    elements         = {
        Be = 2.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Br2_cr_ = Substance {
    name             = "Br2(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 265.90,
            NASA7 {
                 9.125460e+00,
                -8.261609e-02,
                 6.998615e-04,
                -2.408431e-06,
                 3.211060e-09,
                -3.304088e+03,
                -3.017280e+01,
            }
        )
    },
    elements         = {
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Br2_L_ = Substance {
    name             = "Br2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            265.90, 332.50,
            NASA7 {
                 1.042529e+01,
                 1.111812e-01,
                -1.068570e-03,
                 3.259766e-06,
                -3.274904e-09,
                -3.506204e+03,
                -4.907571e+01,
            }
        ),
        Range(
            332.50, 6000.00,
            NASA7 {
                 9.056697e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.699880e+03,
                -3.329363e+01,
            }
        )
    },
    elements         = {
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_C_gr_ = Substance {
    name             = "C(gr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -3.108721e-01,
                 4.403537e-03,
                 1.903941e-06,
                -6.385470e-09,
                 2.989642e-12,
                -1.086508e+02,
                 1.113830e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.455718e+00,
                 1.717022e-03,
                -6.975628e-07,
                 1.352770e-10,
                -9.675907e-15,
                -6.951388e+02,
                -8.525830e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_C6H6_L_ = Substance {
    name             = "C6H6(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            278.68, 500.00,
            NASA7 {
                 6.366902e+01,
                -6.005344e-01,
                 2.667928e-03,
                -5.063088e-06,
                 3.639556e-09,
                -1.670855e+03,
                -2.438918e+02,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_C7H8_L_ = Substance {
    name             = "C7H8(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            178.15, 500.00,
            NASA7 {
                 2.936760e+01,
                -1.947227e-01,
                 9.747731e-04,
                -1.914727e-06,
                 1.480970e-09,
                -4.163184e+03,
                -1.120200e+02,
            }
        )
    },
    elements         = {
        C = 7.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_C8H18_L__n_minusocta = Substance {
    name             = "C8H18(L),n-octa",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            220.00, 300.00,
            NASA7 {
                 7.141339e+01,
                -5.020795e-01,
                 1.834199e-03,
                -2.045017e-06,
                 0.000000e+00,
                -4.124372e+04,
                -2.772224e+02,
            }
        )
    },
    elements         = {
        C = 8.0,
        H = 18.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Jet_minusA_L_ = Substance {
    name             = "Jet-A(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            220.00, 550.00,
            NASA7 {
                 1.904961e+01,
                -1.691853e-02,
                 6.302204e-04,
                -1.333658e-06,
                 9.433564e-10,
                -4.480396e+04,
                -6.769020e+01,
            }
        )
    },
    elements         = {
        C = 12.0,
        H = 23.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ca_a_ = Substance {
    name             = "Ca(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 716.00,
            NASA7 {
                 3.033256e+00,
                -1.418001e-03,
                 7.244876e-06,
                -6.687906e-09,
                 2.499039e-12,
                -8.933105e+02,
                -1.201143e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ca_b_ = Substance {
    name             = "Ca(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            716.00, 1115.00,
            NASA7 {
                 5.701118e+00,
                -5.810565e-03,
                 4.022125e-06,
                 0.000000e+00,
                 0.000000e+00,
                -1.516764e+03,
                -2.607581e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ca_L_ = Substance {
    name             = "Ca(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1115.00, 6000.00,
            NASA7 {
                 4.570323e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.822433e+02,
                -2.119886e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CaBr2_s_ = Substance {
    name             = "CaBr2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.269339e+00,
                 2.369780e-02,
                -4.979991e-05,
                 4.670722e-08,
                -1.521610e-11,
                -8.444737e+04,
                -1.965945e+01,
            }
        ),
        Range(
            1000.00, 1015.00,
            NASA7 {
                 6.629971e+00,
                 4.028391e-03,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -8.393967e+04,
                -2.252384e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CaBr2_L_ = Substance {
    name             = "CaBr2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1015.00, 5000.00,
            NASA7 {
                 1.358720e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -8.542874e+04,
                -6.315166e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CaCO3_caL_ = Substance {
    name             = "CaCO3(caL)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                -1.769690e+00,
                 6.188847e-02,
                -8.823801e-05,
                 4.619090e-08,
                -2.987297e-12,
                -1.466918e+05,
                 6.324125e+00,
            }
        ),
        Range(
            1000.00, 1200.00,
            NASA7 {
                 1.443882e+01,
                -1.397778e-03,
                 2.043331e-06,
                 0.000000e+00,
                 0.000000e+00,
                -1.504007e+05,
                -7.284455e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        C  = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CaCL2_s_ = Substance {
    name             = "CaCL2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.355467e+00,
                 1.378431e-02,
                -2.442140e-05,
                 1.955128e-08,
                -4.953417e-12,
                -9.804178e+04,
                -2.681415e+01,
            }
        ),
        Range(
            1000.00, 1045.00,
            NASA7 {
                 8.733241e+00,
                 2.395514e-04,
                 9.446738e-07,
                 4.585186e-10,
                -5.974953e-14,
                -9.830808e+04,
                -3.723667e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CaCL2_L_ = Substance {
    name             = "CaCL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1045.00, 5000.00,
            NASA7 {
                 1.233214e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.802395e+04,
                -5.804747e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CaF2_a_ = Substance {
    name             = "CaF2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -3.915372e-01,
                 5.746647e-02,
                -1.308343e-04,
                 1.327383e-07,
                -4.816416e-11,
                -1.489636e+05,
                -1.917969e+00,
            }
        ),
        Range(
            1000.00, 1424.00,
            NASA7 {
                 1.034399e+00,
                 2.184025e-02,
                -2.047961e-05,
                 1.033820e-08,
                -1.918438e-12,
                -1.480104e+05,
                -2.080489e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CaF2_b_ = Substance {
    name             = "CaF2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1424.00, 1691.00,
            NASA7 {
                 1.428661e+01,
                -1.102494e-03,
                 1.417754e-06,
                -2.812321e-10,
                 0.000000e+00,
                -1.554533e+05,
                -7.918664e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CaF2_L_ = Substance {
    name             = "CaF2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1691.00, 6000.00,
            NASA7 {
                 1.201681e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.479083e+05,
                -6.049280e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CaO_s_ = Substance {
    name             = "CaO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.693769e+00,
                 1.814966e-02,
                -2.837261e-05,
                 2.051354e-08,
                -5.517577e-12,
                -7.748277e+04,
                -9.371008e+00,
            }
        ),
        Range(
            1000.00, 3200.00,
            NASA7 {
                 5.655752e+00,
                 1.016544e-03,
                -2.557690e-07,
                 5.451439e-11,
                -4.257995e-15,
                -7.823838e+04,
                -2.822337e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CaO_L_ = Substance {
    name             = "CaO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            3200.00, 5000.00,
            NASA7 {
                 7.548442e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.117929e+04,
                -3.808395e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CaO2H2_s_ = Substance {
    name             = "CaO2H2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -7.402277e-01,
                 6.756647e-02,
                -1.319128e-04,
                 1.198907e-07,
                -4.061305e-11,
                -1.204354e+05,
                -1.009707e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CaS_s_ = Substance {
    name             = "CaS(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.647556e+00,
                 4.931552e-03,
                -5.530890e-06,
                 3.066396e-09,
                -6.078561e-13,
                -5.847705e+04,
                -2.092271e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 5.653052e+00,
                 1.362587e-03,
                -7.278118e-07,
                 2.498976e-10,
                -3.096813e-14,
                -5.871034e+04,
                -2.590639e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CaSO4_s_ = Substance {
    name             = "CaSO4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 5000.00,
            NASA7 {
                 8.444190e+00,
                 1.187622e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.755324e+05,
                -3.882013e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cr_cr_ = Substance {
    name             = "Cr(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(200.0, 311.5, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=7.8482602400e+00, a4=-1.1627602000e-01, a5=8.1236925100e-04, a6=-2.3080708600e-06, a7=2.3532814200e-09, a8=-8.9801394600e+02, a9=-2.7573313900e+01 }),
        Range(311.5, 1000.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=1.8286347100e+00, a4=4.1956226700e-03, a5=-2.8273508200e-06, a6=-9.1599057800e-10, a7=1.5520304000e-12, a8=-7.0550266300e+02, a9=-8.6980610300e+00 }),
        Range(1000.0, 2130.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=4.5978263700e+00, a4=-4.8179113200e-03, a5=5.8412975400e-06, a6=-2.0703684700e-09, a7=2.8210226800e-13, a8=-1.3148966800e+03, a9=-2.2445474800e+01 })
    },
    elements         = {
        Cr = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cr_L_ = Substance {
    name             = "Cr(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2130.00, 6000.00,
            NASA7 {
                 4.730285e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 5.753592e+02,
                -2.453183e+01,
            }
        )
    },
    elements         = {
        Cr = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CrN_s_ = Substance {
    name             = "CrN(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 9.715290e+00,
                -2.377537e-02,
                 5.256102e-05,
                -4.839075e-08,
                 1.627076e-11,
                -1.632342e+04,
                -4.573005e+01,
            }
        ),
        Range(
            1000.00, 2500.00,
            NASA7 {
                 5.694454e+00,
                 5.301169e-04,
                 2.270583e-07,
                -8.148325e-11,
                 1.080380e-14,
                -1.583600e+04,
                -2.813170e+01,
            }
        )
    },
    elements         = {
        Cr = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cr2N_s_ = Substance {
    name             = "Cr2N(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.030339e+00,
                 3.400644e-02,
                -6.152495e-05,
                 5.314255e-08,
                -1.676952e-11,
                -1.676831e+04,
                -1.160070e+01,
            }
        ),
        Range(
            1000.00, 2500.00,
            NASA7 {
                 8.098418e+00,
                 1.853361e-03,
                 1.422731e-06,
                -5.589639e-10,
                 6.930711e-14,
                -1.768480e+04,
                -3.914747e+01,
            }
        )
    },
    elements         = {
        Cr = 2.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cr2O3_s_ = Substance {
    name             = "Cr2O3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.933277e+01,
                -1.020738e-01,
                 2.360110e-04,
                -2.257802e-07,
                 7.779929e-11,
                -1.424041e+05,
                -1.357428e+02,
            }
        ),
        Range(
            1000.00, 2603.00,
            NASA7 {
                 1.401224e+01,
                 1.382398e-03,
                -2.377923e-07,
                 1.699509e-10,
                -3.770586e-14,
                -1.409822e+05,
                -7.110157e+01,
            }
        )
    },
    elements         = {
        Cr = 2.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cr2O3_L_ = Substance {
    name             = "Cr2O3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2603.00, 5000.00,
            NASA7 {
                 1.887111e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.336950e+05,
                -9.996147e+01,
            }
        )
    },
    elements         = {
        Cr = 2.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Cs_cr_ = Substance {
    name             = "Cs(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            100.00, 301.59,
            NASA7 {
                 3.311572e+00,
                -9.679748e-03,
                 1.199266e-04,
                -5.206081e-07,
                 8.334159e-10,
                -9.808444e+02,
                -8.108669e+00,
            }
        )
    },
    elements         = {
        Cs = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cs_L_ = Substance {
    name             = "Cs(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            301.59, 1000.00,
            NASA7 {
                 3.203581e+00,
                 6.535602e-03,
                -1.886093e-05,
                 1.882625e-08,
                -6.103718e-12,
                -8.613419e+02,
                -8.431004e+00,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 5.115130e+00,
                -3.839703e-03,
                 2.015553e-06,
                 3.642026e-10,
                -5.439745e-14,
                -1.138418e+03,
                -1.705676e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CsCL_a_ = Substance {
    name             = "CsCL(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 743.00,
            NASA7 {
                 5.545340e+00,
                 2.380583e-03,
                 8.357033e-07,
                -9.957164e-10,
                 3.805480e-13,
                -5.502654e+04,
                -2.016426e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CsCL_b_ = Substance {
    name             = "CsCL(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            743.00, 918.00,
            NASA7 {
                 8.161074e+00,
                -1.762357e-03,
                -2.250852e-07,
                 3.930732e-09,
                -2.345234e-12,
                -5.548043e+04,
                -3.394140e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CsCL_L_ = Substance {
    name             = "CsCL(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            918.00, 5000.00,
            NASA7 {
                 9.309745e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -5.503116e+04,
                -4.081013e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CsF_s_ = Substance {
    name             = "CsF(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 976.00,
            NASA7 {
                 5.648999e+00,
                 1.871140e-03,
                 6.624238e-07,
                -6.308487e-10,
                 1.869234e-13,
                -6.848510e+04,
                -2.214996e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CsF_L_ = Substance {
    name             = "CsF(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            976.00, 5000.00,
            NASA7 {
                 8.907162e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.806682e+04,
                -3.991277e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CsOH_a_ = Substance {
    name             = "CsOH(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 410.00,
            NASA7 {
                 5.889461e+00,
                 6.131900e-03,
                 8.607640e-06,
                -1.206147e-08,
                 0.000000e+00,
                -5.220103e+04,
                -2.378401e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CsOH_b_ = Substance {
    name             = "CsOH(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            410.00, 493.00,
            NASA7 {
                 4.921046e+00,
                 1.006551e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -5.186607e+04,
                -1.874381e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CsOH_c_ = Substance {
    name             = "CsOH(c)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            493.00, 588.00,
            NASA7 {
                 1.006445e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -5.244886e+04,
                -4.419315e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CsOH_L_ = Substance {
    name             = "CsOH(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            588.00, 6000.00,
            NASA7 {
                 9.812843e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -5.175247e+04,
                -4.165596e+01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Cs2SO4_II_ = Substance {
    name             = "Cs2SO4(II)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 940.00,
            NASA7 {
                -2.978931e+00,
                 1.265088e-01,
                -2.955321e-04,
                 3.320731e-07,
                -1.310499e-10,
                -1.762335e+05,
                 1.518575e+01,
            }
        )
    },
    elements         = {
        Cs = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cs2SO4_I_ = Substance {
    name             = "Cs2SO4(I)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            940.00, 1000.00,
            NASA7 {
                 4.734984e+00,
                 1.861960e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.715414e+05,
                 1.373705e-01,
            }
        ),
        Range(
            1000.00, 1278.00,
            NASA7 {
                -2.723272e-02,
                 3.135404e-02,
                -1.130053e-05,
                 3.328311e-09,
                 0.000000e+00,
                -1.702116e+05,
                 2.483999e+01,
            }
        )
    },
    elements         = {
        Cs = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cs2SO4_L_ = Substance {
    name             = "Cs2SO4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1278.00, 5000.00,
            NASA7 {
                 2.485920e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.777620e+05,
                -1.166574e+02,
            }
        )
    },
    elements         = {
        Cs = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Cu_cr_ = Substance {
    name             = "Cu(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.766721e+00,
                 7.346994e-03,
                -1.547130e-05,
                 1.505396e-08,
                -5.248613e-12,
                -7.438821e+02,
                -7.704540e+00,
            }
        ),
        Range(
            1000.00, 1358.00,
            NASA7 {
                 3.420089e+00,
                -1.612014e-03,
                 3.051459e-06,
                -2.111628e-09,
                 6.998584e-13,
                -9.902956e+02,
                -1.519323e+01,
            }
        )
    },
    elements         = {
        Cu = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cu_L_ = Substance {
    name             = "Cu(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1358.00, 6000.00,
            NASA7 {
                 3.944911e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.106347e+02,
                -1.835857e+01,
            }
        )
    },
    elements         = {
        Cu = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CuF_s_ = Substance {
    name             = "CuF(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.442129e+00,
                 7.966908e-03,
                -7.280731e-06,
                 2.763777e-09,
                -2.731884e-13,
                -3.533617e+04,
                -1.958517e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 5.321551e+00,
                 4.854983e-03,
                -3.544005e-06,
                 1.110902e-09,
                -1.245372e-13,
                -3.552171e+04,
                -2.390264e+01,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CuF2_s_ = Substance {
    name             = "CuF2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.387368e+00,
                 1.439711e-02,
                -8.621350e-06,
                -1.983045e-09,
                 2.689674e-12,
                -6.668559e+04,
                -1.958056e+01,
            }
        ),
        Range(
            1000.00, 1109.00,
            NASA7 {
                 2.355768e+00,
                 1.491351e-02,
                -6.399519e-06,
                 0.000000e+00,
                 0.000000e+00,
                -6.561062e+04,
                -7.162676e+00,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CuF2_L_ = Substance {
    name             = "CuF2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1109.00, 5000.00,
            NASA7 {
                 1.207751e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.348800e+04,
                -5.673037e+01,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_CuO_s_ = Substance {
    name             = "CuO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 8.840387e-01,
                 2.415885e-02,
                -4.389414e-05,
                 3.758618e-08,
                -1.208827e-11,
                -1.978838e+04,
                -5.472388e+00,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 5.025812e+00,
                 2.542408e-03,
                -1.376829e-06,
                 5.349283e-10,
                -7.966428e-14,
                -2.043328e+04,
                -2.437670e+01,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CuO2H2_s_ = Substance {
    name             = "CuO2H2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.045119e+01,
                 1.345820e-03,
                 8.660234e-06,
                -6.809235e-09,
                 7.443586e-13,
                -5.740686e+04,
                -4.723880e+01,
            }
        ),
        Range(
            1000.00, 1500.00,
            NASA7 {
                 8.673079e+00,
                 1.038576e-02,
                -4.699484e-06,
                -5.029251e-10,
                 5.359316e-13,
                -5.723038e+04,
                -3.936616e+01,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_CuSO4_s_ = Substance {
    name             = "CuSO4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.301917e+00,
                 3.701232e-02,
                -2.899080e-05,
                 4.531405e-09,
                 2.638844e-12,
                -9.499362e+04,
                -1.546588e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 1.131454e+01,
                 1.405035e-02,
                -1.006357e-05,
                 3.720422e-09,
                -5.280591e-13,
                -9.699821e+04,
                -5.625469e+01,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cu2O_s_ = Substance {
    name             = "Cu2O(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.383247e+00,
                 2.295418e-02,
                -3.954230e-05,
                 3.402040e-08,
                -1.104381e-11,
                -2.227316e+04,
                -1.353071e+01,
            }
        ),
        Range(
            1000.00, 1516.72,
            NASA7 {
                 1.475564e+01,
                -1.587666e-02,
                 1.497119e-05,
                -4.484026e-09,
                 4.055601e-13,
                -2.506507e+04,
                -7.054188e+01,
            }
        )
    },
    elements         = {
        Cu = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Cu2O_L_ = Substance {
    name             = "Cu2O(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1516.72, 5000.00,
            NASA7 {
                 1.201712e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.925239e+04,
                -5.688687e+01,
            }
        )
    },
    elements         = {
        Cu = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Cu2O5S_s_ = Substance {
    name             = "Cu2O5S(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.525718e+00,
                 7.220596e-02,
                -9.785567e-05,
                 6.543250e-08,
                -1.674445e-11,
                -1.147865e+05,
                -1.319611e+01,
            }
        ),
        Range(
            1000.00, 1500.00,
            NASA7 {
                 1.601163e+01,
                 1.942467e-02,
                -1.844825e-05,
                 1.118720e-08,
                -2.611198e-12,
                -1.176162e+05,
                -7.872749e+01,
            }
        )
    },
    elements         = {
        Cu = 2.0,
        O  = 5.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Fe_a_ = Substance {
    name             = "Fe(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(200.0, 1000.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=2.4133747600e+00, a4=-1.5778074400e-03, a5=2.1470133900e-05, a6=-3.8017143800e-08, a7=2.2042698400e-11, a8=-7.7438099800e+02, a9=-1.0656029600e+01 }),
        Range(1000.0, 1042.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=4.6908017300e+03, a4=-9.9065999100e+00, a5=2.6942744600e-03, a6=5.5444532100e-06, a7=-3.0165982300e-09, a8=-1.4154758600e+06, a9=-2.4929438700e+04 }),
        Range(1042.0, 1184.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=6.5967880900e+02, a4=-1.1405821700e+00, a5=4.9630699700e-04, a6=0.0000000000e+00, a7=0.0000000000e+00, a8=-2.5210680200e+05, a9=-3.6566523600e+03 })
    },
    elements         = {
        Fe = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Fe_c_ = Substance {
    name             = "Fe(c)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1184.00, 1665.00,
            NASA7 {
                 6.101100e+01,
                -1.609451e-01,
                 1.683695e-04,
                -7.745637e-08,
                 1.330913e-11,
                -1.653355e+04,
                -3.137107e+02,
            }
        )
    },
    elements         = {
        Fe = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Fe_d_ = Substance {
    name             = "Fe(d)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1665.00, 1809.00,
            NASA7 {
                -4.359047e+02,
                 7.684894e-01,
                -4.468989e-04,
                 8.670709e-08,
                 0.000000e+00,
                 1.879255e+05,
                 2.450576e+03,
            }
        )
    },
    elements         = {
        Fe = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Fe_L_ = Substance {
    name             = "Fe(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1809.00, 6000.00,
            NASA7 {
                 5.535383e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.274289e+03,
                -2.947723e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_FeC5O5_L_ = Substance {
    name             = "FeC5O5(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 5000.00,
            NASA7 {
                 2.811845e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.005248e+05,
                -1.196654e+02,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        C  = 5.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_FeCL2_s_ = Substance {
    name             = "FeCL2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 950.00,
            NASA7 {
                 7.112227e+00,
                 1.108695e-02,
                -1.707274e-05,
                 1.351582e-08,
                -4.136504e-12,
                -4.360099e+04,
                -2.899405e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_FeCL2_L_ = Substance {
    name             = "FeCL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            950.00, 5000.00,
            NASA7 {
                 1.228886e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.110982e+04,
                -5.319306e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_FeCL3_s_ = Substance {
    name             = "FeCL3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 577.00,
            NASA7 {
                -7.395569e+00,
                 2.026084e-01,
                -8.445059e-04,
                 1.592866e-06,
                -1.079893e-09,
                -5.001447e+04,
                 2.444509e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_FeCL3_L_ = Substance {
    name             = "FeCL3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            577.00, 6000.00,
            NASA7 {
                 1.610313e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.841353e+04,
                -6.757590e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_FeO_s_ = Substance {
    name             = "FeO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.319547e+00,
                 2.209659e-03,
                 1.072177e-06,
                -2.792973e-09,
                 1.332073e-12,
                -3.440717e+04,
                -2.368603e+01,
            }
        ),
        Range(
            1000.00, 1650.00,
            NASA7 {
                 5.831649e+00,
                 1.427516e-03,
                -9.320814e-08,
                -6.599776e-12,
                -2.251214e-14,
                -3.456690e+04,
                -2.644699e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_FeO_L_ = Substance {
    name             = "FeO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1650.00, 5000.00,
            NASA7 {
                 8.202248e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.384861e+04,
                -4.007913e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Fe_OH_2_s_ = Substance {
    name             = "Fe(OH)2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.009122e+01,
                 4.452314e-03,
                 4.066685e-06,
                -4.009453e-09,
                 2.394716e-13,
                -7.227769e+04,
                -4.840003e+01,
            }
        ),
        Range(
            1000.00, 1500.00,
            NASA7 {
                 7.403181e+00,
                 1.198174e-02,
                -1.495761e-06,
                -5.052636e-09,
                 2.003711e-12,
                -7.159227e+04,
                -3.467327e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Fe_OH_3_s_ = Substance {
    name             = "Fe(OH)3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.411684e+00,
                 3.268246e-02,
                -2.239381e-05,
                 2.864679e-09,
                 2.262232e-12,
                -1.027183e+05,
                -2.133101e+01,
            }
        ),
        Range(
            1000.00, 1500.00,
            NASA7 {
                 8.022393e+00,
                 1.642013e-02,
                -1.236938e-07,
                -6.819284e-09,
                 2.327691e-12,
                -1.032134e+05,
                -3.793402e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        O  = 3.0,
        H  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_FeS_a_ = Substance {
    name             = "FeS(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 411.00,
            NASA7 {
                 1.897763e+01,
                -1.095428e-01,
                 2.218602e-04,
                 0.000000e+00,
                 0.000000e+00,
                -1.499524e+04,
                -7.812543e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_FeS_b_ = Substance {
    name             = "FeS(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            411.00, 598.00,
            NASA7 {
                 8.702851e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.468974e+04,
                -4.208210e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_FeS_c_ = Substance {
    name             = "FeS(c)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            598.00, 1000.00,
            NASA7 {
                 9.372418e+00,
                 9.416206e-04,
                -1.582986e-05,
                 1.838088e-08,
                -5.770707e-12,
                -1.458168e+04,
                -4.514152e+01,
            }
        ),
        Range(
            1000.00, 1463.00,
            NASA7 {
                -2.683048e+00,
                 3.676510e-02,
                -5.218227e-05,
                 3.160717e-08,
                -6.412604e-12,
                -1.149868e+04,
                 1.623912e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_FeS_L_ = Substance {
    name             = "FeS(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1463.00, 5000.00,
            NASA7 {
                 7.523281e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.016424e+04,
                -3.197093e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_FeSO4_s_ = Substance {
    name             = "FeSO4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.505768e+00,
                 3.702970e-02,
                -2.903353e-05,
                 4.577859e-09,
                 2.620209e-12,
                -1.141625e+05,
                -1.522324e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 1.160893e+01,
                 1.380470e-02,
                -9.812638e-06,
                 3.608781e-09,
                -5.097628e-13,
                -1.161919e+05,
                -5.647782e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_FeS2_s_ = Substance {
    name             = "FeS2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.034566e-01,
                 4.267468e-02,
                -8.403063e-05,
                 7.630144e-08,
                -2.543232e-11,
                -2.204593e+04,
                -5.545639e+00,
            }
        ),
        Range(
            1000.00, 1400.00,
            NASA7 {
                -8.851532e+01,
                 3.274893e-01,
                -4.105744e-04,
                 2.292815e-07,
                -4.776442e-11,
                -4.651248e+02,
                 4.417305e+02,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        S  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Fe2O3_s_ = Substance {
    name             = "Fe2O3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -7.703784e+00,
                 1.364747e-01,
                -3.290566e-04,
                 3.815048e-07,
                -1.631028e-10,
                -1.008008e+05,
                 2.529209e+01,
            }
        ),
        Range(
            1000.00, 2500.00,
            NASA7 {
                 4.049753e+01,
                -4.613160e-02,
                 3.182641e-05,
                -8.922633e-09,
                 8.465542e-13,
                -1.131763e+05,
                -2.163509e+02,
            }
        )
    },
    elements         = {
        Fe = 2.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Fe2S3O12_s_ = Substance {
    name             = "Fe2S3O12(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.111696e+01,
                 8.370678e-02,
                -4.136507e-05,
                -2.527922e-08,
                 2.104144e-11,
                -3.172978e+05,
                -4.928875e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 3.911444e+01,
                 1.179633e-02,
                -3.387101e-08,
                -2.297040e-09,
                 6.410199e-13,
                -3.247826e+05,
                -1.940043e+02,
            }
        )
    },
    elements         = {
        Fe = 2.0,
        S  = 3.0,
        O  = 12.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Fe3O4_s_ = Substance {
    name             = "Fe3O4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.619815e+01,
                -1.743798e-01,
                 5.247567e-04,
                -5.423822e-07,
                 1.799620e-10,
                -1.413873e+05,
                -1.555668e+02,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.413372e+01,
                 4.159223e-05,
                -2.633149e-08,
                 6.603509e-12,
                -5.692468e-16,
                -1.412105e+05,
                -1.200641e+02,
            }
        )
    },
    elements         = {
        Fe = 3.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_H2O_s_ = Substance {
    name             = "H2O(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 273.15,
            NASA7 {
                 5.296780e+00,
                -6.757492e-02,
                 5.169421e-04,
                -1.438534e-06,
                 1.525648e-09,
                -3.622666e+04,
                -1.792204e+01,
            }
        )
    },
    elements         = {
        H = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_H2O_L_ = Substance {
    name             = "H2O(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            273.15, 600.00,
            NASA7 {
                 7.255750e+01,
                -6.624454e-01,
                 2.561987e-03,
                -4.365919e-06,
                 2.781790e-09,
                -4.188655e+04,
                -2.882801e+02,
            }
        )
    },
    elements         = {
        H = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_H2SO4_L_ = Substance {
    name             = "H2SO4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 9.942153e+00,
                 2.178637e-02,
                 3.497446e-06,
                -3.354886e-09,
                 1.169959e-12,
                -1.018598e+05,
                -4.439869e+01,
            }
        )
    },
    elements         = {
        H = 2.0,
        S = 1.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Hg_cr_ = Substance {
    name             = "Hg(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 234.29,
            NASA7 {
                 2.431034e+00,
                 4.246467e-03,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.178868e+03,
                -7.112481e+00,
            }
        )
    },
    elements         = {
        Hg = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Hg_L_ = Substance {
    name             = "Hg(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            234.29, 1000.00,
            NASA7 {
                 3.796852e+00,
                -2.090261e-03,
                 2.222671e-06,
                -1.086057e-10,
                -4.280872e-13,
                -1.058346e+03,
                -1.196269e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 3.036535e+00,
                 3.160067e-04,
                 6.439012e-08,
                -2.923070e-11,
                 4.868609e-15,
                -8.881705e+02,
                -8.172430e+00,
            }
        )
    },
    elements         = {
        Hg = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_HgBr2_s_ = Substance {
    name             = "HgBr2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 514.00,
            NASA7 {
                 8.282971e+00,
                 1.630236e-03,
                 3.422988e-06,
                 7.096199e-10,
                -4.335386e-12,
                -2.295244e+04,
                -2.734528e+01,
            }
        )
    },
    elements         = {
        Hg = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_HgBr2_L_ = Substance {
    name             = "HgBr2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            514.00, 5000.00,
            NASA7 {
                 1.227880e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.250090e+04,
                -4.685121e+01,
            }
        )
    },
    elements         = {
        Hg = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_HgO_s_ = Substance {
    name             = "HgO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.417087e+00,
                 7.116057e-03,
                -1.489700e-06,
                -4.491355e-09,
                 2.593792e-12,
                -1.223327e+04,
                -1.303718e+01,
            }
        )
    },
    elements         = {
        Hg = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_I2_cr_ = Substance {
    name             = "I2(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 386.75,
            NASA7 {
                -1.057577e+01,
                 2.269057e-01,
                -1.124616e-03,
                 2.416785e-06,
                -1.849014e-09,
                -8.997216e+02,
                 3.885990e+01,
            }
        )
    },
    elements         = {
        I = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_I2_L_ = Substance {
    name             = "I2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            386.75, 6000.00,
            NASA7 {
                 9.568213e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.204519e+03,
                -3.637339e+01,
            }
        )
    },
    elements         = {
        I = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_K_cr_ = Substance {
    name             = "K(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 336.86,
            NASA7 {
                -2.089511e+00,
                 6.163202e-02,
                -2.407319e-04,
                 3.272558e-07,
                 0.000000e+00,
                -6.360981e+02,
                 9.117369e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K_L_ = Substance {
    name             = "K(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            336.86, 1000.00,
            NASA7 {
                 4.229106e+00,
                -7.068855e-04,
                -2.129658e-06,
                 3.362273e-09,
                -1.059026e-12,
                -9.451175e+02,
                -1.523401e+01,
            }
        ),
        Range(
            1000.00, 2200.00,
            NASA7 {
                 4.649549e+00,
                -2.791741e-03,
                 1.808363e-06,
                 3.412449e-11,
                -4.487822e-15,
                -1.014678e+03,
                -1.717673e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_KCN_s_ = Substance {
    name             = "KCN(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 895.00,
            NASA7 {
                 8.179973e+00,
                -1.401078e-03,
                 3.423772e-06,
                -3.496174e-09,
                 1.305278e-12,
                -1.604820e+04,
                -3.094452e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        C = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_KCN_L_ = Substance {
    name             = "KCN(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            895.00, 5000.00,
            NASA7 {
                 9.058131e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.522672e+04,
                -3.545408e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        C = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_KCL_s_ = Substance {
    name             = "KCL(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.393431e+00,
                 2.653524e-03,
                 9.607565e-07,
                -5.025184e-09,
                 4.072123e-12,
                -5.424839e+04,
                -2.159681e+01,
            }
        ),
        Range(
            1000.00, 1044.00,
            NASA7 {
                 3.915717e+00,
                -2.092727e-03,
                 4.731018e-06,
                 7.015254e-09,
                -5.514610e-12,
                -5.274707e+04,
                -1.014480e+01,
            }
        )
    },
    elements         = {
        K  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_KCL_L_ = Substance {
    name             = "KCL(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1044.00, 5000.00,
            NASA7 {
                 8.851806e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -5.336948e+04,
                -4.001006e+01,
            }
        )
    },
    elements         = {
        K  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_KF_s_ = Substance {
    name             = "KF(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.984397e+00,
                 3.594319e-03,
                -1.769640e-06,
                -4.810614e-10,
                 1.028073e-12,
                -7.001815e+04,
                -2.138450e+01,
            }
        ),
        Range(
            1000.00, 1131.00,
            NASA7 {
                 9.462778e+00,
                -6.405751e-03,
                 6.391326e-08,
                 7.594959e-09,
                -3.359810e-12,
                -7.124911e+04,
                -4.483180e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_KF_L_ = Substance {
    name             = "KF(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1131.00, 5000.00,
            NASA7 {
                 8.655547e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.926802e+04,
                -4.117993e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_KHF2_a_ = Substance {
    name             = "KHF2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 469.85,
            NASA7 {
                -9.129850e+00,
                 8.661889e-02,
                 4.390441e-05,
                -6.686760e-07,
                 8.045416e-10,
                -1.125826e+05,
                 4.108280e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        H = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_KHF2_b_ = Substance {
    name             = "KHF2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            469.85, 511.95,
            NASA7 {
                 1.205738e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.145713e+05,
                -5.417014e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        H = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_KHF2_L_ = Substance {
    name             = "KHF2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            511.95, 6000.00,
            NASA7 {
                 1.258074e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.140431e+05,
                -5.587991e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        H = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_KOH_a_ = Substance {
    name             = "KOH(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 516.00,
            NASA7 {
                 6.440098e+00,
                 1.131017e-03,
                 1.507327e-05,
                -1.490612e-08,
                 1.055633e-11,
                -5.316190e+04,
                -2.809885e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        O = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_KOH_b_ = Substance {
    name             = "KOH(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            516.00, 679.00,
            NASA7 {
                 9.460714e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -5.329165e+04,
                -4.336933e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        O = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_KOH_L_ = Substance {
    name             = "KOH(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            679.00, 5000.00,
            NASA7 {
                 9.995647e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -5.262073e+04,
                -4.533439e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        O = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_KO2_s_ = Substance {
    name             = "KO2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.877549e+00,
                 3.015703e-02,
                -5.118225e-05,
                 4.163387e-08,
                -1.307296e-11,
                -3.634073e+04,
                -1.441903e+01,
            }
        ),
        Range(
            1000.00, 1500.00,
            NASA7 {
                -1.049455e+01,
                 6.885899e-02,
                -8.140231e-05,
                 4.294769e-08,
                -8.496583e-12,
                -3.248999e+04,
                 5.968591e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2CO3_s_ = Substance {
    name             = "K2CO3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 8.439863e+00,
                 1.883626e-02,
                -4.682748e-07,
                -1.051961e-08,
                 6.431841e-12,
                -1.416674e+05,
                -3.489442e+01,
            }
        ),
        Range(
            1000.00, 1174.00,
            NASA7 {
                 2.282434e+01,
                -1.358099e-02,
                 8.740989e-06,
                 1.149443e-08,
                -6.758815e-12,
                -1.457784e+05,
                -1.104866e+02,
            }
        )
    },
    elements         = {
        K = 2.0,
        C = 1.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2CO3_L_ = Substance {
    name             = "K2CO3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1174.00, 5000.00,
            NASA7 {
                 2.516147e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.474014e+05,
                -1.311073e+02,
            }
        )
    },
    elements         = {
        K = 2.0,
        C = 1.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_K2O_s_ = Substance {
    name             = "K2O(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.430399e-01,
                 6.206377e-02,
                -1.362311e-04,
                 1.363770e-07,
                -4.901639e-11,
                -4.561259e+04,
                -4.759035e+00,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 7.187026e+00,
                 9.114924e-03,
                -4.180669e-06,
                 1.798983e-09,
                -2.839413e-13,
                -4.600094e+04,
                -3.174498e+01,
            }
        )
    },
    elements         = {
        K = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2O2_s_ = Substance {
    name             = "K2O2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 8.826742e+00,
                 1.326213e-02,
                -1.114396e-05,
                 1.095886e-08,
                -4.241016e-12,
                -6.277353e+04,
                -4.025143e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 1.048163e+01,
                 6.908618e-03,
                 4.865670e-07,
                -2.549027e-10,
                 4.083862e-14,
                -6.318143e+04,
                -4.847729e+01,
            }
        )
    },
    elements         = {
        K = 2.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2S_1_ = Substance {
    name             = "K2S(1)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.136443e+01,
                -1.881066e-01,
                 5.600573e-04,
                -6.970355e-07,
                 3.124909e-10,
                -4.999741e+04,
                -1.281045e+02,
            }
        ),
        Range(
            1000.00, 1050.00,
            NASA7 {
                -7.484934e+01,
                 9.361980e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.721794e+03,
                 4.496739e+02,
            }
        )
    },
    elements         = {
        K = 2.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2S_2_ = Substance {
    name             = "K2S(2)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1050.00, 1100.00,
            NASA7 {
                 1.564282e+02,
                -1.266444e-01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.311442e+05,
                -9.279428e+02,
            }
        )
    },
    elements         = {
        K = 2.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2S_3_ = Substance {
    name             = "K2S(3)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1100.00, 1221.00,
            NASA7 {
                 1.711987e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -5.452495e+04,
                -9.166651e+01,
            }
        )
    },
    elements         = {
        K = 2.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2S_L_ = Substance {
    name             = "K2S(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1221.00, 5000.00,
            NASA7 {
                 1.214293e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.652035e+04,
                -5.471604e+01,
            }
        )
    },
    elements         = {
        K = 2.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_K2SO4_a_ = Substance {
    name             = "K2SO4(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 857.00,
            NASA7 {
                 1.702653e+00,
                 8.470971e-02,
                -1.763257e-04,
                 1.928280e-07,
                -7.647089e-11,
                -1.759809e+05,
                -7.563195e+00,
            }
        )
    },
    elements         = {
        K = 2.0,
        S = 1.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2SO4_b_ = Substance {
    name             = "K2SO4(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            857.00, 1000.00,
            NASA7 {
                 1.380718e+01,
                 9.673059e-03,
                 4.565855e-08,
                 0.000000e+00,
                 0.000000e+00,
                -1.758533e+05,
                -5.844130e+01,
            }
        ),
        Range(
            1000.00, 1342.00,
            NASA7 {
                -2.901987e+02,
                 1.056963e+00,
                -1.347530e-03,
                 7.676658e-07,
                -1.633744e-10,
                -1.055421e+05,
                 1.453009e+03,
            }
        )
    },
    elements         = {
        K = 2.0,
        S = 1.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_K2SO4_L_ = Substance {
    name             = "K2SO4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1342.00, 5000.00,
            NASA7 {
                 2.423050e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.769552e+05,
                -1.174022e+02,
            }
        )
    },
    elements         = {
        K = 2.0,
        S = 1.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Li_cr_ = Substance {
    name             = "Li(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 453.69,
            NASA7 {
                 6.109099e-01,
                 1.410412e-02,
                -1.749582e-05,
                -3.337410e-08,
                 7.766297e-11,
                -6.251212e+02,
                -3.264499e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Li_L_ = Substance {
    name             = "Li(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            453.69, 1000.00,
            NASA7 {
                 4.622666e+00,
                -4.061642e-03,
                 5.916662e-06,
                -4.249601e-09,
                 1.235175e-12,
                -9.588113e+02,
                -2.127785e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 3.893142e+00,
                -8.427877e-04,
                 4.455463e-07,
                -3.653375e-11,
                 3.892792e-15,
                -8.220196e+02,
                -1.781831e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_LiALO2_s_ = Substance {
    name             = "LiALO2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -5.284116e+00,
                 7.845259e-02,
                -1.454158e-04,
                 1.246296e-07,
                -4.011370e-11,
                -1.438183e+05,
                 1.857673e+01,
            }
        ),
        Range(
            1000.00, 1973.00,
            NASA7 {
                 8.544089e+00,
                 6.488679e-03,
                -4.086397e-06,
                 1.547147e-09,
                -2.249504e-13,
                -1.459815e+05,
                -4.459062e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        Al = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_LiALO2_L_ = Substance {
    name             = "LiALO2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1973.00, 5000.00,
            NASA7 {
                 1.509668e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.416584e+05,
                -8.099377e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        Al = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_LiCL_s_ = Substance {
    name             = "LiCL(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 883.00,
            NASA7 {
                 4.109525e+00,
                 8.198100e-03,
                -1.154187e-05,
                 1.058539e-08,
                -3.645702e-12,
                -5.060827e+04,
                -1.829889e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_LiCL_L_ = Substance {
    name             = "LiCL(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            883.00, 1000.00,
            NASA7 {
                 1.038303e+01,
                -4.717970e-03,
                -1.613832e-06,
                 8.080717e-09,
                -4.445949e-12,
                -5.053912e+04,
                -4.992196e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 8.214948e+00,
                 5.639136e-04,
                -1.735033e-06,
                 7.659501e-10,
                -1.237848e-13,
                -5.000732e+04,
                -3.880896e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_LiF_s_ = Substance {
    name             = "LiF(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.769432e+00,
                 1.750522e-02,
                -2.803875e-05,
                 2.289338e-08,
                -6.963366e-12,
                -7.529928e+04,
                -9.947806e+00,
            }
        ),
        Range(
            1000.00, 1121.30,
            NASA7 {
                 5.540574e+00,
                -1.342108e-04,
                 1.782561e-06,
                 8.899644e-10,
                -9.129665e-13,
                -7.590037e+04,
                -2.744728e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_LiF_L_ = Substance {
    name             = "LiF(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1121.30, 5000.00,
            NASA7 {
                 7.719540e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.430435e+04,
                -3.881549e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_LiH_s_ = Substance {
    name             = "LiH(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 961.80,
            NASA7 {
                 3.861181e-01,
                 1.212796e-02,
                -8.690034e-06,
                 5.631156e-09,
                -1.269348e-12,
                -1.148699e+04,
                -3.065457e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_LiH_L_ = Substance {
    name             = "LiH(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            961.80, 5000.00,
            NASA7 {
                 7.498119e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.158183e+04,
                -4.004728e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_LiOH_s_ = Substance {
    name             = "LiOH(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 744.30,
            NASA7 {
                 6.322780e-01,
                 2.534054e-02,
                -2.789795e-05,
                 8.692589e-09,
                 4.149989e-12,
                -5.941268e+04,
                -4.838270e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_LiOH_L_ = Substance {
    name             = "LiOH(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            744.30, 5000.00,
            NASA7 {
                 1.047422e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.018567e+04,
                -5.389714e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Li2O_s_ = Substance {
    name             = "Li2O(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -3.172724e-01,
                 3.614936e-02,
                -5.545592e-05,
                 4.179644e-08,
                -1.180405e-11,
                -7.310620e+04,
                -2.288833e+00,
            }
        ),
        Range(
            1000.00, 1843.00,
            NASA7 {
                 4.277478e+00,
                 7.852167e-03,
                -5.222509e-07,
                -1.786443e-09,
                 5.396103e-13,
                -7.339628e+04,
                -2.176550e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Li2O_L_ = Substance {
    name             = "Li2O(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1843.00, 5000.00,
            NASA7 {
                 1.207693e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.133792e+04,
                -6.517497e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Li2SO4_a_ = Substance {
    name             = "Li2SO4(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 848.00,
            NASA7 {
                -4.138736e+00,
                 1.069406e-01,
                -2.093461e-04,
                 2.128928e-07,
                -8.016251e-11,
                -1.748068e+05,
                 1.298358e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Li2SO4_b_ = Substance {
    name             = "Li2SO4(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            848.00, 1000.00,
            NASA7 {
                 2.579548e+01,
                -2.846251e-04,
                 1.533011e-07,
                 0.000000e+00,
                 0.000000e+00,
                -1.803084e+05,
                -1.363122e+02,
            }
        ),
        Range(
            1000.00, 1132.00,
            NASA7 {
                 2.610265e+01,
                -8.293047e-04,
                 3.908107e-07,
                 0.000000e+00,
                 0.000000e+00,
                -1.804224e+05,
                -1.380081e+02,
            }
        )
    },
    elements         = {
        Li = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Li2SO4_L_ = Substance {
    name             = "Li2SO4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1132.00, 6000.00,
            NASA7 {
                 2.465791e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.780978e+05,
                -1.276262e+02,
            }
        )
    },
    elements         = {
        Li = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Li3N_s_ = Substance {
    name             = "Li3N(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.922556e+00,
                 2.859870e-02,
                -3.533695e-05,
                 3.186199e-08,
                -1.109350e-11,
                -2.167803e+04,
                -1.633106e+01,
            }
        ),
        Range(
            1000.00, 1300.00,
            NASA7 {
                 5.442250e+00,
                 1.347774e-02,
                -1.942232e-06,
                -2.496011e-11,
                 0.000000e+00,
                -2.201578e+04,
                -2.745727e+01,
            }
        )
    },
    elements         = {
        Li = 3.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Mg_cr_ = Substance {
    name             = "Mg(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 923.00,
            NASA7 {
                 1.478849e+00,
                 9.274305e-03,
                -1.950508e-05,
                 1.982155e-08,
                -7.049274e-12,
                -7.166493e+02,
                -6.572227e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Mg_L_ = Substance {
    name             = "Mg(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            923.00, 6000.00,
            NASA7 {
                 4.125318e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.589343e+02,
                -1.937869e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgAL2O4_s_ = Substance {
    name             = "MgAL2O4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -6.391262e+00,
                 1.171886e-01,
                -2.132518e-04,
                 1.827740e-07,
                -5.883199e-11,
                -2.782714e+05,
                 2.013270e+01,
            }
        ),
        Range(
            1000.00, 2408.00,
            NASA7 {
                 1.469768e+01,
                 9.330480e-03,
                -3.552260e-06,
                 1.155053e-09,
                -1.433453e-13,
                -2.816641e+05,
                -7.666868e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Al = 2.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgAL2O4_L_ = Substance {
    name             = "MgAL2O4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2408.00, 5000.00,
            NASA7 {
                 2.641919e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.688354e+05,
                -1.419858e+02,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Al = 2.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgBr2_s_ = Substance {
    name             = "MgBr2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 984.00,
            NASA7 {
                 5.196642e+00,
                 2.067025e-02,
                -3.725394e-05,
                 3.193756e-08,
                -9.950702e-12,
                -6.525262e+04,
                -2.028891e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgBr2_L_ = Substance {
    name             = "MgBr2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            984.00, 5000.00,
            NASA7 {
                 1.258074e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.396298e+04,
                -5.625546e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgCO3_s_ = Substance {
    name             = "MgCO3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.349192e+00,
                 3.693411e-02,
                -4.449295e-05,
                 3.181591e-08,
                -9.754530e-12,
                -1.354169e+05,
                -9.061873e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        C  = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgCL2_s_ = Substance {
    name             = "MgCL2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 987.00,
            NASA7 {
                 5.449130e+00,
                 1.674522e-02,
                -2.595691e-05,
                 1.911157e-08,
                -5.105901e-12,
                -7.934389e+04,
                -2.426108e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgCL2_L_ = Substance {
    name             = "MgCL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            987.00, 5000.00,
            NASA7 {
                 1.107105e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.629462e+04,
                -4.897259e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgF2_s_ = Substance {
    name             = "MgF2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.603611e+00,
                 3.179449e-02,
                -5.268580e-05,
                 4.158771e-08,
                -1.261950e-11,
                -1.367203e+05,
                -9.732317e+00,
            }
        ),
        Range(
            1000.00, 1536.00,
            NASA7 {
                -2.102243e+00,
                 3.502423e-02,
                -3.974989e-05,
                 2.046186e-08,
                -3.953441e-12,
                -1.353931e+05,
                 1.104456e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgF2_L_ = Substance {
    name             = "MgF2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1536.00, 5000.00,
            NASA7 {
                 1.141677e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.340841e+05,
                -5.742507e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgI2_s_ = Substance {
    name             = "MgI2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 907.00,
            NASA7 {
                 6.701716e+00,
                 1.169702e-02,
                -1.683631e-05,
                 1.314381e-08,
                -4.009996e-12,
                -4.652776e+04,
                -2.543204e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgI2_L_ = Substance {
    name             = "MgI2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            907.00, 5000.00,
            NASA7 {
                 1.207751e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.552566e+04,
                -5.188353e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgO_s_ = Substance {
    name             = "MgO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -4.540395e-01,
                 2.787327e-02,
                -4.906225e-05,
                 4.047415e-08,
                -1.267034e-11,
                -7.305795e+04,
                -6.355202e-01,
            }
        ),
        Range(
            1000.00, 3105.00,
            NASA7 {
                 5.044868e+00,
                 1.689820e-03,
                -7.561769e-07,
                 2.028689e-10,
                -2.059127e-14,
                -7.402929e+04,
                -2.632889e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgO_L_ = Substance {
    name             = "MgO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            3105.00, 5000.00,
            NASA7 {
                 8.051671e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.987945e+04,
                -4.434383e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgO2H2_s_ = Substance {
    name             = "MgO2H2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -4.166425e+00,
                 7.684499e-02,
                -1.372077e-04,
                 1.142686e-07,
                -3.592584e-11,
                -1.123843e+05,
                 1.359264e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgS_s_ = Substance {
    name             = "MgS(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.097288e+00,
                 6.929786e-03,
                -9.202929e-06,
                 5.632934e-09,
                -1.217033e-12,
                -4.304076e+04,
                -1.899600e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 5.350123e+00,
                 1.343365e-03,
                -6.290500e-07,
                 1.981986e-10,
                -2.259165e-14,
                -4.323855e+04,
                -2.483783e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgSO4_s_ = Substance {
    name             = "MgSO4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.153406e+00,
                 4.875653e-02,
                -7.366503e-05,
                 5.942779e-08,
                -1.843371e-11,
                -1.568096e+05,
                -1.302844e+01,
            }
        ),
        Range(
            1000.00, 1400.00,
            NASA7 {
                -6.447692e+01,
                 2.637532e-01,
                -3.249188e-04,
                 1.825723e-07,
                -3.869077e-11,
                -1.406611e+05,
                 3.218839e+02,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgSO4_L_ = Substance {
    name             = "MgSO4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1400.00, 5000.00,
            NASA7 {
                 1.912272e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.609288e+05,
                -1.018046e+02,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgSiO3_I_ = Substance {
    name             = "MgSiO3(I)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 903.00,
            NASA7 {
                 1.337778e+00,
                 4.445322e-02,
                -6.597375e-05,
                 4.741426e-08,
                -1.233110e-11,
                -1.881723e+05,
                -1.017894e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Si = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgSiO3_II_ = Substance {
    name             = "MgSiO3(II)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            903.00, 1258.00,
            NASA7 {
                 1.447389e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.916217e+05,
                -7.665946e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Si = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgSiO3_III_ = Substance {
    name             = "MgSiO3(III)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1258.00, 1850.00,
            NASA7 {
                 1.472550e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.917420e+05,
                -7.829930e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Si = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgSiO3_L_ = Substance {
    name             = "MgSiO3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1850.00, 5000.00,
            NASA7 {
                 1.761303e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.880258e+05,
                -9.512573e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Si = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgTiO3_s_ = Substance {
    name             = "MgTiO3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.577774e-01,
                 6.201840e-02,
                -1.048060e-04,
                 8.494092e-08,
                -2.636730e-11,
                -1.910774e+05,
                -4.661653e+00,
            }
        ),
        Range(
            1000.00, 1953.00,
            NASA7 {
                 1.028822e+01,
                 1.034373e-02,
                -7.401218e-06,
                 2.792882e-09,
                -3.953245e-13,
                -1.928117e+05,
                -5.295809e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Ti = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgTiO3_L_ = Substance {
    name             = "MgTiO3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1953.00, 5000.00,
            NASA7 {
                 1.962595e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.909181e+05,
                -1.065620e+02,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Ti = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_MgTi2O5_s_ = Substance {
    name             = "MgTi2O5(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.271631e+00,
                 9.266379e-02,
                -1.636950e-04,
                 1.390337e-07,
                -4.451323e-11,
                -3.051161e+05,
                -1.242210e+01,
            }
        ),
        Range(
            1000.00, 1963.00,
            NASA7 {
                 1.677661e+01,
                 1.223779e-02,
                -6.301316e-06,
                 2.401949e-09,
                -3.541293e-13,
                -3.075465e+05,
                -8.329339e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Ti = 2.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_MgTi2O5_L_ = Substance {
    name             = "MgTi2O5(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1963.00, 5000.00,
            NASA7 {
                 3.140152e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.041000e+05,
                -1.685865e+02,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Ti = 2.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Mg2SiO4_s_ = Substance {
    name             = "Mg2SiO4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.342898e+00,
                 6.686659e-02,
                -9.644562e-05,
                 6.642396e-08,
                -1.718399e-11,
                -2.644690e+05,
                -1.239916e+01,
            }
        ),
        Range(
            1000.00, 2171.00,
            NASA7 {
                 1.575268e+01,
                 6.800465e-03,
                -1.620395e-06,
                 7.736811e-12,
                 6.333757e-14,
                -2.672995e+05,
                -8.145799e+01,
            }
        )
    },
    elements         = {
        Mg = 2.0,
        Si = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Mg2SiO4_L_ = Substance {
    name             = "Mg2SiO4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2171.00, 5000.00,
            NASA7 {
                 2.465824e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.669255e+05,
                -1.346151e+02,
            }
        )
    },
    elements         = {
        Mg = 2.0,
        Si = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Mg2TiO4_s_ = Substance {
    name             = "Mg2TiO4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -5.044116e-02,
                 8.808642e-02,
                -1.568379e-04,
                 1.340185e-07,
                -4.312379e-11,
                -2.630787e+05,
                -6.253751e+00,
            }
        ),
        Range(
            1000.00, 2013.00,
            NASA7 {
                 1.477258e+01,
                 1.082415e-02,
                -4.990756e-06,
                 1.740794e-09,
                -2.539820e-13,
                -2.653908e+05,
                -7.393371e+01,
            }
        )
    },
    elements         = {
        Mg = 2.0,
        Ti = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Mg2TiO4_L_ = Substance {
    name             = "Mg2TiO4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2013.00, 5000.00,
            NASA7 {
                 2.747633e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.615356e+05,
                -1.474584e+02,
            }
        )
    },
    elements         = {
        Mg = 2.0,
        Ti = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Mo_cr_ = Substance {
    name             = "Mo(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.328841e+00,
                 9.825537e-03,
                -2.109298e-05,
                 2.095095e-08,
                -7.607032e-12,
                -6.843648e+02,
                -6.292865e+00,
            }
        ),
        Range(
            1000.00, 2896.00,
            NASA7 {
                 5.384328e+00,
                -6.016222e-03,
                 6.014825e-06,
                -2.329623e-09,
                 3.520078e-13,
                -1.626572e+03,
                -2.624889e+01,
            }
        )
    },
    elements         = {
        Mo = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Mo_L_ = Substance {
    name             = "Mo(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2896.00, 6000.00,
            NASA7 {
                 4.528950e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 2.021407e+03,
                -2.280748e+01,
            }
        )
    },
    elements         = {
        Mo = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NH4CL_a_ = Substance {
    name             = "NH4CL(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 458.00,
            NASA7 {
                 4.674938e+00,
                 1.927343e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.008275e+04,
                -2.095913e+01,
            }
        )
    },
    elements         = {
        N  = 1.0,
        H  = 4.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NH4CL_b_ = Substance {
    name             = "NH4CL(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            458.00, 793.20,
            NASA7 {
                 4.166685e+00,
                 1.343605e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.876269e+04,
                -1.413440e+01,
            }
        )
    },
    elements         = {
        N  = 1.0,
        H  = 4.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na_cr_ = Substance {
    name             = "Na(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 371.01,
            NASA7 {
                 1.239542e+00,
                 2.005622e-02,
                -7.364183e-05,
                 1.027121e-07,
                 0.000000e+00,
                -8.133209e+02,
                -4.506514e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na_L_ = Substance {
    name             = "Na(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            371.01, 1000.00,
            NASA7 {
                 4.323824e+00,
                -1.411455e-03,
                -1.310688e-07,
                 9.174577e-10,
                -2.350651e-13,
                -9.365223e+02,
                -1.727226e+01,
            }
        ),
        Range(
            1000.00, 2300.00,
            NASA7 {
                 4.598585e+00,
                -2.424594e-03,
                 1.324538e-06,
                -4.123753e-11,
                 6.401671e-15,
                -9.985355e+02,
                -1.862571e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NaALO2_a_ = Substance {
    name             = "NaALO2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 740.00,
            NASA7 {
                -8.050478e-01,
                 5.843497e-02,
                -1.188441e-04,
                 1.197004e-07,
                -4.622479e-11,
                -1.378166e+05,
                -5.333528e-02,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Al = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NaALO2_b_ = Substance {
    name             = "NaALO2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            740.00, 1000.00,
            NASA7 {
                 1.054234e+01,
                 8.848391e-04,
                 1.390676e-06,
                -5.139139e-10,
                 0.000000e+00,
                -1.395806e+05,
                -5.237136e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 1.196622e+01,
                -2.281728e-03,
                 3.771374e-06,
                -1.293267e-09,
                 1.413502e-13,
                -1.400482e+05,
                -6.000646e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Al = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NaBr_s_ = Substance {
    name             = "NaBr(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.876646e+00,
                 6.831893e-03,
                -1.064116e-05,
                 9.161393e-09,
                -2.881630e-12,
                -4.514864e+04,
                -1.898254e+01,
            }
        ),
        Range(
            1000.00, 1020.00,
            NASA7 {
                 6.624645e+00,
                 1.238298e-04,
                 4.099028e-07,
                 2.068365e-10,
                -1.807648e-14,
                -4.556037e+04,
                -2.760580e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NaBr_L_ = Substance {
    name             = "NaBr(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1020.00, 5000.00,
            NASA7 {
                 7.498119e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.304977e+04,
                -3.017045e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NaCN_s_ = Substance {
    name             = "NaCN(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 835.00,
            NASA7 {
                 7.996773e+00,
                 1.915455e-03,
                -5.342159e-06,
                 6.809164e-09,
                -3.141491e-12,
                -1.334029e+04,
                -3.170393e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        C  = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NaCN_L_ = Substance {
    name             = "NaCN(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            835.00, 5000.00,
            NASA7 {
                 9.561360e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.338641e+04,
                -4.028731e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        C  = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NaCL_s_ = Substance {
    name             = "NaCL(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.024078e+00,
                 5.194907e-03,
                -7.283373e-06,
                 6.067198e-09,
                -1.201342e-12,
                -5.112333e+04,
                -2.122720e+01,
            }
        ),
        Range(
            1000.00, 1073.80,
            NASA7 {
                 2.213493e+00,
                 1.585990e-03,
                 5.048638e-06,
                 2.602055e-09,
                -3.648710e-12,
                -4.926320e+04,
                -2.602566e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NaCL_L_ = Substance {
    name             = "NaCL(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1073.80, 5000.00,
            NASA7 {
                 1.235849e+01,
                -6.307120e-03,
                 3.200472e-06,
                -6.771736e-10,
                 5.101561e-14,
                -5.142326e+04,
                -6.058553e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NaF_s_ = Substance {
    name             = "NaF(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.697755e+00,
                 1.052057e-02,
                -1.723566e-05,
                 1.412591e-08,
                -3.951453e-12,
                -7.064718e+04,
                -1.739363e+01,
            }
        ),
        Range(
            1000.00, 1269.00,
            NASA7 {
                 7.834203e+00,
                -9.483918e-04,
                -5.484399e-06,
                 8.684302e-09,
                -2.928586e-12,
                -7.181040e+04,
                -3.881571e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NaF_L_ = Substance {
    name             = "NaF(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1269.00, 3500.00,
            NASA7 {
                 1.096326e+01,
                -3.206846e-03,
                 1.161166e-06,
                -1.629930e-10,
                 5.245614e-15,
                -7.067394e+04,
                -5.637570e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NaI_s_ = Substance {
    name             = "NaI(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 933.00,
            NASA7 {
                 5.499598e+00,
                 3.566805e-03,
                -3.996563e-06,
                 3.184107e-09,
                -9.530872e-13,
                -3.639036e+04,
                -2.039925e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NaI_L_ = Substance {
    name             = "NaI(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            933.00, 5000.00,
            NASA7 {
                 7.800057e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.475957e+04,
                -3.081888e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NaOH_a_ = Substance {
    name             = "NaOH(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 596.00,
            NASA7 {
                 8.587949e+00,
                -3.540601e-03,
                -4.553339e-05,
                 1.841848e-07,
                -1.501897e-10,
                -5.351185e+04,
                -3.940758e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NaOH_L_ = Substance {
    name             = "NaOH(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            596.00, 1000.00,
            NASA7 {
                 9.055677e+00,
                 4.302504e-03,
                -2.425913e-06,
                -3.547966e-09,
                 2.688942e-12,
                -5.294244e+04,
                -4.351514e+01,
            }
        ),
        Range(
            1000.00, 2500.00,
            NASA7 {
                 9.497232e+00,
                 2.271797e-03,
                -2.397793e-06,
                 7.839848e-10,
                -8.197647e-14,
                -5.290682e+04,
                -4.529990e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NaO2_s_ = Substance {
    name             = "NaO2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.279888e+00,
                 4.416072e-03,
                 1.241392e-06,
                -1.292117e-09,
                 4.825948e-13,
                -3.372656e+04,
                -2.889981e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 6.675318e+00,
                 6.423451e-03,
                -1.543777e-06,
                 6.835777e-10,
                -1.107392e-13,
                -3.357255e+04,
                -2.584861e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2CO3_I_ = Substance {
    name             = "Na2CO3(I)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 723.15,
            NASA7 {
                 6.783566e+00,
                 3.882970e-02,
                -9.826246e-05,
                 1.654308e-07,
                -8.329452e-11,
                -1.391701e+05,
                -3.046329e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        C  = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2CO3_II_ = Substance {
    name             = "Na2CO3(II)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            723.15, 1000.00,
            NASA7 {
                 1.184834e+01,
                -3.513899e-03,
                 2.061557e-05,
                -7.396518e-09,
                 0.000000e+00,
                -1.381419e+05,
                -4.806437e+01,
            }
        ),
        Range(
            1000.00, 1123.15,
            NASA7 {
                 8.281776e+00,
                 1.127539e-02,
                 1.996329e-06,
                 0.000000e+00,
                 0.000000e+00,
                -1.376127e+05,
                -3.137258e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        C  = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2CO3_L_ = Substance {
    name             = "Na2CO3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1123.15, 5000.00,
            NASA7 {
                 2.279630e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.422922e+05,
                -1.162212e+02,
            }
        )
    },
    elements         = {
        Na = 2.0,
        C  = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Na2O_c_ = Substance {
    name             = "Na2O(c)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.265458e+00,
                 1.111687e-02,
                -6.387538e-07,
                -9.699321e-09,
                 5.372007e-12,
                -5.231435e+04,
                -2.418702e+01,
            }
        ),
        Range(
            1000.00, 1243.20,
            NASA7 {
                 2.416896e+01,
                -2.527974e-02,
                -4.739066e-06,
                 3.183639e-08,
                -1.457026e-11,
                -5.804824e+04,
                -1.251806e+02,
            }
        )
    },
    elements         = {
        Na = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2O_a_ = Substance {
    name             = "Na2O(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1243.20, 1405.20,
            NASA7 {
                -1.490659e+02,
                 2.279904e-01,
                 3.839127e-05,
                -1.709992e-07,
                 6.139593e-11,
                 1.161480e+04,
                 8.468927e+02,
            }
        )
    },
    elements         = {
        Na = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2O_L_ = Substance {
    name             = "Na2O(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1405.20, 5000.00,
            NASA7 {
                 1.258074e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.859486e+04,
                -6.066155e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Na2O2_a_ = Substance {
    name             = "Na2O2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 785.00,
            NASA7 {
                 4.581528e+00,
                 3.245591e-02,
                -5.115420e-05,
                 4.266398e-08,
                -1.399164e-11,
                -6.416105e+04,
                -2.245545e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2O2_b_ = Substance {
    name             = "Na2O2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            785.00, 5000.00,
            NASA7 {
                 1.366268e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.563257e+04,
                -6.684155e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2S_1_ = Substance {
    name             = "Na2S(1)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 9.707560e+00,
                -3.112618e-04,
                 5.512116e-06,
                -6.043507e-09,
                 2.301755e-12,
                -4.695038e+04,
                -4.383761e+01,
            }
        ),
        Range(
            1000.00, 1276.00,
            NASA7 {
                 4.467556e+02,
                -1.058511e+00,
                 8.117009e-04,
                -1.887788e-07,
                 0.000000e+00,
                -1.774839e+05,
                -2.346266e+03,
            }
        )
    },
    elements         = {
        Na = 2.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2S_2_ = Substance {
    name             = "Na2S(2)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1276.00, 1445.00,
            NASA7 {
                -5.679355e+05,
                 1.680412e+03,
                -1.862268e+00,
                 9.162059e-04,
                -1.688488e-07,
                 1.533280e+08,
                 2.910869e+06,
            }
        )
    },
    elements         = {
        Na = 2.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2S_L_ = Substance {
    name             = "Na2S(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1445.00, 5000.00,
            NASA7 {
                 1.107105e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.279093e+04,
                -4.861589e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Na2SO4_V_ = Substance {
    name             = "Na2SO4(V)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 458.00,
            NASA7 {
                 5.833932e+00,
                 3.082020e-02,
                 5.979864e-05,
                -2.597791e-07,
                 2.478540e-10,
                -1.701561e+05,
                -2.528864e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2SO4_IV_ = Substance {
    name             = "Na2SO4(IV)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            458.00, 514.00,
            NASA7 {
                 9.719678e+00,
                 2.188204e-02,
                -6.197707e-06,
                 0.000000e+00,
                 0.000000e+00,
                -1.707128e+05,
                -4.360634e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2SO4_I_ = Substance {
    name             = "Na2SO4(I)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            514.00, 1000.00,
            NASA7 {
                 1.548544e+01,
                 1.926138e-02,
                -3.322573e-05,
                 3.562833e-08,
                -1.305772e-11,
                -1.713229e+05,
                -7.351270e+01,
            }
        ),
        Range(
            1000.00, 1157.00,
            NASA7 {
                 1.611574e+01,
                 8.209259e-03,
                -2.333055e-07,
                 0.000000e+00,
                 0.000000e+00,
                -1.711291e+05,
                -7.469907e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na2SO4_L_ = Substance {
    name             = "Na2SO4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1157.00, 6000.00,
            NASA7 {
                 2.369777e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.716589e+05,
                -1.163585e+02,
            }
        )
    },
    elements         = {
        Na = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Na3ALF6_a_ = Substance {
    name             = "Na3ALF6(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 836.00,
            NASA7 {
                 2.259296e+00,
                 1.556967e-01,
                -3.616184e-04,
                 4.047908e-07,
                -1.650555e-10,
                -4.040599e+05,
                -1.779855e+01,
            }
        )
    },
    elements         = {
        Na = 3.0,
        Al = 1.0,
        F  = 6.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na3ALF6_b_ = Substance {
    name             = "Na3ALF6(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            836.00, 1000.00,
            NASA7 {
                 1.659366e+01,
                 1.691169e-02,
                 1.031660e-06,
                 0.000000e+00,
                 0.000000e+00,
                -4.010869e+05,
                -6.491079e+01,
            }
        ),
        Range(
            1000.00, 1285.00,
            NASA7 {
                 9.554396e+00,
                 3.520154e-02,
                -1.462099e-05,
                 4.402067e-09,
                 0.000000e+00,
                -3.990755e+05,
                -2.821618e+01,
            }
        )
    },
    elements         = {
        Na = 3.0,
        Al = 1.0,
        F  = 6.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na3ALF6_L_ = Substance {
    name             = "Na3ALF6(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1285.00, 5000.00,
            NASA7 {
                 4.756762e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.129654e+05,
                -2.537588e+02,
            }
        )
    },
    elements         = {
        Na = 3.0,
        Al = 1.0,
        F  = 6.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Na5AL3F14_s_ = Substance {
    name             = "Na5AL3F14(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.372817e+01,
                 2.329830e-01,
                -4.167217e-04,
                 3.537327e-07,
                -1.127677e-10,
                -9.232558e+05,
                -7.391375e+01,
            }
        ),
        Range(
            1000.00, 1010.00,
            NASA7 {
                 6.080538e+01,
                 1.014902e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.319437e+05,
                -2.949195e+02,
            }
        )
    },
    elements         = {
        Na = 5.0,
        Al = 3.0,
        F  = 14.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Na5AL3F14_L_ = Substance {
    name             = "Na5AL3F14(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1010.00, 5000.00,
            NASA7 {
                 1.171301e+02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.561288e+05,
                -6.470531e+02,
            }
        )
    },
    elements         = {
        Na = 5.0,
        Al = 3.0,
        F  = 14.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Nb_cr_ = Substance {
    name             = "Nb(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.912006e+00,
                 6.923963e-03,
                -1.560812e-05,
                 1.618041e-08,
                -6.046020e-12,
                -7.690372e+02,
                -8.009903e+00,
            }
        ),
        Range(
            1000.00, 2750.00,
            NASA7 {
                 4.215000e+00,
                -2.906865e-03,
                 3.123970e-06,
                -1.279097e-09,
                 2.092294e-13,
                -1.286821e+03,
                -1.919762e+01,
            }
        )
    },
    elements         = {
        Nb = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Nb_L_ = Substance {
    name             = "Nb(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2750.00, 6000.00,
            NASA7 {
                 4.025733e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.427040e+03,
                -1.857906e+01,
            }
        )
    },
    elements         = {
        Nb = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NbO_s_ = Substance {
    name             = "NbO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.982126e+00,
                 1.021754e-02,
                -1.517889e-05,
                 1.130847e-08,
                -3.138286e-12,
                -5.170337e+04,
                -1.391860e+01,
            }
        ),
        Range(
            1000.00, 2210.00,
            NASA7 {
                 5.123655e+00,
                 8.937586e-04,
                 3.093084e-07,
                -1.643370e-10,
                 2.856984e-14,
                -5.211091e+04,
                -2.409952e+01,
            }
        )
    },
    elements         = {
        Nb = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NbO_L_ = Substance {
    name             = "NbO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2210.00, 5000.00,
            NASA7 {
                 7.548442e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.458714e+04,
                -3.581734e+01,
            }
        )
    },
    elements         = {
        Nb = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NbO2_I_ = Substance {
    name             = "NbO2(I)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -1.548418e+00,
                 5.455364e-02,
                -1.206746e-04,
                 1.237778e-07,
                -4.561548e-11,
                -9.673116e+04,
                 3.472682e+00,
            }
        ),
        Range(
            1000.00, 1090.00,
            NASA7 {
                 5.289027e+00,
                 5.203861e-03,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.729725e+04,
                -2.489086e+01,
            }
        )
    },
    elements         = {
        Nb = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NbO2_II_ = Substance {
    name             = "NbO2(II)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1090.00, 1200.00,
            NASA7 {
                 1.117141e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.002060e+05,
                -5.998194e+01,
            }
        )
    },
    elements         = {
        Nb = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NbO2_III_ = Substance {
    name             = "NbO2(III)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1200.00, 2175.00,
            NASA7 {
                 9.988851e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.878693e+04,
                -5.159751e+01,
            }
        )
    },
    elements         = {
        Nb = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NbO2_L_ = Substance {
    name             = "NbO2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2175.00, 6000.00,
            NASA7 {
                 1.132237e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.061658e+04,
                -5.675535e+01,
            }
        )
    },
    elements         = {
        Nb = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Nb2O5_s_ = Substance {
    name             = "Nb2O5(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 8.505349e+00,
                 3.440121e-02,
                -3.769875e-05,
                 1.986372e-08,
                -3.961027e-12,
                -2.322323e+05,
                -4.068492e+01,
            }
        ),
        Range(
            1000.00, 1785.00,
            NASA7 {
                 1.705489e+01,
                 4.914056e-03,
                 4.729464e-07,
                -1.837607e-09,
                 5.062192e-13,
                -2.342303e+05,
                -8.322480e+01,
            }
        )
    },
    elements         = {
        Nb = 2.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Nb2O5_L_ = Substance {
    name             = "Nb2O5(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1785.00, 5000.00,
            NASA7 {
                 2.913699e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.373602e+05,
                -1.593340e+02,
            }
        )
    },
    elements         = {
        Nb = 2.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ni_cr_ = Substance {
    name             = "Ni(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(200.0, 631.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=3.9209761400e+00, a4=-2.3418471900e-02, a5=1.3423014500e-04, a6=-2.7597163900e-07, a7=1.9853086100e-10, a8=-8.6238720600e+02, a9=-1.5685618600e+01 }),
        Range(631.0, 1000.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=4.8548487700e+02, a4=-2.3039538000e+00, a5=4.1062263400e-03, a6=-3.2335010100e-06, a7=9.4961738100e-10, a8=-8.1170908500e+04, a9=-2.2542896000e+03 }),
        Range(1000.0, 1728.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=9.5820857200e+00, a4=-1.7894512200e-02, a5=1.9718511200e-05, a6=-9.1195795200e-09, a7=1.5872860900e-12, a8=-2.6178218500e+03, a9=-4.7461239300e+01 })
    },
    elements         = {
        Ni = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ni_L_ = Substance {
    name             = "Ni(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1728.00, 6000.00,
            NASA7 {
                 4.679891e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.222383e+02,
                -2.335178e+01,
            }
        )
    },
    elements         = {
        Ni = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NiS_b_ = Substance {
    name             = "NiS(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 652.00,
            NASA7 {
                 2.515051e+00,
                 1.981088e-02,
                -4.475171e-05,
                 5.355274e-08,
                -2.473915e-11,
                -1.189727e+04,
                -1.229880e+01,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NiS_a_ = Substance {
    name             = "NiS(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            652.00, 1000.00,
            NASA7 {
                 1.597786e+00,
                 1.627916e-02,
                -2.395926e-05,
                 1.966525e-08,
                -5.999359e-12,
                -1.060519e+04,
                -4.998841e+00,
            }
        ),
        Range(
            1000.00, 1249.00,
            NASA7 {
                -2.168828e+00,
                 2.046726e-02,
                -1.523907e-05,
                 4.524204e-09,
                 0.000000e+00,
                -9.253973e+03,
                 1.601898e+01,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NiS_L_ = Substance {
    name             = "NiS(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1249.00, 5000.00,
            NASA7 {
                 9.234261e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.105365e+04,
                -4.576974e+01,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_NiS2_s_ = Substance {
    name             = "NiS2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.744935e+00,
                 2.535171e-03,
                -9.976759e-08,
                 1.078295e-10,
                -4.191294e-14,
                -1.822254e+04,
                -3.622439e+01,
            }
        ),
        Range(
            1000.00, 1280.00,
            NASA7 {
                 5.274264e+00,
                 9.087093e-03,
                -5.820110e-06,
                 1.705008e-09,
                 0.000000e+00,
                -1.752872e+04,
                -2.339222e+01,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        S  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_NiS2_L_ = Substance {
    name             = "NiS2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1280.00, 5000.00,
            NASA7 {
                 1.094524e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.234492e+04,
                -4.972062e+01,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        S  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ni3S2_I_ = Substance {
    name             = "Ni3S2(I)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 829.00,
            NASA7 {
                 6.923830e+00,
                 4.044668e-02,
                -7.307396e-05,
                 7.100708e-08,
                -2.622186e-11,
                -2.936220e+04,
                -3.273505e+01,
            }
        )
    },
    elements         = {
        Ni = 3.0,
        S  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ni3S2_II_ = Substance {
    name             = "Ni3S2(II)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            829.00, 1062.00,
            NASA7 {
                 2.268558e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.931348e+04,
                -1.116898e+02,
            }
        )
    },
    elements         = {
        Ni = 3.0,
        S  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ni3S2_L_ = Substance {
    name             = "Ni3S2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1062.00, 5000.00,
            NASA7 {
                 2.306804e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.734440e+04,
                -1.121181e+02,
            }
        )
    },
    elements         = {
        Ni = 3.0,
        S  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ni3S4_s_ = Substance {
    name             = "Ni3S4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.467119e+01,
                 1.727716e-02,
                -2.756928e-09,
                 1.023386e-11,
                -6.298396e-15,
                -4.135848e+04,
                -6.631294e+01,
            }
        ),
        Range(
            1000.00, 1100.00,
            NASA7 {
                 1.467382e+01,
                 1.727572e-02,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.136000e+04,
                -6.632916e+01,
            }
        )
    },
    elements         = {
        Ni = 3.0,
        S  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_P_cr_ = Substance {
    name             = "P(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            195.40, 317.30,
            NASA7 {
                 8.024697e-01,
                 1.857793e-02,
                -8.340807e-05,
                 2.111049e-07,
                -2.096589e-10,
                -6.463626e+02,
                -2.912810e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_P_L_ = Substance {
    name             = "P(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            317.30, 6000.00,
            NASA7 {
                 3.141496e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -8.621486e+02,
                -1.272275e+01,
            }
        )
    },
    elements         = {
        P = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_P4O10_s_ = Substance {
    name             = "P4O10(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.955610e-01,
                 1.133382e-01,
                -1.240998e-04,
                 9.771560e-08,
                -3.410784e-11,
                -3.662564e+05,
                -3.809070e+00,
            }
        ),
        Range(
            1000.00, 1500.00,
            NASA7 {
                -4.330062e+01,
                 2.156738e-01,
                -1.768634e-04,
                 6.764285e-08,
                -9.910871e-12,
                -3.534614e+05,
                 2.260547e+02,
            }
        )
    },
    elements         = {
        P = 4.0,
        O = 10.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Pb_cr_ = Substance {
    name             = "Pb(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 600.65,
            NASA7 {
                 3.360142e+00,
                -4.315255e-03,
                 2.104044e-05,
                -3.358974e-08,
                 1.918510e-11,
                -9.385930e+02,
                -1.074087e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Pb_L_ = Substance {
    name             = "Pb(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            600.65, 1000.00,
            NASA7 {
                 3.406799e+00,
                 2.032219e-03,
                -4.174175e-06,
                 3.083970e-09,
                -8.165314e-13,
                -5.920278e+02,
                -1.133780e+01,
            }
        ),
        Range(
            1000.00, 3600.00,
            NASA7 {
                 4.181914e+00,
                -9.841510e-04,
                 3.553398e-07,
                -1.758083e-11,
                -3.238844e-15,
                -7.560658e+02,
                -1.510995e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_PbBr2_s_ = Substance {
    name             = "PbBr2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 644.00,
            NASA7 {
                 1.055755e+01,
                -7.061739e-03,
                 1.018760e-05,
                 1.305288e-08,
                -1.637309e-11,
                -3.630480e+04,
                -3.919903e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbBr2_L_ = Substance {
    name             = "PbBr2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            644.00, 5000.00,
            NASA7 {
                 1.348655e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.657220e+04,
                -5.704909e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_PbCL2_s_ = Substance {
    name             = "PbCL2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 774.00,
            NASA7 {
                 8.280269e+00,
                 3.041434e-03,
                 1.560258e-06,
                -2.228461e-09,
                 1.111544e-12,
                -4.584122e+04,
                -3.178124e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbCL2_L_ = Substance {
    name             = "PbCL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            774.00, 5000.00,
            NASA7 {
                 1.341107e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.616708e+04,
                -5.993265e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_PbF2_a_ = Substance {
    name             = "PbF2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 583.00,
            NASA7 {
                 2.469665e+01,
                -1.596589e-01,
                 5.676763e-04,
                -8.510305e-07,
                 4.668420e-10,
                -8.524133e+04,
                -9.815737e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbF2_b_ = Substance {
    name             = "PbF2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            583.00, 1000.00,
            NASA7 {
                -9.635250e+02,
                 4.505875e+00,
                -7.582241e-03,
                 5.523155e-06,
                -1.471839e-09,
                 7.852313e+04,
                 4.495317e+03,
            }
        ),
        Range(
            1000.00, 1103.00,
            NASA7 {
                 9.932847e+02,
                -1.872559e+00,
                 8.906993e-04,
                 0.000000e+00,
                 0.000000e+00,
                -4.269620e+05,
                -5.406789e+03,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbF2_L_ = Substance {
    name             = "PbF2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1103.00, 6000.00,
            NASA7 {
                 1.313406e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -8.475522e+04,
                -6.207133e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_PbI2_s_ = Substance {
    name             = "PbI2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 683.00,
            NASA7 {
                 8.442443e+00,
                 5.919577e-03,
                -1.388869e-05,
                 1.322139e-08,
                 1.616407e-12,
                -2.377905e+04,
                -2.833790e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbI2_L_ = Substance {
    name             = "PbI2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            683.00, 5000.00,
            NASA7 {
                 1.305880e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.344093e+04,
                -5.204481e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_PbO_rd_ = Substance {
    name             = "PbO(rd)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 762.00,
            NASA7 {
                 2.864601e+00,
                 1.077237e-02,
                -3.661310e-06,
                -1.228109e-08,
                 1.006643e-11,
                -2.767017e+04,
                -1.130451e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbO_yw_ = Substance {
    name             = "PbO(yw)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            762.00, 1000.00,
            NASA7 {
                 4.207325e+00,
                 5.217648e-03,
                -3.861359e-06,
                 1.384015e-09,
                 0.000000e+00,
                -2.766560e+04,
                -1.706448e+01,
            }
        ),
        Range(
            1000.00, 1159.00,
            NASA7 {
                 5.112463e+00,
                 2.039449e-03,
                -2.042823e-07,
                 0.000000e+00,
                 0.000000e+00,
                -2.785466e+04,
                -2.150594e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbO_L_ = Substance {
    name             = "PbO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1159.00, 5000.00,
            NASA7 {
                 7.817670e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.665653e+04,
                -3.571693e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_PbO2_s_ = Substance {
    name             = "PbO2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.342979e+00,
                 2.661291e-02,
                -4.121263e-05,
                 3.072324e-08,
                -8.928787e-12,
                -3.458529e+04,
                -1.106993e+01,
            }
        ),
        Range(
            1000.00, 1200.00,
            NASA7 {
                 6.869549e+00,
                 4.688794e-03,
                -2.020635e-06,
                 0.000000e+00,
                 0.000000e+00,
                -3.531875e+04,
                -3.200137e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbS_s_ = Substance {
    name             = "PbS(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.516097e+00,
                 1.719669e-03,
                -1.265860e-06,
                 1.250569e-09,
                -4.627851e-13,
                -1.353818e+04,
                -2.090927e+01,
            }
        ),
        Range(
            1000.00, 1386.50,
            NASA7 {
                 4.869541e+00,
                 2.550985e-03,
                -3.804288e-07,
                -5.481464e-10,
                 2.657382e-13,
                -1.329845e+04,
                -1.729961e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_PbS_L_ = Substance {
    name             = "PbS(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1386.50, 5000.00,
            NASA7 {
                 8.051671e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.356606e+04,
                -3.575780e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Pb3O4_s_ = Substance {
    name             = "Pb3O4(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.470936e+00,
                 8.986701e-02,
                -1.523131e-04,
                 1.198850e-07,
                -3.494965e-11,
                -9.004773e+04,
                -9.606224e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.992720e+01,
                 5.033623e-03,
                -8.343922e-10,
                 2.076090e-13,
                -1.777088e-17,
                -9.287679e+04,
                -9.028841e+01,
            }
        )
    },
    elements         = {
        Pb = 3.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_S_cr1_ = Substance {
    name             = "S(cr1)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 368.30,
            NASA7 {
                 3.713695e-01,
                 1.533735e-02,
                -3.354411e-05,
                 2.892495e-08,
                 0.000000e+00,
                -5.532138e+02,
                -1.596245e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_S_cr2_ = Substance {
    name             = "S(cr2)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            368.30, 388.36,
            NASA7 {
                 2.080331e+00,
                 2.441376e-03,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.853067e+02,
                -8.607155e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_S_L_ = Substance {
    name             = "S(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            388.36, 1000.00,
            NASA7 {
                -7.274057e+01,
                 4.812225e-01,
                -1.078422e-03,
                 1.032577e-06,
                -3.588845e-10,
                 8.291349e+03,
                 3.152697e+02,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.500784e+00,
                 3.816621e-04,
                -1.555700e-07,
                 2.727837e-11,
                -1.728126e-15,
                -5.908730e+02,
                -1.521673e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_SCL2_L_ = Substance {
    name             = "SCL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 5000.00,
            NASA7 {
                 1.094524e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.251754e+03,
                -4.026980e+01,
            }
        )
    },
    elements         = {
        S  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_S2CL2_L_ = Substance {
    name             = "S2CL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 5000.00,
            NASA7 {
                 1.494894e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.145192e+04,
                -5.825023e+01,
            }
        )
    },
    elements         = {
        S  = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Si_cr_ = Substance {
    name             = "Si(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -1.291769e-01,
                 1.472031e-02,
                -2.765102e-05,
                 2.418783e-08,
                -7.934529e-12,
                -4.155164e+02,
                -3.595700e-01,
            }
        ),
        Range(
            1000.00, 1690.00,
            NASA7 {
                 1.755474e+00,
                 3.172855e-03,
                -2.782364e-06,
                 1.264581e-09,
                -2.171285e-13,
                -6.286574e+02,
                -8.553412e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Si_L_ = Substance {
    name             = "Si(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1690.00, 6000.00,
            NASA7 {
                 3.271389e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 4.882868e+03,
                -1.326655e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_SiC_b_ = Substance {
    name             = "SiC(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -2.471591e+00,
                 3.069378e-02,
                -4.926308e-05,
                 3.862639e-08,
                -1.176162e-11,
                -9.069126e+03,
                 8.800921e+00,
            }
        ),
        Range(
            1000.00, 4000.00,
            NASA7 {
                 3.797481e+00,
                 3.187289e-03,
                -1.450233e-06,
                 3.154974e-10,
                -2.615899e-14,
                -1.029194e+04,
                -2.106779e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_SiO2_Lqz_ = Substance {
    name             = "SiO2(Lqz)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 847.00,
            NASA7 {
                -7.585114e-01,
                 3.057740e-02,
                -4.008619e-05,
                 2.161948e-08,
                -6.172490e-13,
                -1.103715e+05,
                 1.783845e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_SiO2_hqz_ = Substance {
    name             = "SiO2(hqz)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            847.00, 1000.00,
            NASA7 {
                 7.117876e+00,
                 1.138195e-03,
                 3.697342e-08,
                 0.000000e+00,
                 0.000000e+00,
                -1.117942e+05,
                -3.637081e+01,
            }
        ),
        Range(
            1000.00, 1696.00,
            NASA7 {
                 7.235371e+00,
                 7.618422e-04,
                 4.895023e-07,
                -2.357546e-10,
                 4.208391e-14,
                -1.118238e+05,
                -3.696428e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_SiO2_L_ = Substance {
    name             = "SiO2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1696.00, 6000.00,
            NASA7 {
                 1.031607e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.146006e+05,
                -5.762666e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Si2N2O_s_ = Substance {
    name             = "Si2N2O(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                -4.122685e+00,
                 5.417281e-02,
                -4.239293e-05,
                -1.072460e-08,
                 1.736686e-11,
                -1.147460e+05,
                 1.482216e+01,
            }
        ),
        Range(
            1000.00, 2500.00,
            NASA7 {
                 1.184902e+01,
                 2.424468e-03,
                 3.652924e-07,
                -4.257883e-10,
                 8.627593e-14,
                -1.182149e+05,
                -6.425009e+01,
            }
        )
    },
    elements         = {
        Si = 2.0,
        N  = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Si3N4_a_ = Substance {
    name             = "Si3N4(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.163568e+00,
                 1.900711e-02,
                -1.146933e-05,
                 7.066592e-09,
                -2.745864e-12,
                -9.246665e+04,
                -3.244243e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 2.798175e+00,
                 2.797502e-02,
                -1.502058e-05,
                 3.587229e-09,
                -3.177697e-13,
                -9.101724e+04,
                -8.926882e+00,
            }
        )
    },
    elements         = {
        Si = 3.0,
        N  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Sr_a_ = Substance {
    name             = "Sr(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 820.00,
            NASA7 {
                 2.611219e+00,
                 3.069239e-03,
                -4.439809e-06,
                 4.035248e-09,
                -1.480878e-12,
                -8.830027e+02,
                -9.013311e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Sr_b_ = Substance {
    name             = "Sr(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            820.00, 1041.00,
            NASA7 {
                 3.190326e+00,
                 4.837327e-04,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -8.560806e+02,
                -1.157235e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Sr_L_ = Substance {
    name             = "Sr(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1041.00, 6000.00,
            NASA7 {
                 4.450052e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -9.431755e+02,
                -1.889700e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_SrCL2_a_ = Substance {
    name             = "SrCL2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.936964e+00,
                 1.078760e-02,
                -1.390794e-05,
                 5.898228e-09,
                 3.013333e-12,
                -1.021272e+05,
                -2.837088e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_SrCL2_b_ = Substance {
    name             = "SrCL2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1000.00, 1147.00,
            NASA7 {
                 1.479495e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.064275e+05,
                -7.537623e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_SrCL2_L_ = Substance {
    name             = "SrCL2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1147.00, 5000.00,
            NASA7 {
                 1.258074e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.019368e+05,
                -5.807635e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_SrF2_s_ = Substance {
    name             = "SrF2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.291621e+00,
                 1.553765e-02,
                -1.921191e-05,
                 7.496523e-09,
                 9.400057e-13,
                -1.485305e+05,
                -2.408915e+01,
            }
        ),
        Range(
            1000.00, 1750.00,
            NASA7 {
                 8.874717e+01,
                -1.637651e-01,
                 6.519690e-05,
                 4.354839e-08,
                -2.367347e-11,
                -1.745612e+05,
                -4.693452e+02,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_SrF2_L_ = Substance {
    name             = "SrF2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1750.00, 5000.00,
            NASA7 {
                 1.191295e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.464281e+05,
                -5.802284e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_SrO_s_ = Substance {
    name             = "SrO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.563137e+00,
                 9.271785e-03,
                -1.164658e-05,
                 7.085183e-09,
                -1.525991e-12,
                -7.259140e+04,
                -1.592880e+01,
            }
        ),
        Range(
            1000.00, 2938.00,
            NASA7 {
                 5.647793e+00,
                 1.315400e-03,
                -2.764041e-07,
                 6.730833e-11,
                -6.562635e-15,
                -7.303734e+04,
                -2.609836e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_SrO_L_ = Substance {
    name             = "SrO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2938.00, 5000.00,
            NASA7 {
                 8.051671e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.673477e+04,
                -3.909294e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_SrO2H2_s_ = Substance {
    name             = "SrO2H2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 783.15,
            NASA7 {
                 4.170696e+00,
                 1.650370e-02,
                -1.302975e-06,
                 1.397182e-09,
                -5.394894e-13,
                -1.185006e+05,
                -1.696281e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_SrO2H2_L_ = Substance {
    name             = "SrO2H2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            783.15, 5000.00,
            NASA7 {
                 1.897175e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.226117e+05,
                -9.966050e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_SrS_s_ = Substance {
    name             = "SrS(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.744423e+00,
                -2.036361e-03,
                 1.198334e-05,
                -1.488964e-08,
                 5.961644e-12,
                -5.806300e+04,
                -2.430732e+01,
            }
        ),
        Range(
            1000.00, 3000.00,
            NASA7 {
                 5.940546e+00,
                 1.044733e-03,
                -3.079439e-07,
                 9.719855e-11,
                -1.112969e-14,
                -5.825473e+04,
                -2.609996e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ta_cr_ = Substance {
    name             = "Ta(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.329985e+00,
                 4.450284e-03,
                -9.522428e-06,
                 9.878292e-09,
                -3.783084e-12,
                -8.260915e+02,
                -9.270936e+00,
            }
        ),
        Range(
            1000.00, 3258.00,
            NASA7 {
                 2.895950e+00,
                 5.337591e-04,
                -3.591447e-08,
                -7.207615e-11,
                 3.133020e-14,
                -8.712558e+02,
                -1.164403e+01,
            }
        )
    },
    elements         = {
        Ta = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ta_L_ = Substance {
    name             = "Ta(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            3258.00, 6000.00,
            NASA7 {
                 5.032167e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.442238e+02,
                -2.597366e+01,
            }
        )
    },
    elements         = {
        Ta = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_TaC_s_ = Substance {
    name             = "TaC(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.024972e+00,
                 1.762862e-02,
                -2.551586e-05,
                 1.731331e-08,
                -4.305786e-12,
                -1.822660e+04,
                -5.009313e+00,
            }
        ),
        Range(
            1000.00, 4273.00,
            NASA7 {
                 5.002706e+00,
                 1.284904e-03,
                -1.749594e-07,
                 3.524558e-11,
                -2.642926e-15,
                -1.902055e+04,
                -2.412969e+01,
            }
        )
    },
    elements         = {
        Ta = 1.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_TaC_L_ = Substance {
    name             = "TaC(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            4273.00, 5000.00,
            NASA7 {
                 8.051671e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.010334e+04,
                -4.208555e+01,
            }
        )
    },
    elements         = {
        Ta = 1.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ta2O5_s_ = Substance {
    name             = "Ta2O5(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.011994e+01,
                 2.553756e-02,
                -1.684735e-05,
                 3.473408e-11,
                 3.126801e-12,
                -2.500817e+05,
                -4.731088e+01,
            }
        ),
        Range(
            1000.00, 2058.00,
            NASA7 {
                 1.847368e+01,
                 3.490243e-03,
                 9.115658e-07,
                -1.150829e-09,
                 2.470206e-13,
                -2.524591e+05,
                -9.073349e+01,
            }
        )
    },
    elements         = {
        Ta = 2.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ta2O5_L_ = Substance {
    name             = "Ta2O5(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2058.00, 5000.00,
            NASA7 {
                 2.918731e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.533625e+05,
                -1.585777e+02,
            }
        )
    },
    elements         = {
        Ta = 2.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ti_a_ = Substance {
    name             = "Ti(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.328296e+00,
                 1.047761e-02,
                -2.198165e-05,
                 2.174690e-08,
                -7.660604e-12,
                -7.068810e+02,
                -6.197229e+00,
            }
        ),
        Range(
            1000.00, 1156.00,
            NASA7 {
                 2.979872e+01,
                -5.673690e-02,
                 3.084873e-05,
                 0.000000e+00,
                 0.000000e+00,
                -9.275570e+03,
                -1.567308e+02,
            }
        )
    },
    elements         = {
        Ti = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ti_b_ = Substance {
    name             = "Ti(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1156.00, 1944.00,
            NASA7 {
                 4.550509e+00,
                -5.784468e-03,
                 6.584288e-06,
                -2.605235e-09,
                 4.069302e-13,
                -1.866957e+02,
                -1.979530e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ti_L_ = Substance {
    name             = "Ti(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1944.00, 6000.00,
            NASA7 {
                 5.628714e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.375096e+03,
                -3.078727e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_TiC_s_ = Substance {
    name             = "TiC(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.363394e+00,
                 2.825224e-02,
                -4.117521e-05,
                 2.678886e-08,
                -6.346987e-12,
                -2.267835e+04,
                 3.862648e+00,
            }
        ),
        Range(
            1000.00, 3290.00,
            NASA7 {
                 5.941394e+00,
                -3.727997e-04,
                 7.120995e-07,
                -1.351709e-10,
                 9.980366e-15,
                -2.417344e+04,
                -3.153022e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_TiC_L_ = Substance {
    name             = "TiC(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            3290.00, 5000.00,
            NASA7 {
                 7.548442e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.766020e+04,
                -4.062966e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_TiCL2_s_ = Substance {
    name             = "TiCL2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.756752e+00,
                 1.363103e-02,
                -2.041623e-05,
                 1.590989e-08,
                -4.545110e-12,
                -6.416992e+04,
                -2.558546e+01,
            }
        ),
        Range(
            1000.00, 2000.00,
            NASA7 {
                 7.968415e+00,
                 2.544792e-03,
                -2.864812e-07,
                 1.318781e-10,
                -2.227083e-14,
                -6.450844e+04,
                -3.571309e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_TiCL3_s_ = Substance {
    name             = "TiCL3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.093794e+01,
                 2.662274e-03,
                -1.478592e-07,
                -1.540677e-09,
                 9.221877e-13,
                -9.018267e+04,
                -4.628729e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.146266e+01,
                 1.401781e-03,
                -3.068972e-08,
                 1.233901e-13,
                -1.056130e-17,
                -9.031696e+04,
                -4.899308e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_TiCL4_L_ = Substance {
    name             = "TiCL4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.706604e+01,
                 1.577717e-03,
                -1.087038e-06,
                 1.039030e-09,
                -3.602253e-13,
                -1.018713e+05,
                -6.730823e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.714264e+01,
                 1.093709e-03,
                -1.069031e-09,
                 2.661676e-13,
                -2.279448e-17,
                -1.018803e+05,
                -6.764014e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_TiN_s_ = Substance {
    name             = "TiN(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -2.532012e+00,
                 4.117486e-02,
                -7.705578e-05,
                 6.528987e-08,
                -2.060519e-11,
                -4.112467e+04,
                 8.675080e+00,
            }
        ),
        Range(
            1000.00, 3220.00,
            NASA7 {
                 5.601005e+00,
                 3.564594e-04,
                 3.952180e-07,
                -8.871800e-11,
                 7.784451e-15,
                -4.244343e+04,
                -2.877329e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_TiN_L_ = Substance {
    name             = "TiN(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            3220.00, 5000.00,
            NASA7 {
                 7.548442e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.626171e+04,
                -3.958391e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_TiO_a_ = Substance {
    name             = "TiO(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 8.980956e-01,
                 2.135438e-02,
                -3.584287e-05,
                 3.040816e-08,
                -9.712163e-12,
                -6.622433e+04,
                -5.956700e+00,
            }
        ),
        Range(
            1000.00, 1265.00,
            NASA7 {
                 2.651679e+00,
                 7.996320e-03,
                -4.955283e-06,
                 1.412884e-09,
                 0.000000e+00,
                -6.628836e+04,
                -1.291870e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_TiO_b_ = Substance {
    name             = "TiO(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1265.00, 2023.00,
            NASA7 {
                 1.797142e+00,
                 1.012886e-02,
                -7.458557e-06,
                 3.083581e-09,
                -4.756175e-13,
                -6.548277e+04,
                -7.934918e+00,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_TiO_L_ = Substance {
    name             = "TiO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2023.00, 5000.00,
            NASA7 {
                 8.051671e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -6.327214e+04,
                -4.131211e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_TiO2_ru_ = Substance {
    name             = "TiO2(ru)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.611752e-01,
                 3.796666e-02,
                -6.515475e-05,
                 5.255214e-08,
                -1.620005e-11,
                -1.147890e+05,
                -1.887404e+00,
            }
        ),
        Range(
            1000.00, 2130.00,
            NASA7 {
                 6.848915e+00,
                 4.246346e-03,
                -3.008898e-06,
                 1.060252e-09,
                -1.437960e-13,
                -1.159925e+05,
                -3.451411e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_TiO2_L_ = Substance {
    name             = "TiO2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2130.00, 5000.00,
            NASA7 {
                 1.207751e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.149423e+05,
                -6.591076e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ti2O3_a_ = Substance {
    name             = "Ti2O3(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 470.00,
            NASA7 {
                 1.462354e+01,
                -3.716172e-02,
                 9.002647e-05,
                 0.000000e+00,
                 0.000000e+00,
                -1.864169e+05,
                -6.691490e+01,
            }
        )
    },
    elements         = {
        Ti = 2.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ti2O3_b_ = Substance {
    name             = "Ti2O3(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            470.00, 1000.00,
            NASA7 {
                 1.697749e+00,
                 5.713743e-02,
                -8.332068e-05,
                 5.729953e-08,
                -1.521168e-11,
                -1.852504e+05,
                -1.406656e+01,
            }
        ),
        Range(
            1000.00, 2115.00,
            NASA7 {
                 1.487422e+01,
                 4.546570e-03,
                -2.364636e-06,
                 5.996039e-10,
                -5.341426e-14,
                -1.879734e+05,
                -7.786316e+01,
            }
        )
    },
    elements         = {
        Ti = 2.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ti2O3_L_ = Substance {
    name             = "Ti2O3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2115.00, 5000.00,
            NASA7 {
                 1.887111e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.785870e+05,
                -9.656726e+01,
            }
        )
    },
    elements         = {
        Ti = 2.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ti3O5_a_ = Substance {
    name             = "Ti3O5(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 450.00,
            NASA7 {
                -3.733743e+00,
                 1.061932e-01,
                -1.047238e-04,
                 0.000000e+00,
                 0.000000e+00,
                -2.984562e+05,
                 9.824102e+00,
            }
        )
    },
    elements         = {
        Ti = 3.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ti3O5_b_ = Substance {
    name             = "Ti3O5(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            450.00, 1000.00,
            NASA7 {
                 1.869282e+01,
                 8.505106e-03,
                -5.124621e-06,
                 4.611988e-09,
                -1.523856e-12,
                -3.001290e+05,
                -8.988959e+01,
            }
        ),
        Range(
            1000.00, 2050.00,
            NASA7 {
                 1.841516e+01,
                 8.001310e-03,
                -1.990706e-06,
                 8.781240e-10,
                -1.424528e-13,
                -2.999868e+05,
                -8.813548e+01,
            }
        )
    },
    elements         = {
        Ti = 3.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ti3O5_L_ = Substance {
    name             = "Ti3O5(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2050.00, 5000.00,
            NASA7 {
                 3.220669e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.936854e+05,
                -1.691270e+02,
            }
        )
    },
    elements         = {
        Ti = 3.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Ti4O7_s_ = Substance {
    name             = "Ti4O7(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -8.633356e-01,
                 1.416046e-01,
                -2.324231e-04,
                 1.819407e-07,
                -5.480141e-11,
                -4.137948e+05,
                -4.563758e+00,
            }
        ),
        Range(
            1000.00, 1950.00,
            NASA7 {
                 2.411292e+01,
                 2.292771e-02,
                -1.711916e-05,
                 6.484921e-09,
                -9.488381e-13,
                -4.181072e+05,
                -1.210465e+02,
            }
        )
    },
    elements         = {
        Ti = 4.0,
        O  = 7.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Ti4O7_L_ = Substance {
    name             = "Ti4O7(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1950.00, 5000.00,
            NASA7 {
                 4.428419e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.108967e+05,
                -2.351604e+02,
            }
        )
    },
    elements         = {
        Ti = 4.0,
        O  = 7.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_V_cr_ = Substance {
    name             = "V(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 8.642730e-01,
                 1.403013e-02,
                -3.152285e-05,
                 3.167286e-08,
                -1.143275e-11,
                -6.599696e+02,
                -4.483323e+00,
            }
        ),
        Range(
            1000.00, 2190.00,
            NASA7 {
                 4.482156e+00,
                -4.257281e-03,
                 5.383252e-06,
                -2.420440e-09,
                 4.239812e-13,
                -1.284202e+03,
                -2.124016e+01,
            }
        )
    },
    elements         = {
        V = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_V_L_ = Substance {
    name             = "V(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2190.00, 6000.00,
            NASA7 {
                 5.557032e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.899582e+03,
                -3.070343e+01,
            }
        )
    },
    elements         = {
        V = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_VCL2_s_ = Substance {
    name             = "VCL2(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.739560e+00,
                 1.048722e-02,
                -1.722678e-05,
                 1.476883e-08,
                -4.755071e-12,
                -5.669889e+04,
                -2.920570e+01,
            }
        ),
        Range(
            1000.00, 1300.00,
            NASA7 {
                 6.271122e+00,
                 7.489005e-03,
                -5.253100e-06,
                 1.506737e-09,
                 0.000000e+00,
                -5.635806e+04,
                -2.572654e+01,
            }
        )
    },
    elements         = {
        V  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_VCL3_s_ = Substance {
    name             = "VCL3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.977041e+00,
                 2.354201e-02,
                -4.074527e-05,
                 3.492848e-08,
                -1.124490e-11,
                -7.267817e+04,
                -2.949371e+01,
            }
        )
    },
    elements         = {
        V  = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_VCL4_L_ = Substance {
    name             = "VCL4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 2000.00,
            NASA7 {
                 1.746206e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.369585e+04,
                -6.879479e+01,
            }
        )
    },
    elements         = {
        V  = 1.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_VN_s_ = Substance {
    name             = "VN(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 8.127136e-01,
                 2.010104e-02,
                -3.117800e-05,
                 2.310369e-08,
                -6.384514e-12,
                -2.702009e+04,
                -4.945744e+00,
            }
        ),
        Range(
            1000.00, 3500.00,
            NASA7 {
                 4.836874e+00,
                 1.890015e-03,
                -3.161046e-07,
                 4.605066e-11,
                -1.910204e-15,
                -2.773815e+04,
                -2.387335e+01,
            }
        )
    },
    elements         = {
        V = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_VO_s_ = Substance {
    name             = "VO(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.538040e+00,
                 1.644708e-02,
                -2.855981e-05,
                 2.483639e-08,
                -7.988695e-12,
                -5.321192e+04,
                -1.359976e+01,
            }
        ),
        Range(
            1000.00, 2063.00,
            NASA7 {
                 5.339872e+00,
                 1.759170e-03,
                 3.847762e-07,
                -2.618247e-10,
                 5.100939e-14,
                -5.365138e+04,
                -2.638236e+01,
            }
        )
    },
    elements         = {
        V = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_VO_L_ = Substance {
    name             = "VO(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2063.00, 5000.00,
            NASA7 {
                 7.548442e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.760047e+04,
                -3.615421e+01,
            }
        )
    },
    elements         = {
        V = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_V2O3_s_ = Substance {
    name             = "V2O3(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.287703e+00,
                 5.763276e-02,
                -9.673856e-05,
                 7.406692e-08,
                -2.065839e-11,
                -1.491119e+05,
                -1.472345e+01,
            }
        ),
        Range(
            1000.00, 2340.00,
            NASA7 {
                 1.396421e+01,
                 1.687130e-03,
                 1.137121e-06,
                -2.080601e-10,
                 1.002832e-14,
                -1.510058e+05,
                -6.878289e+01,
            }
        )
    },
    elements         = {
        V = 2.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_V2O3_L_ = Substance {
    name             = "V2O3(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2340.00, 5000.00,
            NASA7 {
                 1.887111e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.403406e+05,
                -9.458092e+01,
            }
        )
    },
    elements         = {
        V = 2.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_V2O4_I_ = Substance {
    name             = "V2O4(I)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 340.00,
            NASA7 {
                 6.891454e+00,
                 9.914202e-03,
                 5.783710e-05,
                 4.305392e-08,
                -2.848269e-10,
                -1.746086e+05,
                -3.215736e+01,
            }
        )
    },
    elements         = {
        V = 2.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_V2O4_II_ = Substance {
    name             = "V2O4(II)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            340.00, 1000.00,
            NASA7 {
                 4.900362e+00,
                 5.002695e-02,
                -7.131633e-05,
                 4.651557e-08,
                -1.078327e-11,
                -1.737368e+05,
                -2.450337e+01,
            }
        ),
        Range(
            1000.00, 1818.00,
            NASA7 {
                 1.661026e+01,
                 2.332942e-03,
                 9.890479e-07,
                -7.503250e-10,
                 1.613546e-13,
                -1.760739e+05,
                -8.083200e+01,
            }
        )
    },
    elements         = {
        V = 2.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_V2O4_L_ = Substance {
    name             = "V2O4(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1818.00, 5000.00,
            NASA7 {
                 2.566470e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.746301e+05,
                -1.365594e+02,
            }
        )
    },
    elements         = {
        V = 2.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_V2O5_s_ = Substance {
    name             = "V2O5(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 943.00,
            NASA7 {
                -1.164036e+00,
                 9.353588e-02,
                -1.567510e-04,
                 1.222352e-07,
                -3.573885e-11,
                -1.891453e+05,
                 4.072275e-01,
            }
        )
    },
    elements         = {
        V = 2.0,
        O = 5.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_V2O5_L_ = Substance {
    name             = "V2O5(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            943.00, 5000.00,
            NASA7 {
                 2.294726e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.875145e+05,
                -1.108928e+02,
            }
        )
    },
    elements         = {
        V = 2.0,
        O = 5.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Zn_cr_ = Substance {
    name             = "Zn(cr)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 692.73,
            NASA7 {
                 1.850689e+00,
                 9.177914e-03,
                -2.610470e-05,
                 3.385688e-08,
                -1.394307e-11,
                -7.894031e+02,
                -7.385263e+00,
            }
        )
    },
    elements         = {
        Zn = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Zn_L_ = Substance {
    name             = "Zn(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            692.73, 6000.00,
            NASA7 {
                 3.776530e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -4.316953e+02,
                -1.567084e+01,
            }
        )
    },
    elements         = {
        Zn = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_ZnSO4_a_ = Substance {
    name             = "ZnSO4(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(300.0, 540.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=5.1657364000e+00, a4=2.3977394000e-02, a5=-3.0700744000e-06, a6=-4.8450164000e-09, a7=0.0000000000e+00, a8=-1.2045359000e+05, a9=-2.3105369000e+01 }),
        Range(540.0, 1000.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=1.5553495000e+01, a4=2.7737319000e-03, a5=-3.8034721000e-06, a6=4.0845543000e-09, a7=-1.5289562000e-12, a8=-1.2250490000e+05, a9=-7.6221684000e+01 }),
        Range(1000.0, 1013.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=1.5895259000e+01, a4=1.1840942000e-03, a5=0.0000000000e+00, a6=0.0000000000e+00, a7=0.0000000000e+00, a8=-1.2260433000e+05, a9=-7.7915322000e+01 })
    },
    elements         = {
        Zn = 1.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ZnSO4_b_ = Substance {
    name             = "ZnSO4(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1013.00, 5000.00,
            NASA7 {
                 1.746183e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.211381e+05,
                -8.514325e+01,
            }
        )
    },
    elements         = {
        Zn = 1.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Zr_a_ = Substance {
    name             = "Zr(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.182888e+00,
                 5.428864e-03,
                -1.214640e-05,
                 1.311327e-08,
                -4.838184e-12,
                -8.084414e+02,
                -8.947418e+00,
            }
        ),
        Range(
            1000.00, 1135.00,
            NASA7 {
                 2.281195e+00,
                 1.469717e-03,
                -1.046576e-08,
                 0.000000e+00,
                 0.000000e+00,
                -6.618031e+02,
                -8.573772e+00,
            }
        )
    },
    elements         = {
        Zr = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Zr_b_ = Substance {
    name             = "Zr(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1135.00, 2125.00,
            NASA7 {
                 4.068762e+00,
                -1.584897e-03,
                 1.029951e-06,
                -1.557676e-10,
                 2.302846e-14,
                -6.911723e+02,
                -1.785934e+01,
            }
        )
    },
    elements         = {
        Zr = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_Zr_L_ = Substance {
    name             = "Zr(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2125.00, 6000.00,
            NASA7 {
                 5.032167e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.100846e+03,
                -2.547976e+01,
            }
        )
    },
    elements         = {
        Zr = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_ZrN_s_ = Substance {
    name             = "ZrN(s)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.855629e+00,
                 8.616697e-03,
                -5.348664e-06,
                -2.880422e-09,
                 3.108785e-12,
                -4.511202e+04,
                -1.390107e+01,
            }
        ),
        Range(
            1000.00, 3225.00,
            NASA7 {
                 5.540782e+00,
                 6.183935e-04,
                 2.954211e-07,
                -1.178431e-10,
                 1.524143e-14,
                -4.575132e+04,
                -2.742065e+01,
            }
        )
    },
    elements         = {
        Zr = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ZrN_L_ = Substance {
    name             = "ZrN(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            3225.00, 5000.00,
            NASA7 {
                 7.045116e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.810553e+04,
                -3.443626e+01,
            }
        )
    },
    elements         = {
        Zr = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_ZrO2_a_ = Substance {
    name             = "ZrO2(a)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -7.953711e-01,
                 4.393346e-02,
                -8.121444e-05,
                 6.956765e-08,
                -2.238095e-11,
                -1.331197e+05,
                 5.322101e-01,
            }
        ),
        Range(
            1000.00, 1478.00,
            NASA7 {
                -2.214439e+01,
                 9.963976e-02,
                -1.200669e-04,
                 6.468674e-08,
                -1.300488e-11,
                -1.273280e+05,
                 1.110089e+02,
            }
        )
    },
    elements         = {
        Zr = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ZrO2_b_ = Substance {
    name             = "ZrO2(b)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            1478.00, 2950.00,
            NASA7 {
                 8.957363e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.341435e+05,
                -4.527402e+01,
            }
        )
    },
    elements         = {
        Zr = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Solid",
}

local s_ZrO2_L_ = Substance {
    name             = "ZrO2(L)",
    molar_volume     = 0.0,
    s0               = 0.0,
    ranges           = {
        Range(
            2950.00, 5000.00,
            NASA7 {
                 1.056767e+01,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -1.284274e+05,
                -5.459226e+01,
            }
        )
    },
    elements         = {
        Zr = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Liquid",
}

local s_Electron = Substance {
    name             = "Electron",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.453750e+02,
                -1.172469e+01,
            }
        )
    },
    elements         = {
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL = Substance {
    name             = "AL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.111124e+00,
                -3.593823e-03,
                 8.147493e-06,
                -8.088090e-09,
                 2.931325e-12,
                 3.882834e+04,
                 2.840457e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.533857e+00,
                -4.658595e-05,
                 2.827980e-08,
                -8.543620e-12,
                 1.022080e-15,
                 3.890457e+04,
                 5.379842e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL_plus = Substance {
    name             = "AL+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.090281e+05,
                 3.791006e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.512153e+00,
                -2.610113e-05,
                 1.903605e-08,
                -5.688815e-12,
                 6.005300e-16,
                 1.090240e+05,
                 3.725383e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL_minus = Substance {
    name             = "AL-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.647319e+00,
                -7.203716e-04,
                 1.025396e-06,
                -3.511182e-11,
                -2.389330e-13,
                 3.300493e+04,
                 5.308767e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.189635e+00,
                 8.034462e-04,
                -3.793895e-07,
                 6.900599e-11,
                -4.398841e-15,
                 3.309603e+04,
                 7.555572e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALBO2 = Substance {
    name             = "ALBO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.308723e+00,
                 1.889054e-02,
                -2.063335e-05,
                 1.025132e-08,
                -1.694128e-12,
                -6.648217e+04,
                 1.447702e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.172300e+00,
                 2.978074e-03,
                -1.243111e-06,
                 2.318878e-10,
                -1.604121e-14,
                -6.768368e+04,
                -9.981740e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        B  = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALBr = Substance {
    name             = "ALBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.490061e+00,
                 4.547680e-03,
                -8.193558e-06,
                 6.866615e-09,
                -2.176506e-12,
                 7.294531e+02,
                 7.886648e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.382242e+00,
                 2.120071e-04,
                -7.076445e-08,
                 1.065902e-11,
                 1.483027e-16,
                 5.761685e+02,
                 3.739109e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALBr3 = Substance {
    name             = "ALBr3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.253721e+00,
                 1.608022e-02,
                -2.865976e-05,
                 2.361608e-08,
                -7.393131e-12,
                -5.173521e+04,
                 2.683658e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.615059e+00,
                 4.446855e-04,
                -1.990298e-07,
                 3.925182e-11,
                -2.842798e-15,
                -5.234954e+04,
                -1.311911e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Br = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALC = Substance {
    name             = "ALC",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.642248e+00,
                 6.446516e-03,
                -9.589238e-06,
                 6.904081e-09,
                -1.943078e-12,
                 8.192987e+04,
                 1.026736e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.156448e+00,
                 4.469249e-04,
                -1.746704e-07,
                 3.430434e-11,
                -2.477271e-15,
                 8.160660e+04,
                 2.904725e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCL = Substance {
    name             = "ALCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.122229e+00,
                 5.928047e-03,
                -1.041583e-05,
                 8.555107e-09,
                -2.672238e-12,
                -7.307584e+03,
                 8.253356e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.339527e+00,
                 2.483887e-04,
                -8.292185e-08,
                 1.234232e-11,
                -2.375582e-17,
                -7.528108e+03,
                 2.537294e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCL_plus = Substance {
    name             = "ALCL+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.869835e+00,
                 6.653459e-03,
                -1.132771e-05,
                 9.070297e-09,
                -2.779464e-12,
                 1.025974e+05,
                 1.001995e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.628496e+00,
                -3.475054e-04,
                 2.299735e-07,
                -2.427980e-11,
                -2.644054e-16,
                 1.022045e+05,
                 1.430400e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCLF = Substance {
    name             = "ALCLF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.217597e+00,
                 1.452455e-02,
                -2.392249e-05,
                 1.862161e-08,
                -5.590367e-12,
                -6.030551e+04,
                 1.227182e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.426262e+00,
                 6.786117e-04,
                -3.118639e-07,
                 6.214238e-11,
                -4.251957e-15,
                -6.093877e+04,
                -3.062271e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCLF_plus = Substance {
    name             = "ALCLF+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.734129e+00,
                 1.388904e-02,
                -2.222254e-05,
                 1.693768e-08,
                -5.006134e-12,
                 3.164776e+04,
                 6.669147e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.883591e+00,
                 7.050937e-04,
                -3.136609e-07,
                 6.160731e-11,
                -4.449054e-15,
                 3.100599e+04,
                -8.482114e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCLF2 = Substance {
    name             = "ALCLF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.490524e+00,
                 2.341062e-02,
                -3.673080e-05,
                 2.757748e-08,
                -8.057087e-12,
                -1.219786e+05,
                 1.035983e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.867454e+00,
                 1.293332e-03,
                -5.746880e-07,
                 1.127842e-10,
                -8.139815e-15,
                -1.230925e+05,
                -1.560078e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCL2 = Substance {
    name             = "ALCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.933674e+00,
                 1.292892e-02,
                -2.276799e-05,
                 1.860551e-08,
                -5.790028e-12,
                -3.529662e+04,
                 9.401867e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.641413e+00,
                 4.339191e-04,
                -2.034246e-07,
                 4.090014e-11,
                -2.720938e-15,
                -3.579469e+04,
                -3.348439e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCL2_plus = Substance {
    name             = "ALCL2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.356113e+00,
                 1.264061e-02,
                -2.155406e-05,
                 1.722275e-08,
                -5.274447e-12,
                 5.616974e+04,
                 4.493047e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.095458e+00,
                 4.652547e-04,
                -2.076648e-07,
                 4.087991e-11,
                -2.956891e-15,
                 5.564378e+04,
                -8.518099e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCL2_minus = Substance {
    name             = "ALCL2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.251095e+00,
                 1.196856e-02,
                -2.153823e-05,
                 1.786923e-08,
                -5.622075e-12,
                -5.951306e+04,
                 7.393262e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.712562e+00,
                 3.465684e-04,
                -1.588435e-07,
                 2.995006e-11,
                -1.654481e-15,
                -5.995426e+04,
                -4.136329e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 2.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCL2F = Substance {
    name             = "ALCL2F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.255166e+00,
                 2.201679e-02,
                -3.627699e-05,
                 2.827484e-08,
                -8.501110e-12,
                -9.708889e+04,
                 8.024888e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.147607e+00,
                 9.766916e-04,
                -4.348868e-07,
                 8.546408e-11,
                -6.173947e-15,
                -9.806029e+04,
                -1.537912e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 2.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALCL3 = Substance {
    name             = "ALCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.913266e+00,
                 2.103186e-02,
                -3.654693e-05,
                 2.958681e-08,
                -9.145100e-12,
                -7.244106e+04,
                 4.942996e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.404108e+00,
                 6.864187e-04,
                -3.066385e-07,
                 6.039151e-11,
                -4.369357e-15,
                -7.328581e+04,
                -1.629638e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF = Substance {
    name             = "ALF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.647292e+00,
                 6.082269e-03,
                -8.596343e-06,
                 5.897984e-09,
                -1.588677e-12,
                -3.294926e+04,
                 9.313912e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.126139e+00,
                 4.626805e-04,
                -1.747773e-07,
                 3.001548e-11,
                -1.532884e-15,
                -3.327594e+04,
                 2.066407e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF_plus = Substance {
    name             = "ALF+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.725305e+00,
                 4.812031e-03,
                -5.441172e-06,
                 2.743908e-09,
                -3.587519e-13,
                 8.225047e+04,
                 9.723361e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.352219e+00,
                 1.310387e-03,
                -1.431838e-07,
                -4.544233e-11,
                 7.342075e-15,
                 8.223250e+04,
                 7.083708e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF2 = Substance {
    name             = "ALF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.740846e+00,
                 1.446674e-02,
                -2.152062e-05,
                 1.541199e-08,
                -4.322980e-12,
                -8.483459e+04,
                 1.267668e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.157930e+00,
                 9.813229e-04,
                -4.453503e-07,
                 8.820596e-11,
                -6.126226e-15,
                -8.556648e+04,
                -3.951192e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF2_plus = Substance {
    name             = "ALF2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.123918e+00,
                 1.452306e-02,
                -2.131544e-05,
                 1.515613e-08,
                -4.237410e-12,
                 9.654507e+03,
                 7.474176e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.592539e+00,
                 1.031949e-03,
                -4.573944e-07,
                 8.962060e-11,
                -6.460982e-15,
                 8.899194e+03,
                -9.459698e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF2_minus = Substance {
    name             = "ALF2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.671535e+00,
                 1.560194e-02,
                -2.441932e-05,
                 1.825317e-08,
                -5.306478e-12,
                -1.105086e+05,
                 1.233823e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.266674e+00,
                 8.371117e-04,
                -3.684002e-07,
                 7.015048e-11,
                -4.687630e-15,
                -1.112529e+05,
                -5.021180e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 2.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF2O = Substance {
    name             = "ALF2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.087409e+00,
                 2.383324e-02,
                -3.606298e-05,
                 2.626892e-08,
                -7.485676e-12,
                -1.350654e+05,
                 1.189367e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.820562e+00,
                 1.254869e-03,
                -5.452446e-07,
                 1.203686e-10,
                -9.648360e-15,
                -1.363067e+05,
                -1.604287e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF2O_minus = Substance {
    name             = "ALF2O-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.919760e+00,
                 2.409401e-02,
                -3.608094e-05,
                 2.606785e-08,
                -7.380838e-12,
                -1.591815e+05,
                 1.183108e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.614279e+00,
                 1.578460e-03,
                -7.002911e-07,
                 1.372921e-10,
                -9.901398e-15,
                -1.604034e+05,
                -1.587925e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 2.0,
        O  = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF3 = Substance {
    name             = "ALF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.102854e+00,
                 2.234558e-02,
                -3.145887e-05,
                 2.115821e-08,
                -5.538961e-12,
                -1.471268e+05,
                 1.015971e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.728972e+00,
                 1.314286e-03,
                -5.175996e-07,
                 8.867828e-11,
                -5.528374e-15,
                -1.483903e+05,
                -1.750367e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALF4_minus = Substance {
    name             = "ALF4-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.587859e+00,
                 3.993044e-02,
                -6.573691e-05,
                 5.116306e-08,
                -1.535869e-11,
                -2.415965e+05,
                 1.130158e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.147145e+01,
                 1.752579e-03,
                -7.806423e-07,
                 1.534447e-10,
                -1.108637e-14,
                -2.433604e+05,
                -3.119807e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        F  = 4.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALH = Substance {
    name             = "ALH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.657686e+00,
                -1.974470e-03,
                 6.866340e-06,
                -6.204140e-09,
                 1.866310e-12,
                 3.014646e+04,
                 2.088511e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.336690e+00,
                 1.287786e-03,
                -4.986994e-07,
                 9.229463e-11,
                -6.345169e-15,
                 3.009176e+04,
                 3.095488e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALI = Substance {
    name             = "ALI",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.376194e+00,
                 6.203580e-03,
                -1.334380e-05,
                 1.289780e-08,
                -4.592625e-12,
                 6.984689e+03,
                 9.209803e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.300678e+00,
                 3.945268e-04,
                -1.947179e-07,
                 4.317666e-11,
                -2.509959e-15,
                 6.877338e+03,
                 5.195550e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALI3 = Substance {
    name             = "ALI3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.976130e+00,
                 1.321278e-02,
                -2.382907e-05,
                 1.979639e-08,
                -6.233628e-12,
                -2.574158e+04,
                 2.147667e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.709250e+00,
                 3.366469e-04,
                -1.509485e-07,
                 2.981316e-11,
                -2.161799e-15,
                -2.623400e+04,
                -1.066399e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        I  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALN = Substance {
    name             = "ALN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.644865e+00,
                 6.541688e-03,
                -9.862534e-06,
                 7.188232e-09,
                -2.044484e-12,
                 6.189738e+04,
                 1.084786e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.145047e+00,
                 4.856096e-04,
                -2.012641e-07,
                 4.125949e-11,
                -2.885431e-15,
                 6.158324e+04,
                 3.582343e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALO = Substance {
    name             = "ALO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.811610e+00,
                 3.958426e-03,
                -3.369530e-06,
                 6.733050e-10,
                 4.008946e-13,
                 7.065504e+03,
                 9.208958e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.313906e+00,
                 1.045242e-03,
                 2.748553e-07,
                -1.792861e-10,
                 1.998781e-14,
                 7.094334e+03,
                 7.209634e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALO_plus = Substance {
    name             = "ALO+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.941443e+00,
                 5.259217e-03,
                -7.343907e-06,
                 5.331678e-09,
                -1.578334e-12,
                 1.183747e+05,
                 9.735383e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.190847e+00,
                 6.935820e-04,
                -3.446000e-07,
                 7.617233e-11,
                -5.903240e-15,
                 1.180744e+05,
                 3.529520e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALO_minus = Substance {
    name             = "ALO-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.722675e+00,
                 4.947552e-03,
                -5.757175e-06,
                 3.142440e-09,
                -6.415283e-13,
                -3.339130e+04,
                 8.836314e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.038055e+00,
                 5.583711e-04,
                -2.188866e-07,
                 3.853302e-11,
                -2.109555e-15,
                -3.371009e+04,
                 2.244807e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALOCL = Substance {
    name             = "ALOCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.244441e+00,
                 1.411701e-02,
                -1.932204e-05,
                 1.196280e-08,
                -2.706918e-12,
                -4.331234e+04,
                 8.005372e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.780520e+00,
                 7.966282e-04,
                -3.423335e-07,
                 6.502265e-11,
                -4.551920e-15,
                -4.408083e+04,
                -9.300140e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALOF = Substance {
    name             = "ALOF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.039146e+00,
                 1.894876e-02,
                -2.897877e-05,
                 2.136094e-08,
                -6.157987e-12,
                -7.118233e+04,
                 1.238660e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.452162e+00,
                 1.192659e-03,
                -5.289314e-07,
                 1.036781e-10,
                -7.476537e-15,
                -7.211636e+04,
                -9.018128e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALOH = Substance {
    name             = "ALOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.613221e+00,
                 2.771689e-03,
                 7.415783e-06,
                -1.135460e-08,
                 4.556956e-12,
                -2.258680e+04,
                 1.007533e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.686067e+00,
                 3.363682e-03,
                -1.246624e-06,
                 2.138220e-10,
                -1.389832e-14,
                -2.304610e+04,
                 3.690156e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALOH_plus = Substance {
    name             = "ALOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.960344e+00,
                 7.919114e-03,
                -2.285796e-06,
                -4.010379e-09,
                 2.570760e-12,
                 6.451018e+04,
                 1.410618e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.150199e+00,
                 2.892521e-03,
                -1.056541e-06,
                 1.794517e-10,
                -1.158701e-14,
                 6.389289e+04,
                 2.640138e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALOH_minus = Substance {
    name             = "ALOH-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.913020e+00,
                 5.953071e-03,
                -3.055805e-06,
                -1.259871e-09,
                 1.288609e-12,
                -2.878183e+04,
                 1.062247e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.301072e+00,
                 2.166850e-03,
                -7.398864e-07,
                 1.182105e-10,
                -7.220884e-15,
                -2.913410e+04,
                 3.527008e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 1.0,
        H  = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALO2 = Substance {
    name             = "ALO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.254515e+00,
                 1.427584e-02,
                -2.110325e-05,
                 1.505626e-08,
                -4.214261e-12,
                -1.181258e+04,
                 8.302555e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.606464e+00,
                 1.080225e-03,
                -5.222934e-07,
                 1.132422e-10,
                -8.529097e-15,
                -1.253243e+04,
                -8.017176e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALO2_minus = Substance {
    name             = "ALO2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.081204e+00,
                 1.303965e-02,
                -1.711992e-05,
                 1.097870e-08,
                -2.794212e-12,
                -6.020620e+04,
                 7.501567e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.368748e+00,
                 1.279203e-03,
                -5.650399e-07,
                 1.104638e-10,
                -7.951244e-15,
                -6.097201e+04,
                -8.798795e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 2.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALO2H = Substance {
    name             = "ALO2H",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.480046e+00,
                 1.614926e-02,
                -1.603352e-05,
                 6.446617e-09,
                -4.099477e-13,
                -5.668276e+04,
                 1.230707e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.426435e+00,
                 3.223036e-03,
                -1.213935e-06,
                 2.107450e-10,
                -1.382800e-14,
                -5.762615e+04,
                -7.457593e+00,
            }
        )
    },
    elements         = {
        Al = 1.0,
        O  = 2.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ALS = Substance {
    name             = "ALS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.714552e+00,
                 7.311807e-03,
                -1.265289e-05,
                 1.017962e-08,
                -2.876134e-12,
                 2.764349e+04,
                 1.056696e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.981711e+00,
                 3.975264e-03,
                -1.494289e-06,
                 2.263659e-10,
                -1.210364e-14,
                 2.824058e+04,
                 1.598823e+01,
            }
        )
    },
    elements         = {
        Al = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2 = Substance {
    name             = "AL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.809448e+00,
                 1.593650e-02,
                -2.725026e-05,
                 1.987112e-08,
                -5.368405e-12,
                 5.753113e+04,
                 1.407208e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.815806e+00,
                -1.325054e-03,
                 6.075189e-07,
                -1.069242e-10,
                 7.061141e-15,
                 5.678905e+04,
                -4.954711e+00,
            }
        )
    },
    elements         = {
        Al = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2Br6 = Substance {
    name             = "AL2Br6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.418598e+01,
                 3.445251e-02,
                -6.252244e-05,
                 5.217324e-08,
                -1.648271e-11,
                -1.180252e+05,
                -2.292911e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.127433e+01,
                 8.393963e-04,
                -3.759478e-07,
                 7.417011e-11,
                -5.372855e-15,
                -1.192932e+05,
                -5.610682e+01,
            }
        )
    },
    elements         = {
        Al = 2.0,
        Br = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2CL6 = Substance {
    name             = "AL2CL6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.050920e+01,
                 4.907744e-02,
                -8.720873e-05,
                 7.172343e-08,
                -2.242433e-11,
                -1.605178e+05,
                -1.408407e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.079400e+01,
                 1.391425e-03,
                -6.221367e-07,
                 1.225938e-10,
                -8.872758e-15,
                -1.624047e+05,
                -6.247319e+01,
            }
        )
    },
    elements         = {
        Al = 2.0,
        Cl = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2F6 = Substance {
    name             = "AL2F6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.161812e+00,
                 6.889889e-02,
                -1.096586e-04,
                 8.329334e-08,
                -2.456105e-11,
                -3.199425e+05,
                 1.221256e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.882985e+01,
                 3.620223e-03,
                -1.608555e-06,
                 3.156625e-10,
                -2.278029e-14,
                -3.231511e+05,
                -6.324008e+01,
            }
        )
    },
    elements         = {
        Al = 2.0,
        F  = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2I6 = Substance {
    name             = "AL2I6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.622550e+01,
                 2.593844e-02,
                -4.764235e-05,
                 4.008368e-08,
                -1.273718e-11,
                -6.451950e+04,
                -2.654041e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.150319e+01,
                 5.759419e-04,
                -2.583903e-07,
                 5.104598e-11,
                -3.701774e-15,
                -6.544913e+04,
                -5.116607e+01,
            }
        )
    },
    elements         = {
        Al = 2.0,
        I  = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2O = Substance {
    name             = "AL2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.073266e+00,
                 1.130761e-02,
                -1.656516e-05,
                 1.178428e-08,
                -3.300550e-12,
                -1.905423e+04,
                 4.408348e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.772063e+00,
                 8.255009e-04,
                -3.629100e-07,
                 6.953130e-11,
                -4.734521e-15,
                -1.964320e+04,
                -8.772331e+00,
            }
        )
    },
    elements         = {
        Al = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2O_plus = Substance {
    name             = "AL2O+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.104574e+00,
                 1.197835e-02,
                -1.852259e-05,
                 1.375669e-08,
                -3.986742e-12,
                 7.685270e+04,
                 5.102572e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.879785e+00,
                 7.074988e-04,
                -3.141924e-07,
                 6.164098e-11,
                -4.447870e-15,
                 7.627076e+04,
                -8.331814e+00,
            }
        )
    },
    elements         = {
        Al = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2O2 = Substance {
    name             = "AL2O2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.759641e+00,
                 2.999760e-02,
                -5.219050e-05,
                 4.228269e-08,
                -1.307536e-11,
                -4.922603e+04,
                 1.110077e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.159098e+00,
                 9.685393e-04,
                -4.325851e-07,
                 8.517884e-11,
                -6.161537e-15,
                -5.042806e+04,
                -1.915647e+01,
            }
        )
    },
    elements         = {
        Al = 2.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_AL2O2_plus = Substance {
    name             = "AL2O2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.342190e+00,
                 2.811125e-02,
                -4.954718e-05,
                 4.050975e-08,
                -1.261031e-11,
                 6.636251e+04,
                 9.290242e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.275169e+00,
                 8.358722e-04,
                -3.736161e-07,
                 7.360517e-11,
                -5.326279e-15,
                 6.526407e+04,
                -1.867726e+01,
            }
        )
    },
    elements         = {
        Al = 2.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ar = Substance {
    name             = "Ar",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.453750e+02,
                 4.379675e+00,
            }
        )
    },
    elements         = {
        Ar = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ar_plus = Substance {
    name             = "Ar+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.593161e+00,
                -1.328929e-03,
                 5.265039e-06,
                -5.979567e-09,
                 2.189679e-12,
                 1.828784e+05,
                 5.449806e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.869995e+00,
                -1.425472e-04,
                 9.366888e-09,
                 2.925809e-12,
                -3.582479e-16,
                 1.827026e+05,
                 3.532300e+00,
            }
        )
    },
    elements         = {
        Ar = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B = Substance {
    name             = "B",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.510541e+00,
                -6.238013e-05,
                 1.421781e-07,
                -1.416978e-10,
                 5.150187e-14,
                 6.660539e+04,
                 4.163672e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.498603e+00,
                 1.402673e-06,
                 1.094583e-09,
                -1.200064e-12,
                 2.431220e-16,
                 6.660759e+04,
                 4.218880e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B_plus = Substance {
    name             = "B+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.636320e+05,
                 2.419077e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.512071e+00,
                -2.600085e-05,
                 1.904118e-08,
                -5.718401e-12,
                 6.068930e-16,
                 1.636279e+05,
                 2.353927e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B_minus = Substance {
    name             = "B-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.501203e+00,
                -5.734272e-06,
                 1.096704e-08,
                -9.503035e-12,
                 3.089358e-15,
                 6.264158e+04,
                 4.610781e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.500076e+00,
                -8.172943e-08,
                 3.299658e-11,
                -5.746497e-15,
                 3.623661e-19,
                 6.264177e+04,
                 4.615986e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BCL = Substance {
    name             = "BCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.836446e+00,
                 4.436881e-03,
                -4.388752e-06,
                 1.516108e-09,
                 3.264620e-14,
                 1.600136e+04,
                 8.345332e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.102057e+00,
                 4.865919e-04,
                -1.886433e-07,
                 3.583334e-11,
                -2.509907e-15,
                 1.568796e+04,
                 1.955251e+00,
            }
        )
    },
    elements         = {
        B  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BCL_plus = Substance {
    name             = "BCL+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.812420e+00,
                 4.600639e-03,
                -4.811996e-06,
                 1.967222e-09,
                -1.383780e-13,
                 1.474485e+05,
                 9.156682e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.106089e+00,
                 4.727417e-04,
                -1.792858e-07,
                 3.241614e-11,
                -2.054576e-15,
                 1.471310e+05,
                 2.642729e+00,
            }
        )
    },
    elements         = {
        B  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BCLF = Substance {
    name             = "BCLF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.312023e+00,
                 7.419876e-03,
                -4.348595e-06,
                -1.137406e-09,
                 1.376389e-12,
                -3.901755e+04,
                 1.094836e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.707676e+00,
                 1.410020e-03,
                -6.011414e-07,
                 1.136704e-10,
                -7.936806e-15,
                -3.969333e+04,
                -1.535038e+00,
            }
        )
    },
    elements         = {
        B  = 1.0,
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BCL2 = Substance {
    name             = "BCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.297479e+00,
                 1.208258e-02,
                -1.612375e-05,
                 9.626586e-09,
                -2.059920e-12,
                -1.095654e+04,
                 1.104253e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.445984e+00,
                 5.792795e-04,
                -2.604970e-07,
                 6.359636e-11,
                -5.398222e-15,
                -1.166130e+04,
                -4.460870e+00,
            }
        )
    },
    elements         = {
        B  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BCL2_plus = Substance {
    name             = "BCL2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.270493e+00,
                 1.060379e-02,
                -1.422984e-05,
                 8.537283e-09,
                -1.834967e-12,
                 7.943602e+04,
                 4.076451e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.926663e+00,
                 6.777763e-04,
                -3.210150e-07,
                 6.834442e-11,
                -5.007359e-15,
                 7.885782e+04,
                -8.934627e+00,
            }
        )
    },
    elements         = {
        B  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BCL2_minus = Substance {
    name             = "BCL2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.235879e+00,
                 1.169022e-02,
                -1.477826e-05,
                 8.218155e-09,
                -1.565791e-12,
                -1.898181e+04,
                 1.069001e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.351822e+00,
                 7.702885e-04,
                -4.469986e-07,
                 1.383118e-10,
                -1.322199e-14,
                -1.970543e+04,
                -4.774721e+00,
            }
        )
    },
    elements         = {
        B  = 1.0,
        Cl = 2.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BCL3 = Substance {
    name             = "BCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.739527e+00,
                 1.810581e-02,
                -2.134046e-05,
                 1.082834e-08,
                -1.732597e-12,
                -5.021461e+04,
                 9.053127e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.598538e+00,
                 1.553192e-03,
                -6.700060e-07,
                 1.278911e-10,
                -9.000006e-15,
                -5.135707e+04,
                -1.515843e+01,
            }
        )
    },
    elements         = {
        B  = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BF = Substance {
    name             = "BF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.461361e+00,
                -9.568547e-04,
                 6.013574e-06,
                -6.497806e-09,
                 2.235535e-12,
                -1.496982e+04,
                 4.460780e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.577189e+00,
                 1.019291e-03,
                -4.125156e-07,
                 7.719644e-11,
                -5.349874e-15,
                -1.512726e+04,
                 3.266122e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BF2 = Substance {
    name             = "BF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.030930e+00,
                 7.241102e-03,
                -2.825092e-06,
                -2.892041e-09,
                 2.004610e-12,
                -7.215110e+04,
                 1.044570e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.444746e+00,
                 1.753321e-03,
                -7.844447e-07,
                 1.571986e-10,
                -1.131107e-14,
                -7.286037e+04,
                -2.273319e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BF2_plus = Substance {
    name             = "BF2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.314647e+00,
                 8.644365e-03,
                -6.752540e-06,
                 1.338366e-09,
                 4.511491e-13,
                 3.748365e+04,
                 5.904690e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.812764e+00,
                 1.819342e-03,
                -7.710346e-07,
                 1.448978e-10,
                -9.980916e-15,
                 3.679480e+04,
                -7.004312e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BF2_minus = Substance {
    name             = "BF2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.142458e+00,
                 6.410458e-03,
                -1.238646e-06,
                -4.122010e-09,
                 2.347237e-12,
                -9.767296e+04,
                 9.225232e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.310035e+00,
                 2.002044e-03,
                -9.723551e-07,
                 2.164144e-10,
                -1.664088e-14,
                -9.833693e+04,
                -2.327761e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        F = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BF3 = Substance {
    name             = "BF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.446824e+00,
                 1.527631e-02,
                -1.078462e-05,
                 6.890750e-10,
                 1.489319e-12,
                -1.379014e+05,
                 1.256782e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.024198e+00,
                 3.222156e-03,
                -1.370515e-06,
                 2.591967e-10,
                -1.812231e-14,
                -1.391807e+05,
                -1.118430e+01,
            }
        )
    },
    elements         = {
        B = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BH = Substance {
    name             = "BH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.686221e+00,
                -1.305544e-03,
                 2.674211e-06,
                -9.107374e-10,
                -1.559114e-13,
                 5.217633e+04,
                -5.524540e-02,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.891908e+00,
                 1.583295e-03,
                -5.826173e-07,
                 1.024207e-10,
                -6.766957e-15,
                 5.232871e+04,
                 3.796243e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BHF2 = Substance {
    name             = "BHF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.405360e+00,
                 9.275584e-03,
                 1.338646e-06,
                -8.680789e-09,
                 4.121102e-12,
                -8.938841e+04,
                 1.288804e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.318453e+00,
                 4.744447e-03,
                -1.933786e-06,
                 3.550838e-10,
                -2.429367e-14,
                -9.037501e+04,
                -3.043140e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        H = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BH2 = Substance {
    name             = "BH2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.395828e+00,
                 7.477626e-03,
                -7.201951e-06,
                 4.582640e-09,
                -1.251068e-12,
                 2.316265e+04,
                 6.076470e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.362528e+00,
                 3.901285e-03,
                -1.509755e-06,
                 2.667281e-10,
                -1.771305e-14,
                 2.291903e+04,
                 1.259283e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BH3 = Substance {
    name             = "BH3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.948703e+00,
                -5.217054e-04,
                 7.648116e-06,
                -4.614869e-09,
                 5.631862e-13,
                 1.161881e+04,
                -4.551746e-02,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.062173e+00,
                 7.265589e-03,
                -2.751034e-06,
                 4.780371e-10,
                -3.133429e-14,
                 1.192375e+04,
                 8.849451e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        H = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BN = Substance {
    name             = "BN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.537507e+00,
                -1.355659e-03,
                 6.221419e-06,
                -6.168327e-09,
                 1.987246e-12,
                 5.632974e+04,
                 5.563177e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.598183e+00,
                 8.717680e-04,
                -2.997264e-07,
                 5.603694e-11,
                -4.075042e-15,
                 5.617124e+04,
                 4.600225e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BO = Substance {
    name             = "BO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.729725e+00,
                -2.087832e-03,
                 5.736285e-06,
                -4.389483e-09,
                 1.091663e-12,
                -1.061886e+03,
                 3.625541e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.156496e+00,
                 1.381659e-03,
                -5.504963e-07,
                 9.911668e-11,
                -6.416455e-15,
                -1.030342e+03,
                 6.037490e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BOCL = Substance {
    name             = "BOCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.270532e+00,
                 1.022775e-02,
                -1.207016e-05,
                 7.202556e-09,
                -1.691474e-12,
                -3.937821e+04,
                 7.349302e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.713557e+00,
                 1.866469e-03,
                -7.748790e-07,
                 1.439857e-10,
                -9.931774e-15,
                -3.997735e+04,
                -4.880404e+00,
            }
        )
    },
    elements         = {
        B  = 1.0,
        O  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BOF = Substance {
    name             = "BOF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.237037e+00,
                 1.334955e-02,
                -1.815306e-05,
                 1.360937e-08,
                -4.243824e-12,
                -7.352837e+04,
                 1.100694e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.392966e+00,
                 2.074445e-03,
                -7.936006e-07,
                 1.334766e-10,
                -8.217793e-15,
                -7.431139e+04,
                -4.765005e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        O = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BOF2 = Substance {
    name             = "BOF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.744598e+00,
                 1.869328e-02,
                -1.524616e-05,
                 2.655947e-09,
                 1.379861e-12,
                -1.018676e+05,
                 1.735314e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.307723e+00,
                 2.990362e-03,
                -1.305962e-06,
                 2.530824e-10,
                -1.768733e-14,
                -1.033458e+05,
                -1.119242e+01,
            }
        )
    },
    elements         = {
        B = 1.0,
        O = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BO2 = Substance {
    name             = "BO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.121205e+00,
                 8.468088e-03,
                -4.597228e-06,
                -1.642002e-09,
                 1.665823e-12,
                -3.548331e+04,
                 7.547892e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.819843e+00,
                 1.862657e-03,
                -8.130280e-07,
                 1.573582e-10,
                -1.094424e-14,
                -3.625512e+04,
                -6.560908e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BO2_minus = Substance {
    name             = "BO2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.491634e+00,
                 9.747064e-03,
                -8.764086e-06,
                 3.580254e-09,
                -4.061122e-13,
                -8.464122e+04,
                 9.226896e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.880517e+00,
                 2.674365e-03,
                -1.093219e-06,
                 2.008087e-10,
                -1.371777e-14,
                -8.528432e+04,
                -3.009276e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        O = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BS = Substance {
    name             = "BS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.174205e+00,
                 9.854497e-04,
                 2.771132e-06,
                -4.375180e-09,
                 1.761618e-12,
                 2.823062e+04,
                 7.533862e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.706854e+00,
                 9.868290e-04,
                -4.749527e-07,
                 1.065460e-10,
                -8.051964e-15,
                 2.801282e+04,
                 4.424621e+00,
            }
        )
    },
    elements         = {
        B = 1.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B2 = Substance {
    name             = "B2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.790997e+00,
                -5.875364e-03,
                 3.005142e-05,
                -3.914392e-08,
                 1.604194e-11,
                 9.872300e+04,
                 3.434632e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.238692e+00,
                -5.236075e-04,
                 1.697050e-07,
                -2.065490e-11,
                 9.414359e-16,
                 9.798738e+04,
                -6.007422e+00,
            }
        )
    },
    elements         = {
        B = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B2O = Substance {
    name             = "B2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.529473e+00,
                 3.199383e-03,
                 3.032926e-06,
                -5.749126e-09,
                 2.284735e-12,
                 1.036320e+04,
                 6.239631e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.730054e+00,
                 2.394149e-03,
                -1.000832e-06,
                 1.869751e-10,
                -1.295367e-14,
                 9.885335e+03,
                -6.358513e-01,
            }
        )
    },
    elements         = {
        B = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B2O2 = Substance {
    name             = "B2O2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.680708e+00,
                 1.536113e-02,
                -1.860610e-05,
                 1.217145e-08,
                -3.241102e-12,
                -5.648665e+04,
                 4.356127e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.993857e+00,
                 3.594039e-03,
                -1.475361e-06,
                 2.722512e-10,
                -1.869600e-14,
                -5.729618e+04,
                -1.216778e+01,
            }
        )
    },
    elements         = {
        B = 2.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B2O3 = Substance {
    name             = "B2O3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.660884e+00,
                 2.026208e-02,
                -2.194734e-05,
                 1.225300e-08,
                -2.703840e-12,
                -1.023652e+05,
                 8.106221e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.399411e+00,
                 4.743634e-03,
                -1.955230e-06,
                 3.618775e-10,
                -2.490723e-14,
                -1.035716e+05,
                -1.581000e+01,
            }
        )
    },
    elements         = {
        B = 2.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B3O3CL3 = Substance {
    name             = "B3O3CL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.044498e+00,
                 5.426060e-02,
                -5.575076e-05,
                 2.222313e-08,
                -1.418130e-12,
                -1.994163e+05,
                 9.056723e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.928256e+01,
                 6.317258e-03,
                -2.724293e-06,
                 5.204791e-10,
                -3.667779e-14,
                -2.032088e+05,
                -6.788515e+01,
            }
        )
    },
    elements         = {
        B  = 3.0,
        O  = 3.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B3O3F3 = Substance {
    name             = "B3O3F3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.079886e+00,
                 4.563659e-02,
                -3.309883e-05,
                 2.553884e-09,
                 4.435876e-12,
                -2.871221e+05,
                 1.147539e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.685862e+01,
                 8.868575e-03,
                -3.788106e-06,
                 7.187040e-10,
                -5.037692e-14,
                -2.909310e+05,
                -5.985875e+01,
            }
        )
    },
    elements         = {
        B = 3.0,
        O = 3.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_B3O3H3 = Substance {
    name             = "B3O3H3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.769891e+00,
                 2.534259e-02,
                 1.224867e-05,
                -3.730576e-08,
                 1.745569e-11,
                -1.484310e+05,
                 1.152180e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.212012e+01,
                 1.228112e-02,
                -4.609225e-06,
                 7.658245e-10,
                -4.676238e-14,
                -1.516486e+05,
                -3.989180e+01,
            }
        )
    },
    elements         = {
        B = 3.0,
        O = 3.0,
        H = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ba = Substance {
    name             = "Ba",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.503878e+00,
                -3.780391e-05,
                 1.291497e-07,
                -1.840041e-10,
                 9.293483e-14,
                 2.079254e+04,
                 6.216742e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.973054e+00,
                -1.116122e-02,
                 7.117215e-06,
                -1.533667e-09,
                 1.087670e-13,
                 1.888997e+04,
                -2.348768e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaBr = Substance {
    name             = "BaBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.171455e+00,
                 1.596081e-03,
                -2.888654e-06,
                 2.476715e-09,
                -7.983070e-13,
                -1.459450e+04,
                 8.386207e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.368977e+00,
                 3.907589e-04,
                -2.990175e-07,
                 1.064130e-10,
                -9.841605e-15,
                -1.461768e+04,
                 7.525261e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaBr2 = Substance {
    name             = "BaBr2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.340528e+00,
                 3.056195e-03,
                -5.728586e-06,
                 4.887597e-09,
                -1.568808e-12,
                -5.306232e+04,
                 4.319437e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.950234e+00,
                 5.806602e-05,
                -2.619543e-08,
                 5.199283e-12,
                -3.785277e-16,
                -5.316684e+04,
                 1.490028e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaCL = Substance {
    name             = "BaCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.978115e+00,
                 2.180322e-03,
                -3.434257e-06,
                 2.518221e-09,
                -6.905803e-13,
                -1.836694e+04,
                 7.924261e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.667524e+00,
                -2.218725e-04,
                 8.127068e-08,
                 3.021696e-11,
                -5.318330e-15,
                -1.854214e+04,
                 4.464442e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaCL2 = Substance {
    name             = "BaCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.057124e+00,
                 3.842615e-03,
                -6.268321e-06,
                 4.619666e-09,
                -1.274477e-12,
                -6.191454e+04,
                 3.761792e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.913864e+00,
                 9.821396e-05,
                -4.326835e-08,
                 8.396901e-12,
                -5.989209e-16,
                -6.207605e+04,
                -3.058631e-01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaF = Substance {
    name             = "BaF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.353751e+00,
                 4.381958e-03,
                -6.640593e-06,
                 4.614323e-09,
                -1.197152e-12,
                -3.989296e+04,
                 9.457589e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.358713e+00,
                 3.011074e-04,
                -2.286331e-07,
                 8.986555e-11,
                -8.765759e-15,
                -4.010138e+04,
                 4.601485e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaF_plus = Substance {
    name             = "BaF+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.161746e+00,
                 4.887608e-03,
                -7.121988e-06,
                 4.714497e-09,
                -1.145898e-12,
                 1.696046e+04,
                 9.546233e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.494556e+00,
                -4.113006e-03,
                 2.588281e-06,
                -5.045870e-10,
                 3.071956e-14,
                 1.596065e+04,
                -7.884984e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaF2 = Substance {
    name             = "BaF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.096824e+00,
                 7.422625e-03,
                -1.168283e-05,
                 8.329622e-09,
                -2.221686e-12,
                -9.843160e+04,
                 5.436921e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.797716e+00,
                 2.293220e-04,
                -1.005352e-07,
                 1.942857e-11,
                -1.380751e-15,
                -9.876311e+04,
                -2.695283e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaOH = Substance {
    name             = "BaOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.668183e+00,
                 1.688398e-02,
                -3.103178e-05,
                 2.642105e-08,
                -8.395359e-12,
                -2.855467e+04,
                 1.134341e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.517847e+00,
                 1.478090e-03,
                -5.782331e-07,
                 1.404022e-10,
                -1.203577e-14,
                -2.895907e+04,
                -1.497873e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaOH_plus = Substance {
    name             = "BaOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.709049e+00,
                 1.672652e-02,
                -3.076793e-05,
                 2.621045e-08,
                -8.330384e-12,
                 3.125508e+04,
                 1.047079e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.512602e+00,
                 1.401384e-03,
                -4.235022e-07,
                 6.057836e-11,
                -3.351965e-15,
                 3.087135e+04,
                -2.107673e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaO2H2 = Substance {
    name             = "BaO2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.790936e+00,
                 3.207545e-02,
                -5.935081e-05,
                 5.077638e-08,
                -1.618113e-11,
                -7.748356e+04,
                 8.948693e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.082474e+00,
                 2.736831e-03,
                -8.175368e-07,
                 1.153488e-10,
                -6.283376e-15,
                -7.818659e+04,
                -1.468867e+01,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BaS = Substance {
    name             = "BaS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.481617e+00,
                 4.565813e-03,
                -8.272641e-06,
                 6.937259e-09,
                -2.200024e-12,
                 3.363649e+03,
                 9.044225e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.440259e+00,
                 7.426940e-04,
                -1.179568e-06,
                 5.761864e-10,
                -6.754632e-14,
                 3.115982e+03,
                 4.285984e+00,
            }
        )
    },
    elements         = {
        Ba = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Be = Substance {
    name             = "Be",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 3.822265e+04,
                 2.146173e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.294386e+00,
                 4.116698e-04,
                -2.647308e-07,
                 6.256814e-11,
                -3.892810e-15,
                 3.829581e+04,
                 3.267319e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Be_plus = Substance {
    name             = "Be+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.458937e+05,
                 2.839229e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.501690e+00,
                -5.103736e-06,
                 5.274811e-09,
                -2.161550e-12,
                 3.007130e-16,
                 1.458933e+05,
                 2.830668e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeBO2 = Substance {
    name             = "BeBO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.006912e+00,
                 1.804482e-02,
                -1.691758e-05,
                 6.086537e-09,
                -1.727628e-13,
                -5.923420e+04,
                 1.580556e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.910838e+00,
                 3.266868e-03,
                -1.367812e-06,
                 2.557621e-10,
                -1.772774e-14,
                -6.050571e+04,
                -9.161658e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        B  = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeBr = Substance {
    name             = "BeBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.659146e+00,
                 6.702728e-03,
                -1.040371e-05,
                 7.765519e-09,
                -2.253092e-12,
                 1.343310e+04,
                 1.073565e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.194389e+00,
                 3.993902e-04,
                -1.483887e-07,
                 2.676227e-11,
                -1.562613e-15,
                 1.311546e+04,
                 3.322948e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeBr2 = Substance {
    name             = "BeBr2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.642228e+00,
                 9.008445e-03,
                -1.269856e-05,
                 8.755898e-09,
                -2.392319e-12,
                -2.926544e+04,
                 4.300119e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.834487e+00,
                 7.542929e-04,
                -3.336821e-07,
                 6.530235e-11,
                -4.704110e-15,
                -2.975712e+04,
                -6.471792e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeCL = Substance {
    name             = "BeCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.832199e+00,
                 4.456676e-03,
                -4.448216e-06,
                 1.585259e-09,
                 4.520689e-15,
                 6.290625e+03,
                 8.891561e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.105288e+00,
                 4.746170e-04,
                -1.799653e-07,
                 3.256390e-11,
                -2.065284e-15,
                 5.975306e+03,
                 2.464517e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeCL_plus = Substance {
    name             = "BeCL+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.896598e+00,
                 5.126749e-03,
                -6.442791e-06,
                 3.563264e-09,
                -6.592509e-13,
                 1.167147e+05,
                 7.837270e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.382750e+00,
                -1.847120e-03,
                 1.112368e-06,
                -1.695299e-10,
                 6.100709e-15,
                 1.159972e+05,
                -5.062241e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeCLF = Substance {
    name             = "BeCLF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.102438e+00,
                 8.501749e-03,
                -8.909396e-06,
                 4.007623e-09,
                -5.162754e-13,
                -7.046874e+04,
                 4.099163e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.440279e+00,
                 1.146369e-03,
                -4.854536e-07,
                 9.128787e-11,
                -6.344355e-15,
                -7.105977e+04,
                -7.728700e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeCL2 = Substance {
    name             = "BeCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.492712e+00,
                 8.053555e-03,
                -8.831924e-06,
                 4.089705e-09,
                -5.349809e-13,
                -4.495288e+04,
                 2.695821e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.704319e+00,
                 8.716647e-04,
                -3.725505e-07,
                 7.056701e-11,
                -4.933536e-15,
                -4.549456e+04,
                -8.422012e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeF = Substance {
    name             = "BeF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.276186e+00,
                 2.523376e-04,
                 4.093994e-06,
                -5.312815e-09,
                 1.995490e-12,
                -2.144592e+04,
                 5.864997e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.709529e+00,
                 8.938360e-04,
                -3.611307e-07,
                 6.760109e-11,
                -4.642083e-15,
                -2.166005e+04,
                 3.164192e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeF2 = Substance {
    name             = "BeF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.523427e+00,
                 9.389028e-03,
                -9.563621e-06,
                 4.292099e-09,
                -5.775111e-13,
                -9.713046e+04,
                 4.883975e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.045763e+00,
                 1.562937e-03,
                -6.610820e-07,
                 1.244755e-10,
                -8.671606e-15,
                -9.777913e+04,
                -7.917883e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeH = Substance {
    name             = "BeH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.731231e+00,
                -1.914355e-03,
                 4.891032e-06,
                -3.292588e-09,
                 6.663856e-13,
                 3.756556e+04,
                 3.886085e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.057022e+00,
                 1.497722e-03,
                -5.687296e-07,
                 1.026082e-10,
                -6.916698e-15,
                 3.763951e+04,
                 3.400275e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeH_plus = Substance {
    name             = "BeH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.709571e+00,
                -1.585203e-03,
                 3.622877e-06,
                -1.893322e-09,
                 1.717326e-13,
                 1.380287e+05,
                -2.828964e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.901599e+00,
                 1.675176e-03,
                -6.680550e-07,
                 1.251095e-10,
                -8.174147e-15,
                 1.381681e+05,
                 3.555629e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeI = Substance {
    name             = "BeI",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.782612e+00,
                 6.841035e-03,
                -1.138990e-05,
                 8.992413e-09,
                -2.727769e-12,
                 1.939618e+04,
                 1.107894e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.260049e+00,
                 3.432082e-04,
                -1.275948e-07,
                 2.418971e-11,
                -1.457014e-15,
                 1.911035e+04,
                 4.047668e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeI2 = Substance {
    name             = "BeI2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.937379e+00,
                 8.740474e-03,
                -1.311472e-05,
                 9.492849e-09,
                -2.692634e-12,
                -9.461601e+03,
                 4.829511e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.001126e+00,
                 5.687887e-04,
                -2.525376e-07,
                 4.954105e-11,
                -3.574720e-15,
                -9.903886e+03,
                -5.210255e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeN = Substance {
    name             = "BeN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.168429e+00,
                 1.028248e-03,
                 2.737602e-06,
                -4.348110e-09,
                 1.753445e-12,
                 5.031045e+04,
                 6.662525e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.785594e+00,
                 8.238658e-04,
                -3.271160e-07,
                 6.155189e-11,
                -4.280904e-15,
                 5.006618e+04,
                 3.105585e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeO = Substance {
    name             = "BeO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.789742e+00,
                -3.248962e-03,
                 1.129885e-05,
                -1.180563e-08,
                 4.206758e-12,
                 1.534107e+04,
                 2.739053e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.667785e+00,
                -4.078476e-03,
                 3.411126e-06,
                -8.210524e-10,
                 6.137733e-14,
                 1.458996e+04,
                -8.085807e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeOH = Substance {
    name             = "BeOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.913915e+00,
                 1.350716e-02,
                -1.853169e-05,
                 1.294247e-08,
                -3.543896e-12,
                -1.481968e+04,
                 1.099283e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.611672e+00,
                 2.397201e-03,
                -8.548916e-07,
                 1.430906e-10,
                -9.111240e-15,
                -1.536184e+04,
                -1.988292e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeOH_plus = Substance {
    name             = "BeOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.928098e+00,
                 1.353424e-02,
                -1.865403e-05,
                 1.307392e-08,
                -3.590058e-12,
                 9.036830e+04,
                 1.022573e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.622353e+00,
                 2.390257e-03,
                -8.554947e-07,
                 1.444167e-10,
                -9.356029e-15,
                 8.982944e+04,
                -2.726147e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeO2H2 = Substance {
    name             = "BeO2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.418439e-01,
                 3.991357e-02,
                -6.458828e-05,
                 5.102348e-08,
                -1.547921e-11,
                -8.274104e+04,
                 1.731363e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.855048e+00,
                 4.647758e-03,
                -1.650283e-06,
                 2.767062e-10,
                -1.782630e-14,
                -8.410626e+04,
                -1.842947e+01,
            }
        )
    },
    elements         = {
        Be = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_BeS = Substance {
    name             = "BeS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.902254e+00,
                 3.189741e-03,
                -1.365182e-06,
                -1.509271e-09,
                 1.227593e-12,
                 3.071076e+04,
                 7.875851e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.204073e+00,
                -3.874202e-03,
                 4.257889e-06,
                -1.256060e-09,
                 1.134340e-13,
                 3.022608e+04,
                -3.578012e+00,
            }
        )
    },
    elements         = {
        Be = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Be2O = Substance {
    name             = "Be2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.752790e+00,
                 8.964870e-03,
                -5.585925e-06,
                -3.476919e-10,
                 1.101547e-12,
                -8.717471e+03,
                 8.451919e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.454973e+00,
                 2.197038e-03,
                -9.291958e-07,
                 1.749641e-10,
                -1.218998e-14,
                -9.495898e+03,
                -5.670423e+00,
            }
        )
    },
    elements         = {
        Be = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Be2OF2 = Substance {
    name             = "Be2OF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.860003e+00,
                 1.943898e-02,
                -1.881876e-05,
                 7.100950e-09,
                -3.722526e-13,
                -1.470396e+05,
                 3.241733e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.031134e+01,
                 2.925815e-03,
                -1.248199e-06,
                 2.365217e-10,
                -1.655916e-14,
                -1.484462e+05,
                -2.448768e+01,
            }
        )
    },
    elements         = {
        Be = 2.0,
        O  = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Be2O2 = Substance {
    name             = "Be2O2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.710274e+00,
                 1.824494e-02,
                -1.437725e-05,
                 2.126882e-09,
                 1.469199e-12,
                -5.051237e+04,
                 1.521451e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.178365e+00,
                 3.079693e-03,
                -1.316227e-06,
                 2.497061e-10,
                -1.749634e-14,
                -5.198488e+04,
                -1.292559e+01,
            }
        )
    },
    elements         = {
        Be = 2.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Be3O3 = Substance {
    name             = "Be3O3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.000269e+00,
                 2.000517e-02,
                 5.751785e-07,
                -1.709281e-08,
                 8.486279e-12,
                -1.282687e+05,
                 1.562095e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.190732e+00,
                 7.362370e-03,
                -3.129273e-06,
                 5.916259e-10,
                -4.136019e-14,
                -1.306185e+05,
                -2.331688e+01,
            }
        )
    },
    elements         = {
        Be = 3.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Be4O4 = Substance {
    name             = "Be4O4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.381844e+00,
                 5.238483e-02,
                -4.089302e-05,
                 4.737971e-09,
                 4.995416e-12,
                -1.927836e+05,
                 3.041307e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.454703e+01,
                 8.190373e-03,
                -3.516279e-06,
                 6.692346e-10,
                -4.700596e-14,
                -1.970485e+05,
                -5.149677e+01,
            }
        )
    },
    elements         = {
        Be = 4.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Br = Substance {
    name             = "Br",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.485717e+00,
                 1.506475e-04,
                -5.372673e-07,
                 7.209211e-10,
                -2.502056e-13,
                 1.270922e+04,
                 6.860308e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.088511e+00,
                 7.121186e-04,
                -2.700031e-07,
                 4.149863e-11,
                -2.311883e-15,
                 1.285688e+04,
                 9.073511e+00,
            }
        )
    },
    elements         = {
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Br2 = Substance {
    name             = "Br2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.343310e+00,
                 6.352308e-03,
                -1.364188e-05,
                 1.317263e-08,
                -4.683735e-12,
                 2.535154e+03,
                 9.079404e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.187282e+00,
                -1.386511e-03,
                 9.347452e-07,
                -2.070654e-10,
                 1.418085e-14,
                 2.107057e+03,
                 7.762234e-02,
            }
        )
    },
    elements         = {
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C = Substance {
    name             = "C",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.554240e+00,
                -3.215377e-04,
                 7.337922e-07,
                -7.322349e-10,
                 2.665214e-13,
                 8.544388e+04,
                 4.531308e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.605583e+00,
                -1.959343e-04,
                 1.067372e-07,
                -1.642394e-11,
                 8.187058e-16,
                 8.541294e+04,
                 4.192387e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C_plus = Substance {
    name             = "C+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.615240e+00,
                -5.537839e-04,
                 1.063486e-06,
                -9.237563e-10,
                 3.007746e-13,
                 2.168621e+05,
                 3.826529e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.508535e+00,
                -1.085993e-05,
                 5.370692e-09,
                -1.182706e-12,
                 9.712676e-17,
                 2.168795e+05,
                 4.317397e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C_minus = Substance {
    name             = "C-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 6.993157e+04,
                 3.963404e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CCL = Substance {
    name             = "CCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.195356e+00,
                 2.807632e-03,
                -1.604384e-06,
                -5.774407e-10,
                 6.140973e-13,
                 5.932508e+04,
                 8.035173e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.098473e+00,
                 5.007785e-04,
                -2.001283e-07,
                 3.868099e-11,
                -2.544111e-15,
                 5.907660e+04,
                 3.350174e+00,
            }
        )
    },
    elements         = {
        C  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CCLF3 = Substance {
    name             = "CCLF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.901194e+00,
                 2.056366e-02,
                -8.550864e-06,
                -1.039565e-08,
                 7.572183e-12,
                -8.682956e+04,
                 1.211507e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.016510e+01,
                 2.846004e-03,
                -1.092602e-06,
                 1.831437e-10,
                -1.119406e-14,
                -8.884875e+04,
                -2.570411e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        Cl = 1.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CCL2 = Substance {
    name             = "CCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.858850e+00,
                 1.395794e-02,
                -2.003890e-05,
                 1.350073e-08,
                -3.166971e-12,
                 2.736393e+04,
                 1.224331e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.718500e+00,
                 5.344975e-03,
                -2.343128e-06,
                 4.180618e-10,
                -2.676530e-14,
                 2.755479e+04,
                 9.645980e+00,
            }
        )
    },
    elements         = {
        C  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CCL2F2 = Substance {
    name             = "CCL2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.813497e+00,
                 2.003683e-02,
                -9.898669e-06,
                -8.799535e-09,
                 7.121855e-12,
                -6.125355e+04,
                 8.990971e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.070825e+01,
                 2.323219e-03,
                -9.007322e-07,
                 1.526170e-10,
                -9.443496e-15,
                -6.310260e+04,
                -2.662288e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        Cl = 2.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CCL3 = Substance {
    name             = "CCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.715336e+00,
                 1.944380e-02,
                -2.462784e-05,
                 1.378646e-08,
                -2.663893e-12,
                 7.782002e+03,
                 9.716043e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.781547e+00,
                 1.351613e-03,
                -5.824945e-07,
                 1.109870e-10,
                -7.793726e-15,
                 6.634415e+03,
                -1.531613e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CCL3F = Substance {
    name             = "CCL3F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.828769e+00,
                 1.898174e-02,
                -1.036066e-05,
                -7.847213e-09,
                 6.845275e-12,
                -3.644618e+04,
                 4.634137e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.124653e+01,
                 1.783770e-03,
                -6.926044e-07,
                 1.174072e-10,
                -7.264029e-15,
                -3.810831e+04,
                -2.827599e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        Cl = 3.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CCL4 = Substance {
    name             = "CCL4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 5.796630e+00,
                 1.797744e-02,
                -1.095655e-05,
                -6.668181e-09,
                 6.455490e-12,
                -1.394097e+04,
                -5.569596e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.173910e+01,
                 1.283755e-03,
                -4.965026e-07,
                 8.352502e-11,
                -5.110722e-15,
                -1.541909e+04,
                -3.077782e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CF = Substance {
    name             = "CF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.465514e+00,
                -6.877981e-04,
                 5.678477e-06,
                -6.458298e-09,
                 2.298825e-12,
                 2.965560e+04,
                 5.881355e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.686968e+00,
                 9.114349e-04,
                -3.646385e-07,
                 6.748285e-11,
                -4.526960e-15,
                 2.947812e+04,
                 4.174510e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CF_plus = Substance {
    name             = "CF+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.582851e+00,
                -1.863909e-03,
                 8.534353e-06,
                -9.323781e-09,
                 3.339417e-12,
                 1.371982e+05,
                 4.074390e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.675961e+00,
                 8.528231e-04,
                -3.067557e-07,
                 4.974301e-11,
                -2.839690e-15,
                 1.370189e+05,
                 2.846088e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CF2 = Substance {
    name             = "CF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.768882e+00,
                 7.237296e-03,
                -1.602815e-06,
                -4.551238e-09,
                 2.664801e-12,
                -2.301579e+04,
                 1.113770e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.226714e+00,
                 2.083768e-03,
                -9.903728e-07,
                 2.126485e-10,
                -1.583111e-14,
                -2.375585e+04,
                -1.910904e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CF2_plus = Substance {
    name             = "CF2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.978352e+00,
                 6.033660e-03,
                 6.585879e-10,
                -5.212945e-09,
                 2.666302e-12,
                 1.121268e+05,
                 1.095156e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.155423e+00,
                 2.052831e-03,
                -9.117391e-07,
                 1.827276e-10,
                -1.321364e-14,
                 1.114312e+05,
                -7.787668e-01,
            }
        )
    },
    elements         = {
        C = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CF3 = Substance {
    name             = "CF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.065017e+00,
                 1.642416e-02,
                -1.083815e-05,
                -8.531800e-10,
                 2.387807e-12,
                -5.781198e+04,
                 1.570469e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.201262e+00,
                 3.066393e-03,
                -1.314418e-06,
                 2.499692e-10,
                -1.755093e-14,
                -5.923863e+04,
                -1.094571e+01,
            }
        )
    },
    elements         = {
        C = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CF3_plus = Substance {
    name             = "CF3+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.260558e+00,
                 1.542232e-02,
                -9.895667e-06,
                -7.834505e-10,
                 2.121189e-12,
                 4.936534e+04,
                 1.357846e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.022541e+00,
                 3.244127e-03,
                -1.386487e-06,
                 2.632364e-10,
                -1.846440e-14,
                 4.802232e+04,
                -1.120653e+01,
            }
        )
    },
    elements         = {
        C = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CF4 = Substance {
    name             = "CF4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.051440e+00,
                 2.782465e-02,
                -2.465253e-05,
                 6.745483e-09,
                 9.189093e-13,
                -1.135741e+05,
                 1.819009e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.472154e+00,
                 3.595252e-03,
                -1.403785e-06,
                 2.391882e-10,
                -1.485589e-14,
                -1.158163e+05,
                -2.497091e+01,
            }
        )
    },
    elements         = {
        C = 1.0,
        F = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH = Substance {
    name             = "CH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.489817e+00,
                 3.238355e-04,
                -1.688991e-06,
                 3.162173e-09,
                -1.406091e-12,
                 7.079729e+04,
                 2.084011e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.520906e+00,
                 1.765372e-03,
                -4.614757e-07,
                 5.928855e-11,
                -3.347320e-15,
                 7.113144e+04,
                 7.405322e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH_plus = Substance {
    name             = "CH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.537966e+00,
                -7.592602e-05,
                -6.095667e-07,
                 2.008195e-09,
                -1.008068e-12,
                 1.950572e+05,
                 5.232378e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.537267e+00,
                -2.051654e-03,
                 1.695872e-06,
                -3.510977e-10,
                 2.221292e-14,
                 1.946611e+05,
                -5.027822e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CHCL = Substance {
    name             = "CHCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.961361e+00,
                 6.115192e-03,
                -4.520318e-06,
                 1.309339e-09,
                 7.157809e-14,
                 3.595998e+04,
                 9.743496e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.156604e+00,
                 4.588833e-04,
                 4.474902e-07,
                -1.360679e-10,
                 1.024245e-14,
                 3.531058e+04,
                -1.751161e+00,
            }
        )
    },
    elements         = {
        C  = 1.0,
        H  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CHCLF2 = Substance {
    name             = "CHCLF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.468112e+00,
                 1.588395e-02,
                -2.820901e-06,
                -1.047813e-08,
                 6.070490e-12,
                -5.957088e+04,
                 1.519342e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.902983e+00,
                 4.625190e-03,
                -1.648987e-06,
                 2.591043e-10,
                -1.483621e-14,
                -6.123427e+04,
                -1.373430e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        H  = 1.0,
        Cl = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CHCL2F = Substance {
    name             = "CHCL2F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.110716e+00,
                 1.629589e-02,
                -4.733119e-06,
                -9.479816e-09,
                 6.132375e-12,
                -3.586221e+04,
                 1.296385e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.508392e+00,
                 4.034571e-03,
                -1.426823e-06,
                 2.224730e-10,
                -1.263017e-14,
                -3.742791e+04,
                -1.541166e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        H  = 1.0,
        Cl = 2.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CHCL3 = Substance {
    name             = "CHCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.681980e+00,
                 1.661102e-02,
                -6.618080e-06,
                -8.129156e-09,
                 5.943314e-12,
                -1.414184e+04,
                 9.983500e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.993803e+00,
                 3.565219e-03,
                -1.253765e-06,
                 1.947913e-10,
                -1.103202e-14,
                -1.560900e+04,
                -1.763170e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        H  = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CHF3 = Substance {
    name             = "CHF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.785709e+00,
                 1.596113e-02,
                -1.557502e-06,
                -1.136691e-08,
                 6.127529e-12,
                -8.459112e+04,
                 1.645759e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.387025e+00,
                 5.126692e-03,
                -1.837178e-06,
                 2.900464e-10,
                -1.669209e-14,
                -8.636744e+04,
                -1.361026e+01,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH2 = Substance {
    name             = "CH2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.744849e+00,
                 1.179608e-03,
                 1.945023e-06,
                -2.529325e-09,
                 1.124476e-12,
                 4.557995e+04,
                 1.628501e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.777232e+00,
                 3.836635e-03,
                -1.348532e-06,
                 2.116413e-10,
                -1.234457e-14,
                 4.585903e+04,
                 6.672864e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH2CLF = Substance {
    name             = "CH2CLF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.097553e+00,
                 1.255190e-02,
                 2.714704e-07,
                -9.131984e-09,
                 4.471357e-12,
                -3.297362e+04,
                 1.616817e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.957278e+00,
                 6.087970e-03,
                -2.081376e-06,
                 3.134621e-10,
                -1.708488e-14,
                -3.428078e+04,
                -4.879886e+00,
            }
        )
    },
    elements         = {
        C  = 1.0,
        H  = 2.0,
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH2CL2 = Substance {
    name             = "CH2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.362613e+00,
                 1.388553e-02,
                -2.087217e-06,
                -8.665616e-09,
                 4.949432e-12,
                -1.276123e+04,
                 1.508491e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.499128e+00,
                 5.567234e-03,
                -1.888745e-06,
                 2.823339e-10,
                -1.525687e-14,
                -1.404881e+04,
                -7.011562e+00,
            }
        )
    },
    elements         = {
        C  = 1.0,
        H  = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH2F2 = Substance {
    name             = "CH2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.926408e+00,
                 1.052910e-02,
                 3.465992e-06,
                -9.685600e-09,
                 3.816532e-12,
                -5.550539e+04,
                 1.547694e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.298311e+00,
                 6.756801e-03,
                -2.340155e-06,
                 3.572238e-10,
                -1.978999e-14,
                -5.679921e+04,
                -3.528511e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 2.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3 = Substance {
    name             = "CH3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.673590e+00,
                 2.010952e-03,
                 5.730219e-06,
                -6.871174e-09,
                 2.543857e-12,
                 1.644500e+04,
                 1.604564e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.968660e+00,
                 5.807175e-03,
                -1.977785e-06,
                 3.072788e-10,
                -1.788539e-14,
                 1.653889e+04,
                 4.779445e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3CL = Substance {
    name             = "CH3CL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.067245e+00,
                 9.209152e-03,
                 3.042605e-06,
                -8.034206e-09,
                 3.212744e-12,
                -1.089688e+04,
                 1.358395e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.295299e+00,
                 7.284682e-03,
                -2.416119e-06,
                 3.520584e-10,
                -1.840618e-14,
                -1.179347e+04,
                 8.592965e-01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        H  = 3.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3F = Substance {
    name             = "CH3F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.265102e+00,
                 6.073386e-03,
                 6.982541e-06,
                -8.138091e-09,
                 2.103634e-12,
                -2.957766e+04,
                 1.184396e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.625652e+00,
                 7.968370e-03,
                -2.684532e-06,
                 3.984111e-10,
                -2.134864e-14,
                -3.037248e+04,
                 3.069903e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 3.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH2OH = Substance {
    name             = "CH2OH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.863889e+00,
                 5.596723e-03,
                 5.932718e-06,
                -1.045320e-08,
                 4.369673e-12,
                -2.505014e+03,
                 5.473022e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.676256e+00,
                 6.564060e-03,
                -2.265255e-06,
                 3.556025e-10,
                -2.086262e-14,
                -2.892486e+03,
                 4.877370e-01,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 3.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3O = Substance {
    name             = "CH3O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.265249e+00,
                 3.303001e-03,
                 1.704940e-05,
                -2.271045e-08,
                 8.807565e-12,
                 3.332815e+02,
                 7.425680e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.266765e+00,
                 7.853801e-03,
                -2.837399e-06,
                 4.590397e-10,
                -2.744261e-14,
                -3.400732e+02,
                 3.856374e-01,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 3.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH4 = Substance {
    name             = "CH4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.149876e+00,
                -1.367098e-02,
                 4.918006e-05,
                -4.847430e-08,
                 1.666940e-11,
                -1.024665e+04,
                -4.641304e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.635526e+00,
                 1.008428e-02,
                -3.369163e-06,
                 5.349587e-10,
                -3.155188e-14,
                -1.000565e+04,
                 9.993133e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3OH = Substance {
    name             = "CH3OH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.715396e+00,
                -1.523091e-02,
                 6.524412e-05,
                -7.108069e-08,
                 2.613527e-11,
                -2.564277e+04,
                -1.504098e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.601345e+00,
                 1.024310e-02,
                -3.599855e-06,
                 5.725060e-10,
                -3.391176e-14,
                -2.599719e+04,
                 4.705123e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        H = 4.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CN = Substance {
    name             = "CN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.612935e+00,
                -9.555133e-04,
                 2.144298e-06,
                -3.151633e-10,
                -4.643035e-13,
                 5.190080e+04,
                 3.980499e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.748183e+00,
                 3.917533e-05,
                 2.997030e-07,
                -6.927045e-11,
                 4.461377e-15,
                 5.172784e+04,
                 2.774690e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CN_plus = Substance {
    name             = "CN+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 6.928085e+00,
                -2.814922e-02,
                 7.585114e-05,
                -7.241743e-08,
                 2.338915e-11,
                 2.151955e+05,
                -1.017305e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.290067e+00,
                -2.463311e-03,
                 9.035993e-07,
                -1.359706e-10,
                 7.337099e-15,
                 2.135791e+05,
                -1.913404e+01,
            }
        )
    },
    elements         = {
        C = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CN_minus = Substance {
    name             = "CN-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.819628e+00,
                -2.482473e-03,
                 6.045678e-06,
                -4.527332e-09,
                 1.156792e-12,
                 6.802563e+03,
                 2.389044e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.090519e+00,
                 1.331818e-03,
                -4.849023e-07,
                 7.968652e-11,
                -4.827709e-15,
                 6.881957e+03,
                 5.631283e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        N = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CNN = Substance {
    name             = "CNN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.782408e+00,
                 1.255331e-02,
                -2.130820e-05,
                 1.909416e-08,
                -6.592442e-12,
                 7.495517e+04,
                 9.106347e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.866581e+00,
                 2.384996e-03,
                -8.525778e-07,
                 1.384239e-10,
                -8.184231e-15,
                 7.455869e+04,
                -6.775871e-01,
            }
        )
    },
    elements         = {
        C = 1.0,
        N = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CO = Substance {
    name             = "CO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.579533e+00,
                -6.103537e-04,
                 1.016814e-06,
                 9.070059e-10,
                -9.044245e-13,
                -1.434409e+04,
                 3.508409e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.048486e+00,
                 1.351728e-03,
                -4.857941e-07,
                 7.885365e-11,
                -4.698075e-15,
                -1.426612e+04,
                 6.017098e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CO_plus = Substance {
    name             = "CO+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.770571e+00,
                -2.017708e-03,
                 4.610762e-06,
                -2.991719e-09,
                 6.060578e-13,
                 1.490043e+05,
                 3.381257e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.930594e+00,
                 1.560314e-03,
                -6.162390e-07,
                 1.099560e-10,
                -6.661113e-15,
                 1.491447e+05,
                 7.338379e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_COCL = Substance {
    name             = "COCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.286379e+00,
                 5.086898e-03,
                -5.072941e-06,
                 2.964798e-09,
                -7.709345e-13,
                -9.012521e+03,
                 6.251187e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.429124e+00,
                 1.612154e-03,
                -6.600628e-07,
                 1.212711e-10,
                -8.285860e-15,
                -9.330501e+03,
                 3.828741e-01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        O  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_COCLF = Substance {
    name             = "COCLF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.706666e+00,
                 2.272257e-02,
                -3.011564e-05,
                 2.048357e-08,
                -5.657223e-12,
                -5.261990e+04,
                 1.798763e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.088108e+00,
                 3.181648e-03,
                -1.376332e-06,
                 2.654400e-10,
                -1.892897e-14,
                -5.388378e+04,
                -8.684994e+00,
            }
        )
    },
    elements         = {
        C  = 1.0,
        O  = 1.0,
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_COCL2 = Substance {
    name             = "COCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.707879e+00,
                 2.893695e-02,
                -4.932891e-05,
                 4.169101e-08,
                -1.370574e-11,
                -2.783509e+04,
                 1.762021e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.860184e+00,
                 2.132715e-03,
                -8.220772e-07,
                 1.389511e-10,
                -8.584067e-15,
                -2.910564e+04,
                -1.190119e+01,
            }
        )
    },
    elements         = {
        C  = 1.0,
        O  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_COF = Substance {
    name             = "COF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.201973e+00,
                 5.583777e-03,
                -1.490548e-06,
                -2.312607e-09,
                 1.361435e-12,
                -2.181704e+04,
                 1.006074e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.890821e+00,
                 2.217970e-03,
                -9.255073e-07,
                 1.727012e-10,
                -1.195534e-14,
                -2.235798e+04,
                 9.927841e-01,
            }
        )
    },
    elements         = {
        C = 1.0,
        O = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_COF2 = Substance {
    name             = "COF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.129795e+00,
                 1.410197e-02,
                -5.943814e-06,
                -5.305448e-09,
                 3.973675e-12,
                -7.817453e+04,
                 1.511091e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.816317e+00,
                 3.164733e-03,
                -1.217763e-06,
                 2.055823e-10,
                -1.268931e-14,
                -7.954827e+04,
                -9.528646e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        O = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_COS = Substance {
    name             = "COS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.462532e+00,
                 1.194799e-02,
                -1.379437e-05,
                 8.070774e-09,
                -1.832765e-12,
                -1.780399e+04,
                 1.080587e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.239200e+00,
                 2.410058e-03,
                -9.606452e-07,
                 1.777835e-10,
                -1.223570e-14,
                -1.848046e+04,
                -3.077739e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        O = 1.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CO2 = Substance {
    name             = "CO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
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
                 9.901052e+00,
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
                -1.935349e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CO2_plus = Substance {
    name             = "CO2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.393057e+00,
                 5.823004e-03,
                 4.380121e-08,
                -4.682363e-09,
                 2.315528e-12,
                 1.123562e+05,
                 6.390386e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.612925e+00,
                 1.898300e-03,
                -7.345964e-07,
                 1.239757e-10,
                -7.576923e-15,
                 1.116211e+05,
                -5.651357e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_COOH = Substance {
    name             = "COOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.922079e+00,
                 7.624538e-03,
                 3.298847e-06,
                -1.071352e-08,
                 5.115873e-12,
                -2.683836e+04,
                 1.129260e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.392062e+00,
                 4.112213e-03,
                -1.481948e-06,
                 2.398753e-10,
                -1.439030e-14,
                -2.767088e+04,
                -2.235286e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        O = 2.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CP = Substance {
    name             = "CP",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.702914e+00,
                -2.940263e-03,
                 1.252638e-05,
                -1.459483e-08,
                 5.619553e-12,
                 6.150293e+04,
                 5.349715e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.169861e+00,
                -3.338932e-04,
                 6.305101e-07,
                -1.652489e-10,
                 1.252485e-14,
                 6.121210e+04,
                 2.057623e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        P = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CS = Substance {
    name             = "CS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.403934e+00,
                -6.577331e-04,
                 6.171216e-06,
                -7.368960e-09,
                 2.734674e-12,
                 3.268939e+04,
                 5.911067e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.682601e+00,
                 9.047320e-04,
                -3.643637e-07,
                 6.385429e-11,
                -3.693398e-15,
                 3.249749e+04,
                 3.898417e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CS2 = Substance {
    name             = "CS2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.832601e+00,
                 1.329079e-02,
                -1.814469e-05,
                 1.283168e-08,
                -3.680061e-12,
                 1.276678e+04,
                 9.222194e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.925261e+00,
                 1.825300e-03,
                -7.558538e-07,
                 1.460507e-10,
                -1.043859e-14,
                 1.204807e+04,
                -6.058932e+00,
            }
        )
    },
    elements         = {
        C = 1.0,
        S = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2 = Substance {
    name             = "C2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -1.962586e+00,
                 5.768153e-02,
                -1.580377e-04,
                 1.724606e-07,
                -6.579053e-11,
                 9.898833e+04,
                 2.331984e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.124873e+00,
                 1.083466e-04,
                 1.572509e-07,
                -4.240421e-11,
                 3.250557e-15,
                 9.892281e+04,
                 7.974210e-01,
            }
        )
    },
    elements         = {
        C = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2_plus = Substance {
    name             = "C2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.744385e+00,
                -2.750608e-03,
                 9.416980e-06,
                -9.544720e-09,
                 3.487435e-12,
                 2.400576e+05,
                 3.701689e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.474362e+00,
                 3.908584e-03,
                -1.153627e-06,
                 1.285228e-10,
                -4.371609e-15,
                 2.408016e+05,
                 1.565710e+01,
            }
        )
    },
    elements         = {
        C = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2_minus = Substance {
    name             = "C2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.820382e+00,
                -2.881624e-03,
                 8.219230e-06,
                -7.322549e-09,
                 2.414059e-12,
                 5.675240e+04,
                 2.431812e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.941478e+00,
                 3.345543e-03,
                -1.214013e-06,
                 1.868363e-10,
                -1.034477e-14,
                 5.726967e+04,
                 1.200325e+01,
            }
        )
    },
    elements         = {
        C = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2CL2 = Substance {
    name             = "C2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.022948e+00,
                 1.408267e-02,
                -1.809567e-05,
                 1.161035e-08,
                -2.881748e-12,
                 2.322748e+04,
                 6.099952e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.172855e+00,
                 2.365989e-03,
                -9.655250e-07,
                 1.773615e-10,
                -1.213520e-14,
                 2.251019e+04,
                -1.490359e+01,
            }
        )
    },
    elements         = {
        C  = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2CL4 = Substance {
    name             = "C2CL4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.143479e+00,
                 3.742237e-02,
                -5.436979e-05,
                 3.911286e-08,
                -1.117638e-11,
                -3.949263e+03,
                 8.344559e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.293594e+01,
                 3.430920e-03,
                -1.506719e-06,
                 2.934699e-10,
                -2.107090e-14,
                -5.893234e+03,
                -3.468070e+01,
            }
        )
    },
    elements         = {
        C  = 2.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2CL6 = Substance {
    name             = "C2CL6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.638353e+00,
                 6.336556e-02,
                -1.008003e-04,
                 7.663692e-08,
                -2.264655e-11,
                -2.015651e+04,
                 6.474796e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.903429e+01,
                 3.395682e-03,
                -1.511529e-06,
                 2.970031e-10,
                -2.145383e-14,
                -2.310380e+04,
                -6.285293e+01,
            }
        )
    },
    elements         = {
        C  = 2.0,
        Cl = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2F2 = Substance {
    name             = "C2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.534584e+00,
                 1.444585e-02,
                -1.218969e-05,
                 3.604298e-09,
                 1.911895e-13,
                 9.213356e+02,
                 5.419465e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.516458e+00,
                 3.168646e-03,
                -1.331138e-06,
                 2.496005e-10,
                -1.734207e-14,
                -1.610765e+02,
                -1.506806e+01,
            }
        )
    },
    elements         = {
        C = 2.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2F4 = Substance {
    name             = "C2F4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.616618e+00,
                 2.648862e-02,
                -2.243327e-05,
                 6.228644e-09,
                 6.214924e-13,
                -8.127724e+04,
                 8.523764e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.108647e+01,
                 5.278843e-03,
                -2.235440e-06,
                 4.216685e-10,
                -2.943391e-14,
                -8.329288e+04,
                -2.986688e+01,
            }
        )
    },
    elements         = {
        C = 2.0,
        F = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H = Substance {
    name             = "C2H",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.889657e+00,
                 1.340996e-02,
                -2.847695e-05,
                 2.947910e-08,
                -1.093315e-11,
                 6.683939e+04,
                 6.222964e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.361184e+00,
                 4.389897e-03,
                -1.627722e-06,
                 2.605567e-10,
                -1.529393e-14,
                 6.704922e+04,
                 5.571275e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2HCL = Substance {
    name             = "C2HCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.804716e+00,
                 2.583787e-02,
                -4.314995e-05,
                 3.588358e-08,
                -1.144799e-11,
                 2.423021e+04,
                 1.273775e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.321046e+00,
                 3.845974e-03,
                -1.486461e-06,
                 2.656138e-10,
                -1.795247e-14,
                 2.344048e+04,
                -8.284651e+00,
            }
        )
    },
    elements         = {
        C  = 2.0,
        H  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2HF = Substance {
    name             = "C2HF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.690177e+00,
                 1.768085e-02,
                -2.274986e-05,
                 1.492057e-08,
                -3.738193e-12,
                 1.368322e+04,
                 8.146972e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.094950e+00,
                 3.943243e-03,
                -1.471144e-06,
                 2.529464e-10,
                -1.644666e-14,
                 1.297691e+04,
                -8.315343e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CHCO_ketyl = Substance {
    name             = "CHCO,ketyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.765940e+00,
                 1.417412e-02,
                -2.326010e-05,
                 2.157281e-08,
                -7.585093e-12,
                 1.808563e+04,
                 1.054086e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.260381e+00,
                 4.827405e-03,
                -1.666188e-06,
                 2.614052e-10,
                -1.532580e-14,
                 1.788048e+04,
                 3.978743e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H2_acetylene = Substance {
    name             = "C2H2,acetylene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 8.086811e-01,
                 2.336156e-02,
                -3.551718e-05,
                 2.801524e-08,
                -8.500730e-12,
                 2.642898e+04,
                 1.393971e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.658785e+00,
                 4.883965e-03,
                -1.608288e-06,
                 2.469742e-10,
                -1.386057e-14,
                 2.575940e+04,
                -3.998348e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H2_vinylidene = Substance {
    name             = "C2H2,vinylidene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.281549e+00,
                 6.976427e-03,
                -2.385283e-06,
                -1.210770e-09,
                 9.820386e-13,
                 4.862179e+04,
                 5.920392e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.278071e+00,
                 4.756229e-03,
                -1.630075e-06,
                 2.546230e-10,
                -1.488603e-14,
                 4.831667e+04,
                 6.400226e-01,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH2CO_ketene = Substance {
    name             = "CH2CO,ketene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.135836e+00,
                 1.811887e-02,
                -1.739475e-05,
                 9.343976e-09,
                -2.014576e-12,
                -7.042918e+03,
                 1.221565e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.757933e+00,
                 6.349114e-03,
                -2.258148e-06,
                 3.620267e-10,
                -2.156512e-14,
                -7.978784e+03,
                -6.107722e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H3_vinyl = Substance {
    name             = "C2H3,vinyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.212466e+00,
                 1.514792e-03,
                 2.592094e-05,
                -3.576578e-08,
                 1.471509e-11,
                 3.485985e+04,
                 8.510540e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.351051e+00,
                 7.493301e-03,
                -2.643146e-06,
                 4.212859e-10,
                -2.498961e-14,
                 3.415462e+04,
                 5.716765e-01,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3CN = Substance {
    name             = "CH3CN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.824842e+00,
                 4.101004e-03,
                 2.145457e-05,
                -2.872345e-08,
                 1.118041e-11,
                 6.288385e+03,
                 5.540242e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.085770e+00,
                 9.707970e-03,
                -3.484849e-06,
                 5.621068e-10,
                -3.362347e-14,
                 5.458531e+03,
                -3.265539e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 3.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3CO_acetyl = Substance {
    name             = "CH3CO,acetyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.125278e+00,
                 9.778220e-03,
                 4.521448e-06,
                -9.009462e-09,
                 3.193718e-12,
                -4.108508e+03,
                 1.124202e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.612279e+00,
                 8.449886e-03,
                -2.854147e-06,
                 4.238376e-10,
                -2.268404e-14,
                -5.187863e+03,
                -3.261782e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 3.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H4 = Substance {
    name             = "C2H4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.959201e+00,
                -7.570522e-03,
                 5.709903e-05,
                -6.915888e-08,
                 2.698844e-11,
                 5.089776e+03,
                 4.097331e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.991828e+00,
                 1.048339e-02,
                -3.717214e-06,
                 5.946285e-10,
                -3.536305e-14,
                 4.268658e+03,
                -2.690522e-01,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H4O_ethylen = Substance {
    name             = "C2H4O,ethylen",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.759049e+00,
                -9.441193e-03,
                 8.030968e-05,
                -1.008078e-07,
                 4.003984e-11,
                -7.560814e+03,
                 7.849770e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.488884e+00,
                 1.204602e-02,
                -4.333615e-06,
                 7.002690e-10,
                -4.194819e-14,
                -9.180476e+03,
                -7.080639e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 4.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3CHO_ethanal = Substance {
    name             = "CH3CHO,ethanal",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.729476e+00,
                -3.193432e-03,
                 4.753535e-05,
                -5.745905e-08,
                 2.193126e-11,
                -2.157288e+04,
                 4.102955e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.404179e+00,
                 1.172297e-02,
                -4.226268e-06,
                 6.837157e-10,
                -4.098427e-14,
                -2.259315e+04,
                -3.481176e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 4.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3COOH = Substance {
    name             = "CH3COOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.789368e+00,
                 1.000010e-02,
                 3.425580e-05,
                -5.090179e-08,
                 2.062175e-11,
                -5.347523e+04,
                 1.410595e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.670837e+00,
                 1.351527e-02,
                -5.258747e-06,
                 8.931851e-10,
                -5.531809e-14,
                -5.575610e+04,
                -1.546766e+01,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 4.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s__HCOOH_2 = Substance {
    name             = "(HCOOH)2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.769239e+00,
                 2.722472e-02,
                 1.723805e-06,
                -2.077672e-08,
                 9.937995e-12,
                -1.010499e+05,
                 1.050550e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.220737e+01,
                 1.368885e-02,
                -4.684037e-06,
                 7.051166e-10,
                -3.836929e-14,
                -1.039594e+05,
                -3.570981e+01,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 4.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H5 = Substance {
    name             = "C2H5",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.306466e+00,
                -4.186589e-03,
                 4.971428e-05,
                -5.991266e-08,
                 2.305090e-11,
                 1.284163e+04,
                 4.707209e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.288005e+00,
                 1.243374e-02,
                -4.413838e-06,
                 7.065269e-10,
                -4.203419e-14,
                 1.205642e+04,
                 8.452996e-01,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H6 = Substance {
    name             = "C2H6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.291425e+00,
                -5.501543e-03,
                 5.994383e-05,
                -7.084663e-08,
                 2.686858e-11,
                -1.152221e+04,
                 2.666823e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.046667e+00,
                 1.535388e-02,
                -5.470393e-06,
                 8.778262e-10,
                -5.231673e-14,
                -1.244735e+04,
                -9.686836e-01,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3N2CH3 = Substance {
    name             = "CH3N2CH3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 6.296136e+00,
                -2.258154e-03,
                 6.212328e-05,
                -7.462930e-08,
                 2.803719e-11,
                 1.569289e+04,
                -2.499259e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.449549e+00,
                 1.744062e-02,
                -6.273825e-06,
                 1.013512e-09,
                -6.069375e-14,
                 1.419800e+04,
                -1.415676e+01,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 6.0,
        N = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3OCH3 = Substance {
    name             = "CH3OCH3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.305623e+00,
                -2.142543e-03,
                 5.308732e-05,
                -6.231471e-08,
                 2.307310e-11,
                -2.398663e+04,
                 7.132642e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.648442e+00,
                 1.633819e-02,
                -5.868024e-06,
                 9.468369e-10,
                -5.665047e-14,
                -2.510747e+04,
                -5.962649e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 6.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2H5OH = Substance {
    name             = "C2H5OH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.858682e+00,
                -3.740067e-03,
                 6.955503e-05,
                -8.865411e-08,
                 3.516844e-11,
                -2.999613e+04,
                 4.801923e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.562898e+00,
                 1.520343e-02,
                -5.389222e-06,
                 8.621502e-10,
                -5.128247e-14,
                -3.152580e+04,
                -9.475576e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        H = 6.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CCN = Substance {
    name             = "CCN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.676007e+00,
                 7.888423e-03,
                -9.553266e-06,
                 7.313441e-09,
                -2.480352e-12,
                 9.541955e+04,
                 5.816520e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.535949e+00,
                 1.933362e-03,
                -7.430080e-07,
                 1.256542e-10,
                -7.704200e-15,
                 9.490281e+04,
                -3.703806e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CNC = Substance {
    name             = "CNC",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.989589e+00,
                 5.219778e-03,
                -5.810837e-07,
                -3.394165e-09,
                 1.762731e-12,
                 8.096564e+04,
                 3.887219e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.932597e+00,
                 1.579148e-03,
                -6.123335e-07,
                 1.038696e-10,
                -6.431619e-15,
                 8.033268e+04,
                -6.602072e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2N2 = Substance {
    name             = "C2N2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.329253e+00,
                 2.615378e-02,
                -4.900040e-05,
                 4.619175e-08,
                -1.643239e-11,
                 3.566844e+04,
                 9.863362e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.705448e+00,
                 3.642603e-03,
                -1.309342e-06,
                 2.164111e-10,
                -1.311874e-14,
                 3.486080e+04,
                -1.048037e+01,
            }
        )
    },
    elements         = {
        C = 2.0,
        N = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C2O = Substance {
    name             = "C2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.863454e+00,
                 1.197330e-02,
                -1.812325e-05,
                 1.538136e-08,
                -5.289065e-12,
                 3.375009e+04,
                 8.894059e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.515764e+00,
                 1.877457e-03,
                -7.011598e-07,
                 1.215053e-10,
                -7.767789e-15,
                 3.309705e+04,
                -4.276361e+00,
            }
        )
    },
    elements         = {
        C = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3 = Substance {
    name             = "C3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.432840e+00,
                -4.467544e-03,
                 1.493215e-05,
                -1.479531e-08,
                 5.014211e-12,
                 9.949572e+04,
                -1.587207e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.803578e+00,
                 2.145112e-03,
                -1.072921e-06,
                 2.607353e-10,
                -2.016320e-14,
                 9.939654e+04,
                 3.893693e-01,
            }
        )
    },
    elements         = {
        C = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H3_propargyl = Substance {
    name             = "C3H3,propargyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.828408e+00,
                 2.378390e-02,
                -2.192282e-05,
                 1.000674e-08,
                -1.389846e-12,
                 4.018631e+04,
                 1.384480e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.641758e+00,
                 8.085874e-03,
                -2.847879e-06,
                 4.535260e-10,
                -2.688798e-14,
                 3.897937e+04,
                -1.040043e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H4_allene = Substance {
    name             = "C3H4,allene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.613075e+00,
                 1.212234e-02,
                 1.854054e-05,
                -3.452585e-08,
                 1.533534e-11,
                 2.154156e+04,
                 1.025033e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.316949e+00,
                 1.113363e-02,
                -3.962890e-06,
                 6.356338e-10,
                -3.787499e-14,
                 2.011746e+04,
                -1.097189e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H4_propyne = Substance {
    name             = "C3H4,propyne",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.680408e+00,
                 1.579944e-02,
                 2.507757e-06,
                -1.365846e-08,
                 6.615766e-12,
                 2.069164e+04,
                 9.892510e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.025311e+00,
                 1.133644e-02,
                -4.022290e-06,
                 6.437514e-10,
                -3.829901e-14,
                 1.951018e+04,
                -8.589126e+00,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H4_cyclo_minus = Substance {
    name             = "C3H4,cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.246666e+00,
                 5.762381e-03,
                 4.420803e-05,
                -6.629068e-08,
                 2.818247e-11,
                 3.212844e+04,
                 1.334518e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.280787e+00,
                 1.123938e-02,
                -4.019575e-06,
                 6.469206e-10,
                -3.864332e-14,
                 3.034151e+04,
                -1.114199e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H5_allyl = Substance {
    name             = "C3H5,allyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.787947e+00,
                 9.484143e-03,
                 2.423434e-05,
                -3.656040e-08,
                 1.485924e-11,
                 1.862612e+04,
                 7.828225e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.547611e+00,
                 1.331522e-02,
                -4.783331e-06,
                 7.719498e-10,
                -4.619308e-14,
                 1.727147e+04,
                -9.274868e+00,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H6_propylene = Substance {
    name             = "C3H6,propylene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.834645e+00,
                 3.290784e-03,
                 5.052282e-05,
                -6.662514e-08,
                 2.637076e-11,
                 7.538383e+02,
                 7.534110e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.038705e+00,
                 1.629639e-02,
                -5.821306e-06,
                 9.359365e-10,
                -5.586029e-14,
                -7.765951e+02,
                -8.438243e+00,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H6_cyclo_minus = Substance {
    name             = "C3H6,cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.832786e+00,
                -5.210275e-03,
                 9.295828e-05,
                -1.227531e-07,
                 4.991912e-11,
                 5.195201e+03,
                 1.083067e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.216633e+00,
                 1.653936e-02,
                -5.900760e-06,
                 9.480955e-10,
                -5.656617e-14,
                 2.959376e+03,
                -1.360406e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H6O = Substance {
    name             = "C3H6O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.568511e+00,
                 5.027173e-03,
                 6.423156e-05,
                -8.902295e-08,
                 3.624238e-11,
                -1.296792e+04,
                 9.888382e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.945557e+00,
                 1.740617e-02,
                -6.254365e-06,
                 1.009755e-09,
                -6.044890e-14,
                -1.528677e+04,
                -1.841841e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 6.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H7_n_minuspropyl = Substance {
    name             = "C3H7,n-propyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.032400e+00,
                 3.427283e-03,
                 6.143444e-05,
                -8.376463e-08,
                 3.408578e-11,
                 1.033938e+04,
                 8.774281e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.964685e+00,
                 1.754519e-02,
                -6.233701e-06,
                 9.985297e-10,
                -5.943948e-14,
                 8.542444e+03,
                -1.148315e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 7.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H7_i_minuspropyl = Substance {
    name             = "C3H7,i-propyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.408729e+00,
                -8.552218e-03,
                 8.421785e-05,
                -1.009427e-07,
                 3.869145e-11,
                 9.426010e+03,
                 3.623225e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.751259e+00,
                 1.876058e-02,
                -6.701920e-06,
                 1.077519e-09,
                -6.430909e-14,
                 7.979773e+03,
                -4.913594e+00,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 7.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H8 = Substance {
    name             = "C3H8",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.211026e+00,
                 1.715998e-03,
                 7.061835e-05,
                -9.195941e-08,
                 3.644214e-11,
                -1.438121e+04,
                 5.609305e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.667894e+00,
                 2.061202e-02,
                -7.365530e-06,
                 1.184408e-09,
                -7.069532e-14,
                -1.627485e+04,
                -1.318595e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H8O_1propanol = Substance {
    name             = "C3H8O,1propanol",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.277994e+00,
                 8.086605e-04,
                 8.215482e-05,
                -1.084882e-07,
                 4.348869e-11,
                -3.283488e+04,
                 5.705268e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.710109e+00,
                 2.080515e-02,
                -7.384809e-06,
                 1.181890e-09,
                -7.035978e-14,
                -3.512440e+04,
                -1.889655e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 8.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3H8O_2propanol = Substance {
    name             = "C3H8O,2propanol",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.308030e+00,
                 1.024980e-02,
                 6.198578e-05,
                -9.033111e-08,
                 3.740654e-11,
                -3.492488e+04,
                 7.558263e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.642711e+00,
                 2.002244e-02,
                -7.119484e-06,
                 1.141364e-09,
                -6.799217e-14,
                -3.748401e+04,
                -2.563461e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        H = 8.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C3O2 = Substance {
    name             = "C3O2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.196682e+00,
                 3.145531e-02,
                -5.074586e-05,
                 4.357944e-08,
                -1.473518e-11,
                -1.294610e+04,
                 1.329853e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.461759e+00,
                 4.815528e-03,
                -1.809308e-06,
                 3.007871e-10,
                -1.837222e-14,
                -1.432717e+04,
                -1.706057e+01,
            }
        )
    },
    elements         = {
        C = 3.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4 = Substance {
    name             = "C4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.322735e+00,
                 2.025965e-02,
                -3.734661e-05,
                 3.568783e-08,
                -1.277274e-11,
                 1.227236e+05,
                 6.809948e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.630915e+00,
                 4.831164e-03,
                -1.504056e-06,
                 2.028724e-10,
                -1.003457e-14,
                 1.225009e+05,
                -2.989547e+00,
            }
        )
    },
    elements         = {
        C = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H2 = Substance {
    name             = "C4H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -4.071324e-01,
                 5.207751e-02,
                -9.211383e-05,
                 8.086574e-08,
                -2.704221e-11,
                 5.259574e+04,
                 2.032402e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.667049e+00,
                 6.715052e-03,
                -2.353551e-06,
                 3.736354e-10,
                -2.210540e-14,
                 5.100170e+04,
                -2.180020e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H4_1_3_minuscyclo_minus = Substance {
    name             = "C4H4,1,3-cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.278953e+00,
                 1.342034e-02,
                 4.119921e-05,
                -6.989567e-08,
                 3.072521e-11,
                 4.508641e+04,
                 1.767878e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.042078e+00,
                 1.252022e-02,
                -4.523370e-06,
                 7.331204e-10,
                -4.401109e-14,
                 4.251085e+04,
                -2.112845e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H6_butadiene = Substance {
    name             = "C4H6,butadiene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.685304e+00,
                 1.961200e-02,
                 4.465236e-05,
                -8.315231e-08,
                 3.806512e-11,
                 1.160757e+04,
                 1.675460e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.600101e+01,
                 3.918251e-03,
                 1.143557e-06,
                -2.079257e-10,
                 7.577136e-15,
                 6.517082e+03,
                -6.282041e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H6_2_minusbutyne = Substance {
    name             = "C4H6,2-butyne",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.424817e+00,
                 2.653800e-03,
                 5.304433e-05,
                -6.713921e-08,
                 2.581901e-11,
                 1.546412e+04,
                 5.409674e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.932321e+00,
                 1.864259e-02,
                -6.823591e-06,
                 1.119105e-09,
                -6.767831e-14,
                 1.403096e+04,
                -1.220843e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H6_cyclo_minus = Substance {
    name             = "C4H6,cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.916334e+00,
                -3.205848e-03,
                 1.002636e-04,
                -1.342482e-07,
                 5.466701e-11,
                 1.747322e+04,
                 1.248172e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.848583e+00,
                 1.808129e-02,
                -6.531866e-06,
                 1.058421e-09,
                -6.352539e-14,
                 1.461535e+04,
                -2.089803e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H8_1_minusbutene = Substance {
    name             = "C4H8,1-butene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.426741e+00,
                 6.639462e-03,
                 6.806528e-05,
                -9.287536e-08,
                 3.734739e-11,
                -2.115328e+03,
                 7.546949e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.021480e+00,
                 2.260107e-02,
                -8.312840e-06,
                 1.378031e-09,
                -8.421755e-14,
                -4.308522e+03,
                -1.711707e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H8_cis2_minusbuten = Substance {
    name             = "C4H8,cis2-buten",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.444178e+00,
                -5.204517e-03,
                 9.629066e-05,
                -1.200688e-07,
                 4.681948e-11,
                -2.917415e+03,
                 3.460507e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.083350e+00,
                 2.349824e-02,
                -8.644831e-06,
                 1.431601e-09,
                -8.737626e-14,
                -4.923203e+03,
                -1.287093e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H8_tr2_minusbutene = Substance {
    name             = "C4H8,tr2-butene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.572790e+00,
                 3.765410e-03,
                 6.522267e-05,
                -8.309095e-08,
                 3.203113e-11,
                -3.579033e+03,
                 5.377967e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.625147e+00,
                 2.304510e-02,
                -8.494249e-06,
                 1.411526e-09,
                -8.647518e-14,
                -5.401028e+03,
                -1.619871e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H8_isobutene = Substance {
    name             = "C4H8,isobutene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.680497e+00,
                 1.694144e-02,
                 3.519636e-05,
                -5.431669e-08,
                 2.202016e-11,
                -4.120993e+03,
                 8.114571e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.835553e+00,
                 2.274597e-02,
                -8.365175e-06,
                 1.390763e-09,
                -8.533300e-14,
                -6.163563e+03,
                -1.765407e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H8_cyclo_minus = Substance {
    name             = "C4H8,cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.811447e+00,
                -9.680500e-03,
                 1.279177e-04,
                -1.630571e-07,
                 6.483148e-11,
                 1.871079e+03,
                 8.609982e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.763311e+00,
                 2.306533e-02,
                -8.259838e-06,
                 1.334124e-09,
                -7.993633e-14,
                -1.176720e+03,
                -2.191482e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s__CH3COOH_2 = Substance {
    name             = "(CH3COOH)2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 7.754817e+00,
                 1.389189e-02,
                 8.329556e-05,
                -1.200219e-07,
                 4.906796e-11,
                -1.151857e+05,
                -1.224468e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.582452e+01,
                 2.618351e-02,
                -9.460984e-06,
                 1.533376e-09,
                -9.204765e-14,
                -1.190391e+05,
                -5.110976e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 8.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H9_n_minusbutyl = Substance {
    name             = "C4H9,n-butyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.824305e+00,
                 5.503091e-03,
                 7.493003e-05,
                -1.020859e-07,
                 4.134847e-11,
                 5.540780e+03,
                 2.176095e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.189756e+00,
                 2.363223e-02,
                -8.642710e-06,
                 1.427705e-09,
                -8.702037e-14,
                 3.377029e+03,
                -2.156006e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 9.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H9_i_minusbutyl = Substance {
    name             = "C4H9,i-butyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.548852e+00,
                 1.787476e-02,
                 5.007828e-05,
                -7.944751e-08,
                 3.358024e-11,
                 4.740116e+03,
                 1.118494e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.430406e+00,
                 2.342713e-02,
                -8.535992e-06,
                 1.397484e-09,
                -8.440575e-14,
                 2.142149e+03,
                -2.422080e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 9.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H9_s_minusbutyl = Substance {
    name             = "C4H9,s-butyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.039306e+00,
                 4.093871e-04,
                 9.155741e-05,
                -1.194117e-07,
                 4.750440e-11,
                 6.423272e+03,
                 8.243604e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.426119e+00,
                 2.393793e-02,
                -8.560358e-06,
                 1.377352e-09,
                -8.224960e-14,
                 3.964843e+03,
                -1.698769e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 9.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H9_t_minusbutyl = Substance {
    name             = "C4H9,t-butyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 6.873271e+00,
                -1.851463e-02,
                 1.305601e-04,
                -1.508328e-07,
                 5.653583e-11,
                 4.109589e+03,
                 2.300166e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.630747e+00,
                 2.593537e-02,
                -9.371631e-06,
                 1.518459e-09,
                -9.111909e-14,
                 2.008613e+03,
                -9.205814e+00,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 9.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H10_isobutane = Substance {
    name             = "C4H10,isobutane",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.454793e+00,
                 8.260580e-03,
                 8.298867e-05,
                -1.146476e-07,
                 4.645701e-11,
                -1.845939e+04,
                 4.927432e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.769912e+00,
                 2.549972e-02,
                -9.141429e-06,
                 1.473283e-09,
                -8.808002e-14,
                -2.140526e+04,
                -3.003291e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4H10_n_minusbutane = Substance {
    name             = "C4H10,n-butane",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 6.147468e+00,
                 1.559474e-04,
                 9.679135e-05,
                -1.254839e-07,
                 4.978166e-11,
                -1.759944e+04,
                -1.094099e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.445358e+00,
                 2.578581e-02,
                -9.236191e-06,
                 1.486328e-09,
                -8.878972e-14,
                -2.013822e+04,
                -2.634701e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        H = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C4N2 = Substance {
    name             = "C4N2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.281168e+00,
                 4.612735e-02,
                -8.532932e-05,
                 7.934078e-08,
                -2.803564e-11,
                 6.204010e+04,
                 1.128982e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.048548e+01,
                 5.695449e-03,
                -2.127455e-06,
                 3.523232e-10,
                -2.146317e-14,
                 6.046206e+04,
                -2.722665e+01,
            }
        )
    },
    elements         = {
        C = 4.0,
        N = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5 = Substance {
    name             = "C5",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.358730e+00,
                 3.243509e-02,
                -5.930585e-05,
                 5.601149e-08,
                -2.030752e-11,
                 1.243762e+05,
                 6.049158e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.574569e+00,
                 3.860168e-03,
                -1.475580e-06,
                 2.480488e-10,
                -1.526603e-14,
                 1.230535e+05,
                -2.371380e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5H6_1_3cyclo_minus = Substance {
    name             = "C5H6,1,3cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 8.610440e-01,
                 1.480459e-02,
                 7.210721e-05,
                -1.133784e-07,
                 4.868905e-11,
                 1.480175e+04,
                 2.135363e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.975827e+00,
                 1.890552e-02,
                -6.841103e-06,
                 1.109921e-09,
                -6.667914e-14,
                 1.108167e+04,
                -3.220969e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5H8_cyclo_minus = Substance {
    name             = "C5H8,cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.689805e+00,
                 2.096355e-03,
                 1.130345e-04,
                -1.540776e-07,
                 6.276236e-11,
                 2.458271e+03,
                 1.530750e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.642824e+00,
                 2.425628e-02,
                -8.720895e-06,
                 1.411909e-09,
                -8.472678e-14,
                -1.292550e+03,
                -3.012256e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5H10_1_minuspentene = Substance {
    name             = "C5H10,1-pentene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.883565e+00,
                 5.104013e-03,
                 9.782822e-05,
                -1.323892e-07,
                 5.322315e-11,
                -5.168231e+03,
                 3.419870e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.173971e+01,
                 2.574671e-02,
                -9.259887e-06,
                 1.514979e-09,
                -9.178839e-14,
                -8.462748e+03,
                -3.543756e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5H10_cyclo_minus = Substance {
    name             = "C5H10,cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.703280e+00,
                -1.155654e-02,
                 1.641114e-04,
                -2.093681e-07,
                 8.310545e-11,
                -1.109518e+04,
                 1.197778e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.132958e+00,
                 3.011304e-02,
                -1.091691e-05,
                 1.772988e-09,
                -1.065752e-13,
                -1.515974e+04,
                -2.926188e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5H11_pentyl = Substance {
    name             = "C5H11,pentyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 7.174014e+00,
                 3.809216e-03,
                 1.043791e-04,
                -1.396340e-07,
                 5.603951e-11,
                 2.528709e+03,
                -1.188686e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.129851e+01,
                 2.973142e-02,
                -1.097727e-05,
                 1.827089e-09,
                -1.119960e-13,
                -2.397642e+02,
                -3.103959e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 11.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5H11_t_minuspentyl = Substance {
    name             = "C5H11,t-pentyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 6.446225e+00,
                -9.541778e-03,
                 1.378914e-04,
                -1.692416e-07,
                 6.530971e-11,
                 1.508375e+03,
                 5.430917e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.231210e+00,
                 3.116884e-02,
                -1.124786e-05,
                 1.820907e-09,
                -1.092054e-13,
                -1.600695e+03,
                -2.061420e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 11.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5H12_n_minuspentane = Substance {
    name             = "C5H12,n-pentane",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.898368e+00,
                 4.120304e-02,
                 1.231218e-05,
                -3.658950e-08,
                 1.504251e-11,
                -2.009150e+04,
                 1.867908e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.354700e+01,
                 2.842179e-02,
                -9.417465e-06,
                 1.389359e-09,
                -7.421261e-14,
                -2.457768e+04,
                -4.702117e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 12.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C5H12_i_minuspentane = Substance {
    name             = "C5H12,i-pentane",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.083288e+00,
                 4.457108e-02,
                 8.238993e-06,
                -3.525805e-08,
                 1.578576e-11,
                -2.080753e+04,
                 2.179516e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.232779e+01,
                 3.061309e-02,
                -9.841579e-06,
                 1.391978e-09,
                -7.033734e-14,
                -2.503749e+04,
                -4.113349e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 12.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CH3C_CH3_2CH3 = Substance {
    name             = "CH3C(CH3)2CH3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 7.263899e-01,
                 4.812548e-02,
                 1.591746e-06,
                -2.669246e-08,
                 1.207828e-11,
                -2.240798e+04,
                 1.832721e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.011042e+01,
                 3.534957e-02,
                -1.103997e-05,
                 1.477772e-09,
                -6.846704e-14,
                -2.580671e+04,
                -3.375698e+01,
            }
        )
    },
    elements         = {
        C = 5.0,
        H = 12.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H2 = Substance {
    name             = "C6H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -5.944050e-01,
                 7.466133e-02,
                -1.358480e-04,
                 1.221981e-07,
                -4.176968e-11,
                 7.841922e+04,
                 2.211788e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.252381e+01,
                 8.785963e-03,
                -3.136632e-06,
                 5.043459e-10,
                -3.011097e-14,
                 7.607710e+04,
                -3.885012e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H5_phenyl = Substance {
    name             = "C6H5,phenyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 7.097250e-01,
                 1.932995e-02,
                 5.940790e-05,
                -9.850841e-08,
                 4.254248e-11,
                 3.913457e+04,
                 2.302993e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.077022e+01,
                 1.838486e-02,
                -6.699860e-06,
                 1.092256e-09,
                -6.584144e-14,
                 3.520403e+04,
                -3.501468e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6D5 = Substance {
    name             = "C6D5",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.254978e+00,
                 4.732877e-02,
                -8.075988e-06,
                -2.990197e-08,
                 1.714906e-11,
                 3.531406e+04,
                 2.978015e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.472949e+01,
                 1.521054e-02,
                -5.524163e-06,
                 8.798458e-10,
                -5.097922e-14,
                 3.028263e+04,
                -5.575496e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        D = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H5O_phenoxy = Substance {
    name             = "C6H5O,phenoxy",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 7.762964e-02,
                 3.305749e-02,
                 3.603563e-05,
                -7.931654e-08,
                 3.643286e-11,
                 4.065394e+03,
                 2.575989e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.315151e+01,
                 1.901655e-02,
                -6.946956e-06,
                 1.134422e-09,
                -6.846342e-14,
                -4.729683e+02,
                -4.671072e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 5.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H6 = Substance {
    name             = "C6H6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.034697e-01,
                 1.851424e-02,
                 7.378644e-05,
                -1.181061e-07,
                 5.071825e-11,
                 8.552663e+03,
                 2.164818e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.107717e+01,
                 2.070679e-02,
                -7.516251e-06,
                 1.222094e-09,
                -7.353125e-14,
                 4.309884e+03,
                -4.001170e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6D6 = Substance {
    name             = "C6D6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -2.070122e+00,
                 5.293820e-02,
                -9.607483e-06,
                -3.280237e-08,
                 1.901253e-11,
                 5.406898e+03,
                 3.069387e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.561986e+01,
                 1.712393e-02,
                -6.201276e-06,
                 9.849306e-10,
                -5.689156e-14,
                -1.443305e+02,
                -6.388819e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        D = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H5OH_phenol = Substance {
    name             = "C6H5OH,phenol",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -2.910492e-01,
                 4.085678e-02,
                 2.428235e-05,
                -7.144768e-08,
                 3.460030e-11,
                -1.341292e+04,
                 2.687489e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.415537e+01,
                 1.993495e-02,
                -7.182171e-06,
                 1.162287e-09,
                -6.971458e-14,
                -1.812873e+04,
                -5.179914e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 6.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H10_cyclo_minus = Substance {
    name             = "C6H10,cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.366278e+00,
                 1.068142e-02,
                 1.182222e-04,
                -1.656799e-07,
                 6.761338e-11,
                -2.482504e+03,
                 1.676920e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.177339e+01,
                 3.094827e-02,
                -1.123473e-05,
                 1.826320e-09,
                -1.098557e-13,
                -7.202632e+03,
                -4.265579e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H12_1_minushexene = Substance {
    name             = "C6H12,1-hexene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 7.315398e+00,
                 3.709038e-03,
                 1.272557e-04,
                -1.715622e-07,
                 6.898245e-11,
                -8.209162e+03,
                -5.957824e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.512688e+01,
                 2.949752e-02,
                -1.054112e-05,
                 1.721314e-09,
                -1.042189e-13,
                -1.248616e+04,
                -5.193518e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 12.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H12_cyclo_minus = Substance {
    name             = "C6H12,cyclo-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.043488e+00,
                -6.195274e-03,
                 1.766211e-04,
                -2.229678e-07,
                 8.636674e-11,
                -1.692029e+04,
                 8.525668e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.321476e+01,
                 3.582424e-02,
                -1.321106e-05,
                 2.172023e-09,
                -1.317305e-13,
                -2.280920e+04,
                -5.535265e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 12.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C6H13_n_minushexyl = Substance {
    name             = "C6H13,n-hexyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 8.763450e+00,
                 2.162439e-03,
                 1.316741e-04,
                -1.738275e-07,
                 6.925150e-11,
                -5.426281e+02,
                -5.917270e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.403020e+01,
                 3.471140e-02,
                -1.268361e-05,
                 2.093659e-09,
                -1.276280e-13,
                -4.069079e+03,
                -4.396438e+01,
            }
        )
    },
    elements         = {
        C = 6.0,
        H = 13.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C7H7_benzyl = Substance {
    name             = "C7H7,benzyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.811457e-01,
                 3.851269e-02,
                 3.286183e-05,
                -7.697286e-08,
                 3.542303e-11,
                 2.330702e+04,
                 2.354870e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.404356e+01,
                 2.349462e-02,
                -8.537870e-06,
                 1.389145e-09,
                -8.361837e-14,
                 1.856437e+04,
                -5.166324e+01,
            }
        )
    },
    elements         = {
        C = 7.0,
        H = 7.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C7H8 = Substance {
    name             = "C7H8",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.611914e+00,
                 2.111889e-02,
                 8.532215e-05,
                -1.325669e-07,
                 5.594061e-11,
                 4.096520e+03,
                 2.029736e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.293947e+01,
                 2.669216e-02,
                -9.684201e-06,
                 1.573921e-09,
                -9.466705e-14,
                -6.770358e+02,
                -4.672553e+01,
            }
        )
    },
    elements         = {
        C = 7.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C7H8O_cresol = Substance {
    name             = "C7H8O,cresol",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 7.980260e-01,
                 4.672849e-02,
                 2.736174e-05,
                -7.758233e-08,
                 3.689484e-11,
                -1.833241e+04,
                 2.423032e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.651795e+01,
                 2.547216e-02,
                -9.187812e-06,
                 1.487727e-09,
                -8.926172e-14,
                -2.361168e+04,
                -6.193862e+01,
            }
        )
    },
    elements         = {
        C = 7.0,
        H = 8.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C7H14_1_minusheptene = Substance {
    name             = "C7H14,1-heptene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 8.705756e+00,
                 2.797880e-03,
                 1.552123e-04,
                -2.090201e-07,
                 8.405272e-11,
                -1.126614e+04,
                -4.453419e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.849725e+01,
                 3.325760e-02,
                -1.181503e-05,
                 1.925133e-09,
                -1.164419e-13,
                -1.651420e+04,
                -6.830951e+01,
            }
        )
    },
    elements         = {
        C = 7.0,
        H = 14.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C7H15_n_minusheptyl = Substance {
    name             = "C7H15,n-heptyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.028041e+01,
                 7.015536e-04,
                 1.595513e-04,
                -2.095932e-07,
                 8.334453e-11,
                -3.603073e+03,
                -1.030209e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.641171e+01,
                 4.036029e-02,
                -1.478232e-05,
                 2.444146e-09,
                -1.491604e-13,
                -7.763109e+03,
                -5.495318e+01,
            }
        )
    },
    elements         = {
        C = 7.0,
        H = 15.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C7H16_n_minusheptane = Substance {
    name             = "C7H16,n-heptane",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.115325e+01,
                -9.494154e-03,
                 1.955712e-04,
                -2.497525e-07,
                 9.848732e-11,
                -2.677117e+04,
                -1.590961e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.853547e+01,
                 3.914205e-02,
                -1.380303e-05,
                 2.224039e-09,
                -1.334526e-13,
                -3.195008e+04,
                -7.019028e+01,
            }
        )
    },
    elements         = {
        C = 7.0,
        H = 16.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C8H8_styrene = Substance {
    name             = "C8H8,styrene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.181758e+00,
                 3.348760e-02,
                 6.923663e-05,
                -1.244904e-07,
                 5.493847e-11,
                 1.560391e+04,
                 2.266250e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.588133e+01,
                 2.683741e-02,
                -9.902446e-06,
                 1.637591e-09,
                -9.984490e-14,
                 1.008478e+04,
                -6.094193e+01,
            }
        )
    },
    elements         = {
        C = 8.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C8H10_ethylbenz = Substance {
    name             = "C8H10,ethylbenz",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.515350e+00,
                 1.781457e-02,
                 1.189340e-04,
                -1.756398e-07,
                 7.320611e-11,
                 1.020386e+03,
                 1.415396e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.557608e+01,
                 3.230646e-02,
                -1.190027e-05,
                 1.967925e-09,
                -1.199112e-13,
                -4.411575e+03,
                -5.910439e+01,
            }
        )
    },
    elements         = {
        C = 8.0,
        H = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C8H16_1_minusoctene = Substance {
    name             = "C8H16,1-octene",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.014879e+01,
                 1.251075e-03,
                 1.852527e-04,
                -2.490942e-07,
                 1.002504e-10,
                -1.432675e+04,
                -8.507744e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.201341e+01,
                 3.679722e-02,
                -1.298305e-05,
                 2.108546e-09,
                -1.272942e-13,
                -2.061098e+04,
                -8.553372e+01,
            }
        )
    },
    elements         = {
        C = 8.0,
        H = 16.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C8H17_n_minusoctyl = Substance {
    name             = "C8H17,n-octyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.180825e+01,
                -8.503481e-04,
                 1.876977e-04,
                -2.456907e-07,
                 9.758130e-11,
                -6.664504e+03,
                -1.472985e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.879680e+01,
                 4.600485e-02,
                -1.687901e-05,
                 2.794225e-09,
                -1.706639e-13,
                -1.145926e+04,
                -6.596222e+01,
            }
        )
    },
    elements         = {
        C = 8.0,
        H = 17.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C8H18_isooctane = Substance {
    name             = "C8H18,isooctane",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 8.157373e-01,
                 7.326440e-02,
                 1.783007e-05,
                -6.935896e-08,
                 3.216294e-11,
                -3.047729e+04,
                 2.415100e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.598993e+01,
                 5.531848e-02,
                -1.952671e-05,
                 3.117792e-09,
                -1.853126e-13,
                -3.587580e+04,
                -6.011614e+01,
            }
        )
    },
    elements         = {
        C = 8.0,
        H = 18.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C8H18_n_minusoctane = Substance {
    name             = "C8H18,n-octane",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.252449e+01,
                -1.010184e-02,
                 2.219916e-04,
                -2.848624e-07,
                 1.124096e-10,
                -2.984330e+04,
                -1.971086e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.217554e+01,
                 4.244262e-02,
                -1.491611e-05,
                 2.403767e-09,
                -1.443590e-13,
                -3.610309e+04,
                -8.808545e+01,
            }
        )
    },
    elements         = {
        C = 8.0,
        H = 18.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C9H19_n_minusnonyl = Substance {
    name             = "C9H19,n-nonyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.875649e+00,
                 7.579279e-02,
                 1.346243e-05,
                -6.408840e-08,
                 2.869417e-11,
                -8.683453e+03,
                 2.426224e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.919527e+01,
                 5.543925e-02,
                -2.143660e-05,
                 3.788514e-09,
                -2.500299e-13,
                -1.437371e+04,
                -6.605629e+01,
            }
        )
    },
    elements         = {
        C = 9.0,
        H = 19.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C10H8_naphthale = Substance {
    name             = "C10H8,naphthale",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -1.049193e+00,
                 4.629706e-02,
                 7.075922e-05,
                -1.384082e-07,
                 6.204757e-11,
                 1.598464e+04,
                 3.021216e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.861299e+01,
                 3.044941e-02,
                -1.112248e-05,
                 1.816154e-09,
                -1.096012e-13,
                 8.915529e+03,
                -8.002305e+01,
            }
        )
    },
    elements         = {
        C = 10.0,
        H = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C10H21_n_minusdecyl = Substance {
    name             = "C10H21,n-decyl",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.089701e+00,
                 8.411795e-02,
                 1.590184e-05,
                -7.238793e-08,
                 3.226692e-11,
                -1.161494e+04,
                 2.528119e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.132213e+01,
                 6.157352e-02,
                -2.384948e-05,
                 4.220912e-09,
                -2.788931e-13,
                -1.796781e+04,
                -7.564378e+01,
            }
        )
    },
    elements         = {
        C = 10.0,
        H = 21.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C12H9_o_minusbipheny = Substance {
    name             = "C12H9,o-bipheny",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.076492e-01,
                 5.427978e-02,
                 7.125147e-05,
                -1.444045e-07,
                 6.485006e-11,
                 4.853498e+04,
                 2.819825e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.256934e+01,
                 3.456194e-02,
                -1.270208e-05,
                 2.081118e-09,
                -1.258495e-13,
                 4.059051e+04,
                -9.577924e+01,
            }
        )
    },
    elements         = {
        C = 12.0,
        H = 9.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_O_minusC12D9 = Substance {
    name             = "O-C12D9",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -7.329940e-01,
                 8.983689e-02,
                -1.373128e-05,
                -5.942702e-08,
                 3.370243e-11,
                 4.294309e+04,
                 3.004196e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.012320e+01,
                 2.832826e-02,
                -1.036654e-05,
                 1.659334e-09,
                -9.652712e-14,
                 3.320779e+04,
                -1.351913e+02,
            }
        )
    },
    elements         = {
        C = 12.0,
        D = 9.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C12H10_bipheny = Substance {
    name             = "C12H10,bipheny",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.945662e-01,
                 5.352644e-02,
                 8.549967e-05,
                -1.639036e-07,
                 7.299772e-11,
                 1.900204e+04,
                 2.721513e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.289649e+01,
                 3.684526e-02,
                -1.350163e-05,
                 2.208028e-09,
                -1.333582e-13,
                 1.073945e+04,
                -1.005101e+02,
            }
        )
    },
    elements         = {
        C = 12.0,
        H = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_C12D10 = Substance {
    name             = "C12D10",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.579349e+00,
                 9.505957e-02,
                -1.453207e-05,
                -6.264560e-08,
                 3.553008e-11,
                 1.313742e+04,
                 3.152984e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.090506e+01,
                 3.034999e-02,
                -1.109505e-05,
                 1.775581e-09,
                -1.033233e-13,
                 2.883445e+03,
                -1.424389e+02,
            }
        )
    },
    elements         = {
        C = 12.0,
        D = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Jet_minusA_g_ = Substance {
    name             = "Jet-A(g)",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            273.15, 1000.00,
            NASA7 {
                 2.086922e+00,
                 1.331497e-01,
                -8.115745e-05,
                 2.940929e-08,
                -6.519521e-12,
                -3.591281e+04,
                 2.735530e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.488020e+01,
                 7.825005e-02,
                -3.155097e-05,
                 5.787890e-09,
                -3.982797e-13,
                -4.311068e+04,
                -9.365525e+01,
            }
        )
    },
    elements         = {
        C = 12.0,
        H = 23.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ca = Substance {
    name             = "Ca",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 2.063893e+04,
                 4.384548e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.927076e+00,
                 1.349092e-03,
                -1.075159e-06,
                 3.254579e-10,
                -2.646715e-14,
                 2.081962e+04,
                 7.428784e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ca_plus = Substance {
    name             = "Ca+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 9.232421e+04,
                 5.077675e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.642214e+00,
                -1.605174e-04,
                -2.708440e-08,
                 5.135225e-11,
                -5.964870e-15,
                 9.225964e+04,
                 4.253726e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaBr = Substance {
    name             = "CaBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.851188e+00,
                 3.027148e-03,
                -5.509781e-06,
                 4.676457e-09,
                -1.495996e-12,
                -7.183724e+03,
                 7.778033e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.321736e+00,
                 4.090367e-04,
                -2.454153e-07,
                 6.902687e-11,
                -5.368420e-15,
                -7.246273e+03,
                 5.676681e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaBr2 = Substance {
    name             = "CaBr2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.605716e+00,
                 3.605889e-03,
                -5.831465e-06,
                 4.263480e-09,
                -1.166728e-12,
                -4.838296e+04,
                -6.310523e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.415164e+00,
                 9.654901e-05,
                -4.246382e-08,
                 8.228686e-12,
                -5.861706e-16,
                -4.853682e+04,
                -4.480802e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaCL = Substance {
    name             = "CaCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.673052e+00,
                 3.314416e-03,
                -5.168243e-06,
                 3.711127e-09,
                -9.968703e-13,
                -1.378414e+04,
                 7.336796e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.306712e+00,
                 4.008496e-04,
                -2.331366e-07,
                 6.392180e-11,
                -4.866238e-15,
                -1.389266e+04,
                 4.373374e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaCL2 = Substance {
    name             = "CaCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.161336e+00,
                 5.306043e-03,
                -8.464946e-06,
                 6.112890e-09,
                -1.652236e-12,
                -5.872293e+04,
                -1.448297e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.365001e+00,
                 1.532711e-04,
                -6.727529e-08,
                 1.301413e-11,
                -9.256797e-16,
                -5.895473e+04,
                -7.188521e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaF = Substance {
    name             = "CaF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.050899e+00,
                 5.154944e-03,
                -7.350830e-06,
                 4.787646e-09,
                -1.152315e-12,
                -3.379235e+04,
                 8.988009e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.198862e+00,
                 4.924409e-04,
                -2.610212e-07,
                 6.479163e-11,
                -4.730395e-15,
                -3.402113e+04,
                 3.463148e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaF2 = Substance {
    name             = "CaF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.230815e+00,
                 1.025580e-02,
                -1.544435e-05,
                 1.054679e-08,
                -2.684392e-12,
                -9.595526e+04,
                 6.367807e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.654343e+00,
                 3.905269e-04,
                -1.708107e-07,
                 3.295284e-11,
                -2.338774e-15,
                -9.644528e+04,
                -5.310721e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaI = Substance {
    name             = "CaI",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.023910e+00,
                 2.255998e-03,
                -4.093983e-06,
                 3.484005e-09,
                -1.116300e-12,
                -1.877051e+03,
                 7.990311e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.319847e+00,
                 4.346669e-04,
                -2.744192e-07,
                 8.008044e-11,
                -6.545161e-15,
                -1.906480e+03,
                 6.714802e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaI2 = Substance {
    name             = "CaI2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.564173e+00,
                 4.268465e-03,
                -7.924758e-06,
                 6.720560e-09,
                -2.148546e-12,
                -3.313828e+04,
                 1.022092e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.423866e+00,
                 8.855536e-05,
                -3.984689e-08,
                 7.891836e-12,
                -5.735266e-16,
                -3.328775e+04,
                -2.978445e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaO = Substance {
    name             = "CaO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.671860e+00,
                 6.432402e-03,
                -9.572703e-06,
                 6.762042e-09,
                -1.817305e-12,
                 4.273453e+03,
                 9.654227e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.174587e+00,
                -1.064323e-02,
                 7.696897e-06,
                -1.907044e-09,
                 1.550923e-13,
                 2.324804e+03,
                -2.442758e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaOH = Substance {
    name             = "CaOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.100485e+00,
                 1.869516e-02,
                -3.350664e-05,
                 2.802564e-08,
                -8.799269e-12,
                -2.453092e+04,
                 1.203876e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.275476e+00,
                 1.802562e-03,
                -6.843565e-07,
                 1.306020e-10,
                -8.913158e-15,
                -2.498468e+04,
                -2.311085e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaOH_plus = Substance {
    name             = "CaOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.156646e+00,
                 1.851868e-02,
                -3.326822e-05,
                 2.787222e-08,
                -8.760801e-12,
                 4.316839e+04,
                 1.109277e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.405109e+00,
                 1.524500e-03,
                -4.783081e-07,
                 7.134722e-11,
                -4.129835e-15,
                 4.268593e+04,
                -3.669811e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaO2H2 = Substance {
    name             = "CaO2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.322217e+00,
                 3.751568e-02,
                -6.799651e-05,
                 5.729026e-08,
                -1.808147e-11,
                -7.532286e+04,
                 1.248796e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.858204e+00,
                 2.994191e-03,
                -9.321930e-07,
                 1.378839e-10,
                -7.911198e-15,
                -7.627950e+04,
                -1.713930e+01,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CaS = Substance {
    name             = "CaS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.225860e+00,
                 5.306404e-03,
                -8.765276e-06,
                 6.426011e-09,
                -1.615290e-12,
                 1.373349e+04,
                 8.348921e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.357078e+00,
                -4.183925e-03,
                 4.682914e-06,
                -1.407251e-09,
                 1.288927e-13,
                 1.347418e+04,
                -1.431732e+00,
            }
        )
    },
    elements         = {
        Ca = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ca2 = Substance {
    name             = "Ca2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.945901e+00,
                 4.306213e-03,
                -3.233842e-05,
                 4.516408e-08,
                -1.935011e-11,
                 3.961755e+04,
                 2.545113e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.167002e+00,
                -6.168144e-04,
                 2.035410e-07,
                -2.771282e-11,
                 1.650030e-15,
                 4.043824e+04,
                 1.371135e+01,
            }
        )
    },
    elements         = {
        Ca = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CL = Substance {
    name             = "CL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.260625e+00,
                 1.541544e-03,
                -6.802836e-07,
                -1.599730e-09,
                 1.154166e-12,
                 1.385530e+04,
                 6.570208e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.946584e+00,
                -3.859854e-04,
                 1.361394e-07,
                -2.170329e-11,
                 1.287510e-15,
                 1.369703e+04,
                 3.113301e+00,
            }
        )
    },
    elements         = {
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CL_plus = Substance {
    name             = "CL+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.714354e+00,
                 6.624892e-03,
                -1.355231e-05,
                 1.149998e-08,
                -3.587606e-12,
                 1.651238e+05,
                 8.917396e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.122861e+00,
                -6.366240e-04,
                 2.483379e-07,
                -3.725078e-11,
                 1.984337e-15,
                 1.649122e+05,
                 2.497313e+00,
            }
        )
    },
    elements         = {
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CL_minus = Substance {
    name             = "CL-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -2.888341e+04,
                 4.200629e+00,
            }
        )
    },
    elements         = {
        Cl = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CLCN = Substance {
    name             = "CLCN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.339085e+00,
                 1.039747e-02,
                -1.370465e-05,
                 9.506196e-09,
                -2.592526e-12,
                 1.523754e+04,
                 6.831033e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.492002e+00,
                 2.098725e-03,
                -7.741591e-07,
                 1.382388e-10,
                -9.233486e-15,
                 1.474916e+04,
                -3.730462e+00,
            }
        )
    },
    elements         = {
        Cl = 1.0,
        C  = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CLF = Substance {
    name             = "CLF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.644557e+00,
                 6.248126e-03,
                -9.035435e-06,
                 6.340058e-09,
                -1.743537e-12,
                -7.046911e+03,
                 9.630428e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.848623e+00,
                 3.173328e-03,
                -2.052339e-06,
                 5.216273e-10,
                -3.747226e-14,
                -6.927882e+03,
                 9.316997e+00,
            }
        )
    },
    elements         = {
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CLF3 = Substance {
    name             = "CLF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.894912e+00,
                 2.471855e-02,
                -3.513932e-05,
                 2.255959e-08,
                -5.326198e-12,
                -2.079864e+04,
                 1.138169e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.953597e+00,
                 1.172216e-03,
                -5.089619e-07,
                 9.756349e-11,
                -6.885873e-15,
                -2.207597e+04,
                -1.808155e+01,
            }
        )
    },
    elements         = {
        Cl = 1.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CLO = Substance {
    name             = "CLO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.817936e+00,
                 4.453133e-03,
                -4.412489e-06,
                 1.592094e-09,
                -1.448624e-14,
                 1.117140e+04,
                 1.005798e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.091262e+00,
                 5.000313e-04,
                -1.877821e-07,
                 3.509767e-11,
                -2.420504e-15,
                 1.085322e+04,
                 3.618892e+00,
            }
        )
    },
    elements         = {
        Cl = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CLO2 = Substance {
    name             = "CLO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.293386e+00,
                 6.193113e-03,
                 1.056854e-06,
                -8.161913e-09,
                 4.346946e-12,
                 1.137608e+04,
                 1.030170e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.766477e+00,
                 1.411325e-03,
                -5.437140e-07,
                 1.007343e-10,
                -6.435438e-15,
                 1.063242e+04,
                -2.865601e+00,
            }
        )
    },
    elements         = {
        Cl = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CL2 = Substance {
    name             = "CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.736381e+00,
                 7.835257e-03,
                -1.451050e-05,
                 1.257308e-08,
                -4.132471e-12,
                -1.058801e+03,
                 9.445559e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.747275e+00,
                -4.885817e-04,
                 2.684449e-07,
                -2.434761e-11,
                -1.036831e-15,
                -1.511019e+03,
                -3.445513e-01,
            }
        )
    },
    elements         = {
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CL2O = Substance {
    name             = "CL2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.254524e+00,
                 1.279945e-02,
                -1.788246e-05,
                 1.126438e-08,
                -2.596425e-12,
                 9.165742e+03,
                 1.057121e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.434006e+00,
                 6.272881e-04,
                -2.693325e-07,
                 5.107639e-11,
                -3.569155e-15,
                 8.486053e+03,
                -4.936724e+00,
            }
        )
    },
    elements         = {
        Cl = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cr = Substance {
    name             = "Cr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.502594e+00,
                -2.765602e-05,
                 1.039741e-07,
                -1.619964e-10,
                 8.893920e-14,
                 4.706002e+04,
                 6.711072e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.084978e+00,
                -1.447037e-03,
                 1.084922e-06,
                -2.356436e-10,
                 1.863558e-14,
                 4.689282e+04,
                 3.659139e+00,
            }
        )
    },
    elements         = {
        Cr = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CrN = Substance {
    name             = "CrN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.930464e+00,
                 3.037704e-03,
                -1.271396e-06,
                -1.178125e-09,
                 8.555135e-13,
                 5.974420e+04,
                 1.019188e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.864960e+00,
                 8.516046e-04,
                -4.407076e-07,
                 1.066760e-10,
                -8.373142e-15,
                 5.947744e+04,
                 5.295068e+00,
            }
        )
    },
    elements         = {
        Cr = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CrO = Substance {
    name             = "CrO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.841500e+00,
                 4.095336e-03,
                -3.577646e-06,
                 8.171044e-10,
                 2.407201e-13,
                 2.164607e+04,
                 1.151799e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.013982e+00,
                 6.270025e-04,
                -2.795679e-07,
                 6.000310e-11,
                -4.405792e-15,
                 2.134669e+04,
                 5.551715e+00,
            }
        )
    },
    elements         = {
        Cr = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CrO2 = Substance {
    name             = "CrO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.301264e+00,
                 8.162586e-03,
                -5.890768e-06,
                 1.617086e-11,
                 1.081627e-12,
                -1.035357e+04,
                 1.139911e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.850000e+00,
                 1.272510e-03,
                -5.492055e-07,
                 1.049749e-10,
                -7.399549e-15,
                -1.104218e+04,
                -1.744976e+00,
            }
        )
    },
    elements         = {
        Cr = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CrO3 = Substance {
    name             = "CrO3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.907286e+00,
                 2.304961e-02,
                -2.650129e-05,
                 1.286241e-08,
                -1.838199e-12,
                -3.660868e+04,
                 1.534514e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.162895e+00,
                 2.045084e-03,
                -8.859413e-07,
                 1.697628e-10,
                -1.198776e-14,
                -3.809256e+04,
                -1.589589e+01,
            }
        )
    },
    elements         = {
        Cr = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cs = Substance {
    name             = "Cs",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500046e+00,
                -4.668334e-07,
                 1.680051e-09,
                -2.482180e-12,
                 1.277122e-15,
                 8.455404e+03,
                 6.875735e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.820233e+00,
                -3.348403e-04,
                -9.829157e-08,
                 1.275644e-10,
                -1.461193e-14,
                 8.306394e+03,
                 5.008940e+00,
            }
        )
    },
    elements         = {
        Cs = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cs_plus = Substance {
    name             = "Cs+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 5.438740e+04,
                 6.182758e+00,
            }
        )
    },
    elements         = {
        Cs = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CsCL = Substance {
    name             = "CsCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.182303e+00,
                 1.375955e-03,
                -2.058693e-06,
                 1.483647e-09,
                -3.976455e-13,
                -3.017793e+04,
                 6.638488e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.479845e+00,
                 1.094916e-04,
                -3.998991e-09,
                 2.064199e-13,
                 2.218464e-17,
                -3.023581e+04,
                 5.217317e+00,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CsF = Substance {
    name             = "CsF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.744988e+00,
                 3.010052e-03,
                -4.588382e-06,
                 3.217969e-09,
                -8.378602e-13,
                -4.409070e+04,
                 7.194873e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.437331e+00,
                 1.271500e-04,
                -2.054765e-08,
                 2.981336e-12,
                -1.477424e-16,
                -4.422800e+04,
                 3.873556e+00,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CsO = Substance {
    name             = "CsO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.985742e+00,
                 2.127925e-03,
                -3.217026e-06,
                 2.276430e-09,
                -5.972198e-13,
                 6.289894e+03,
                 7.516023e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.466028e+00,
                 1.156323e-04,
                -5.998919e-09,
                 1.317670e-13,
                 5.763974e-17,
                 6.195031e+03,
                 5.214549e+00,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CsOH = Substance {
    name             = "CsOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.548600e+00,
                 7.961233e-03,
                -1.332650e-05,
                 1.031423e-08,
                -2.897378e-12,
                -3.281089e+04,
                 2.861880e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.700565e+00,
                 1.182038e-03,
                -3.193909e-07,
                 3.864292e-11,
                -1.663564e-15,
                -3.291921e+04,
                -2.118700e+00,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CsOH_plus = Substance {
    name             = "CsOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.848716e+00,
                 6.890835e-03,
                -1.183933e-05,
                 9.433537e-09,
                -2.722268e-12,
                 5.167817e+04,
                 3.084849e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.729256e+00,
                 1.157132e-03,
                -3.104443e-07,
                 3.709629e-11,
                -1.550946e-15,
                 5.162648e+04,
                -5.764822e-01,
            }
        )
    },
    elements         = {
        Cs = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cs2 = Substance {
    name             = "Cs2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.745882e+00,
                -2.638628e-03,
                 1.141393e-05,
                -1.604305e-08,
                 6.561123e-12,
                 1.154449e+04,
                 7.606793e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.866452e+00,
                -3.990143e-03,
                 1.319481e-06,
                -1.634132e-10,
                 6.881259e-15,
                 1.080543e+04,
                -4.297495e+00,
            }
        )
    },
    elements         = {
        Cs = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cs2CL2 = Substance {
    name             = "Cs2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 9.295264e+00,
                 2.850560e-03,
                -4.557602e-06,
                 3.255773e-09,
                -8.606736e-13,
                -8.222286e+04,
                -7.518353e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.942438e+00,
                 6.265930e-05,
                -2.633110e-08,
                 4.891214e-12,
                -3.355415e-16,
                -8.234585e+04,
                -1.059806e+01,
            }
        )
    },
    elements         = {
        Cs = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cs2F2 = Substance {
    name             = "Cs2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 8.442556e+00,
                 6.492100e-03,
                -1.083276e-05,
                 8.179105e-09,
                -2.317398e-12,
                -1.097816e+05,
                -7.248245e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.879373e+00,
                 1.267483e-04,
                -5.090525e-08,
                 8.971176e-12,
                -5.809096e-16,
                -1.100506e+05,
                -1.405482e+01,
            }
        )
    },
    elements         = {
        Cs = 2.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cs2O = Substance {
    name             = "Cs2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.755364e+00,
                 4.911607e-03,
                -7.707252e-06,
                 5.415696e-09,
                -1.408090e-12,
                -1.294683e+04,
                 4.300155e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.897947e+00,
                 1.016510e-04,
                -3.806206e-08,
                 6.146639e-12,
                -3.575822e-16,
                -1.316999e+04,
                -1.165917e+00,
            }
        )
    },
    elements         = {
        Cs = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cs2O2H2 = Substance {
    name             = "Cs2O2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.522819e+00,
                 7.907837e-03,
                 3.543030e-06,
                -1.045633e-08,
                 4.801403e-12,
                -8.533841e+04,
                -1.906633e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.580936e+00,
                 5.326051e-03,
                -1.878054e-06,
                 3.092592e-10,
                -1.942953e-14,
                -8.602584e+04,
                -1.321459e+01,
            }
        )
    },
    elements         = {
        Cs = 2.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cs2SO4 = Substance {
    name             = "Cs2SO4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.296538e+00,
                 4.485430e-02,
                -6.098792e-05,
                 4.051639e-08,
                -1.067350e-11,
                -1.378256e+05,
                 1.340964e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.541905e+01,
                 4.052765e-03,
                -1.791034e-06,
                 3.502465e-10,
                -2.521574e-14,
                -1.403678e+05,
                -4.149218e+01,
            }
        )
    },
    elements         = {
        Cs = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cu = Substance {
    name             = "Cu",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500066e+00,
                -6.773064e-07,
                 2.441168e-09,
                -3.613148e-12,
                 1.863032e-15,
                 3.985834e+04,
                 5.768846e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.135226e+00,
                -1.133375e-03,
                 5.720230e-07,
                -7.663262e-11,
                 2.838815e-15,
                 3.961772e+04,
                 2.253319e+00,
            }
        )
    },
    elements         = {
        Cu = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cu_plus = Substance {
    name             = "Cu+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.302638e+05,
                 1.249412e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.499818e+00,
                 3.579221e-07,
                -2.217698e-10,
                 4.869379e-14,
                -2.390196e-18,
                 1.302639e+05,
                 1.249512e+01,
            }
        )
    },
    elements         = {
        Cu = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CuCL = Substance {
    name             = "CuCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.349160e+00,
                 5.102830e-03,
                -9.127800e-06,
                 7.601415e-09,
                -2.398449e-12,
                 9.796756e+03,
                 8.269473e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.390299e+00,
                 1.834948e-04,
                -5.711070e-08,
                 1.129332e-11,
                -8.197552e-16,
                 9.609727e+03,
                 3.392165e+00,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CuF = Substance {
    name             = "CuF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.765451e+00,
                 6.851180e-03,
                -1.133882e-05,
                 8.909658e-09,
                -2.692769e-12,
                -2.554856e+03,
                 9.872774e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.122740e+00,
                 6.316346e-04,
                -3.347282e-07,
                 8.083737e-11,
                -5.783482e-15,
                -2.800595e+03,
                 3.485646e+00,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CuF2 = Substance {
    name             = "CuF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.110770e+00,
                 1.432581e-02,
                -2.281174e-05,
                 1.727889e-08,
                -5.072698e-12,
                -3.350045e+04,
                 1.099957e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.818424e+00,
                -1.649791e-04,
                 2.029177e-07,
                -2.545311e-11,
                 1.206573e-16,
                -3.432274e+04,
                -7.128629e+00,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_CuO = Substance {
    name             = "CuO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.709352e+00,
                 3.196506e-03,
                -5.297011e-06,
                 4.216424e-09,
                -1.289185e-12,
                 3.562747e+04,
                 6.331401e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.272362e+00,
                 4.471328e-04,
                -2.395698e-07,
                 6.040532e-11,
                -4.245602e-15,
                 3.553535e+04,
                 3.727019e+00,
            }
        )
    },
    elements         = {
        Cu = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cu2 = Substance {
    name             = "Cu2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.924436e+00,
                 2.727495e-03,
                -4.919496e-06,
                 4.182196e-09,
                -1.339353e-12,
                 5.711919e+04,
                 6.083808e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.423973e+00,
                 2.024895e-04,
                -6.448979e-08,
                 1.406541e-11,
                -7.602049e-16,
                 5.703813e+04,
                 3.785356e+00,
            }
        )
    },
    elements         = {
        Cu = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Cu3CL3 = Substance {
    name             = "Cu3CL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.144290e+01,
                 2.069081e-02,
                -3.826400e-05,
                 3.234105e-08,
                -1.030988e-11,
                -3.515161e+04,
                -1.826879e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.562613e+01,
                 4.337383e-04,
                -1.946701e-07,
                 3.846694e-11,
                -2.789970e-15,
                -3.588185e+04,
                -3.775233e+01,
            }
        )
    },
    elements         = {
        Cu = 3.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_D = Substance {
    name             = "D",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 2.592126e+04,
                 5.917158e-01,
            }
        )
    },
    elements         = {
        D = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_D_plus = Substance {
    name             = "D+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.845120e+05,
                -1.018389e-01,
            }
        )
    },
    elements         = {
        D = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_D_minus = Substance {
    name             = "D-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.642377e+04,
                -1.010239e-01,
            }
        )
    },
    elements         = {
        D = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_DCL = Substance {
    name             = "DCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.826921e+00,
                -2.501333e-03,
                 6.046612e-06,
                -4.483752e-09,
                 1.136764e-12,
                -1.230192e+04,
                 1.891778e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.957203e+00,
                 1.591816e-03,
                -6.332027e-07,
                 1.175566e-10,
                -8.159991e-15,
                -1.217351e+04,
                 5.898797e+00,
            }
        )
    },
    elements         = {
        D  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_DF = Substance {
    name             = "DF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.498139e+00,
                 2.217679e-04,
                -1.332024e-06,
                 2.561949e-09,
                -1.151224e-12,
                -3.418323e+04,
                 1.655079e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.726462e+00,
                 1.509129e-03,
                -5.170494e-07,
                 8.548537e-11,
                -5.419602e-15,
                -3.393694e+04,
                 5.829820e+00,
            }
        )
    },
    elements         = {
        D = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_DOCL = Substance {
    name             = "DOCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.479042e+00,
                 1.084590e-02,
                -1.522830e-05,
                 1.143731e-08,
                -3.420492e-12,
                -1.051809e+04,
                 1.212671e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.435076e+00,
                 2.532239e-03,
                -1.031233e-06,
                 1.900545e-10,
                -1.268238e-14,
                -1.091940e+04,
                 2.727160e+00,
            }
        )
    },
    elements         = {
        D  = 1.0,
        O  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_D2 = Substance {
    name             = "D2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.495470e+00,
                 2.583482e-04,
                -1.317625e-06,
                 2.429120e-09,
                -1.059825e-12,
                -1.046316e+03,
                -2.519054e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.730689e+00,
                 1.480048e-03,
                -4.793148e-07,
                 7.894963e-11,
                -4.883808e-15,
                -7.952675e+02,
                 1.642662e+00,
            }
        )
    },
    elements         = {
        D = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_D2_plus = Substance {
    name             = "D2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.807514e+00,
                -3.110626e-03,
                 1.016298e-05,
                -9.836327e-09,
                 3.265985e-12,
                 1.791710e+05,
                -2.286628e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.589180e+00,
                 8.921465e-04,
                -2.426448e-07,
                 5.758441e-11,
                -6.738056e-15,
                 1.790375e+05,
                -2.058179e+00,
            }
        )
    },
    elements         = {
        D = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_D2_minus = Substance {
    name             = "D2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.214480e+00,
                 7.835816e-04,
                 3.589269e-06,
                -5.239419e-09,
                 2.087136e-12,
                 2.729301e+04,
                 3.681558e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.753104e+00,
                 9.801899e-04,
                -3.638796e-07,
                 7.070048e-11,
                -5.067427e-15,
                 2.706471e+04,
                -2.819552e+00,
            }
        )
    },
    elements         = {
        D = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_D2O = Substance {
    name             = "D2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.854113e+00,
                 1.471229e-04,
                 3.006901e-06,
                -1.774763e-09,
                 2.301886e-13,
                -3.115165e+04,
                 1.733420e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.726459e+00,
                 3.984517e-03,
                -1.493263e-06,
                 2.634977e-10,
                -1.764956e-14,
                -3.090264e+04,
                 7.318201e+00,
            }
        )
    },
    elements         = {
        D = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_D2S = Substance {
    name             = "D2S",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.807082e+00,
                 3.759631e-04,
                 5.753080e-06,
                -5.348574e-09,
                 1.405408e-12,
                -4.066122e+03,
                 3.879287e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.666290e+00,
                 3.499226e-03,
                -1.420728e-06,
                 2.668564e-10,
                -1.868474e-14,
                -4.214731e+03,
                 3.799700e+00,
            }
        )
    },
    elements         = {
        D = 2.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_F = Substance {
    name             = "F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.419514e+00,
                 2.941328e-03,
                -8.927992e-06,
                 9.920609e-09,
                -3.798600e-12,
                 8.757324e+03,
                 4.747710e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.667495e+00,
                -1.666935e-04,
                 6.424485e-08,
                -1.085888e-11,
                 6.708458e-16,
                 8.788953e+03,
                 4.007292e+00,
            }
        )
    },
    elements         = {
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_F_plus = Substance {
    name             = "F+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.084211e+00,
                -9.000621e-04,
                -1.645992e-07,
                 1.101213e-09,
                -5.562709e-13,
                 2.116191e+05,
                 2.145977e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.688349e+00,
                -1.761830e-04,
                 6.069406e-08,
                -8.915301e-12,
                 5.475522e-16,
                 2.117441e+05,
                 4.274808e+00,
            }
        )
    },
    elements         = {
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_F_minus = Substance {
    name             = "F-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -3.142415e+04,
                 3.264883e+00,
            }
        )
    },
    elements         = {
        F = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FCN = Substance {
    name             = "FCN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.251694e+00,
                 8.307314e-03,
                -8.366636e-06,
                 4.412564e-09,
                -9.088242e-13,
                 3.055120e+03,
                 6.442148e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.089856e+00,
                 2.417068e-03,
                -9.768277e-07,
                 1.781344e-10,
                -1.211857e-14,
                 2.578078e+03,
                -2.872781e+00,
            }
        )
    },
    elements         = {
        F = 1.0,
        C = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FO = Substance {
    name             = "FO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.968002e+00,
                 2.648339e-03,
                -3.736801e-07,
                -1.900622e-09,
                 1.061428e-12,
                 1.208784e+04,
                 8.393497e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.919277e+00,
                 7.044234e-04,
                -2.664820e-07,
                 4.961760e-11,
                -3.368857e-15,
                 1.179819e+04,
                 3.328758e+00,
            }
        )
    },
    elements         = {
        F = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FO2 = Substance {
    name             = "FO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.780507e+00,
                 6.817460e-03,
                -5.813361e-06,
                 1.756250e-09,
                 6.775743e-14,
                 1.276947e+02,
                 7.835683e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.704093e+00,
                 1.386289e-03,
                -5.835537e-07,
                 1.093721e-10,
                -7.586918e-15,
                -3.967868e+02,
                -2.067917e+00,
            }
        )
    },
    elements         = {
        F = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_F2 = Substance {
    name             = "F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.208324e+00,
                 1.259192e-03,
                 3.897480e-06,
                -7.221850e-09,
                 3.318379e-12,
                -1.034258e+03,
                 5.619036e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.861662e+00,
                 7.883677e-04,
                -1.819829e-07,
                -9.174366e-12,
                 2.651935e-15,
                -1.232387e+03,
                 2.041199e+00,
            }
        )
    },
    elements         = {
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_F2O = Substance {
    name             = "F2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.610922e+00,
                 1.223128e-02,
                -1.344142e-05,
                 5.890941e-09,
                -5.748717e-13,
                 1.734720e+03,
                 1.178788e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.005187e+00,
                 1.102840e-03,
                -4.754794e-07,
                 9.068315e-11,
                -6.375710e-15,
                 9.190607e+02,
                -5.222106e+00,
            }
        )
    },
    elements         = {
        F = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FS2F_fluorodisu = Substance {
    name             = "FS2F,fluorodisu",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.226647e+00,
                 3.281252e-02,
                -5.927970e-05,
                 5.023313e-08,
                -1.625990e-11,
                -4.215380e+04,
                 1.512394e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.114914e+00,
                 9.255498e-04,
                -3.669729e-07,
                 6.314899e-11,
                -3.948778e-15,
                -4.344486e+04,
                -1.736858e+01,
            }
        )
    },
    elements         = {
        F = 2.0,
        S = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Fe = Substance {
    name             = "Fe",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.707444e+00,
                 1.063392e-02,
                -2.761182e-05,
                 2.809179e-08,
                -1.012198e-11,
                 4.918437e+04,
                 9.808111e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.261980e+00,
                -1.055825e-03,
                 5.929070e-07,
                -1.071895e-10,
                 7.480644e-15,
                 4.909699e+04,
                 3.524439e+00,
            }
        )
    },
    elements         = {
        Fe = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Fe_plus = Substance {
    name             = "Fe+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.764181e+00,
                 2.869482e-03,
                -7.612357e-06,
                 8.181833e-09,
                -3.117922e-12,
                 1.411590e+05,
                 5.539980e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.336024e+00,
                -2.725493e-04,
                 8.054403e-09,
                 1.512291e-11,
                -1.433766e-15,
                 1.410365e+05,
                 2.864770e+00,
            }
        )
    },
    elements         = {
        Fe = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Fe_minus = Substance {
    name             = "Fe-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.521745e+00,
                 9.796732e-03,
                -2.110787e-05,
                 1.848209e-08,
                -5.895371e-12,
                 4.657102e+04,
                 1.086834e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.363106e+00,
                -8.293750e-04,
                 3.124262e-07,
                -5.200684e-11,
                 3.178752e-15,
                 4.635643e+04,
                 2.768024e+00,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FeC5O5 = Substance {
    name             = "FeC5O5",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.606546e+00,
                 7.504213e-02,
                -1.220127e-04,
                 1.005538e-07,
                -3.226097e-11,
                -9.195144e+04,
                -2.576006e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.116402e+01,
                 1.033310e-02,
                -4.331094e-06,
                 8.204750e-10,
                -5.777387e-14,
                -9.488893e+04,
                -7.207365e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        C  = 5.0,
        O  = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FeCL = Substance {
    name             = "FeCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.788583e+00,
                 4.367801e-03,
                -6.692233e-06,
                 4.170745e-09,
                -8.468677e-13,
                 2.892010e+04,
                 8.353368e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.694067e+00,
                 1.160408e-04,
                -2.084017e-08,
                -1.762656e-12,
                 5.231381e-16,
                 2.879034e+04,
                 4.193555e+00,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FeCL2 = Substance {
    name             = "FeCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.455750e+00,
                 7.963293e-03,
                -1.259396e-05,
                 8.997673e-09,
                -2.324236e-12,
                -1.884430e+04,
                 3.022842e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.949260e+00,
                 5.337164e-04,
                 7.022121e-08,
                -6.147549e-11,
                 6.793314e-15,
                -1.904583e+04,
                -3.759514e+00,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FeCL3 = Substance {
    name             = "FeCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.561487e+00,
                 9.733825e-03,
                -1.554331e-05,
                 1.118637e-08,
                -3.002300e-12,
                -3.301362e+04,
                -3.985832e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.777111e+00,
                 2.442136e-04,
                -1.031399e-07,
                 1.920743e-11,
                -1.317930e-15,
                -3.343957e+04,
                -1.454915e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_FeO = Substance {
    name             = "FeO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.824526e+00,
                 4.304921e-03,
                -4.108478e-06,
                 1.320119e-09,
                 7.131622e-14,
                 2.919403e+04,
                 1.189118e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.204982e+00,
                 2.683845e-04,
                -8.942674e-08,
                 3.185591e-11,
                -3.392254e-15,
                 2.882917e+04,
                 4.830432e+00,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Fe_OH_2 = Substance {
    name             = "Fe(OH)2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                -1.676677e+00,
                 6.169315e-02,
                -1.207390e-04,
                 1.098140e-07,
                -3.728568e-11,
                -4.112897e+04,
                 2.967717e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.962620e+00,
                 4.201373e-03,
                -1.610174e-06,
                 2.683471e-10,
                -1.634973e-14,
                -4.279944e+04,
                -1.869124e+01,
            }
        )
    },
    elements         = {
        Fe = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Fe2CL4 = Substance {
    name             = "Fe2CL4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.273824e+01,
                 1.323556e-02,
                -2.164187e-05,
                 1.599367e-08,
                -4.350710e-12,
                -5.610658e+04,
                -1.982475e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.535750e+01,
                 6.420786e-04,
                 2.081773e-08,
                -5.158056e-11,
                 6.067350e-15,
                -5.651004e+04,
                -3.189659e+01,
            }
        )
    },
    elements         = {
        Fe = 2.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Fe2CL6 = Substance {
    name             = "Fe2CL6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.422118e+01,
                 4.354860e-02,
                -9.603902e-05,
                 9.374631e-08,
                -3.360516e-11,
                -8.419963e+04,
                -2.592447e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.156450e+01,
                 4.623490e-04,
                -1.849521e-07,
                 3.201430e-11,
                -2.010027e-15,
                -8.524324e+04,
                -5.865382e+01,
            }
        )
    },
    elements         = {
        Fe = 2.0,
        Cl = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H = Substance {
    name             = "H",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 2.547366e+04,
                -4.466829e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.500003e+00,
                -5.653342e-09,
                 3.632517e-12,
                -9.199497e-16,
                 7.952607e-20,
                 2.547366e+04,
                -4.466985e-01,
            }
        )
    },
    elements         = {
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H_plus = Substance {
    name             = "H+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.840214e+05,
                -1.140645e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H_minus = Substance {
    name             = "H-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.597617e+04,
                -1.139016e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HALO = Substance {
    name             = "HALO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.292212e+00,
                -2.682004e-03,
                 2.868413e-05,
                -3.797089e-08,
                 1.540203e-11,
                 2.977711e+03,
                 6.961610e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.090753e+00,
                 2.425141e-03,
                -9.399329e-07,
                 1.593910e-10,
                -9.867473e-15,
                 2.050095e+03,
                -4.614508e+00,
            }
        )
    },
    elements         = {
        H  = 1.0,
        Al = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HBO = Substance {
    name             = "HBO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.214311e+00,
                 9.371851e-03,
                -1.071107e-05,
                 7.676977e-09,
                -2.358637e-12,
                -2.484925e+04,
                 9.372017e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.748518e+00,
                 3.661086e-03,
                -1.463541e-06,
                 2.651990e-10,
                -1.783427e-14,
                -2.522580e+04,
                 1.746478e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        B = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HBO_plus = Substance {
    name             = "HBO+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.254428e+00,
                 8.030187e-03,
                -5.974907e-06,
                 2.428195e-09,
                -4.305112e-13,
                 1.418507e+05,
                 1.081221e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.947508e+00,
                 3.431544e-03,
                -1.278708e-06,
                 2.218060e-10,
                -1.475719e-14,
                 1.413600e+05,
                 1.998896e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        B = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HBO_minus = Substance {
    name             = "HBO-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.970795e+00,
                -2.210011e-03,
                 1.453541e-05,
                -1.563893e-08,
                 5.397897e-12,
                -3.058950e+04,
                 4.824970e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.086926e+00,
                 2.978476e-03,
                -1.238711e-06,
                 2.469333e-10,
                -1.845505e-14,
                -3.093003e+04,
                 2.780142e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        B = 1.0,
        O = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HBO2 = Substance {
    name             = "HBO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.870787e+00,
                 7.886264e-03,
                -4.073684e-07,
                -4.705902e-09,
                 2.354889e-12,
                -6.862411e+04,
                 1.018052e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.738952e+00,
                 4.771877e-03,
                -1.806349e-06,
                 3.149289e-10,
                -2.073831e-14,
                -6.924884e+04,
                 9.863918e-03,
            }
        )
    },
    elements         = {
        H = 1.0,
        B = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HBS = Substance {
    name             = "HBS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.559590e+00,
                 1.396684e-02,
                -1.798859e-05,
                 1.231514e-08,
                -3.409096e-12,
                 5.089094e+03,
                 1.350190e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.441226e+00,
                 2.997982e-03,
                -1.193823e-06,
                 2.119583e-10,
                -1.346610e-14,
                 4.440297e+03,
                -6.467832e-01,
            }
        )
    },
    elements         = {
        H = 1.0,
        B = 1.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HBS_plus = Substance {
    name             = "HBS+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.251156e+00,
                 1.207717e-02,
                -1.532216e-05,
                 1.049409e-08,
                -2.932529e-12,
                 1.347548e+05,
                 1.127077e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.709754e+00,
                 2.818704e-03,
                -1.163309e-06,
                 2.176884e-10,
                -1.510869e-14,
                 1.341914e+05,
                -8.374721e-01,
            }
        )
    },
    elements         = {
        H = 1.0,
        B = 1.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HBr = Substance {
    name             = "HBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.605669e+00,
                -5.952943e-04,
                 6.502957e-07,
                 9.378122e-10,
                -7.114185e-13,
                -5.438945e+03,
                 3.496341e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.793580e+00,
                 1.565592e-03,
                -5.617106e-07,
                 9.578314e-11,
                -6.181399e-15,
                -5.233838e+03,
                 7.655534e+00,
            }
        )
    },
    elements         = {
        H  = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HCN = Substance {
    name             = "HCN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.259011e+00,
                 1.005106e-02,
                -1.335149e-05,
                 1.009209e-08,
                -3.008820e-12,
                 1.521585e+04,
                 8.916346e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.802317e+00,
                 3.146300e-03,
                -1.063157e-06,
                 1.661854e-10,
                -9.798918e-15,
                 1.491048e+04,
                 1.575036e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        C = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HCO = Substance {
    name             = "HCO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.221186e+00,
                -3.243925e-03,
                 1.377994e-05,
                -1.331441e-08,
                 4.337689e-12,
                 3.839565e+03,
                 3.394372e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.648962e+00,
                 3.080908e-03,
                -1.124299e-06,
                 1.863081e-10,
                -1.139518e-14,
                 3.712090e+03,
                 5.061474e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        C = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HCO_plus = Substance {
    name             = "HCO+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.473974e+00,
                 8.671559e-03,
                -1.003150e-05,
                 6.717053e-09,
                -1.787267e-12,
                 9.914661e+04,
                 8.175712e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.741188e+00,
                 3.344152e-03,
                -1.239712e-06,
                 2.118939e-10,
                -1.370415e-14,
                 9.888408e+04,
                 2.078614e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        C = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HCCN = Substance {
    name             = "HCCN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.871843e+00,
                 2.606113e-02,
                -4.627240e-05,
                 4.186097e-08,
                -1.453527e-11,
                 7.203404e+04,
                 1.221732e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.563142e+00,
                 3.480410e-03,
                -1.246031e-06,
                 2.007645e-10,
                -1.200445e-14,
                 7.113471e+04,
                -9.865561e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        C = 2.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HCL = Substance {
    name             = "HCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.524817e+00,
                 2.998486e-05,
                -8.622189e-07,
                 2.097972e-09,
                -9.865819e-13,
                -1.215051e+04,
                 2.408924e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.766588e+00,
                 1.438188e-03,
                -4.699300e-07,
                 7.349941e-11,
                -4.373111e-15,
                -1.191747e+04,
                 6.471506e+00,
            }
        )
    },
    elements         = {
        H  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HD = Substance {
    name             = "HD",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.432548e+00,
                 6.510703e-04,
                -1.933267e-06,
                 2.410174e-09,
                -8.673240e-13,
                -1.000927e+03,
                -2.389022e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.846454e+00,
                 1.063196e-03,
                -2.443380e-07,
                 2.905083e-11,
                -1.162153e-15,
                -7.618247e+02,
                 9.801440e-01,
            }
        )
    },
    elements         = {
        H = 1.0,
        D = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HD_plus = Substance {
    name             = "HD+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.882714e+00,
                -3.077938e-03,
                 8.191447e-06,
                -6.811950e-09,
                 1.985990e-12,
                 1.789456e+05,
                -2.803360e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.290976e+00,
                 1.155153e-03,
                -3.444946e-07,
                 7.672268e-11,
                -8.094813e-15,
                 1.789428e+05,
                -4.786072e-01,
            }
        )
    },
    elements         = {
        H = 1.0,
        D = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HD_minus = Substance {
    name             = "HD-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.642888e+00,
                -2.129129e-03,
                 8.928412e-06,
                -9.348120e-09,
                 3.256497e-12,
                 2.726927e+04,
                -2.255627e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.493995e+00,
                 1.244867e-03,
                -4.728871e-07,
                 9.105964e-11,
                -6.486293e-15,
                 2.715773e+04,
                -2.231105e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        D = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HDO = Substance {
    name             = "HDO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.075442e+00,
                -1.382028e-03,
                 5.702553e-06,
                -4.416365e-09,
                 1.226306e-12,
                -3.070761e+04,
                 9.710681e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.667269e+00,
                 3.557521e-03,
                -1.202600e-06,
                 1.960721e-10,
                -1.235262e-14,
                -3.037287e+04,
                 7.983599e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        D = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HF = Substance {
    name             = "HF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.437999e+00,
                 5.357160e-04,
                -1.522966e-06,
                 1.756449e-09,
                -5.786994e-13,
                -3.381897e+04,
                 1.206182e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.991911e+00,
                 7.148948e-04,
                -6.863097e-08,
                -1.161713e-11,
                 1.941238e-15,
                -3.362136e+04,
                 3.825495e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HI = Substance {
    name             = "HI",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.696372e+00,
                -1.422476e-03,
                 3.013119e-06,
                -1.266640e-09,
                -3.509876e-14,
                 2.107358e+03,
                 4.088121e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.910401e+00,
                 1.568819e-03,
                -5.922763e-07,
                 1.053709e-10,
                -7.037512e-15,
                 2.250866e+03,
                 7.864471e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        I = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HNC = Substance {
    name             = "HNC",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.301867e+00,
                 1.541575e-02,
                -3.132622e-05,
                 3.088166e-08,
                -1.119124e-11,
                 2.222772e+04,
                 8.147511e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.222481e+00,
                 2.594583e-03,
                -8.584810e-07,
                 1.307450e-10,
                -7.503398e-15,
                 2.201276e+04,
                -7.794474e-02,
            }
        )
    },
    elements         = {
        H = 1.0,
        N = 1.0,
        C = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HNCO = Substance {
    name             = "HNCO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.243225e+00,
                 1.449864e-02,
                -1.526091e-05,
                 8.363645e-09,
                -1.721920e-12,
                -1.342575e+04,
                 1.215655e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.294047e+00,
                 4.030397e-03,
                -1.412903e-06,
                 2.244282e-10,
                -1.328594e-14,
                -1.416538e+04,
                -3.087631e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        N = 1.0,
        C = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HNO = Substance {
    name             = "HNO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.535259e+00,
                -5.685469e-03,
                 1.852000e-05,
                -1.718837e-08,
                 5.558331e-12,
                 1.103988e+04,
                 1.743147e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.165548e+00,
                 3.000051e-03,
                -3.943503e-07,
                -3.857875e-11,
                 7.080919e-15,
                 1.119442e+04,
                 7.647647e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        N = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HNO2 = Substance {
    name             = "HNO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.214159e+00,
                 8.127779e-03,
                 1.659995e-06,
                -9.528156e-09,
                 4.871318e-12,
                -1.075324e+04,
                 9.822000e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.791827e+00,
                 3.651627e-03,
                -1.292935e-06,
                 2.068929e-10,
                -1.231549e-14,
                -1.156555e+04,
                -4.055385e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        N = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HNO3 = Substance {
    name             = "HNO3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.744929e+00,
                 1.880409e-02,
                -8.159636e-06,
                -5.785845e-09,
                 4.437681e-12,
                -1.738053e+04,
                 1.695455e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.003792e+00,
                 4.498375e-03,
                -1.736488e-06,
                 2.936856e-10,
                -1.814787e-14,
                -1.925630e+04,
                -1.609855e+01,
            }
        )
    },
    elements         = {
        H = 1.0,
        N = 1.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HOCL = Substance {
    name             = "HOCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.932054e+00,
                 6.937774e-03,
                -6.719185e-06,
                 3.156887e-09,
                -4.696588e-13,
                -1.008680e+04,
                 9.952566e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.225010e+00,
                 2.318267e-03,
                -8.384238e-07,
                 1.417640e-10,
                -8.746999e-15,
                -1.036866e+04,
                 3.590076e+00,
            }
        )
    },
    elements         = {
        H  = 1.0,
        O  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HOF = Substance {
    name             = "HOF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.231093e+00,
                 3.738986e-03,
                 6.300976e-07,
                -3.621500e-09,
                 1.786713e-12,
                -1.295478e+04,
                 7.750904e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.046434e+00,
                 2.448628e-03,
                -8.628355e-07,
                 1.420990e-10,
                -8.935692e-15,
                -1.320907e+04,
                 3.349933e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        O = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HO2 = Substance {
    name             = "HO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.301798e+00,
                -4.749121e-03,
                 2.115829e-05,
                -2.427639e-08,
                 9.292251e-12,
                 2.948080e+02,
                 3.716662e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.172287e+00,
                 1.881176e-03,
                -3.462774e-07,
                 1.946579e-11,
                 1.762543e-16,
                 6.181030e+01,
                 2.957677e+00,
            }
        )
    },
    elements         = {
        H = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HSO3F = Substance {
    name             = "HSO3F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.119245e+00,
                 3.154571e-02,
                -3.131789e-05,
                 1.246151e-08,
                -8.251463e-13,
                -9.236160e+04,
                 1.555970e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.036419e+01,
                 5.386116e-03,
                -2.123157e-06,
                 3.820834e-10,
                -2.580709e-14,
                -9.439833e+04,
                -2.600550e+01,
            }
        )
    },
    elements         = {
        H = 1.0,
        S = 1.0,
        O = 3.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2 = Substance {
    name             = "H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.344331e+00,
                 7.980521e-03,
                -1.947815e-05,
                 2.015721e-08,
                -7.376118e-12,
                -9.179352e+02,
                 6.830102e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.932866e+00,
                 8.266080e-04,
                -1.464023e-07,
                 1.541004e-11,
                -6.888044e-16,
                -8.130656e+02,
                -1.024329e+00,
            }
        )
    },
    elements         = {
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2_plus = Substance {
    name             = "H2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.772561e+00,
                -1.957466e-03,
                 4.548120e-06,
                -2.821521e-09,
                 5.339692e-13,
                 1.786941e+05,
                -3.966091e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.442048e+00,
                 5.990832e-04,
                 6.691337e-08,
                -3.435744e-11,
                 1.976266e-15,
                 1.786497e+05,
                -2.794989e+00,
            }
        )
    },
    elements         = {
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2_minus = Substance {
    name             = "H2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.838014e+00,
                -3.179477e-03,
                 1.004301e-05,
                -9.551812e-09,
                 3.128133e-12,
                 2.723486e+04,
                -3.998624e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.292108e+00,
                 1.435863e-03,
                -5.470559e-07,
                 1.043388e-10,
                -7.382800e-15,
                 2.721618e+04,
                -1.982778e+00,
            }
        )
    },
    elements         = {
        H = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HCHO_formaldehy = Substance {
    name             = "HCHO,formaldehy",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.793723e+00,
                -9.908334e-03,
                 3.732200e-05,
                -3.792853e-08,
                 1.317727e-11,
                -1.430896e+04,
                 6.028129e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.169527e+00,
                 6.193206e-03,
                -2.250564e-06,
                 3.659757e-10,
                -2.201495e-14,
                -1.447844e+04,
                 6.042094e+00,
            }
        )
    },
    elements         = {
        H = 2.0,
        C = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HCOOH = Substance {
    name             = "HCOOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.232625e+00,
                 2.811296e-03,
                 2.440350e-05,
                -3.175011e-08,
                 1.206317e-11,
                -4.677856e+04,
                 9.862056e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.695794e+00,
                 7.722374e-03,
                -3.180378e-06,
                 5.579495e-10,
                -3.526182e-14,
                -4.815997e+04,
                -6.016801e+00,
            }
        )
    },
    elements         = {
        H = 2.0,
        C = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2F2 = Substance {
    name             = "H2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.676331e+00,
                 1.229799e-02,
                -1.245596e-05,
                 6.360252e-09,
                -1.127082e-12,
                -7.012371e+04,
                 1.031093e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.916039e+00,
                 3.985765e-03,
                -1.355871e-06,
                 2.193092e-10,
                -1.371601e-14,
                -7.059478e+04,
                -6.296059e-01,
            }
        )
    },
    elements         = {
        H = 2.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2O = Substance {
    name             = "H2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
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
                -8.490322e-01,
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
                 6.882556e+00,
            }
        )
    },
    elements         = {
        H = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2O_plus = Substance {
    name             = "H2O+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.024659e+00,
                -1.088510e-03,
                 5.135754e-06,
                -4.400266e-09,
                 1.407263e-12,
                 1.168698e+05,
                 6.999714e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.315705e+00,
                 2.106487e-03,
                -3.763414e-07,
                 3.475259e-11,
                -1.703357e-15,
                 1.169916e+05,
                 4.032204e+00,
            }
        )
    },
    elements         = {
        H = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2O2 = Substance {
    name             = "H2O2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.276113e+00,
                -5.428224e-04,
                 1.673357e-05,
                -2.157708e-08,
                 8.624544e-12,
                -1.775430e+04,
                 3.435051e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.573335e+00,
                 4.049841e-03,
                -1.294795e-06,
                 1.972817e-10,
                -1.134028e-14,
                -1.805481e+04,
                 7.042785e-01,
            }
        )
    },
    elements         = {
        H = 2.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2S = Substance {
    name             = "H2S",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.932348e+00,
                -5.026091e-04,
                 4.592847e-06,
                -3.180721e-09,
                 6.649756e-13,
                -3.650536e+03,
                 2.315790e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.745220e+00,
                 4.043461e-03,
                -1.538451e-06,
                 2.752025e-10,
                -1.859210e-14,
                -3.419944e+03,
                 8.054675e+00,
            }
        )
    },
    elements         = {
        H = 2.0,
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H2SO4 = Substance {
    name             = "H2SO4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.072568e+00,
                 4.376923e-02,
                -5.533324e-05,
                 3.551825e-08,
                -9.067736e-12,
                -9.025976e+04,
                 1.893958e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.088953e+01,
                 7.500418e-03,
                -2.921048e-06,
                 5.259551e-10,
                -3.578942e-14,
                -9.247136e+04,
                -2.940478e+01,
            }
        )
    },
    elements         = {
        H = 2.0,
        S = 1.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H3B3O6 = Substance {
    name             = "H3B3O6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -2.270512e+00,
                 8.702489e-02,
                -9.158771e-05,
                 3.944539e-08,
                -3.666604e-12,
                -2.756952e+05,
                 3.252965e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.015358e+01,
                 1.301629e-02,
                -5.066962e-06,
                 9.030825e-10,
                -6.053241e-14,
                -2.810409e+05,
                -7.967633e+01,
            }
        )
    },
    elements         = {
        H = 3.0,
        B = 3.0,
        O = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H3F3 = Substance {
    name             = "H3F3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.071786e+00,
                 3.727938e-02,
                -5.815029e-05,
                 4.590620e-08,
                -1.398750e-11,
                -1.075786e+05,
                 1.398178e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.530737e+00,
                 6.716594e-03,
                -2.545670e-06,
                 4.478093e-10,
                -2.989427e-14,
                -1.087179e+05,
                -1.621120e+01,
            }
        )
    },
    elements         = {
        H = 3.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H3O_plus = Substance {
    name             = "H3O+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.792953e+00,
                -9.108540e-04,
                 1.163635e-05,
                -1.213649e-08,
                 4.261597e-12,
                 7.075124e+04,
                 1.471569e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.496477e+00,
                 5.728449e-03,
                -1.839533e-06,
                 2.735774e-10,
                -1.540940e-14,
                 7.097291e+04,
                 7.458508e+00,
            }
        )
    },
    elements         = {
        H = 3.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H4F4 = Substance {
    name             = "H4F4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.382175e+00,
                 4.991245e-02,
                -7.789997e-05,
                 6.150362e-08,
                -1.873981e-11,
                -1.450351e+05,
                 1.080547e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.203739e+01,
                 8.959586e-03,
                -3.396057e-06,
                 5.974365e-10,
                -3.988469e-14,
                -1.465619e+05,
                -2.965460e+01,
            }
        )
    },
    elements         = {
        H = 4.0,
        F = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H5F5 = Substance {
    name             = "H5F5",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.684175e+00,
                 6.260531e-02,
                -9.779899e-05,
                 7.725732e-08,
                -2.355046e-11,
                -1.826316e+05,
                 7.481675e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.554414e+01,
                 1.120238e-02,
                -4.246316e-06,
                 7.470318e-10,
                -4.987236e-14,
                -1.845469e+05,
                -4.328139e+01,
            }
        )
    },
    elements         = {
        H = 5.0,
        F = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H6F6 = Substance {
    name             = "H6F6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.996332e+00,
                 7.522577e-02,
                -1.175172e-04,
                 9.282176e-08,
                -2.829046e-11,
                -2.216785e+05,
                 3.964353e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.905092e+01,
                 1.344509e-02,
                -5.096529e-06,
                 8.966158e-10,
                -5.985907e-14,
                -2.239811e+05,
                -5.705915e+01,
            }
        )
    },
    elements         = {
        H = 6.0,
        F = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_H7F7 = Substance {
    name             = "H7F7",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.300979e+00,
                 8.789977e-02,
                -1.373691e-04,
                 1.085262e-07,
                -3.308272e-11,
                -2.579518e+05,
                 3.624761e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.255754e+01,
                 1.568815e-02,
                -5.946958e-06,
                 1.046253e-09,
                -6.985035e-14,
                -2.606425e+05,
                -7.095211e+01,
            }
        )
    },
    elements         = {
        H = 7.0,
        F = 7.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_He = Substance {
    name             = "He",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.453750e+02,
                 9.287247e-01,
            }
        )
    },
    elements         = {
        He = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_He_plus = Substance {
    name             = "He+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 2.853151e+05,
                 1.621667e+00,
            }
        )
    },
    elements         = {
        He = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Hg = Substance {
    name             = "Hg",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 6.636900e+03,
                 6.800202e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.509536e+00,
                -1.988273e-05,
                 1.389108e-08,
                -3.935429e-12,
                 3.909592e-16,
                 6.633581e+03,
                 6.748480e+00,
            }
        )
    },
    elements         = {
        Hg = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_HgBr2 = Substance {
    name             = "HgBr2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.718892e+00,
                 2.578274e-03,
                -2.918024e-06,
                 9.581844e-10,
                 1.387231e-13,
                -1.237143e+04,
                -4.136708e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.422699e+00,
                 7.868766e-05,
                -2.991031e-08,
                 4.849823e-12,
                -2.793093e-16,
                -1.252202e+04,
                -3.867340e+00,
            }
        )
    },
    elements         = {
        Hg = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_I = Substance {
    name             = "I",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500417e+00,
                -4.480468e-06,
                 1.699625e-08,
                -2.677080e-11,
                 1.489275e-14,
                 1.209480e+04,
                 7.498166e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.616677e+00,
                -2.660103e-04,
                 1.860602e-07,
                -3.819275e-11,
                 2.520361e-15,
                 1.205828e+04,
                 6.878967e+00,
            }
        )
    },
    elements         = {
        I = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_I2 = Substance {
    name             = "I2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.872346e+00,
                 3.642654e-03,
                -7.953492e-06,
                 7.821498e-09,
                -2.806081e-12,
                 6.247064e+03,
                 8.494103e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.565881e+00,
                -3.422294e-04,
                 4.844110e-07,
                -1.426322e-10,
                 1.149511e-14,
                 6.160854e+03,
                 5.419583e+00,
            }
        )
    },
    elements         = {
        I = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_K = Substance {
    name             = "K",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500007e+00,
                -7.251132e-08,
                 2.590685e-10,
                -3.794609e-13,
                 1.932106e-16,
                 9.958803e+03,
                 5.040545e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.260267e+00,
                 5.623412e-04,
                -4.485518e-07,
                 1.362435e-10,
                -1.029263e-14,
                 1.003488e+04,
                 6.315682e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_K_plus = Substance {
    name             = "K+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 6.107511e+04,
                 4.347404e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KBO2 = Substance {
    name             = "KBO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.396780e+00,
                 1.216920e-02,
                -1.180422e-05,
                 5.131655e-09,
                -6.593272e-13,
                -8.282701e+04,
                 7.573243e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.550251e+00,
                 2.566182e-03,
                -1.067157e-06,
                 1.985188e-10,
                -1.370417e-14,
                -8.365383e+04,
                -8.492700e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
        B = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KCN = Substance {
    name             = "KCN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.081071e+00,
                 5.526596e-03,
                -9.115712e-06,
                 8.448882e-09,
                -3.005155e-12,
                 7.866216e+03,
                 1.863469e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.800712e+00,
                 1.720079e-03,
                -7.079107e-07,
                 1.319925e-10,
                -9.190832e-15,
                 7.727263e+03,
                -3.158834e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
        C = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KCL = Substance {
    name             = "KCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.990857e+00,
                 2.108917e-03,
                -3.183653e-06,
                 2.252531e-09,
                -5.909418e-13,
                -2.708018e+04,
                 5.512004e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.463673e+00,
                 1.222921e-04,
                -9.171921e-09,
                 9.264824e-13,
                -1.040792e-17,
                -2.717313e+04,
                 3.248090e+00,
            }
        )
    },
    elements         = {
        K  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KF = Substance {
    name             = "KF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.515607e+00,
                 3.786842e-03,
                -5.586500e-06,
                 3.775144e-09,
                -9.392422e-13,
                -4.047608e+04,
                 6.313385e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.404070e+00,
                 1.783372e-04,
                -3.609380e-08,
                 5.883959e-12,
                -3.469405e-16,
                -4.065589e+04,
                 2.031096e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KF2_minus = Substance {
    name             = "KF2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.250757e+00,
                 8.638372e-03,
                -1.340367e-05,
                 9.414083e-09,
                -2.468260e-12,
                -8.538397e+04,
                -4.772247e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.258164e+00,
                 2.670356e-04,
                -1.138463e-07,
                 2.140769e-11,
                -1.482707e-15,
                -8.578084e+04,
                -1.010328e+01,
            }
        )
    },
    elements         = {
        K = 1.0,
        F = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KH = Substance {
    name             = "KH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.815776e+00,
                 3.987106e-03,
                -3.341055e-06,
                 8.860294e-10,
                 1.140285e-13,
                 1.380584e+04,
                 6.725179e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.960339e+00,
                 7.219032e-04,
                -2.691871e-07,
                 5.261730e-11,
                -3.787268e-15,
                 1.350184e+04,
                 8.553451e-01,
            }
        )
    },
    elements         = {
        K = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KO = Substance {
    name             = "KO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.741078e+00,
                 3.124202e-03,
                -4.802004e-06,
                 3.466061e-09,
                -9.359979e-13,
                 7.336871e+03,
                 6.566924e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.424478e+00,
                 1.993616e-04,
                -3.712884e-08,
                 7.130830e-12,
                -5.036969e-16,
                 7.205233e+03,
                 3.307668e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KO_minus = Substance {
    name             = "KO-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.708366e+00,
                 3.237648e-03,
                -4.969050e-06,
                 3.572885e-09,
                -9.608027e-13,
                -1.781861e+04,
                 5.316626e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.420108e+00,
                 2.012427e-04,
                -3.933100e-08,
                 7.559851e-12,
                -5.344228e-16,
                -1.795611e+04,
                 1.920004e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
        O = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KOH = Substance {
    name             = "KOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.073344e+00,
                 9.721795e-03,
                -1.598880e-05,
                 1.214835e-08,
                -3.370934e-12,
                -2.950656e+04,
                 2.935401e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.640095e+00,
                 1.251023e-03,
                -3.498455e-07,
                 4.456699e-11,
                -2.087028e-15,
                -2.969873e+04,
                -4.043655e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
        O = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_KOH_plus = Substance {
    name             = "KOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.432517e+00,
                 8.463162e-03,
                -1.424785e-05,
                 1.110662e-08,
                -3.156361e-12,
                 5.829263e+04,
                 2.873346e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.680614e+00,
                 1.212095e-03,
                -3.344712e-07,
                 4.172793e-11,
                -1.879391e-15,
                 5.816760e+04,
                -2.554151e+00,
            }
        )
    },
    elements         = {
        K = 1.0,
        O = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_K2 = Substance {
    name             = "K2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.506651e+00,
                -4.356762e-04,
                 3.266187e-06,
                -4.178351e-09,
                 1.196184e-12,
                 1.352880e+04,
                 4.373189e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.948664e+00,
                -3.604683e-03,
                 1.175532e-06,
                -1.742204e-10,
                 9.703029e-15,
                 1.260443e+04,
                -9.319391e+00,
            }
        )
    },
    elements         = {
        K = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_K2C2N2 = Substance {
    name             = "K2C2N2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.113306e+01,
                 1.151636e-02,
                -1.947653e-05,
                 1.816986e-08,
                -6.464725e-12,
                -4.698069e+03,
                -2.126796e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.262575e+01,
                 3.412400e-03,
                -1.403489e-06,
                 2.615640e-10,
                -1.820686e-14,
                -4.975361e+03,
                -2.815389e+01,
            }
        )
    },
    elements         = {
        K = 2.0,
        C = 2.0,
        N = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_K2CL2 = Substance {
    name             = "K2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 8.706797e+00,
                 6.015405e-03,
                -1.130394e-05,
                 9.662081e-09,
                -3.105566e-12,
                -7.706770e+04,
                -8.537547e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.904107e+00,
                 1.117971e-04,
                -5.039120e-08,
                 9.993461e-12,
                -7.270301e-16,
                -7.727233e+04,
                -1.409028e+01,
            }
        )
    },
    elements         = {
        K  = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_K2F2 = Substance {
    name             = "K2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.832950e+00,
                 8.924083e-03,
                -1.471985e-05,
                 1.098247e-08,
                -3.072172e-12,
                -1.063875e+05,
                -8.242383e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.814810e+00,
                 2.045308e-04,
                -8.707167e-08,
                 1.633723e-11,
                -1.128726e-15,
                -1.067599e+05,
                -1.764180e+01,
            }
        )
    },
    elements         = {
        K = 2.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_K2O2H2 = Substance {
    name             = "K2O2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.919060e+00,
                 1.030070e-02,
                -2.517330e-07,
                -7.745001e-09,
                 4.079604e-12,
                -8.126055e+04,
                -2.972856e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.509772e+00,
                 5.416707e-03,
                -1.922353e-06,
                 3.186607e-10,
                -2.015251e-14,
                -8.204835e+04,
                -1.681251e+01,
            }
        )
    },
    elements         = {
        K = 2.0,
        O = 2.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_K2SO4 = Substance {
    name             = "K2SO4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.475852e+00,
                 4.877324e-02,
                -6.842008e-05,
                 4.688632e-08,
                -1.272108e-11,
                -1.342809e+05,
                 1.234483e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.537411e+01,
                 4.105614e-03,
                -1.814893e-06,
                 3.549724e-10,
                -2.555875e-14,
                -1.369533e+05,
                -4.614382e+01,
            }
        )
    },
    elements         = {
        K = 2.0,
        S = 1.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Kr = Substance {
    name             = "Kr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.453750e+02,
                 5.490957e+00,
            }
        )
    },
    elements         = {
        Kr = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Kr_plus = Substance {
    name             = "Kr+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.481535e+00,
                 1.498647e-04,
                -4.155766e-07,
                 4.402375e-10,
                -1.193747e-13,
                 1.624606e+05,
                 6.952580e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.189687e+00,
                 4.637757e-04,
                -1.295075e-07,
                 1.311587e-11,
                -3.849780e-16,
                 1.625831e+05,
                 8.624277e+00,
            }
        )
    },
    elements         = {
        Kr = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li = Substance {
    name             = "Li",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.841390e+04,
                 2.447623e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.504131e+00,
                 3.456047e-05,
                -6.447900e-08,
                 2.757530e-11,
                -1.787839e-15,
                 1.840745e+04,
                 2.408021e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li_plus = Substance {
    name             = "Li+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 8.172719e+04,
                 1.754358e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiALF4 = Substance {
    name             = "LiALF4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.540342e+00,
                 5.198588e-02,
                -8.618803e-05,
                 6.749682e-08,
                -2.036751e-11,
                -2.253577e+05,
                 1.257193e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.403774e+01,
                 2.248264e-03,
                -1.001000e-06,
                 1.967025e-10,
                -1.420889e-14,
                -2.276276e+05,
                -4.236015e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        Al = 1.0,
        F  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiBO2 = Substance {
    name             = "LiBO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.743547e+00,
                 1.447526e-02,
                -1.520969e-05,
                 7.413654e-09,
                -1.224219e-12,
                -7.943776e+04,
                 8.012026e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.426610e+00,
                 2.704376e-03,
                -1.128474e-06,
                 2.106240e-10,
                -1.458491e-14,
                -8.037029e+04,
                -1.060079e+01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        B  = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiCL = Substance {
    name             = "LiCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.990691e+00,
                 5.033864e-03,
                -6.567198e-06,
                 3.805016e-09,
                -7.611745e-13,
                -2.460318e+04,
                 7.328184e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.271214e+00,
                 3.140029e-04,
                -1.012313e-07,
                 1.845185e-11,
                -1.239873e-15,
                -2.488444e+04,
                 1.041722e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiF = Substance {
    name             = "LiF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.852887e+00,
                 3.953278e-03,
                -3.172499e-06,
                 4.324440e-10,
                 3.705567e-13,
                -4.198726e+04,
                 6.791029e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.043025e+00,
                 5.704105e-04,
                -2.145414e-07,
                 4.060901e-11,
                -2.835792e-15,
                -4.229932e+04,
                 6.976955e-01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiFO = Substance {
    name             = "LiFO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.500179e+00,
                 1.266172e-02,
                -1.415759e-05,
                 6.450637e-09,
                -7.426143e-13,
                -1.226553e+04,
                 1.214402e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.992611e+00,
                 1.113920e-03,
                -4.788849e-07,
                 9.106833e-11,
                -6.384912e-15,
                -1.310099e+04,
                -5.336603e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        F  = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiF2_minus = Substance {
    name             = "LiF2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.471814e+00,
                 1.063671e-02,
                -1.177765e-05,
                 5.676549e-09,
                -8.465984e-13,
                -8.696311e+04,
                 5.140928e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.344859e+00,
                 1.257127e-03,
                -5.352283e-07,
                 1.011303e-10,
                -7.058174e-15,
                -8.766789e+04,
                -9.298403e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        F  = 2.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiH = Substance {
    name             = "LiH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.420949e+00,
                -6.806737e-04,
                 5.652738e-06,
                -6.218035e-09,
                 2.153176e-12,
                 1.588494e+04,
                 1.065742e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.588430e+00,
                 1.072769e-03,
                -4.019459e-07,
                 7.382856e-11,
                -4.926964e-15,
                 1.571762e+04,
                -3.750390e-01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiN = Substance {
    name             = "LiN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.889430e+00,
                 5.221253e-03,
                -6.596902e-06,
                 3.728900e-09,
                -7.235514e-13,
                 3.921632e+04,
                 7.288871e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.225808e+00,
                 3.966719e-04,
                -1.249399e-07,
                 2.317476e-11,
                -1.585192e-15,
                 3.891695e+04,
                 7.008515e-01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiO = Substance {
    name             = "LiO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.838901e+00,
                 5.153863e-03,
                -6.308238e-06,
                 3.411438e-09,
                -6.163134e-13,
                 9.088431e+03,
                 7.913118e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.187621e+00,
                 4.118657e-04,
                -1.452030e-07,
                 2.725307e-11,
                -1.886477e-15,
                 8.779526e+03,
                 1.231426e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiO_minus = Substance {
    name             = "LiO-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.851587e+00,
                 5.016988e-03,
                -5.954747e-06,
                 3.039945e-09,
                -4.787297e-13,
                -9.077808e+03,
                 6.459471e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.181022e+00,
                 4.178500e-04,
                -1.502485e-07,
                 2.839773e-11,
                -1.978918e-15,
                -9.384970e+03,
                -1.423923e-01,
            }
        )
    },
    elements         = {
        Li = 1.0,
        O  = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiOH = Substance {
    name             = "LiOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.346230e+00,
                 1.178725e-02,
                -1.825266e-05,
                 1.308561e-08,
                -3.432874e-12,
                -2.956464e+04,
                 3.461233e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.509696e+00,
                 1.368546e-03,
                -3.944147e-07,
                 5.233220e-11,
                -2.595868e-15,
                -2.989923e+04,
                -6.507016e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiOH_plus = Substance {
    name             = "LiOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.637974e+00,
                 1.089715e-02,
                -1.722967e-05,
                 1.266793e-08,
                -3.416526e-12,
                 9.216119e+04,
                 3.637761e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.532927e+00,
                 1.377793e-03,
                -4.065931e-07,
                 5.559091e-11,
                -2.860462e-15,
                 9.188858e+04,
                -4.993593e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_LiON = Substance {
    name             = "LiON",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.670116e+00,
                 7.256818e-03,
                -5.868115e-06,
                 1.162831e-09,
                 4.270412e-13,
                 2.027170e+04,
                 6.682495e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.812350e+00,
                 1.287063e-03,
                -5.466771e-07,
                 1.031499e-10,
                -7.193045e-15,
                 1.969230e+04,
                -4.344706e+00,
            }
        )
    },
    elements         = {
        Li = 1.0,
        O  = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li2 = Substance {
    name             = "Li2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.215905e+00,
                 7.093897e-03,
                -1.507234e-05,
                 1.486849e-08,
                -5.437403e-12,
                 2.479888e+04,
                 3.804890e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.583939e+00,
                -7.876994e-04,
                -3.848781e-07,
                 2.911330e-10,
                -3.394385e-14,
                 2.403947e+04,
                -8.506791e+00,
            }
        )
    },
    elements         = {
        Li = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li2CL2 = Substance {
    name             = "Li2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.280135e+00,
                 1.838410e-02,
                -2.876945e-05,
                 2.031336e-08,
                -5.343325e-12,
                -7.416000e+04,
                 2.792794e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.524561e+00,
                 5.245883e-04,
                -2.233795e-07,
                 4.195111e-11,
                -2.902131e-15,
                -7.499026e+04,
                -2.003167e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li2F2 = Substance {
    name             = "Li2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.400751e+00,
                 2.706624e-02,
                -3.925618e-05,
                 2.572260e-08,
                -6.223722e-12,
                -1.150109e+05,
                 1.089178e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.956664e+00,
                 1.171927e-03,
                -5.099050e-07,
                 9.791753e-11,
                -6.921560e-15,
                -1.163723e+05,
                -2.088633e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li2O = Substance {
    name             = "Li2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.972171e+00,
                 9.246092e-03,
                -9.359615e-06,
                 3.463916e-09,
                -7.565888e-14,
                -2.159699e+04,
                 2.552304e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.619875e+00,
                 9.687945e-04,
                -4.149051e-07,
                 7.863734e-11,
                -5.496929e-15,
                -2.225533e+04,
                -1.082156e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li2O2 = Substance {
    name             = "Li2O2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.537523e+00,
                 1.734422e-02,
                -2.719797e-05,
                 1.930563e-08,
                -5.120796e-12,
                -3.140204e+04,
                -2.768313e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.527526e+00,
                 5.302101e-04,
                -2.300586e-07,
                 4.403083e-11,
                -3.101870e-15,
                -3.218248e+04,
                -2.185911e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li2O2H2 = Substance {
    name             = "Li2O2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.864664e+00,
                 2.523731e-02,
                -2.263279e-05,
                 7.463271e-09,
                 2.292550e-13,
                -8.733881e+04,
                 9.543130e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.993613e+00,
                 6.003963e-03,
                -2.181018e-06,
                 3.688873e-10,
                -2.373801e-14,
                -8.884415e+04,
                -2.135865e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li2SO4 = Substance {
    name             = "Li2SO4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.114573e-01,
                 5.945118e-02,
                -8.636349e-05,
                 6.117109e-08,
                -1.709892e-11,
                -1.275084e+05,
                 2.038033e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.492960e+01,
                 4.609747e-03,
                -2.037956e-06,
                 3.986258e-10,
                -2.870303e-14,
                -1.306353e+05,
                -4.916649e+01,
            }
        )
    },
    elements         = {
        Li = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li3CL3 = Substance {
    name             = "Li3CL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.574596e+00,
                 3.974924e-02,
                -5.650821e-05,
                 3.629414e-08,
                -8.578470e-12,
                -1.235335e+05,
                 4.680597e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.431944e+01,
                 1.885401e-03,
                -8.197833e-07,
                 1.573549e-10,
                -1.111947e-14,
                -1.255885e+05,
                -4.271102e+01,
            }
        )
    },
    elements         = {
        Li = 3.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Li3F3 = Substance {
    name             = "Li3F3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.641398e+00,
                 3.987870e-02,
                -5.724899e-05,
                 3.719354e-08,
                -8.923013e-12,
                -1.851985e+05,
                 2.162360e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.436442e+01,
                 1.828550e-03,
                -7.922116e-07,
                 1.515453e-10,
                -1.067567e-14,
                -1.872374e+05,
                -4.506091e+01,
            }
        )
    },
    elements         = {
        Li = 3.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Mg = Substance {
    name             = "Mg",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.694659e+04,
                 3.634330e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.316645e+00,
                 3.658663e-04,
                -2.332278e-07,
                 5.371176e-11,
                -2.995131e-15,
                 1.701192e+04,
                 4.634495e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Mg_plus = Substance {
    name             = "Mg+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.064223e+05,
                 4.327444e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.504166e+00,
                -9.193410e-06,
                 6.961715e-09,
                -2.174949e-12,
                 2.409033e-16,
                 1.064209e+05,
                 4.305045e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgBr = Substance {
    name             = "MgBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.510728e+00,
                 4.452851e-03,
                -8.012408e-06,
                 6.706690e-09,
                -2.123272e-12,
                -5.436826e+03,
                 8.431490e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.409985e+00,
                 1.602174e-04,
                -4.150122e-08,
                 5.937034e-12,
                -4.823157e-17,
                -5.596191e+03,
                 4.229603e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgBr2 = Substance {
    name             = "MgBr2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.713910e+00,
                 7.732162e-03,
                -1.386579e-05,
                 1.147790e-08,
                -3.605788e-12,
                -3.837948e+04,
                 1.868602e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.321510e+00,
                 2.064372e-04,
                -9.248921e-08,
                 1.825584e-11,
                -1.323117e-15,
                -3.867130e+04,
                -5.678466e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgCL = Substance {
    name             = "MgCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.380053e+00,
                 4.281339e-03,
                -6.445733e-06,
                 4.447229e-09,
                -1.142173e-12,
                -6.382656e+03,
                 7.788988e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.377583e+00,
                 1.883418e-04,
                -5.448859e-08,
                 9.948103e-12,
                -6.694961e-16,
                -6.583083e+03,
                 2.989389e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgCL_plus = Substance {
    name             = "MgCL+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.601223e+00,
                 3.479186e-03,
                -5.135314e-06,
                 3.444634e-09,
                -8.384821e-13,
                 7.731469e+04,
                 6.133859e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.351234e+00,
                -3.796719e-03,
                 2.471294e-06,
                -5.082365e-10,
                 3.367262e-14,
                 7.648088e+04,
                -8.290362e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgCLF = Substance {
    name             = "MgCLF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.157043e+00,
                 1.645348e-02,
                -3.011269e-05,
                 2.579746e-08,
                -8.424875e-12,
                -6.989100e+04,
                 1.022554e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.570823e+00,
                 4.488762e-04,
                -1.779948e-07,
                 3.063182e-11,
                -1.915545e-15,
                -7.052360e+04,
                -5.835554e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgCL2 = Substance {
    name             = "MgCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.409553e+00,
                 7.720628e-03,
                -1.162009e-05,
                 7.941789e-09,
                -2.025250e-12,
                -4.907054e+04,
                 6.471581e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.240191e+00,
                 2.885624e-04,
                -1.240119e-07,
                 2.352710e-11,
                -1.644320e-15,
                -4.944233e+04,
                -8.180901e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgF = Substance {
    name             = "MgF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.657075e+00,
                 6.682614e-03,
                -1.033116e-05,
                 7.687177e-09,
                -2.224506e-12,
                -2.949489e+04,
                 9.855080e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.192212e+00,
                 4.036264e-04,
                -1.509763e-07,
                 2.816922e-11,
                -1.827589e-15,
                -2.981371e+04,
                 2.436962e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgF_plus = Substance {
    name             = "MgF+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.438765e+00,
                 2.225265e-03,
                -5.462120e-06,
                 1.408428e-08,
                -8.072691e-12,
                 6.051567e+04,
                 5.778355e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.368106e+00,
                 4.117597e-03,
                -2.939480e-06,
                 7.271184e-10,
                -5.984480e-14,
                 5.953600e+04,
                -1.345778e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgF2 = Substance {
    name             = "MgF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.347906e+00,
                 1.311530e-02,
                -2.054161e-05,
                 1.539578e-08,
                -4.490904e-12,
                -8.883887e+04,
                 8.651902e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.364207e+00,
                 7.262783e-04,
                -3.228005e-07,
                 6.336367e-11,
                -4.573844e-15,
                -8.946443e+04,
                -5.915131e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgF2_plus = Substance {
    name             = "MgF2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.521288e+00,
                 1.526956e-02,
                -2.518009e-05,
                 1.963550e-08,
                -5.905492e-12,
                 6.965839e+04,
                 7.390209e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.891067e+00,
                 7.178128e-04,
                -3.294117e-07,
                 6.588113e-11,
                -4.587323e-15,
                 6.899315e+04,
                -8.713014e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgH = Substance {
    name             = "MgH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.510240e+00,
                -1.236835e-03,
                 6.424700e-06,
                -6.605485e-09,
                 2.200362e-12,
                 1.929389e+04,
                 3.373654e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.463859e+00,
                 1.240405e-03,
                -5.027821e-07,
                 9.811883e-11,
                -6.618307e-15,
                 1.917631e+04,
                 2.997752e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgI = Substance {
    name             = "MgI",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.395966e+00,
                 6.114949e-03,
                -1.315441e-05,
                 1.272593e-08,
                -4.534143e-12,
                 1.769336e+03,
                 9.695865e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.412456e+00,
                 1.789109e-04,
                -5.229867e-08,
                 9.687135e-12,
                -4.671138e-16,
                 1.625819e+03,
                 5.164510e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgI2 = Substance {
    name             = "MgI2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.108143e+00,
                 6.146212e-03,
                -1.116653e-05,
                 9.326652e-09,
                -2.948717e-12,
                -2.128632e+04,
                 1.971267e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.371116e+00,
                 1.494195e-04,
                -6.706774e-08,
                 1.325756e-11,
                -9.620050e-16,
                -2.151192e+04,
                -3.938457e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgN = Substance {
    name             = "MgN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.889455e+00,
                 5.175718e-03,
                -6.584902e-06,
                 3.721893e-09,
                -7.230596e-13,
                 3.368106e+04,
                 9.297589e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.221442e+00,
                 3.648924e-04,
                -1.299573e-07,
                 2.441894e-11,
                -1.691776e-15,
                 3.338293e+04,
                 2.732052e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgO = Substance {
    name             = "MgO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.335350e+00,
                -1.333913e-02,
                 3.566753e-05,
                -2.605747e-08,
                 4.984120e-12,
                 5.731557e+03,
                -2.132777e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.949443e+00,
                -1.264076e-03,
                -2.400973e-07,
                 1.627328e-10,
                -1.761191e-14,
                 3.494438e+03,
                -2.180117e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgOH = Substance {
    name             = "MgOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.762436e+00,
                 1.916701e-02,
                -3.321932e-05,
                 2.715898e-08,
                -8.388927e-12,
                -2.094918e+04,
                 1.273445e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.267142e+00,
                 1.678272e-03,
                -5.430917e-07,
                 8.256335e-11,
                -4.713351e-15,
                -2.150934e+04,
                -3.395166e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgOH_plus = Substance {
    name             = "MgOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.783142e+00,
                 1.922853e-02,
                -3.350314e-05,
                 2.749136e-08,
                -8.515101e-12,
                 6.915058e+04,
                 1.193052e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.282448e+00,
                 1.664044e-03,
                -5.401665e-07,
                 8.346782e-11,
                -5.003617e-15,
                 6.859582e+04,
                -4.150389e+00,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgO2H2 = Substance {
    name             = "MgO2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.549475e+00,
                 3.827048e-02,
                -6.650933e-05,
                 5.453629e-08,
                -1.689134e-11,
                -7.051675e+04,
                 1.441704e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.517838e+00,
                 3.379138e-03,
                -1.102203e-06,
                 1.711118e-10,
                -1.030229e-14,
                -7.162673e+04,
                -1.762946e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MgS = Substance {
    name             = "MgS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.808922e+00,
                -3.249360e-02,
                 9.251726e-05,
                -9.096520e-08,
                 2.972563e-11,
                 1.593229e+04,
                -1.104791e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.035857e+01,
                -5.530709e-03,
                 2.095120e-06,
                -3.522484e-10,
                 2.228274e-14,
                 1.332935e+04,
                -3.319052e+01,
            }
        )
    },
    elements         = {
        Mg = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Mg2 = Substance {
    name             = "Mg2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.665489e+00,
                -1.812080e-02,
                 4.057062e-05,
                -4.007201e-08,
                 1.450405e-11,
                 3.342808e+04,
                 5.330957e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.554993e+00,
                 3.137719e-03,
                -3.154974e-06,
                 1.118152e-09,
                -1.085390e-13,
                 3.410949e+04,
                 1.945477e+01,
            }
        )
    },
    elements         = {
        Mg = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Mg2F4 = Substance {
    name             = "Mg2F4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.229905e+00,
                 4.929085e-02,
                -8.644967e-05,
                 7.045937e-08,
                -2.188711e-11,
                -2.094930e+05,
                 5.003236e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.467202e+01,
                 1.529932e-03,
                -6.834712e-07,
                 1.346047e-10,
                -9.738340e-15,
                -2.114377e+05,
                -4.427824e+01,
            }
        )
    },
    elements         = {
        Mg = 2.0,
        F  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_MoO3 = Substance {
    name             = "MoO3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.654312e+00,
                 1.449099e-02,
                -7.668139e-06,
                -6.098464e-09,
                 5.182581e-12,
                -4.548309e+04,
                 8.505219e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.559908e+00,
                 1.513691e-03,
                -6.137326e-07,
                 1.075889e-10,
                -6.227756e-15,
                -4.676527e+04,
                -1.670283e+01,
            }
        )
    },
    elements         = {
        Mo = 1.0,
        O  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Mo2O6 = Substance {
    name             = "Mo2O6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 7.754672e+00,
                 3.262506e-02,
                -1.665991e-05,
                -1.503960e-08,
                 1.236036e-11,
                -1.418334e+05,
                -6.450927e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.392333e+01,
                 1.290875e-02,
                -7.392939e-06,
                 1.745411e-09,
                -1.441067e-13,
                -1.429283e+05,
                -3.644861e+01,
            }
        )
    },
    elements         = {
        Mo = 2.0,
        O  = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Mo3O9 = Substance {
    name             = "Mo3O9",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.357742e+01,
                 4.538931e-02,
                -2.130595e-05,
                -2.286777e-08,
                 1.775233e-11,
                -2.345969e+05,
                -2.857714e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.226230e+01,
                 1.858497e-02,
                -1.058936e-05,
                 2.492675e-09,
                -2.054254e-13,
                -2.362004e+05,
                -7.108819e+01,
            }
        )
    },
    elements         = {
        Mo = 3.0,
        O  = 9.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Mo4O12 = Substance {
    name             = "Mo4O12",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.872748e+01,
                 6.115950e-02,
                -2.914191e-05,
                -3.065805e-08,
                 2.401182e-11,
                -3.237659e+05,
                -5.008838e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.043175e+01,
                 2.473265e-02,
                -1.411855e-05,
                 3.327129e-09,
                -2.743902e-13,
                -3.259036e+05,
                -1.072803e+02,
            }
        )
    },
    elements         = {
        Mo = 4.0,
        O  = 12.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Mo5O15 = Substance {
    name             = "Mo5O15",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.388705e+01,
                 7.614100e-02,
                -3.517473e-05,
                -3.986486e-08,
                 3.063112e-11,
                -4.105211e+05,
                -7.160418e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.862254e+01,
                 3.074274e-02,
                -1.753605e-05,
                 4.130623e-09,
                -3.405577e-13,
                -4.132416e+05,
                -1.437368e+02,
            }
        )
    },
    elements         = {
        Mo = 5.0,
        O  = 15.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N = Substance {
    name             = "N",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 5.610464e+04,
                 4.193909e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.415943e+00,
                 1.748906e-04,
                -1.190237e-07,
                 3.022624e-11,
                -2.036098e-15,
                 5.613377e+04,
                 4.649610e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N_plus = Substance {
    name             = "N+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.802694e+00,
                -1.447589e-03,
                 2.771184e-06,
                -2.401874e-09,
                 7.808399e-13,
                 2.255752e+05,
                 3.578778e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.511130e+00,
                 3.464418e-06,
                -1.594269e-08,
                 7.248657e-12,
                -6.445014e-16,
                 2.256243e+05,
                 4.927677e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N_minus = Substance {
    name             = "N-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.627234e+00,
                -5.934450e-04,
                 1.120289e-06,
                -9.625856e-10,
                 3.111196e-13,
                 5.618809e+04,
                 4.401112e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.508971e+00,
                -9.584128e-06,
                 3.852101e-09,
                -6.689360e-13,
                 4.209912e-17,
                 5.620830e+04,
                 4.949532e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NCO = Substance {
    name             = "NCO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.754524e+00,
                 9.230080e-03,
                -9.280066e-06,
                 5.625214e-09,
                -1.612001e-12,
                 2.018430e+04,
                 9.853688e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.152557e+00,
                 2.309456e-03,
                -8.836995e-07,
                 1.485253e-10,
                -9.088579e-15,
                 1.949638e+04,
                -2.564064e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        C = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ND = Substance {
    name             = "ND",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.720649e+00,
                -1.534185e-03,
                 3.187743e-06,
                -1.509140e-09,
                 9.712611e-14,
                 4.407276e+04,
                 1.649557e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.829703e+00,
                 1.658418e-03,
                -6.328733e-07,
                 1.147768e-10,
                -7.831858e-15,
                 4.425595e+04,
                 6.006629e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        D = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ND2 = Substance {
    name             = "ND2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.026978e+00,
                -1.408513e-03,
                 7.776582e-06,
                -6.496757e-09,
                 1.755417e-12,
                 2.109803e+04,
                 1.754843e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.351539e+00,
                 3.376316e-03,
                -1.321346e-06,
                 2.680068e-10,
                -2.081017e-14,
                 2.107775e+04,
                 4.373880e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        D = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ND3 = Substance {
    name             = "ND3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.942784e+00,
                 5.103529e-03,
                 2.739282e-06,
                -4.684766e-09,
                 1.627667e-12,
                -8.165156e+03,
                 6.155220e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.196157e+00,
                 6.731176e-03,
                -2.642340e-06,
                 4.763087e-10,
                -3.280483e-14,
                -8.396653e+03,
                 4.162907e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        D = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NF = Substance {
    name             = "NF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.599280e+00,
                -2.181908e-03,
                 1.141069e-05,
                -1.400685e-08,
                 5.533326e-12,
                 2.697025e+04,
                 5.355736e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.060423e+00,
                 3.506549e-04,
                -6.957218e-08,
                 1.459255e-11,
                -1.563724e-15,
                 2.667120e+04,
                 2.087748e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NF2 = Substance {
    name             = "NF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.182338e+00,
                 1.307001e-02,
                -1.514789e-05,
                 8.233646e-09,
                -1.685886e-12,
                 3.026325e+03,
                 1.429674e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.671100e+00,
                 1.524906e-03,
                -6.643205e-07,
                 1.298821e-10,
                -9.348916e-15,
                 2.172892e+03,
                -3.217337e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NF3 = Substance {
    name             = "NF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.474129e-01,
                 3.075048e-02,
                -4.258609e-05,
                 2.884321e-08,
                -7.703466e-12,
                -1.698750e+04,
                 2.187349e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.841996e+00,
                 2.692759e-03,
                -1.080131e-06,
                 2.122126e-10,
                -1.528812e-14,
                -1.866843e+04,
                -1.497089e+01,
            }
        )
    },
    elements         = {
        N = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NH = Substance {
    name             = "NH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.492950e+00,
                 3.117957e-04,
                -1.489066e-06,
                 2.481674e-09,
                -1.035709e-12,
                 4.189429e+04,
                 1.848350e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.783726e+00,
                 1.329859e-03,
                -4.247856e-07,
                 7.834944e-11,
                -5.504513e-15,
                 4.213452e+04,
                 5.740849e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NH_plus = Substance {
    name             = "NH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.616111e+00,
                -3.134357e-03,
                 2.917051e-06,
                 2.573848e-10,
                -7.314313e-13,
                 1.990850e+05,
                -2.927585e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.959190e+00,
                 1.349917e-03,
                -4.614878e-07,
                 8.269777e-11,
                -5.557589e-15,
                 1.995245e+05,
                 5.599780e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NHF = Substance {
    name             = "NHF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.507905e+00,
                 1.468857e-03,
                 5.138932e-06,
                -7.076429e-09,
                 2.731565e-12,
                 1.232662e+04,
                 7.162801e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.705516e+00,
                 3.059284e-03,
                -1.194819e-06,
                 2.153204e-10,
                -1.447128e-14,
                 1.217132e+04,
                 5.630128e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NHF2 = Substance {
    name             = "NHF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.206748e+00,
                 1.187740e-02,
                -5.501269e-06,
                -2.191122e-09,
                 1.974618e-12,
                -1.352214e+04,
                 1.455103e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.287561e+00,
                 4.633233e-03,
                -1.877375e-06,
                 3.469930e-10,
                -2.403675e-14,
                -1.442363e+04,
                -1.644628e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NH2 = Substance {
    name             = "NH2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.205569e+00,
                -2.135614e-03,
                 7.268513e-06,
                -5.930699e-09,
                 1.806910e-12,
                 2.153522e+04,
                -1.466628e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.847690e+00,
                 3.142800e-03,
                -8.986415e-07,
                 1.303183e-10,
                -7.488129e-15,
                 2.182390e+04,
                 6.471654e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NH2F = Substance {
    name             = "NH2F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.646343e+00,
                -1.122991e-03,
                 1.715609e-05,
                -1.903337e-08,
                 6.738460e-12,
                -1.017500e+04,
                 6.557271e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.031689e+00,
                 6.422394e-03,
                -2.483275e-06,
                 4.437033e-10,
                -2.998110e-14,
                -1.030217e+04,
                 8.277200e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 2.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NH3 = Substance {
    name             = "NH3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.301778e+00,
                -4.771273e-03,
                 2.193416e-05,
                -2.298565e-08,
                 8.289923e-12,
                -6.748064e+03,
                -6.906444e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.717097e+00,
                 5.568563e-03,
                -1.768864e-06,
                 2.674173e-10,
                -1.527314e-14,
                -6.584520e+03,
                 6.092898e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NH2OH = Substance {
    name             = "NH2OH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.210161e+00,
                 6.196718e-03,
                 1.105949e-05,
                -1.966682e-08,
                 8.825163e-12,
                -7.309128e+03,
                 7.932936e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.881124e+00,
                 8.157087e-03,
                -2.826157e-06,
                 4.379313e-10,
                -2.527249e-14,
                -7.587827e+03,
                 3.791569e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 3.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NH4_plus = Substance {
    name             = "NH4+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 5.022093e+00,
                -1.170990e-02,
                 3.976001e-05,
                -3.694199e-08,
                 1.202645e-11,
                 7.630298e+04,
                -4.205223e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.315703e+00,
                 9.649267e-03,
                -3.290496e-06,
                 5.120454e-10,
                -2.984991e-14,
                 7.672770e+04,
                 1.209310e+01,
            }
        )
    },
    elements         = {
        N = 1.0,
        H = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_False = Substance {
    name             = "False",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.218599e+00,
                -4.639881e-03,
                 1.104430e-05,
                -9.340555e-09,
                 2.805549e-12,
                 9.845100e+03,
                 2.280610e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.260712e+00,
                 1.191011e-03,
                -4.291226e-07,
                 6.944815e-11,
                -4.032957e-15,
                 9.921431e+03,
                 6.369005e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NO_plus = Substance {
    name             = "NO+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.693012e+00,
                -1.342292e-03,
                 2.673434e-06,
                -1.026093e-09,
                -6.956105e-14,
                 1.181031e+05,
                 3.091267e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.945877e+00,
                 1.403253e-03,
                -4.955032e-07,
                 7.959490e-11,
                -4.720767e-15,
                 1.182443e+05,
                 6.706446e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NOCL = Substance {
    name             = "NOCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.842936e+00,
                 7.307572e-03,
                -9.140073e-06,
                 6.661176e-09,
                -2.050291e-12,
                 4.936487e+03,
                 7.740794e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.869568e+00,
                 9.321848e-04,
                -2.523554e-07,
                 8.094449e-11,
                -9.020373e-15,
                 4.371781e+03,
                -2.644058e+00,
            }
        )
    },
    elements         = {
        N  = 1.0,
        O  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NOF = Substance {
    name             = "NOF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.016789e+00,
                 9.407459e-03,
                -1.141037e-05,
                 7.751570e-09,
                -2.223289e-12,
                -9.048759e+03,
                 1.030434e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.987816e+00,
                 2.438225e-03,
                -1.110405e-06,
                 2.454137e-10,
                -1.888881e-14,
                -9.532832e+03,
                 4.591733e-01,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NOF3 = Substance {
    name             = "NOF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.578588e-01,
                 4.188483e-02,
                -6.273100e-05,
                 4.619048e-08,
                -1.341203e-11,
                -2.393042e+04,
                 2.242342e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.816030e+00,
                 3.546222e-03,
                -1.552127e-06,
                 3.016350e-10,
                -2.162291e-14,
                -2.601812e+04,
                -2.459501e+01,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NO2 = Substance {
    name             = "NO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.944039e+00,
                -1.585474e-03,
                 1.665790e-05,
                -2.047545e-08,
                 7.835033e-12,
                 2.896599e+03,
                 6.311962e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.884744e+00,
                 2.172416e-03,
                -8.280790e-07,
                 1.574773e-10,
                -1.051105e-14,
                 2.316485e+03,
                -1.173571e-01,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NO2_minus = Substance {
    name             = "NO2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.097836e+00,
                 3.704863e-03,
                 5.929390e-06,
                -1.094973e-08,
                 4.627217e-12,
                -2.517983e+04,
                 9.482371e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.053293e+00,
                 2.075557e-03,
                -8.700031e-07,
                 1.610743e-10,
                -1.034481e-14,
                -2.590436e+04,
                -1.540651e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NO2CL = Substance {
    name             = "NO2CL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.559804e+00,
                 1.796932e-02,
                -2.026526e-05,
                 1.169918e-08,
                -2.786337e-12,
                 9.879068e+01,
                 1.358996e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.120260e+00,
                 3.186956e-03,
                -1.377990e-06,
                 2.665316e-10,
                -1.904380e-14,
                -1.061535e+03,
                -9.454766e+00,
            }
        )
    },
    elements         = {
        N  = 1.0,
        O  = 2.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NO2F = Substance {
    name             = "NO2F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.446681e+00,
                 2.088406e-02,
                -2.388553e-05,
                 1.394389e-08,
                -3.340250e-12,
                -1.428430e+04,
                 1.766067e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.710382e+00,
                 3.624017e-03,
                -1.566602e-06,
                 3.026664e-10,
                -2.160887e-14,
                -1.561104e+04,
                -8.881696e+00,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 2.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NO3 = Substance {
    name             = "NO3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.173593e+00,
                 1.049027e-02,
                 1.104726e-05,
                -2.815619e-08,
                 1.365840e-11,
                 7.392199e+03,
                 1.460221e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.483477e+00,
                 2.577720e-03,
                -1.009458e-06,
                 1.723141e-10,
                -1.071540e-14,
                 5.709194e+03,
                -1.416182e+01,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NO3_minus = Substance {
    name             = "NO3-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.212585e+00,
                 1.715452e-02,
                -1.052705e-05,
                -1.160741e-09,
                 2.331150e-12,
                -3.840777e+04,
                 1.799339e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.884047e+00,
                 3.160630e-03,
                -1.230488e-06,
                 2.092580e-10,
                -1.297955e-14,
                -4.005482e+04,
                -1.170871e+01,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 3.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NO3F = Substance {
    name             = "NO3F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.036357e+00,
                 2.878410e-02,
                -3.484034e-05,
                 2.176017e-08,
                -5.649644e-12,
                 1.850682e+02,
                 1.644354e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.289479e+00,
                 4.601814e-03,
                -2.218707e-06,
                 4.512976e-10,
                -3.324065e-14,
                -1.646852e+03,
                -2.008892e+01,
            }
        )
    },
    elements         = {
        N = 1.0,
        O = 3.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2 = Substance {
    name             = "N2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.531005e+00,
                -1.236610e-04,
                -5.029994e-07,
                 2.435306e-09,
                -1.408812e-12,
                -1.046976e+03,
                 2.967475e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.952576e+00,
                 1.396901e-03,
                -4.926317e-07,
                 7.860104e-11,
                -4.607553e-15,
                -9.239486e+02,
                 5.871893e+00,
            }
        )
    },
    elements         = {
        N = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2_plus = Substance {
    name             = "N2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.775407e+00,
                -2.064592e-03,
                 4.757523e-06,
                -3.156642e-09,
                 6.705100e-13,
                 1.804811e+05,
                 2.693222e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.586614e+00,
                 2.530719e-04,
                 1.847782e-07,
                -4.552572e-11,
                 3.268180e-15,
                 1.803910e+05,
                 3.095842e+00,
            }
        )
    },
    elements         = {
        N = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2_minus = Substance {
    name             = "N2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.882685e+00,
                -3.192445e-03,
                 8.522784e-06,
                -7.340375e-09,
                 2.205682e-12,
                 1.679694e+04,
                 3.111805e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.115675e+00,
                 1.458869e-03,
                -6.017315e-07,
                 1.134842e-10,
                -7.965852e-15,
                 1.685906e+04,
                 6.389856e+00,
            }
        )
    },
    elements         = {
        N = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NCN = Substance {
    name             = "NCN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.241340e+00,
                 8.500913e-03,
                -7.616081e-06,
                 3.649866e-09,
                -8.425519e-13,
                 5.894774e+04,
                 6.709564e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.738155e+00,
                 1.772446e-03,
                -6.857511e-07,
                 1.157120e-10,
                -7.075679e-15,
                 5.822149e+04,
                -6.305337e+00,
            }
        )
    },
    elements         = {
        N = 2.0,
        C = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_cis_minusN2D2 = Substance {
    name             = "cis-N2D2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.873359e+00,
                -2.623288e-03,
                 2.630758e-05,
                -3.130087e-08,
                 1.181100e-11,
                 2.369483e+04,
                 4.749492e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.514553e+00,
                 5.189013e-03,
                -1.936843e-06,
                 3.205760e-10,
                -1.952086e-14,
                 2.302304e+04,
                -9.526623e-01,
            }
        )
    },
    elements         = {
        N = 2.0,
        D = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2F2 = Substance {
    name             = "N2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.805893e+00,
                 1.925197e-02,
                -2.369774e-05,
                 1.461686e-08,
                -3.645160e-12,
                 5.994442e+03,
                 1.148415e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.667192e+00,
                 2.594663e-03,
                -1.134602e-06,
                 2.203527e-10,
                -1.578866e-14,
                 4.814000e+03,
                -1.282929e+01,
            }
        )
    },
    elements         = {
        N = 2.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2F4 = Substance {
    name             = "N2F4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 9.878129e-01,
                 5.002952e-02,
                -7.367671e-05,
                 5.252346e-08,
                -1.471296e-11,
                -4.610109e+03,
                 2.048572e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.291507e+01,
                 3.508136e-03,
                -1.554689e-06,
                 3.045622e-10,
                -2.195235e-14,
                -7.200819e+03,
                -3.771090e+01,
            }
        )
    },
    elements         = {
        N = 2.0,
        F = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2H2 = Substance {
    name             = "N2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.910660e+00,
                -1.077919e-02,
                 3.865164e-05,
                -3.865016e-08,
                 1.348521e-11,
                 2.422427e+04,
                 9.102797e-02,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.311151e+00,
                 9.001873e-03,
                -3.149119e-06,
                 4.814497e-10,
                -2.718980e-14,
                 2.478642e+04,
                 1.640911e+01,
            }
        )
    },
    elements         = {
        N = 2.0,
        H = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NH2NO2 = Substance {
    name             = "NH2NO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.173101e+00,
                 1.431623e-02,
                 1.090316e-05,
                -2.767147e-08,
                 1.298687e-11,
                -4.459061e+03,
                 1.538312e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.388910e+00,
                 7.651880e-03,
                -2.750870e-06,
                 4.446229e-10,
                -2.664881e-14,
                -6.217670e+03,
                -1.327370e+01,
            }
        )
    },
    elements         = {
        N = 2.0,
        H = 2.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2H4 = Substance {
    name             = "N2H4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.834721e+00,
                -6.491296e-04,
                 3.768485e-05,
                -5.007092e-08,
                 2.033621e-11,
                 1.008939e+04,
                 5.752720e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.939574e+00,
                 8.750172e-03,
                -2.993991e-06,
                 4.672784e-10,
                -2.730686e-14,
                 9.282655e+03,
                -2.694398e+00,
            }
        )
    },
    elements         = {
        N = 2.0,
        H = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2O = Substance {
    name             = "N2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.257169e+00,
                 1.130463e-02,
                -1.367104e-05,
                 9.681621e-09,
                -2.930556e-12,
                 8.741771e+03,
                 1.075792e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.823189e+00,
                 2.626853e-03,
                -9.584261e-07,
                 1.599913e-10,
                -9.774169e-15,
                 8.073357e+03,
                -2.202366e+00,
            }
        )
    },
    elements         = {
        N = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2O_plus = Substance {
    name             = "N2O+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.286890e+00,
                 7.402346e-03,
                -4.866886e-06,
                 7.331410e-10,
                 2.981617e-13,
                 1.590545e+05,
                 7.401465e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.528597e+00,
                 1.959570e-03,
                -7.537582e-07,
                 1.270459e-10,
                -7.802076e-15,
                 1.583759e+05,
                -4.418967e+00,
            }
        )
    },
    elements         = {
        N = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2O3 = Substance {
    name             = "N2O3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 5.810840e+00,
                 1.433310e-02,
                -1.962086e-05,
                 1.730607e-08,
                -6.465540e-12,
                 8.191845e+03,
                 1.204613e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.085838e+00,
                 3.377563e-03,
                -1.315839e-06,
                 2.307623e-10,
                -1.471513e-14,
                 7.271601e+03,
                -1.553619e+01,
            }
        )
    },
    elements         = {
        N = 2.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2O4 = Substance {
    name             = "N2O4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.020023e+00,
                 2.959043e-02,
                -3.013425e-05,
                 1.423604e-08,
                -2.441000e-12,
                -6.400402e+02,
                 1.180596e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.157529e+01,
                 4.016161e-03,
                -1.571783e-06,
                 2.682743e-10,
                -1.669220e-14,
                -2.921912e+03,
                -3.194884e+01,
            }
        )
    },
    elements         = {
        N = 2.0,
        O = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N2O5 = Substance {
    name             = "N2O5",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.687674e+00,
                 3.921208e-02,
                -5.537700e-05,
                 4.200978e-08,
                -1.312607e-11,
                -8.302912e+02,
                 1.219679e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.311081e+01,
                 4.874358e-03,
                -1.875484e-06,
                 3.163741e-10,
                -1.959268e-14,
                -3.116347e+03,
                -3.468777e+01,
            }
        )
    },
    elements         = {
        N = 2.0,
        O = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N3 = Substance {
    name             = "N3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.860630e+00,
                 4.248835e-03,
                 5.145721e-06,
                -1.014784e-08,
                 4.418784e-12,
                 5.136921e+04,
                 9.115961e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.641107e+00,
                 2.769607e-03,
                -1.049176e-06,
                 1.753407e-10,
                -1.074827e-14,
                 5.069842e+04,
                -9.401355e-01,
            }
        )
    },
    elements         = {
        N = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_N3H = Substance {
    name             = "N3H",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.885109e+00,
                 9.443435e-03,
                -3.879193e-06,
                -1.894040e-09,
                 1.601841e-12,
                 3.411720e+04,
                 9.716878e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.147003e+00,
                 4.305613e-03,
                -1.527046e-06,
                 2.462958e-10,
                -1.471442e-14,
                 3.342840e+04,
                -2.255291e+00,
            }
        )
    },
    elements         = {
        N = 3.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na = Substance {
    name             = "Na",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                -4.984923e-10,
                 1.760341e-12,
                -2.544616e-15,
                 1.276039e-18,
                 1.215978e+04,
                 4.244028e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.398589e+00,
                 2.154670e-04,
                -1.490776e-07,
                 3.668218e-11,
                -1.660360e-15,
                 1.219431e+04,
                 4.791811e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na_plus = Substance {
    name             = "Na+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 7.254132e+04,
                 3.550845e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaALF4 = Substance {
    name             = "NaALF4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.305214e+00,
                 4.496803e-02,
                -7.432379e-05,
                 5.808086e-08,
                -1.749956e-11,
                -2.241499e+05,
                 6.371846e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.427155e+01,
                 1.980019e-03,
                -8.815148e-07,
                 1.732215e-10,
                -1.251292e-14,
                -2.261235e+05,
                -4.127552e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Al = 1.0,
        F  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaBO2 = Substance {
    name             = "NaBO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.065475e+00,
                 1.345493e-02,
                -1.386669e-05,
                 6.639504e-09,
                -1.072867e-12,
                -7.970016e+04,
                 7.934816e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.496525e+00,
                 2.630986e-03,
                -1.097914e-06,
                 2.049400e-10,
                -1.419315e-14,
                -8.057859e+04,
                -9.446302e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        B  = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaBr = Substance {
    name             = "NaBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.901089e+00,
                 2.502540e-03,
                -3.885109e-06,
                 2.831850e-09,
                -7.722053e-13,
                -1.855616e+04,
                 6.188793e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.443314e+00,
                 1.578366e-04,
                -2.798962e-08,
                 5.384904e-12,
                -3.809405e-16,
                -1.865949e+04,
                 3.608582e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaCN = Substance {
    name             = "NaCN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.977256e+00,
                 5.322594e-03,
                -7.555244e-06,
                 6.183979e-09,
                -2.007143e-12,
                 9.673149e+03,
                -3.882073e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.798978e+00,
                 1.682795e-03,
                -6.743792e-07,
                 1.223450e-10,
                -8.296609e-15,
                 9.493344e+03,
                -4.344260e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        C  = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaCL = Substance {
    name             = "NaCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.703229e+00,
                 3.199761e-03,
                -4.892450e-06,
                 3.463922e-09,
                -9.135752e-13,
                -2.302828e+04,
                 5.773479e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.428293e+00,
                 1.562724e-04,
                -2.810838e-08,
                 4.716357e-12,
                -2.883256e-16,
                -2.317090e+04,
                 2.300975e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaF = Substance {
    name             = "NaF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.748718e+00,
                 8.032433e-03,
                -1.515635e-05,
                 1.335922e-08,
                -4.451652e-12,
                -3.600021e+04,
                 8.681078e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.333768e+00,
                 2.568078e-04,
                -6.942326e-08,
                 1.196796e-11,
                -7.493084e-16,
                -3.627979e+04,
                 1.300464e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaF2_minus = Substance {
    name             = "NaF2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.582689e+00,
                 1.060521e-02,
                -1.572050e-05,
                 1.056730e-08,
                -2.641592e-12,
                -8.223450e+04,
                 1.489208e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.122319e+00,
                 4.188405e-04,
                -1.797230e-07,
                 3.404123e-11,
                -2.375194e-15,
                -8.275573e+04,
                -1.078667e+01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        F  = 2.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaH = Substance {
    name             = "NaH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.120395e+00,
                 1.399622e-03,
                 2.214123e-06,
                -3.995080e-09,
                 1.672618e-12,
                 1.394007e+04,
                 4.394561e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.813058e+00,
                 8.564380e-04,
                -3.122682e-07,
                 5.850247e-11,
                -4.051392e-15,
                 1.368306e+04,
                 4.841681e-01,
            }
        )
    },
    elements         = {
        Na = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaI = Substance {
    name             = "NaI",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.040628e+00,
                 1.968711e-03,
                -3.054542e-06,
                 2.255632e-09,
                -6.228683e-13,
                -1.198804e+04,
                 6.459801e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.458457e+00,
                 1.424128e-04,
                -1.692628e-08,
                 3.896009e-12,
                -2.796631e-16,
                -1.206684e+04,
                 4.475959e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaO = Substance {
    name             = "NaO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.442101e+00,
                 4.161724e-03,
                -6.311837e-06,
                 4.447920e-09,
                -1.172049e-12,
                 8.901148e+03,
                 6.950325e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.392416e+00,
                 2.132057e-04,
                -4.522060e-08,
                 7.975182e-12,
                -5.173599e-16,
                 8.711899e+03,
                 2.388090e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaO_minus = Substance {
    name             = "NaO-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.418686e+00,
                 4.211738e-03,
                -6.310465e-06,
                 4.387352e-09,
                -1.137264e-12,
                -1.575223e+04,
                 5.668556e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.386801e+00,
                 2.234467e-04,
                -4.821247e-08,
                 8.572086e-12,
                -5.609433e-16,
                -1.594627e+04,
                 1.013635e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        O  = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaOH = Substance {
    name             = "NaOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.005039e+00,
                 9.992204e-03,
                -1.643421e-05,
                 1.247658e-08,
                -3.463761e-12,
                -2.530047e+04,
                 2.306436e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.646938e+00,
                 1.222739e-03,
                -3.327104e-07,
                 4.066630e-11,
                -1.779069e-15,
                -2.550822e+04,
                -5.036875e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NaOH_plus = Substance {
    name             = "NaOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.350520e+00,
                 8.746502e-03,
                -1.464267e-05,
                 1.135150e-08,
                -3.211003e-12,
                 7.994640e+04,
                 2.344841e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.668855e+00,
                 1.225393e-03,
                -3.402956e-07,
                 4.285327e-11,
                -1.959376e-15,
                 7.980651e+04,
                -3.424683e+00,
            }
        )
    },
    elements         = {
        Na = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na2 = Substance {
    name             = "Na2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.115683e+00,
                 2.529040e-03,
                -5.621686e-06,
                 6.461717e-09,
                -2.751283e-12,
                 1.578246e+04,
                 3.686724e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 5.962019e+00,
                -1.060495e-03,
                -4.392798e-07,
                 3.051748e-10,
                -3.394888e-14,
                 1.499909e+04,
                -6.696136e+00,
            }
        )
    },
    elements         = {
        Na = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na2C2N2 = Substance {
    name             = "Na2C2N2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.036803e+01,
                 1.334855e-02,
                -1.991033e-05,
                 1.615647e-08,
                -5.126455e-12,
                -4.593753e+03,
                -2.054944e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.257279e+01,
                 3.394732e-03,
                -1.361693e-06,
                 2.472096e-10,
                -1.677325e-14,
                -5.049102e+03,
                -3.107420e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        C  = 2.0,
        N  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na2CL2 = Substance {
    name             = "Na2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.958395e+00,
                 8.396236e-03,
                -1.381712e-05,
                 1.027767e-08,
                -2.864499e-12,
                -7.072594e+04,
                -8.175325e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.826200e+00,
                 1.918476e-04,
                -8.160874e-08,
                 1.529818e-11,
                -1.055899e-15,
                -7.107715e+04,
                -1.703610e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na2F2 = Substance {
    name             = "Na2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.821219e+00,
                 1.983640e-02,
                -3.061761e-05,
                 2.133704e-08,
                -5.534431e-12,
                -1.038901e+05,
                 2.366255e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.433553e+00,
                 6.361159e-04,
                -2.762472e-07,
                 5.291719e-11,
                -3.731035e-15,
                -1.048011e+05,
                -1.975299e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na2O = Substance {
    name             = "Na2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.778718e+00,
                 9.948772e-03,
                -1.481446e-05,
                 1.000324e-08,
                -2.513787e-12,
                -6.736021e+03,
                 1.799476e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.147058e+00,
                 3.983310e-04,
                -1.740891e-07,
                 3.356516e-11,
                -2.381080e-15,
                -7.219126e+03,
                -9.634811e+00,
            }
        )
    },
    elements         = {
        Na = 2.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na2O2H2 = Substance {
    name             = "Na2O2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.971293e+00,
                 1.404927e-02,
                -6.244514e-06,
                -3.393575e-09,
                 2.893377e-12,
                -7.541294e+04,
                -9.373865e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.416074e+00,
                 5.519652e-03,
                -1.965961e-06,
                 3.268034e-10,
                -2.071249e-14,
                -7.636637e+04,
                -1.885435e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Na2SO4 = Substance {
    name             = "Na2SO4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.072750e+00,
                 5.458205e-02,
                -7.854353e-05,
                 5.510422e-08,
                -1.526668e-11,
                -1.267696e+05,
                 1.666883e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.520613e+01,
                 4.298426e-03,
                -1.900841e-06,
                 3.718753e-10,
                -2.678046e-14,
                -1.296736e+05,
                -4.765692e+01,
            }
        )
    },
    elements         = {
        Na = 2.0,
        S  = 1.0,
        O  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Nb = Substance {
    name             = "Nb",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.475507e+00,
                 2.053856e-03,
                -6.967026e-06,
                 6.802056e-09,
                -2.251772e-12,
                 8.708775e+04,
                 2.242437e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.220591e+00,
                -1.818744e-03,
                 8.237394e-07,
                -1.183290e-10,
                 5.363705e-15,
                 8.696071e+04,
                -1.184686e+00,
            }
        )
    },
    elements         = {
        Nb = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NbO = Substance {
    name             = "NbO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.921448e+00,
                 3.132408e-03,
                -1.490037e-06,
                -9.934526e-10,
                 7.998402e-13,
                 2.290789e+04,
                 1.123629e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.881173e+00,
                 8.197812e-04,
                -4.253539e-07,
                 1.026494e-10,
                -8.041980e-15,
                 2.263713e+04,
                 6.223642e+00,
            }
        )
    },
    elements         = {
        Nb = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NbO2 = Substance {
    name             = "NbO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.576727e+00,
                 6.358956e-03,
                -5.964422e-07,
                -6.342290e-09,
                 3.708328e-12,
                -2.538732e+04,
                 1.062570e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.051479e+00,
                 9.751537e-04,
                -3.826971e-07,
                 6.541504e-11,
                -4.071591e-15,
                -2.610086e+04,
                -2.400157e+00,
            }
        )
    },
    elements         = {
        Nb = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ne = Substance {
    name             = "Ne",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                -7.453750e+02,
                 3.355323e+00,
            }
        )
    },
    elements         = {
        Ne = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ne_plus = Substance {
    name             = "Ne+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 1.941069e+00,
                 4.400166e-03,
                -8.570474e-06,
                 6.996917e-09,
                -2.115736e-12,
                 2.502943e+05,
                 6.991787e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.903996e+00,
                -3.637946e-04,
                 1.318734e-07,
                -2.142092e-11,
                 1.287785e-15,
                 2.501437e+05,
                 2.563103e+00,
            }
        )
    },
    elements         = {
        Ne = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ni = Substance {
    name             = "Ni",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.776665e+00,
                -7.522064e-04,
                 4.325611e-06,
                -5.473129e-09,
                 2.110757e-12,
                 5.090908e+04,
                 6.168233e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.206149e+00,
                -2.096992e-04,
                -2.283645e-08,
                 1.508521e-11,
                -1.000444e-15,
                 5.070813e+04,
                 3.531716e+00,
            }
        )
    },
    elements         = {
        Ni = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NiCL = Substance {
    name             = "NiCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.489776e+00,
                 3.183793e-03,
                -1.914891e-06,
                -3.573632e-10,
                 4.607477e-13,
                 2.072594e+04,
                 9.549744e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.583651e+00,
                -1.432958e-03,
                 8.520772e-07,
                -1.488639e-10,
                 8.155162e-15,
                 2.005651e+04,
                -1.637321e+00,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NiCL2 = Substance {
    name             = "NiCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.560618e+00,
                 1.361371e-02,
                -2.366013e-05,
                 1.961626e-08,
                -6.241729e-12,
                -1.068357e+04,
                 6.236194e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.387453e+00,
                 8.463760e-04,
                -4.314954e-07,
                 9.359085e-11,
                -7.191514e-15,
                -1.123586e+04,
                -7.188951e+00,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NiO = Substance {
    name             = "NiO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.991968e+00,
                 3.330921e-03,
                -1.535247e-06,
                -1.564083e-09,
                 1.212850e-12,
                 3.674209e+04,
                 9.821407e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.104611e+00,
                 4.865916e-04,
                -1.878678e-07,
                 3.553185e-11,
                -2.471517e-15,
                 3.644564e+04,
                 4.076797e+00,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_NiS = Substance {
    name             = "NiS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.116811e+00,
                 4.017353e-03,
                -1.558391e-06,
                -1.506354e-09,
                 9.368388e-13,
                 4.189686e+04,
                 1.146774e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.916047e+00,
                 3.137745e-04,
                -2.970181e-07,
                 8.017972e-11,
                -6.725742e-15,
                 4.132103e+04,
                 1.818988e+00,
            }
        )
    },
    elements         = {
        Ni = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_O = Substance {
    name             = "O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.168267e+00,
                -3.279319e-03,
                 6.643064e-06,
                -6.128066e-09,
                 2.112660e-12,
                 2.912226e+04,
                 2.051933e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.543637e+00,
                -2.731625e-05,
                -4.190295e-09,
                 4.954818e-12,
                -4.795537e-16,
                 2.922601e+04,
                 4.922295e+00,
            }
        )
    },
    elements         = {
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_O_plus = Substance {
    name             = "O+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.879353e+05,
                 4.393377e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.487733e+00,
                 2.176600e-05,
                -1.089558e-08,
                 1.259092e-12,
                 1.373167e-16,
                 1.879400e+05,
                 4.461341e+00,
            }
        )
    },
    elements         = {
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_O_minus = Substance {
    name             = "O-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.908059e+00,
                -1.698049e-03,
                 2.980700e-06,
                -2.438351e-09,
                 7.612293e-13,
                 1.141383e+04,
                 2.803391e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.544749e+00,
                -4.666954e-05,
                 1.849123e-08,
                -3.181591e-12,
                 1.989629e-16,
                 1.148227e+04,
                 4.521310e+00,
            }
        )
    },
    elements         = {
        O = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_OD = Substance {
    name             = "OD",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.034675e+00,
                -2.456131e-03,
                 3.961020e-06,
                -1.853500e-09,
                 1.929534e-13,
                 3.277051e+03,
                 3.941861e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.782911e+00,
                 1.573957e-03,
                -5.702079e-07,
                 9.886441e-11,
                -6.506201e-15,
                 3.575981e+03,
                 6.675671e+00,
            }
        )
    },
    elements         = {
        O = 1.0,
        D = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_OH = Substance {
    name             = "OH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.992015e+00,
                -2.401318e-03,
                 4.617938e-06,
                -3.881133e-09,
                 1.364115e-12,
                 3.615081e+03,
                -1.039255e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.838646e+00,
                 1.107256e-03,
                -2.939150e-07,
                 4.205242e-11,
                -2.421691e-15,
                 3.943959e+03,
                 5.844527e+00,
            }
        )
    },
    elements         = {
        O = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_OH_plus = Substance {
    name             = "OH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.505026e+00,
                 2.413137e-04,
                -1.422009e-06,
                 2.647802e-09,
                -1.170387e-12,
                 1.541271e+05,
                 1.979076e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.683590e+00,
                 1.570064e-03,
                -5.399728e-07,
                 9.376439e-11,
                -5.700681e-15,
                 1.543957e+05,
                 6.443759e+00,
            }
        )
    },
    elements         = {
        O = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_OH_minus = Substance {
    name             = "OH-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.432800e+00,
                 6.196563e-04,
                -1.899310e-06,
                 2.373659e-09,
                -8.551038e-13,
                -1.826131e+04,
                 1.060537e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.834057e+00,
                 1.070580e-03,
                -2.624594e-07,
                 3.083764e-11,
                -1.313839e-15,
                -1.801870e+04,
                 4.494647e+00,
            }
        )
    },
    elements         = {
        O = 1.0,
        H = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_O2 = Substance {
    name             = "O2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.782456e+00,
                -2.996734e-03,
                 9.847302e-06,
                -9.681295e-09,
                 3.243728e-12,
                -1.063944e+03,
                 3.657676e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.660961e+00,
                 6.563655e-04,
                -1.411495e-07,
                 2.057977e-11,
                -1.299132e-15,
                -1.215977e+03,
                 3.415362e+00,
            }
        )
    },
    elements         = {
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_O2_plus = Substance {
    name             = "O2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.610172e+00,
                -6.359520e-03,
                 1.424256e-05,
                -1.209979e-08,
                 3.709569e-12,
                 1.397422e+05,
                -2.013269e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.316759e+00,
                 1.115222e-03,
                -3.834926e-07,
                 5.727847e-11,
                -2.776484e-15,
                 1.398768e+05,
                 5.447265e+00,
            }
        )
    },
    elements         = {
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_O2_minus = Substance {
    name             = "O2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.664425e+00,
                -9.287411e-04,
                 6.454771e-06,
                -7.747034e-09,
                 2.933327e-12,
                -6.870770e+03,
                 4.351407e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.956663e+00,
                 5.981418e-04,
                -2.121339e-07,
                 3.632676e-11,
                -2.249892e-15,
                -7.062872e+03,
                 2.278710e+00,
            }
        )
    },
    elements         = {
        O = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_O3 = Substance {
    name             = "O3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.407382e+00,
                 2.053791e-03,
                 1.384861e-05,
                -2.233115e-08,
                 9.760732e-12,
                 1.586450e+04,
                 8.282476e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 1.233029e+01,
                -1.193248e-02,
                 7.987413e-06,
                -1.771946e-09,
                 1.260758e-13,
                 1.267558e+04,
                -4.088234e+01,
            }
        )
    },
    elements         = {
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_P = Substance {
    name             = "P",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500043e+00,
                -4.389686e-07,
                 1.581317e-09,
                -2.339005e-12,
                 1.205109e-15,
                 3.730738e+04,
                 5.384147e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.807216e+00,
                -5.308420e-04,
                 2.445430e-07,
                -2.057083e-11,
                -2.945466e-16,
                 3.718927e+04,
                 3.677647e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_P_plus = Substance {
    name             = "P+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.379042e+00,
                -6.466672e-03,
                 8.934096e-06,
                -5.485802e-09,
                 1.209886e-12,
                 1.596478e+05,
                -3.293740e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.902155e+00,
                -5.887890e-04,
                 3.129812e-07,
                -5.972754e-11,
                 3.930493e-15,
                 1.599441e+05,
                 3.833706e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PCL3 = Substance {
    name             = "PCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.259054e+00,
                 1.788057e-02,
                -2.731758e-05,
                 1.889824e-08,
                -4.873850e-12,
                -3.686443e+04,
                 3.252330e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.456612e+00,
                 6.027840e-04,
                -2.584688e-07,
                 4.890428e-11,
                -3.408329e-15,
                -3.770456e+04,
                -1.692965e+01,
            }
        )
    },
    elements         = {
        P  = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PF = Substance {
    name             = "PF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.676086e+00,
                 5.572216e-03,
                -7.283780e-06,
                 4.581944e-09,
                -1.118811e-12,
                -7.289161e+03,
                 1.043418e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.284440e+00,
                 4.651319e-05,
                 1.292316e-07,
                -3.545969e-11,
                 2.930864e-15,
                -7.675665e+03,
                 2.401964e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PF_plus = Substance {
    name             = "PF+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.940212e+00,
                -5.378458e-04,
                 3.935611e-06,
                -4.672619e-09,
                 1.744584e-12,
                 1.072526e+05,
                 4.518503e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.081618e+00,
                 4.950691e-04,
                -2.031981e-07,
                 3.923485e-11,
                -2.783034e-15,
                 1.071458e+05,
                 3.444417e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PF_minus = Substance {
    name             = "PF-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.595138e+00,
                 3.031291e-03,
                -4.406291e-06,
                 3.158347e-09,
                -8.920627e-13,
                -2.090409e+04,
                 5.869907e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.303769e+00,
                 2.639263e-04,
                -9.877430e-08,
                 1.871182e-11,
                -1.211025e-15,
                -2.105814e+04,
                 2.412292e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        F = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PF2 = Substance {
    name             = "PF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.442853e+00,
                 1.518633e-02,
                -2.219692e-05,
                 1.564893e-08,
                -4.329837e-12,
                -5.996098e+04,
                 1.403712e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.092659e+00,
                 1.031332e-03,
                -4.537102e-07,
                 8.704558e-11,
                -5.971405e-15,
                -6.075533e+04,
                -3.785130e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PF2_plus = Substance {
    name             = "PF2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.470214e+00,
                 1.492268e-02,
                -2.157314e-05,
                 1.505439e-08,
                -4.126711e-12,
                 5.556554e+04,
                 1.326367e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.072615e+00,
                 1.058825e-03,
                -4.675817e-07,
                 8.961230e-11,
                -6.045422e-15,
                 5.477694e+04,
                -4.351672e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PF3 = Substance {
    name             = "PF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.362188e+00,
                 2.282005e-02,
                -2.765664e-05,
                 1.449096e-08,
                -2.460236e-12,
                -1.167769e+05,
                 1.368643e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.434773e+00,
                 1.739392e-03,
                -7.511981e-07,
                 1.434425e-10,
                -1.009398e-14,
                -1.181808e+05,
                -1.646360e+01,
            }
        )
    },
    elements         = {
        P = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PF5 = Substance {
    name             = "PF5",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.052325e+00,
                 4.445400e-02,
                -5.390143e-05,
                 2.841669e-08,
                -4.914327e-12,
                -1.936323e+05,
                 1.908901e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.284618e+01,
                 3.510448e-03,
                -1.519860e-06,
                 2.910190e-10,
                -2.053471e-14,
                -1.963623e+05,
                -3.947554e+01,
            }
        )
    },
    elements         = {
        P = 1.0,
        F = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PH = Substance {
    name             = "PH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.680343e+00,
                -1.275602e-03,
                 2.593244e-06,
                -8.435411e-10,
                -1.720861e-13,
                 2.733397e+04,
                 2.918641e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.074544e+00,
                 1.169895e-03,
                -3.038165e-07,
                 4.443631e-11,
                -2.700097e-15,
                 2.742683e+04,
                 5.768049e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PH3 = Substance {
    name             = "PH3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.158193e+00,
                 2.494149e-03,
                 9.025525e-06,
                -1.022790e-08,
                 3.283425e-12,
                -4.612373e+02,
                 6.237225e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.344879e+00,
                 6.577094e-03,
                -2.633675e-06,
                 4.774466e-10,
                -3.235439e-14,
                -8.161768e+02,
                 3.954796e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        H = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PO = Substance {
    name             = "PO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.961308e+00,
                -2.123540e-03,
                 7.520122e-06,
                -7.595091e-09,
                 2.563759e-12,
                -4.698969e+03,
                 4.583692e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.842792e+00,
                 7.236446e-04,
                -2.893420e-07,
                 5.301355e-11,
                -3.549537e-15,
                -4.799455e+03,
                 4.552377e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PO2 = Substance {
    name             = "PO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.334527e+00,
                 1.250210e-02,
                -1.433619e-05,
                 7.676217e-09,
                -1.540169e-12,
                -3.896887e+04,
                 1.405443e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.691328e+00,
                 1.480687e-03,
                -6.542569e-07,
                 1.279323e-10,
                -9.209928e-15,
                -3.979473e+04,
                -2.819722e+00,
            }
        )
    },
    elements         = {
        P = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_P2 = Substance {
    name             = "P2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.839111e+00,
                 4.826619e-03,
                -5.494749e-06,
                 2.580051e-09,
                -3.223645e-13,
                 1.625971e+04,
                 8.842410e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.161173e+00,
                 3.962080e-04,
                -1.558034e-07,
                 2.909347e-11,
                -2.004246e-15,
                 1.594687e+04,
                 2.241092e+00,
            }
        )
    },
    elements         = {
        P = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_P4 = Substance {
    name             = "P4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.535330e+00,
                 2.412529e-02,
                -3.646276e-05,
                 2.491691e-08,
                -6.329856e-12,
                 5.235534e+03,
                 7.755896e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.226279e+00,
                 8.689413e-04,
                -3.775834e-07,
                 7.237967e-11,
                -5.106611e-15,
                 4.090550e+03,
                -1.964170e+01,
            }
        )
    },
    elements         = {
        P = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_P4O10 = Substance {
    name             = "P4O10",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -4.414288e+00,
                 1.375908e-01,
                -1.926860e-04,
                 1.327207e-07,
                -3.631138e-11,
                -3.526295e+05,
                 4.017823e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.893966e+01,
                 1.245210e-02,
                -5.485432e-06,
                 1.070474e-09,
                -7.695686e-14,
                -3.601486e+05,
                -1.238594e+02,
            }
        )
    },
    elements         = {
        P = 4.0,
        O = 10.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Pb = Substance {
    name             = "Pb",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.502290e+00,
                -2.440536e-05,
                 9.170826e-08,
                -1.428178e-10,
                 7.837622e-14,
                 2.273149e+04,
                 6.840093e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.163424e+00,
                -3.496377e-03,
                 2.282632e-06,
                -4.767492e-10,
                 3.222238e-14,
                 2.216875e+04,
                -2.135253e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbBr = Substance {
    name             = "PbBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.190684e+00,
                 1.341118e-03,
                -2.097899e-06,
                 1.551091e-09,
                -4.261791e-13,
                 7.236947e+03,
                 8.574778e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.726877e+00,
                -4.391839e-04,
                 3.321558e-07,
                -6.530724e-11,
                 4.272611e-15,
                 7.098896e+03,
                 5.867352e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbBr2 = Substance {
    name             = "PbBr2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.390209e+00,
                 2.528905e-03,
                -4.190374e-06,
                 3.136752e-09,
                -8.797675e-13,
                -1.454179e+04,
                 3.817529e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.947291e+00,
                 6.019900e-05,
                -2.655668e-08,
                 5.159601e-12,
                -3.683705e-16,
                -1.464544e+04,
                 1.180158e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbBr4 = Substance {
    name             = "PbBr4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.137937e+01,
                 6.662587e-03,
                -1.094065e-05,
                 8.109474e-09,
                -2.249558e-12,
                -5.849543e+04,
                -1.514017e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.285697e+01,
                 1.632394e-04,
                -7.197039e-08,
                 1.397575e-11,
                -9.973619e-16,
                -5.877210e+04,
                -2.214575e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Br = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbCL = Substance {
    name             = "PbCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.897291e+00,
                 2.486746e-03,
                -3.915714e-06,
                 2.849428e-09,
                -7.726658e-13,
                 5.686258e+02,
                 8.428474e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.701653e+00,
                -4.225517e-04,
                 3.268478e-07,
                -6.516215e-11,
                 4.297860e-15,
                 3.779799e+02,
                 4.437442e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbCL_plus = Substance {
    name             = "PbCL+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.960481e+00,
                 2.251138e-03,
                -3.555930e-06,
                 2.613097e-09,
                -7.190128e-13,
                 8.842137e+04,
                 7.587743e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.459170e+00,
                 9.740731e-05,
                -4.882113e-09,
                -2.547225e-12,
                 6.247088e-16,
                 8.832585e+04,
                 5.213101e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbCL2 = Substance {
    name             = "PbCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.639941e+00,
                 5.462213e-03,
                -8.805687e-06,
                 6.419723e-09,
                -1.751859e-12,
                -2.279234e+04,
                 4.727905e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.840168e+00,
                 2.060131e-04,
                -1.002343e-07,
                 1.926277e-11,
                -8.794142e-16,
                -2.301636e+04,
                -9.637551e-01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbCL2_plus = Substance {
    name             = "PbCL2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.565388e+00,
                 5.746842e-03,
                -9.244504e-06,
                 6.725689e-09,
                -1.831386e-12,
                 9.633499e+04,
                 5.249054e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.841884e+00,
                 1.979247e-04,
                -9.656282e-08,
                 2.010644e-11,
                -1.324658e-15,
                 9.609402e+04,
                -8.160435e-01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbCL4 = Substance {
    name             = "PbCL4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 9.628298e+00,
                 1.345644e-02,
                -2.157173e-05,
                 1.563821e-08,
                -4.241492e-12,
                -6.974649e+04,
                -1.213485e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.266967e+01,
                 3.751226e-04,
                -1.646537e-07,
                 3.184885e-11,
                -2.265095e-15,
                -7.032915e+04,
                -2.662383e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbF = Substance {
    name             = "PbF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.245448e+00,
                 4.693617e-03,
                -6.978003e-06,
                 4.745930e-09,
                -1.198393e-12,
                -1.077707e+04,
                 1.044373e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.605220e+00,
                -3.262222e-04,
                 2.829825e-07,
                -5.712059e-11,
                 3.739781e-15,
                -1.108692e+04,
                 3.740594e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbF2 = Substance {
    name             = "PbF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.129569e+00,
                 1.056163e-02,
                -1.580814e-05,
                 1.072575e-08,
                -2.709389e-12,
                -5.391612e+04,
                 9.140425e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.635459e+00,
                 4.117311e-04,
                -1.800461e-07,
                 3.472898e-11,
                -2.464527e-15,
                -5.442506e+04,
                -2.946862e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbF4 = Substance {
    name             = "PbF4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.274539e+00,
                 2.457628e-02,
                -3.656754e-05,
                 2.466327e-08,
                -6.187601e-12,
                -1.390092e+05,
                -1.529585e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.212777e+01,
                 9.842105e-04,
                -4.300616e-07,
                 8.290242e-11,
                -5.880020e-15,
                -1.402035e+05,
                -2.979094e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        F  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbI = Substance {
    name             = "PbI",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.307340e+00,
                 8.566823e-04,
                -1.316455e-06,
                 9.718724e-10,
                -2.652674e-13,
                 1.164574e+04,
                 8.941329e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.718611e+00,
                -4.188224e-04,
                 3.097085e-07,
                -5.920335e-11,
                 3.877397e-15,
                 1.153411e+04,
                 6.839194e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbI2 = Substance {
    name             = "PbI2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.716922e+00,
                 1.184988e-03,
                -1.979155e-06,
                 1.492738e-09,
                -4.218965e-13,
                -2.422950e+03,
                 4.696756e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.976111e+00,
                 2.747457e-05,
                -1.220422e-08,
                 2.386249e-12,
                -1.713377e-16,
                -2.470790e+03,
                 3.471736e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbI4 = Substance {
    name             = "PbI4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.215027e+01,
                 3.538708e-03,
                -5.878243e-06,
                 4.407216e-09,
                -1.237405e-12,
                -3.073356e+04,
                -1.397813e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.292766e+01,
                 8.299829e-05,
                -3.678167e-08,
                 7.176429e-12,
                -5.143096e-16,
                -3.087763e+04,
                -1.765576e+01,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        I  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbO = Substance {
    name             = "PbO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.653987e+00,
                 6.664412e-03,
                -1.031236e-05,
                 7.666326e-09,
                -2.217386e-12,
                 7.443751e+03,
                 1.215671e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.113624e+00,
                 5.377886e-04,
                -2.376339e-07,
                 4.242569e-11,
                -1.229404e-15,
                 7.151926e+03,
                 5.150413e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_PbS = Substance {
    name             = "PbS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.477453e+00,
                 3.970029e-03,
                -6.109669e-06,
                 4.300868e-09,
                -1.131155e-12,
                 1.468475e+04,
                 9.477809e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.091152e+00,
                 8.388536e-04,
                -5.715721e-07,
                 1.616048e-10,
                -1.251190e-14,
                 1.460169e+04,
                 6.700748e+00,
            }
        )
    },
    elements         = {
        Pb = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Pb2 = Substance {
    name             = "Pb2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.050122e+00,
                 2.023000e-03,
                -2.970135e-06,
                 2.178596e-09,
                -5.975533e-13,
                 3.873164e+04,
                 1.027199e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.459834e+00,
                 2.400638e-04,
                -1.925986e-08,
                 3.645694e-12,
                -2.538093e-16,
                 3.865405e+04,
                 8.324960e+00,
            }
        )
    },
    elements         = {
        Pb = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S = Substance {
    name             = "S",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.317256e+00,
                 4.780183e-03,
                -1.420827e-05,
                 1.565695e-08,
                -5.965883e-12,
                 3.250690e+04,
                 6.062424e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.879365e+00,
                -5.110504e-04,
                 2.538067e-07,
                -4.454555e-11,
                 2.667174e-15,
                 3.250138e+04,
                 3.981406e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S_plus = Substance {
    name             = "S+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.534781e+05,
                 5.436270e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.465244e+00,
                 1.142572e-04,
                -1.195727e-07,
                 4.387714e-11,
                -3.805236e-15,
                 1.534854e+05,
                 5.608214e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S_minus = Substance {
    name             = "S-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.513531e+00,
                 1.935169e-03,
                -5.384384e-06,
                 5.403134e-09,
                -1.890537e-12,
                 7.643030e+03,
                 5.132820e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.729481e+00,
                -2.248949e-04,
                 8.586489e-08,
                -1.442562e-11,
                 8.874912e-16,
                 7.659801e+03,
                 4.399027e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SCL = Substance {
    name             = "SCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.705588e+00,
                 5.271862e-03,
                -1.137182e-05,
                 1.049783e-08,
                -3.531841e-12,
                 1.756116e+04,
                 6.279451e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.594726e+00,
                -5.977179e-05,
                 4.522649e-08,
                -9.371844e-12,
                 8.073573e-16,
                 1.745243e+04,
                 2.379852e+00,
            }
        )
    },
    elements         = {
        S  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SCL2 = Substance {
    name             = "SCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.596637e+00,
                 1.432719e-02,
                -2.519920e-05,
                 2.057288e-08,
                -6.397691e-12,
                -3.637584e+03,
                 1.006056e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.627146e+00,
                 4.274702e-04,
                -1.881688e-07,
                 3.576116e-11,
                -2.384940e-15,
                -4.200022e+03,
                -4.232370e+00,
            }
        )
    },
    elements         = {
        S  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SCL2_plus = Substance {
    name             = "SCL2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.595873e+00,
                 1.429167e-02,
                -2.508500e-05,
                 2.044689e-08,
                -6.350467e-12,
                 1.069028e+05,
                 1.075583e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.580257e+00,
                 5.217640e-04,
                -2.507698e-07,
                 5.098812e-11,
                -3.273029e-15,
                 1.063549e+05,
                -3.294938e+00,
            }
        )
    },
    elements         = {
        S  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SD = Substance {
    name             = "SD",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.728560e+00,
                -5.093988e-03,
                 9.913460e-06,
                -7.329081e-09,
                 1.946161e-12,
                 1.539958e+04,
                -1.568480e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.347199e+00,
                 1.212965e-03,
                -4.773014e-07,
                 8.832367e-11,
                -6.074059e-15,
                 1.562715e+04,
                 4.877642e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        D = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF = Substance {
    name             = "SF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.420818e+00,
                 4.551120e-03,
                -7.937256e-06,
                 6.500471e-09,
                -2.028966e-12,
                 3.960950e+02,
                 6.547006e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.369089e+00,
                 1.920442e-04,
                -6.663036e-08,
                 1.244859e-11,
                -7.653749e-16,
                 2.201853e+02,
                 2.075969e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF_plus = Substance {
    name             = "SF+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.666665e+00,
                 5.697549e-03,
                -7.605742e-06,
                 4.911946e-09,
                -1.241451e-12,
                 1.183103e+05,
                 1.051502e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.280725e+00,
                 1.036743e-04,
                 5.544166e-08,
                -1.143330e-11,
                 5.584691e-16,
                 1.179219e+05,
                 2.459395e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF_minus = Substance {
    name             = "SF-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.759794e+00,
                 6.865822e-03,
                -1.131452e-05,
                 8.874637e-09,
                -2.678427e-12,
                -2.348631e+04,
                 8.993507e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.127067e+00,
                 6.256934e-04,
                -3.124699e-07,
                 7.172248e-11,
                -4.706140e-15,
                -2.373488e+04,
                 2.553694e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 1.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF2 = Substance {
    name             = "SF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.410306e+00,
                 1.559012e-02,
                -2.317802e-05,
                 1.658350e-08,
                -4.646576e-12,
                -3.691637e+04,
                 1.350668e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.119420e+00,
                 1.005142e-03,
                -4.465331e-07,
                 8.762401e-11,
                -6.323651e-15,
                -3.771424e+04,
                -4.557174e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF2_plus = Substance {
    name             = "SF2+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.427149e+00,
                 1.551755e-02,
                -2.306026e-05,
                 1.649961e-08,
                -4.624642e-12,
                 8.323956e+04,
                 1.412789e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.120900e+00,
                 9.998482e-04,
                -4.399293e-07,
                 8.436814e-11,
                -5.779538e-15,
                 8.244459e+04,
                -3.863075e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF2_minus = Substance {
    name             = "SF2-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.290050e+00,
                 1.553861e-02,
                -2.723660e-05,
                 2.218280e-08,
                -6.886216e-12,
                -4.939193e+04,
                 9.817478e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.584712e+00,
                 4.788609e-04,
                -2.140544e-07,
                 4.217570e-11,
                -3.052391e-15,
                -5.000571e+04,
                -5.733348e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 2.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF3 = Substance {
    name             = "SF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.877773e+00,
                 3.123404e-02,
                -5.157138e-05,
                 4.024732e-08,
                -1.211059e-11,
                -6.206794e+04,
                 1.636944e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.807690e+00,
                 1.367168e-03,
                -6.080833e-07,
                 1.188302e-10,
                -8.447091e-15,
                -6.344049e+04,
                -1.676489e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF3_plus = Substance {
    name             = "SF3+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.001851e+00,
                 2.975515e-02,
                -4.335679e-05,
                 3.055496e-08,
                -8.463348e-12,
                 4.604418e+04,
                 1.944450e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.138502e+00,
                 2.128891e-03,
                -9.483682e-07,
                 1.860744e-10,
                -1.327173e-14,
                 4.448673e+04,
                -1.542124e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF3_minus = Substance {
    name             = "SF3-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.878876e+00,
                 3.122617e-02,
                -5.155175e-05,
                 4.022679e-08,
                -1.210293e-11,
                -9.494705e+04,
                 1.564598e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.809583e+00,
                 1.364368e-03,
                -6.075732e-07,
                 1.194053e-10,
                -8.625933e-15,
                -9.632026e+04,
                -1.749437e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 3.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF4 = Substance {
    name             = "SF4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.281964e+00,
                 4.356990e-02,
                -7.012517e-05,
                 5.367724e-08,
                -1.591436e-11,
                -9.358670e+04,
                 1.841987e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.112438e+01,
                 2.145799e-03,
                -9.545244e-07,
                 1.874611e-10,
                -1.353595e-14,
                -9.558167e+04,
                -2.887565e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF4_plus = Substance {
    name             = "SF4+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.961581e+00,
                 4.213209e-02,
                -6.915557e-05,
                 5.372067e-08,
                -1.610589e-11,
                 4.809474e+04,
                 1.637990e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.135194e+01,
                 1.887566e-03,
                -8.390406e-07,
                 1.641494e-10,
                -1.173519e-14,
                 4.622477e+04,
                -2.857151e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF4_minus = Substance {
    name             = "SF4-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.079376e+00,
                 3.783950e-02,
                -6.690466e-05,
                 5.482243e-08,
                -1.709284e-11,
                -1.091464e+05,
                 5.641788e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.200333e+01,
                 1.200771e-03,
                -5.739827e-07,
                 1.229938e-10,
                -9.295273e-15,
                -1.106031e+05,
                -3.165927e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 4.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF5 = Substance {
    name             = "SF5",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.714766e+00,
                 6.871601e-02,
                -1.140793e-04,
                 8.933638e-08,
                -2.694043e-11,
                -1.109618e+05,
                 3.027247e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.361056e+01,
                 2.652313e-03,
                -1.169146e-06,
                 2.424513e-10,
                -1.831472e-14,
                -1.140029e+05,
                -4.301510e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF5_plus = Substance {
    name             = "SF5+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -1.716486e+00,
                 6.894005e-02,
                -1.147105e-04,
                 8.997787e-08,
                -2.716633e-11,
                 1.906115e+04,
                 2.944451e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.368422e+01,
                 2.517702e-03,
                -1.085439e-06,
                 2.253375e-10,
                -1.722392e-14,
                 1.600491e+04,
                -4.419972e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 5.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF5_minus = Substance {
    name             = "SF5-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.847765e+00,
                 5.837637e-02,
                -1.013131e-04,
                 8.195698e-08,
                -2.531951e-11,
                -1.549933e+05,
                 1.385388e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.432191e+01,
                 1.931303e-03,
                -8.621994e-07,
                 1.697240e-10,
                -1.227486e-14,
                -1.573431e+05,
                -4.515925e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 5.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF6 = Substance {
    name             = "SF6",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -3.838809e+00,
                 8.322172e-02,
                -1.318169e-04,
                 9.963615e-08,
                -2.924877e-11,
                -1.483648e+05,
                 3.716114e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.516295e+01,
                 4.384232e-03,
                -1.948634e-06,
                 3.824720e-10,
                -2.760505e-14,
                -1.522680e+05,
                -5.441572e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 6.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SF6_minus = Substance {
    name             = "SF6-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -3.260927e+00,
                 8.269537e-02,
                -1.329981e-04,
                 1.017377e-07,
                -3.014638e-11,
                -1.631086e+05,
                 3.542334e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.542865e+01,
                 4.084532e-03,
                -1.816490e-06,
                 3.566733e-10,
                -2.575000e-14,
                -1.668988e+05,
                -5.439612e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        F = 6.0,
        E = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SH = Substance {
    name             = "SH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.442032e+00,
                -2.435920e-03,
                 1.906458e-06,
                 9.916663e-10,
                -9.574076e-13,
                 1.552326e+04,
                -1.144490e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.001454e+00,
                 1.339496e-03,
                -4.678966e-07,
                 7.880401e-11,
                -5.028045e-15,
                 1.590532e+04,
                 6.284627e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        H = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SN = Substance {
    name             = "SN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.942297e+00,
                -2.003551e-03,
                 7.353464e-06,
                -7.516856e-09,
                 2.559110e-12,
                 3.056395e+04,
                 4.580308e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.849398e+00,
                 7.275679e-04,
                -2.937020e-07,
                 5.501363e-11,
                -3.812355e-15,
                 3.045996e+04,
                 4.431274e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SO = Substance {
    name             = "SO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.149023e+00,
                 1.183935e-03,
                 2.574069e-06,
                -4.444342e-09,
                 1.873516e-12,
                -4.040757e+02,
                 8.319879e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.014287e+00,
                 2.702282e-04,
                 8.289667e-08,
                -3.432374e-11,
                 3.112144e-15,
                -7.105196e+02,
                 3.499735e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SOF2 = Substance {
    name             = "SOF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.474907e+00,
                 2.095243e-02,
                -2.416428e-05,
                 1.212038e-08,
                -1.933873e-12,
                -6.689760e+04,
                 1.419734e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.087421e+00,
                 2.109572e-03,
                -9.086691e-07,
                 1.734483e-10,
                -1.221416e-14,
                -6.823816e+04,
                -1.385559e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        O = 1.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SO2 = Substance {
    name             = "SO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.266534e+00,
                 5.323790e-03,
                 6.843755e-07,
                -5.281005e-09,
                 2.559045e-12,
                -3.690815e+04,
                 9.664651e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.245136e+00,
                 1.970420e-03,
                -8.037577e-07,
                 1.514997e-10,
                -1.055800e-14,
                -3.755823e+04,
                -1.074049e+00,
            }
        )
    },
    elements         = {
        S = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SO2CLF = Substance {
    name             = "SO2CLF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.981753e+00,
                 2.644917e-02,
                -2.920018e-05,
                 1.395761e-08,
                -2.030449e-12,
                -6.876150e+04,
                 1.273168e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.011829e+01,
                 3.148899e-03,
                -1.347151e-06,
                 2.558031e-10,
                -1.793826e-14,
                -7.050929e+04,
                -2.312785e+01,
            }
        )
    },
    elements         = {
        S  = 1.0,
        O  = 2.0,
        Cl = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SO2CL2 = Substance {
    name             = "SO2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.385168e+00,
                 2.321216e-02,
                -2.653211e-05,
                 1.349992e-08,
                -2.281928e-12,
                -4.480297e+04,
                 6.578679e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.055094e+01,
                 2.673430e-03,
                -1.142823e-06,
                 2.168620e-10,
                -1.519915e-14,
                -4.629506e+04,
                -2.430786e+01,
            }
        )
    },
    elements         = {
        S  = 1.0,
        O  = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SO2F2 = Substance {
    name             = "SO2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.732468e+00,
                 2.850176e-02,
                -2.945380e-05,
                 1.240130e-08,
                -1.171553e-12,
                -9.278139e+04,
                 1.694841e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.607888e+00,
                 3.711103e-03,
                -1.589911e-06,
                 3.023246e-10,
                -2.122858e-14,
                -9.475477e+04,
                -2.284894e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        O = 2.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SO3 = Substance {
    name             = "SO3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.578038e+00,
                 1.455634e-02,
                -9.176417e-06,
                -7.920302e-10,
                 1.970947e-12,
                -4.893175e+04,
                 1.226514e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.075738e+00,
                 3.176339e-03,
                -1.353576e-06,
                 2.563091e-10,
                -1.793604e-14,
                -5.021138e+04,
                -1.118752e+01,
            }
        )
    },
    elements         = {
        S = 1.0,
        O = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S2 = Substance {
    name             = "S2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.858575e+00,
                 5.175835e-03,
                -6.549343e-06,
                 3.399864e-09,
                -4.015677e-13,
                 1.441240e+04,
                 9.891278e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.988607e+00,
                 5.577505e-04,
                -5.018928e-08,
                -1.547032e-11,
                 2.666177e-15,
                 1.419801e+04,
                 4.491192e+00,
            }
        )
    },
    elements         = {
        S = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S2CL = Substance {
    name             = "S2CL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.974269e+00,
                 1.907829e-02,
                -3.762654e-05,
                 3.403750e-08,
                -1.156847e-11,
                 7.989230e+03,
                 1.384244e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.623204e+00,
                 4.182846e-04,
                -1.756591e-07,
                 3.097184e-11,
                -1.751559e-15,
                 7.374959e+03,
                -2.985119e+00,
            }
        )
    },
    elements         = {
        S  = 2.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S2CL2 = Substance {
    name             = "S2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.479057e+00,
                 3.253700e-02,
                -6.639046e-05,
                 6.211248e-08,
                -2.171123e-11,
                -4.022256e+03,
                 1.227918e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 9.468410e+00,
                 1.121864e-03,
                -6.927843e-07,
                 1.386545e-10,
                -9.293978e-15,
                -5.050195e+03,
                -1.529504e+01,
            }
        )
    },
    elements         = {
        S  = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S2F2_thiothiony = Substance {
    name             = "S2F2,thiothiony",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.493724e+00,
                 3.425756e-02,
                -5.946568e-05,
                 4.876903e-08,
                -1.537617e-11,
                -4.981035e+04,
                 1.873751e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 8.940187e+00,
                 1.104502e-03,
                -4.362277e-07,
                 7.462985e-11,
                -4.620440e-15,
                -5.125747e+04,
                -1.667391e+01,
            }
        )
    },
    elements         = {
        S = 2.0,
        F = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S2O = Substance {
    name             = "S2O",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.841426e+00,
                 1.218841e-02,
                -1.600024e-05,
                 1.030929e-08,
                -2.644912e-12,
                -8.060301e+03,
                 1.291807e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.903752e+00,
                 1.236998e-03,
                -5.457079e-07,
                 1.065984e-10,
                -7.668824e-15,
                -8.775209e+03,
                -2.269998e+00,
            }
        )
    },
    elements         = {
        S = 2.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_S8 = Substance {
    name             = "S8",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.197005e+00,
                 9.155036e-02,
                -1.912636e-04,
                 1.801772e-07,
                -6.303937e-11,
                 8.120717e+03,
                 7.580439e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.072495e+01,
                 1.346861e-03,
                -5.372259e-07,
                 9.281229e-11,
                -5.819513e-15,
                 5.533443e+03,
                -6.748053e+01,
            }
        )
    },
    elements         = {
        S = 8.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Si = Substance {
    name             = "Si",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.764762e+00,
                -7.120710e-03,
                 1.573183e-05,
                -1.538250e-08,
                 5.531949e-12,
                 5.320508e+04,
                 3.021688e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.580612e+00,
                -2.060447e-04,
                 1.930517e-07,
                -4.564851e-11,
                 3.364117e-15,
                 5.338299e+04,
                 5.606574e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Si_plus = Substance {
    name             = "Si+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.244191e+00,
                -7.511609e-03,
                 1.333683e-05,
                -1.094061e-08,
                 3.413572e-12,
                 1.484088e+05,
                -2.789173e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.647946e+00,
                -1.601090e-04,
                 6.540242e-08,
                -1.162247e-11,
                 7.559613e-16,
                 1.487034e+05,
                 4.731718e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiBr = Substance {
    name             = "SiBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.971979e+00,
                 4.774528e-03,
                -1.113068e-05,
                 1.068120e-08,
                -3.672638e-12,
                 2.698630e+04,
                 6.111957e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.668169e+00,
                -1.016941e-04,
                 7.083899e-08,
                -1.433486e-11,
                 1.407674e-15,
                 2.693346e+04,
                 3.224973e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiBr2 = Substance {
    name             = "SiBr2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.671973e+00,
                 1.029290e-02,
                -1.871402e-05,
                 1.563790e-08,
                -4.945652e-12,
                -8.003916e+03,
                 7.726655e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.722477e+00,
                 3.805793e-04,
                -2.013859e-07,
                 4.435117e-11,
                -2.923965e-15,
                -8.359298e+03,
                -1.819557e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiBr3 = Substance {
    name             = "SiBr3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.772960e+00,
                 1.837179e-02,
                -3.301933e-05,
                 2.736786e-08,
                -8.603879e-12,
                -2.655455e+04,
                 5.186270e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.585497e+00,
                 4.792385e-04,
                -2.146059e-07,
                 4.233827e-11,
                -3.067079e-15,
                -2.724451e+04,
                -1.270131e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        Br = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiBr4 = Substance {
    name             = "SiBr4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.610894e+00,
                 2.323938e-02,
                -4.154575e-05,
                 3.430524e-08,
                -1.075508e-11,
                -5.296821e+04,
                -3.099039e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.245609e+01,
                 6.284438e-04,
                -2.812895e-07,
                 5.547441e-11,
                -4.017596e-15,
                -5.385052e+04,
                -2.586091e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        Br = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiC = Substance {
    name             = "SiC",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                -2.192470e+00,
                 4.134270e-02,
                -7.827411e-05,
                 6.069412e-08,
                -1.672921e-11,
                 8.595314e+04,
                 2.876924e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.579903e+00,
                -1.340934e-03,
                 7.548305e-07,
                -1.654378e-10,
                 1.266335e-14,
                 8.504612e+04,
                -5.650196e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiC2 = Substance {
    name             = "SiC2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.880633e+00,
                 6.794777e-03,
                -5.027796e-06,
                 1.057323e-09,
                 2.551314e-13,
                 7.255825e+04,
                 4.550567e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.701152e+00,
                 2.122069e-03,
                -1.145777e-06,
                 3.103877e-10,
                -2.776390e-14,
                 7.202339e+04,
                -4.973732e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        C  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiC4H12 = Substance {
    name             = "SiC4H12",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 4.946186e+00,
                 4.114297e-02,
                -2.932337e-07,
                -2.290037e-08,
                 1.095668e-11,
                -3.773105e+04,
                 3.186311e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.156370e+01,
                 3.281121e-02,
                -1.263709e-05,
                 2.268685e-09,
                -1.542695e-13,
                -4.013814e+04,
                -3.363412e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        C  = 4.0,
        H  = 12.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiCL = Substance {
    name             = "SiCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.739653e+00,
                 3.116472e-03,
                -5.247438e-06,
                 4.201254e-09,
                -1.288722e-12,
                 2.263826e+04,
                 6.567350e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.398289e+00,
                 1.674079e-04,
                -5.360625e-08,
                 9.573155e-12,
                -4.453089e-16,
                 2.251315e+04,
                 3.444958e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiCL2 = Substance {
    name             = "SiCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.710996e+00,
                 1.396635e-02,
                -2.471105e-05,
                 2.025922e-08,
                -6.319370e-12,
                -2.182595e+04,
                 9.461582e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.630789e+00,
                 4.385328e-04,
                -1.981135e-07,
                 3.700587e-11,
                -2.071439e-15,
                -2.236072e+04,
                -4.274870e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiCL3 = Substance {
    name             = "SiCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.262703e+00,
                 2.405087e-02,
                -4.218488e-05,
                 3.437393e-08,
                -1.067446e-11,
                -4.898121e+04,
                 8.405239e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.359463e+00,
                 7.383484e-04,
                -3.299405e-07,
                 6.498997e-11,
                -4.702324e-15,
                -4.993007e+04,
                -1.564801e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiCL4 = Substance {
    name             = "SiCL4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.104001e+00,
                 2.493311e-02,
                -3.670326e-05,
                 2.444875e-08,
                -6.037016e-12,
                -8.235927e+04,
                -9.764005e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.208966e+01,
                 1.019074e-03,
                -4.416786e-07,
                 8.448157e-11,
                -5.949158e-15,
                -8.359025e+04,
                -2.992693e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiF = Substance {
    name             = "SiF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.245353e+00,
                 2.970233e-03,
                -2.485799e-06,
                 5.630484e-10,
                 1.441603e-13,
                -3.494427e+03,
                 7.884435e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.122783e+00,
                 4.680489e-04,
                -1.867767e-07,
                 3.524209e-11,
                -2.301505e-15,
                -3.725862e+03,
                 3.388587e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiF2 = Substance {
    name             = "SiF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.514824e+00,
                 1.450416e-02,
                -2.059478e-05,
                 1.413018e-08,
                -3.813233e-12,
                -7.194243e+04,
                 1.300463e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.056210e+00,
                 1.072195e-03,
                -4.712976e-07,
                 9.017476e-11,
                -6.137090e-15,
                -7.272708e+04,
                -4.359948e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiF3 = Substance {
    name             = "SiF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.348022e+00,
                 2.466503e-02,
                -3.510935e-05,
                 2.423269e-08,
                -6.590942e-12,
                -1.320687e+05,
                 1.459018e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.348819e+00,
                 1.877237e-03,
                -8.317713e-07,
                 1.629072e-10,
                -1.173853e-14,
                -1.333999e+05,
                -1.483439e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiF4 = Substance {
    name             = "SiF4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.189307e+00,
                 3.370201e-02,
                -4.672318e-05,
                 3.158464e-08,
                -8.450611e-12,
                -1.960329e+05,
                 1.330047e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.047847e+01,
                 2.858676e-03,
                -1.264631e-06,
                 2.474686e-10,
                -1.782430e-14,
                -1.979055e+05,
                -2.750748e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        F  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH = Substance {
    name             = "SiH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.336295e+00,
                -5.051242e-03,
                 1.142310e-05,
                -9.389065e-09,
                 2.771815e-12,
                 4.415071e+04,
                 1.882147e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.045319e+00,
                 1.558753e-03,
                -6.207268e-07,
                 1.151827e-10,
                -7.628977e-15,
                 4.433113e+04,
                 6.044655e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH_plus = Substance {
    name             = "SiH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.729259e+00,
                -1.788161e-03,
                 4.246926e-06,
                -2.558013e-09,
                 4.063374e-13,
                 1.369707e+05,
                 1.583873e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.982859e+00,
                 1.545522e-03,
                -5.903855e-07,
                 1.051740e-10,
                -6.822023e-15,
                 1.370795e+05,
                 5.040350e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiHBr3 = Substance {
    name             = "SiHBr3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.337011e+00,
                 2.887299e-02,
                -4.695412e-05,
                 3.752304e-08,
                -1.163492e-11,
                -3.866383e+04,
                 1.032167e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.027483e+01,
                 2.866610e-03,
                -1.211258e-06,
                 2.300492e-10,
                -1.623350e-14,
                -3.984658e+04,
                -1.803407e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 1.0,
        Br = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiHCL3 = Substance {
    name             = "SiHCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.674204e+00,
                 3.438038e-02,
                -5.495386e-05,
                 4.310333e-08,
                -1.315701e-11,
                -6.160172e+04,
                 1.433351e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.933563e+00,
                 3.248122e-03,
                -1.378717e-06,
                 2.626607e-10,
                -1.857489e-14,
                -6.307085e+04,
                -2.047206e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiHF3 = Substance {
    name             = "SiHF3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 9.065482e-01,
                 3.326527e-02,
                -4.392883e-05,
                 2.932837e-08,
                -7.864919e-12,
                -1.458420e+05,
                 1.997327e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.754883e+00,
                 4.552776e-03,
                -1.947753e-06,
                 3.730079e-10,
                -2.647397e-14,
                -1.476566e+05,
                -1.882698e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 1.0,
        F  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiHI3 = Substance {
    name             = "SiHI3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.521122e+00,
                 2.484105e-02,
                -4.083398e-05,
                 3.306839e-08,
                -1.037377e-11,
                -1.140719e+04,
                 7.784670e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.053360e+01,
                 2.588800e-03,
                -1.092190e-06,
                 2.072069e-10,
                -1.460985e-14,
                -1.239734e+04,
                -1.609503e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 1.0,
        I  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH2 = Substance {
    name             = "SiH2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 5.310785e+00,
                -1.446994e-02,
                 5.142715e-05,
                -5.473347e-08,
                 1.928829e-11,
                 2.821339e+04,
                -2.822419e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.859386e+00,
                 1.638256e-03,
                -8.439625e-07,
                 1.832333e-10,
                -1.411437e-14,
                 2.716570e+04,
                -1.006463e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH2Br2 = Substance {
    name             = "SiH2Br2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.000743e+00,
                 3.028263e-02,
                -4.468734e-05,
                 3.441143e-08,
                -1.054872e-11,
                -2.450751e+04,
                 1.856674e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.169260e+00,
                 5.028560e-03,
                -2.109756e-06,
                 3.987216e-10,
                -2.803584e-14,
                -2.584247e+04,
                -1.137119e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 2.0,
        Br = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH2CL2 = Substance {
    name             = "SiH2CL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.026494e+00,
                 3.301359e-02,
                -4.796106e-05,
                 3.622568e-08,
                -1.092045e-11,
                -3.996339e+04,
                 2.062886e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.912140e+00,
                 5.312789e-03,
                -2.233673e-06,
                 4.227481e-10,
                -2.975568e-14,
                -4.146850e+04,
                -1.288676e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 2.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH2F2 = Substance {
    name             = "SiH2F2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.937600e-01,
                 3.007988e-02,
                -3.587414e-05,
                 2.266856e-08,
                -5.918592e-12,
                -9.623033e+04,
                 2.286075e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.098186e+00,
                 6.214649e-03,
                -2.627235e-06,
                 4.990909e-10,
                -3.522164e-14,
                -9.791874e+04,
                -1.167257e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 2.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH2I2 = Substance {
    name             = "SiH2I2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.656281e+00,
                 2.862618e-02,
                -4.300370e-05,
                 3.370803e-08,
                -1.047555e-11,
                -6.325261e+03,
                 1.727093e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.357310e+00,
                 4.816359e-03,
                -2.016145e-06,
                 3.804370e-10,
                -2.672058e-14,
                -7.541767e+03,
                -1.029735e+01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 2.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH3 = Substance {
    name             = "SiH3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.050681e+00,
                 3.310328e-03,
                 1.109400e-05,
                -1.448349e-08,
                 5.188035e-12,
                 2.405142e+04,
                 7.294821e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.127038e+00,
                 6.183887e-03,
                -2.612210e-06,
                 4.957970e-10,
                -3.496052e-14,
                 2.340680e+04,
                 1.518084e-01,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH3Br = Substance {
    name             = "SiH3Br",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.006034e+00,
                 2.530788e-02,
                -3.039643e-05,
                 2.108215e-08,
                -6.205540e-12,
                -1.060536e+04,
                 1.946754e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.135036e+00,
                 7.111291e-03,
                -2.973508e-06,
                 5.606186e-10,
                -3.935085e-14,
                -1.187990e+04,
                -6.178266e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 3.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH3CL = Substance {
    name             = "SiH3CL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.830798e-01,
                 2.616173e-02,
                -3.085407e-05,
                 2.087840e-08,
                -6.015368e-12,
                -1.816198e+04,
                 2.023654e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.991972e+00,
                 7.271894e-03,
                -3.044159e-06,
                 5.743962e-10,
                -4.034093e-14,
                -1.951493e+04,
                -6.867644e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 3.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH3F = Substance {
    name             = "SiH3F",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.736973e-01,
                 2.337104e-02,
                -2.192597e-05,
                 1.143867e-08,
                -2.621760e-12,
                -4.626868e+04,
                 2.045413e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.573612e+00,
                 7.741008e-03,
                -3.250276e-06,
                 6.145479e-10,
                -4.322377e-14,
                -4.768849e+04,
                -6.210023e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 3.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH3I = Substance {
    name             = "SiH3I",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.365932e+00,
                 2.459257e-02,
                -2.999179e-05,
                 2.121514e-08,
                -6.348297e-12,
                -1.525835e+03,
                 1.864040e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.268666e+00,
                 6.965230e-03,
                -2.910274e-06,
                 5.484147e-10,
                -3.848009e-14,
                -2.737353e+03,
                -5.828452e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 3.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiH4 = Substance {
    name             = "SiH4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 1.592264e+00,
                 1.284109e-02,
                -1.945628e-06,
                -4.310637e-09,
                 1.987488e-12,
                 3.105594e+03,
                 1.183360e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.209204e+00,
                 9.082263e-03,
                -3.790540e-06,
                 7.136989e-10,
                -5.004629e-14,
                 2.134463e+03,
                -2.727687e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        H  = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiI = Substance {
    name             = "SiI",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.804471e+00,
                 1.220531e-02,
                -2.587700e-05,
                 2.317097e-08,
                -7.579847e-12,
                 3.652949e+04,
                 1.187531e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.974953e+00,
                -4.080192e-04,
                 1.919967e-07,
                -3.888655e-11,
                 3.855242e-15,
                 3.626173e+04,
                 2.301669e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        I  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiI2 = Substance {
    name             = "SiI2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.321551e+00,
                 1.442734e-02,
                -3.105176e-05,
                 2.983193e-08,
                -1.057855e-11,
                 9.412182e+03,
                 1.081786e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 6.743119e+00,
                 3.619832e-04,
                -1.952786e-07,
                 4.358232e-11,
                -2.899868e-15,
                 9.069754e+03,
                 1.290972e-02,
            }
        )
    },
    elements         = {
        Si = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiN = Substance {
    name             = "SiN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.105196e+00,
                 1.485245e-03,
                 1.856106e-06,
                -3.773488e-09,
                 1.683533e-12,
                 4.378571e+04,
                 7.888561e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.985862e+00,
                -8.792706e-06,
                 5.426954e-07,
                -1.795102e-10,
                 1.633707e-14,
                 4.352481e+04,
                 3.174680e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiO = Substance {
    name             = "SiO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.252828e+00,
                 4.182313e-04,
                 3.780620e-06,
                -5.102448e-09,
                 1.947132e-12,
                -1.309034e+04,
                 6.661743e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.747883e+00,
                 8.199194e-04,
                -3.252540e-07,
                 5.732496e-11,
                -3.510894e-15,
                -1.331743e+04,
                 3.661003e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiO2 = Substance {
    name             = "SiO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.262806e+00,
                 8.501658e-03,
                -5.738814e-06,
                 1.289657e-11,
                 9.754498e-13,
                -3.803597e+04,
                 6.668075e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.862039e+00,
                 1.771978e-03,
                -7.519419e-07,
                 1.418058e-10,
                -9.885642e-15,
                -3.876782e+04,
                -6.847187e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SiS = Substance {
    name             = "SiS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.843069e+00,
                 5.115028e-03,
                -6.331607e-06,
                 3.438733e-09,
                -6.262339e-13,
                 1.171893e+04,
                 9.446192e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.173577e+00,
                 3.928260e-04,
                -1.500517e-07,
                 2.324256e-11,
                -6.056887e-16,
                 1.141775e+04,
                 2.868882e+00,
            }
        )
    },
    elements         = {
        Si = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Si2 = Substance {
    name             = "Si2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.815539e+00,
                -1.909654e-04,
                 5.923342e-06,
                -5.764960e-09,
                 1.477500e-12,
                 6.978465e+04,
                 5.740719e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.047414e+00,
                 5.399003e-04,
                -4.307838e-07,
                 1.135521e-10,
                -9.626287e-15,
                 6.913318e+04,
                -1.910295e+00,
            }
        )
    },
    elements         = {
        Si = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Si2C = Substance {
    name             = "Si2C",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.043894e+00,
                 7.345696e-03,
                -6.641255e-06,
                 2.488505e-09,
                -1.819656e-13,
                 6.293542e+04,
                 4.184412e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.251099e+00,
                 1.322418e-03,
                -7.280521e-07,
                 2.326942e-10,
                -2.328515e-14,
                 6.230100e+04,
                -7.283479e+00,
            }
        )
    },
    elements         = {
        Si = 2.0,
        C  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Si2N = Substance {
    name             = "Si2N",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.668674e+00,
                 1.130184e-02,
                -1.363712e-05,
                 7.168805e-09,
                -1.237831e-12,
                 4.631808e+04,
                 7.122710e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.670991e+00,
                 9.191788e-04,
                -3.951713e-07,
                 7.439714e-11,
                -5.028469e-15,
                 4.562015e+04,
                -7.798278e+00,
            }
        )
    },
    elements         = {
        Si = 2.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Si3 = Substance {
    name             = "Si3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.597913e+00,
                 1.071527e-02,
                -1.610042e-05,
                 1.096921e-08,
                -2.783288e-12,
                 7.476632e+04,
                 3.455330e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.421336e+00,
                -1.170995e-04,
                 8.982077e-08,
                 7.193596e-12,
                -2.567084e-15,
                 7.414670e+04,
                -1.035211e+01,
            }
        )
    },
    elements         = {
        Si = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Sr = Substance {
    name             = "Sr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.897918e+04,
                 5.557821e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.052400e+00,
                 1.195164e-03,
                -1.074534e-06,
                 3.575310e-10,
                -3.056133e-14,
                 1.910410e+04,
                 7.880299e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrBr = Substance {
    name             = "SrBr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.097007e+00,
                 1.932106e-03,
                -3.506889e-06,
                 2.996619e-09,
                -9.633170e-13,
                -1.200064e+04,
                 7.934385e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.343616e+00,
                 3.989594e-04,
                -2.597613e-07,
                 7.932075e-11,
                -6.608383e-15,
                -1.202507e+04,
                 6.873711e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        Br = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrCL = Substance {
    name             = "SrCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.903618e+00,
                 2.463443e-03,
                -3.877696e-06,
                 2.830337e-09,
                -7.730412e-13,
                -1.613974e+04,
                 7.516647e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.334442e+00,
                 3.895211e-04,
                -2.446131e-07,
                 7.328436e-11,
                -5.973332e-15,
                -1.620878e+04,
                 5.525256e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrCL2 = Substance {
    name             = "SrCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.890714e+00,
                 4.494279e-03,
                -7.298940e-06,
                 5.358814e-09,
                -1.473063e-12,
                -5.881640e+04,
                 3.425251e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.896436e+00,
                 1.178872e-04,
                -5.185408e-08,
                 1.004883e-11,
                -7.158435e-16,
                -5.900690e+04,
                -1.354348e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrF = Substance {
    name             = "SrF",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.271395e+00,
                 4.621335e-03,
                -6.900775e-06,
                 4.723358e-09,
                -1.204681e-12,
                -3.655563e+04,
                 9.107021e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.245716e+00,
                 4.663359e-04,
                -2.692590e-07,
                 7.356008e-11,
                -5.721376e-15,
                -3.674030e+04,
                 4.466079e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrF_plus = Substance {
    name             = "SrF+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.109379e+00,
                 5.027004e-03,
                -7.268934e-06,
                 4.794850e-09,
                -1.168385e-12,
                 2.260720e+04,
                 9.074110e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.613552e+00,
                -2.181092e-03,
                 1.221525e-06,
                -1.633297e-10,
                 3.258451e-15,
                 2.188214e+04,
                -3.901420e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        F  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrF2 = Substance {
    name             = "SrF2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.813552e+00,
                 8.382160e-03,
                -1.299953e-05,
                 9.135439e-09,
                -2.398988e-12,
                -9.385054e+04,
                 5.664080e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.754789e+00,
                 2.776196e-04,
                -1.215888e-07,
                 2.347878e-11,
                -1.667519e-15,
                -9.423363e+04,
                -3.641954e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        F  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrI2 = Substance {
    name             = "SrI2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.045041e+00,
                 1.884170e-03,
                -3.117515e-06,
                 2.329939e-09,
                -6.523213e-13,
                -3.522301e+04,
                 2.578218e-01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.460368e+00,
                 4.540348e-05,
                -2.009327e-08,
                 3.915551e-12,
                -2.803098e-16,
                -3.530033e+04,
                -1.708769e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        I  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrO = Substance {
    name             = "SrO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.733000e+00,
                 6.739942e-03,
                -1.080048e-05,
                 8.176794e-09,
                -2.361987e-12,
                -2.644357e+03,
                 1.050129e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.640302e+00,
                -1.128515e-02,
                 7.884232e-06,
                -1.903588e-09,
                 1.514655e-13,
                -4.749949e+03,
                -2.579817e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrOH = Substance {
    name             = "SrOH",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.527649e+00,
                 1.736485e-02,
                -3.173572e-05,
                 2.690965e-08,
                -8.527010e-12,
                -2.601268e+04,
                 1.126033e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.357084e+00,
                 1.735073e-03,
                -6.833965e-07,
                 1.410707e-10,
                -1.041504e-14,
                -2.638917e+04,
                -1.387388e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrOH_plus = Substance {
    name             = "SrOH+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.610181e+00,
                 1.706768e-02,
                -3.127556e-05,
                 2.657085e-08,
                -8.430139e-12,
                 3.727523e+04,
                 1.020409e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.495198e+00,
                 1.421407e-03,
                -4.324502e-07,
                 6.234243e-11,
                -3.479748e-15,
                 3.687411e+04,
                -2.770684e+00,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        O  = 1.0,
        H  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrO2H2 = Substance {
    name             = "SrO2H2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.365885e+00,
                 3.370994e-02,
                -6.202817e-05,
                 5.284327e-08,
                -1.679605e-11,
                -7.370937e+04,
                 9.785597e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.023267e+00,
                 2.804910e-03,
                -8.479101e-07,
                 1.213249e-10,
                -6.715418e-15,
                -7.448504e+04,
                -1.560267e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        O  = 2.0,
        H  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_SrS = Substance {
    name             = "SrS",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.486332e+00,
                 4.384131e-03,
                -7.506755e-06,
                 5.819282e-09,
                -1.635320e-12,
                 1.183485e+04,
                 8.352631e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 8.983470e+00,
                -1.099569e-02,
                 8.658842e-06,
                -2.295548e-09,
                 1.965968e-13,
                 1.030142e+04,
                -2.007627e+01,
            }
        )
    },
    elements         = {
        Sr = 1.0,
        S  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ta = Substance {
    name             = "Ta",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.838163e+00,
                -2.787856e-03,
                 6.897333e-06,
                -4.557175e-09,
                 9.412527e-13,
                 9.327879e+04,
                 6.668937e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.510909e+00,
                 2.702950e-03,
                -1.070559e-06,
                 2.023885e-10,
                -1.397017e-14,
                 9.351776e+04,
                 1.298271e+01,
            }
        )
    },
    elements         = {
        Ta = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TaO = Substance {
    name             = "TaO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.934011e+00,
                 3.059204e-03,
                -1.939636e-06,
                 1.628883e-10,
                 3.015254e-13,
                 2.215447e+04,
                 1.145465e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.499660e+00,
                 1.511253e-03,
                -6.538458e-07,
                 1.778431e-10,
                -1.691940e-14,
                 2.199415e+04,
                 8.526959e+00,
            }
        )
    },
    elements         = {
        Ta = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TaO2 = Substance {
    name             = "TaO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.180383e+00,
                 9.470281e-03,
                -8.734687e-06,
                 2.452269e-09,
                 3.365342e-13,
                -2.545176e+04,
                 1.313035e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.970167e+00,
                 1.179213e-03,
                -5.651741e-07,
                 1.311379e-10,
                -1.056444e-14,
                -2.616948e+04,
                -1.073998e+00,
            }
        )
    },
    elements         = {
        Ta = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ti = Substance {
    name             = "Ti",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.144481e+00,
                -6.804690e-03,
                 1.188678e-05,
                -9.752235e-09,
                 3.090644e-12,
                 5.594384e+04,
                -3.481878e-01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.037743e+00,
                -1.111171e-03,
                 7.585711e-07,
                -1.270738e-10,
                 6.908193e-15,
                 5.612367e+04,
                 4.730019e+00,
            }
        )
    },
    elements         = {
        Ti = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ti_plus = Substance {
    name             = "Ti+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.795111e+00,
                 2.522312e-03,
                -5.631214e-06,
                 4.163712e-09,
                -1.014433e-12,
                 1.359960e+05,
                 5.619516e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 3.673716e+00,
                -1.485595e-03,
                 7.822667e-07,
                -1.438532e-10,
                 8.952844e-15,
                 1.358557e+05,
                 1.531502e+00,
            }
        )
    },
    elements         = {
        Ti = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Ti_minus = Substance {
    name             = "Ti-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 3.589586e+00,
                -4.914444e-03,
                 9.064832e-06,
                -7.662284e-09,
                 2.447242e-12,
                 5.438698e+04,
                 2.769156e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.585261e+00,
                -9.084195e-05,
                 3.643233e-08,
                -6.316401e-12,
                 3.970350e-16,
                 5.456435e+04,
                 7.457111e+00,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TiCL = Substance {
    name             = "TiCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.854309e+00,
                 7.959334e-03,
                -9.821116e-06,
                 5.241998e-09,
                -9.798618e-13,
                 1.744122e+04,
                 1.173022e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.296976e+00,
                -1.640169e-04,
                 1.571976e-07,
                -3.856709e-11,
                 3.073966e-15,
                 1.685767e+04,
                -4.944727e-01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TiCL2 = Substance {
    name             = "TiCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.972347e+00,
                 1.127733e-02,
                -2.058192e-05,
                 1.718665e-08,
                -5.404959e-12,
                -3.036628e+04,
                 2.559096e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 7.762485e+00,
                -9.387243e-04,
                 8.012152e-07,
                -1.904803e-10,
                 1.496154e-14,
                -3.091581e+04,
                -1.075260e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TiCL3 = Substance {
    name             = "TiCL3",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.880156e+00,
                 3.355893e-02,
                -5.995746e-05,
                 4.886366e-08,
                -1.509099e-11,
                -6.677602e+04,
                 1.395821e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.000810e+01,
                 4.193637e-04,
                -2.150487e-07,
                 4.533702e-11,
                -3.454684e-15,
                -6.806125e+04,
                -1.951065e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        Cl = 3.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TiCL4 = Substance {
    name             = "TiCL4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 6.949676e+00,
                 2.604966e-02,
                -4.652030e-05,
                 3.838483e-08,
                -1.202791e-11,
                -9.467783e+04,
                -2.925751e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.238603e+01,
                 7.093132e-04,
                -3.174608e-07,
                 6.260396e-11,
                -4.533704e-15,
                -9.566908e+04,
                -2.847160e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TiO = Substance {
    name             = "TiO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.119888e+00,
                 3.120249e-03,
                -1.329707e-06,
                -1.333836e-09,
                 9.631583e-13,
                 5.486872e+03,
                 9.442612e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.136018e+00,
                 7.392646e-04,
                -4.544446e-07,
                 1.304366e-10,
                -1.152256e-14,
                 5.198348e+03,
                 4.122370e+00,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TiOCL = Substance {
    name             = "TiOCL",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.409386e+00,
                 1.517055e-02,
                -2.442848e-05,
                 1.873452e-08,
                -5.568068e-12,
                -3.088785e+04,
                 8.694426e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.831992e+00,
                 7.635939e-04,
                -3.395309e-07,
                 6.666707e-11,
                -4.813295e-15,
                -3.158231e+04,
                -7.753816e+00,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 1.0,
        Cl = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TiOCL2 = Substance {
    name             = "TiOCL2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 5.440814e+00,
                 1.770505e-02,
                -2.952524e-05,
                 2.324733e-08,
                -7.047978e-12,
                -6.780685e+04,
                 3.450773e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 9.336866e+00,
                 7.596999e-04,
                -3.382738e-07,
                 6.648386e-11,
                -4.803379e-15,
                -6.857265e+04,
                -1.514418e+01,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 1.0,
        Cl = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_TiO2 = Substance {
    name             = "TiO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.014272e+00,
                 1.094210e-02,
                -1.287859e-05,
                 7.118953e-09,
                -1.492751e-12,
                -3.802050e+04,
                 1.136440e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.845506e+00,
                 1.393821e-03,
                -6.640306e-07,
                 1.385738e-10,
                -9.884218e-15,
                -3.870059e+04,
                -2.795999e+00,
            }
        )
    },
    elements         = {
        Ti = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_V = Substance {
    name             = "V",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 4.517369e+00,
                -7.929066e-03,
                 1.338084e-05,
                -8.828290e-09,
                 1.894531e-12,
                 6.090142e+04,
                -1.969718e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 2.917785e+00,
                 4.623689e-04,
                -4.973203e-07,
                 1.677523e-10,
                -1.520255e-14,
                 6.106427e+04,
                 5.106215e+00,
            }
        )
    },
    elements         = {
        V = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_VCL4 = Substance {
    name             = "VCL4",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 7.116646e+00,
                 2.542322e-02,
                -4.549902e-05,
                 3.758389e-08,
                -1.178034e-11,
                -6.612389e+04,
                -2.330955e+00,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 1.271865e+01,
                 1.660018e-05,
                 1.416150e-07,
                -3.476183e-11,
                 2.288976e-15,
                -6.718799e+04,
                -2.884801e+01,
            }
        )
    },
    elements         = {
        V  = 1.0,
        Cl = 4.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_VN = Substance {
    name             = "VN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.723359e+00,
                 4.164299e-03,
                -2.191281e-06,
                -1.235187e-09,
                 1.079183e-12,
                 6.192789e+04,
                 1.141736e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 4.185228e+00,
                 6.151472e-04,
                -3.577634e-07,
                 1.074886e-10,
                -9.727551e-15,
                 6.151154e+04,
                 3.776187e+00,
            }
        )
    },
    elements         = {
        V = 1.0,
        N = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_VO = Substance {
    name             = "VO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 2.943844e+00,
                 2.905923e-03,
                -9.951658e-07,
                -1.408659e-09,
                 9.243851e-13,
                 1.435275e+04,
                 1.018643e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 3.911470e+00,
                 7.754779e-04,
                -4.226379e-07,
                 1.160884e-10,
                -1.007072e-14,
                 1.406520e+04,
                 5.071854e+00,
            }
        )
    },
    elements         = {
        V = 1.0,
        O = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_VO2 = Substance {
    name             = "VO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.193786e+00,
                 9.297946e-03,
                -8.342247e-06,
                 2.104917e-09,
                 4.458265e-13,
                -2.927549e+04,
                 1.128722e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 5.947015e+00,
                 1.168678e-03,
                -5.053638e-07,
                 9.672361e-11,
                -6.824588e-15,
                -2.998380e+04,
                -2.738025e+00,
            }
        )
    },
    elements         = {
        V = 1.0,
        O = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Xe = Substance {
    name             = "Xe",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                -8.991413e-14,
                 2.521969e-16,
                -2.921867e-19,
                 1.189492e-22,
                -7.453750e+02,
                 6.164420e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.500053e+00,
                -1.051365e-07,
                 6.753269e-11,
                -1.709449e-14,
                 1.476810e-18,
                -7.453942e+02,
                 6.164129e+00,
            }
        )
    },
    elements         = {
        Xe = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Xe_plus = Substance {
    name             = "Xe+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 1000.00,
            NASA7 {
                 2.500075e+00,
                -6.256142e-07,
                 1.864310e-09,
                -2.355995e-12,
                 1.072194e-15,
                 1.407611e+05,
                 7.550404e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.583506e+00,
                -1.534888e-04,
                 8.095946e-08,
                -1.142892e-11,
                 4.820814e-16,
                 1.407301e+05,
                 7.090571e+00,
            }
        )
    },
    elements         = {
        Xe = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Zn = Substance {
    name             = "Zn",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                -4.893832e-12,
                 1.380121e-14,
                -1.586797e-17,
                 6.384988e-21,
                 1.493805e+04,
                 5.118861e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.512337e+00,
                -2.928594e-05,
                 2.431302e-08,
                -8.390588e-12,
                 1.026769e-15,
                 1.493414e+04,
                 5.053311e+00,
            }
        )
    },
    elements         = {
        Zn = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Zn_plus = Substance {
    name             = "Zn+",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.239490e+05,
                 5.812008e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.480696e+00,
                 3.360210e-05,
                -1.602872e-08,
                 1.437950e-12,
                 2.928987e-16,
                 1.239564e+05,
                 5.919217e+00,
            }
        )
    },
    elements         = {
        Zn = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Zn_minus = Substance {
    name             = "Zn-",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            298.15, 6000.00,
            NASA7 {
                 2.500000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 0.000000e+00,
                 1.246887e+04,
                 5.812021e+00,
            }
        )
    },
    elements         = {
        Zn = 1.0,
        E  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_Zr = Substance {
    name             = "Zr",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 1.236559e+00,
                 1.282808e-02,
                -2.721384e-05,
                 2.332373e-08,
                -7.094435e-12,
                 7.262456e+04,
                 1.195814e+01,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 2.542942e+00,
                 6.228897e-04,
                -1.074326e-07,
                 2.387445e-11,
                -2.176323e-15,
                 7.279182e+04,
                 7.579515e+00,
            }
        )
    },
    elements         = {
        Zr = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ZrN = Substance {
    name             = "ZrN",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 3.071887e+00,
                 2.643005e-03,
                 3.184994e-07,
                -3.633506e-09,
                 2.026796e-12,
                 8.476849e+04,
                 9.805890e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 4.143789e+00,
                 4.043072e-04,
                -1.446331e-07,
                 2.476064e-11,
                -1.542802e-15,
                 8.446142e+04,
                 4.159379e+00,
            }
        )
    },
    elements         = {
        Zr = 1.0,
        N  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ZrO = Substance {
    name             = "ZrO",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            200.00, 1000.00,
            NASA7 {
                 4.122916e+00,
                -1.318862e-02,
                 6.929224e-05,
                -9.587193e-08,
                 4.103061e-11,
                 9.007492e+03,
                 5.569459e+00,
            }
        ),
        Range(
            1000.00, 6000.00,
            NASA7 {
                 7.296960e+00,
                -2.901193e-03,
                 1.159576e-06,
                -1.802990e-10,
                 1.017589e-14,
                 7.681804e+03,
                -1.421926e+01,
            }
        )
    },
    elements         = {
        Zr = 1.0,
        O  = 1.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

local s_ZrO2 = Substance {
    name             = "ZrO2",
    molar_volume     = 24465.402,
    s0               = 0.0,
    ranges           = {
        Range(
            300.00, 1000.00,
            NASA7 {
                 3.210378e+00,
                 1.162898e-02,
                -1.557536e-05,
                 1.004424e-08,
                -2.543889e-12,
                -3.577561e+04,
                 1.177387e+01,
            }
        ),
        Range(
            1000.00, 5000.00,
            NASA7 {
                 6.141854e+00,
                 9.770370e-04,
                -4.333718e-07,
                 8.495459e-11,
                -6.126665e-15,
                -3.644618e+04,
                -2.709789e+00,
            }
        )
    },
    elements         = {
        Zr = 1.0,
        O  = 2.0,
    },
    reference        = "",
    aggregation_type = "Gas",
}

return {
    ["AL(cr)"] = s_AL_cr_,
    ["AL(L)"] = s_AL_L_,
    ["ALBr3(s)"] = s_ALBr3_s_,
    ["ALBr3(L)"] = s_ALBr3_L_,
    ["ALCL3(s)"] = s_ALCL3_s_,
    ["ALCL3(L)"] = s_ALCL3_L_,
    ["ALF3(a)"] = s_ALF3_a_,
    ["ALF3(b)"] = s_ALF3_b_,
    ["ALF3(L)"] = s_ALF3_L_,
    ["ALI3(s)"] = s_ALI3_s_,
    ["ALI3(L)"] = s_ALI3_L_,
    ["ALN(s)"] = s_ALN_s_,
    ["AL2O3(a)"] = s_AL2O3_a_,
    ["AL2O3(L)"] = s_AL2O3_L_,
    ["AL2SiO5(an)"] = s_AL2SiO5_an_,
    ["AL6Si2O13(s)"] = s_AL6Si2O13_s_,
    ["B(b)"] = s_B_b_,
    ["B(L)"] = s_B_L_,
    ["BN(s)"] = s_BN_s_,
    ["B2O3(L)"] = s_B2O3_L_,
    ["B3O3H3(cr)"] = s_B3O3H3_cr_,
    ["Ba(cr)"] = s_Ba_cr_,
    ["Ba(L)"] = s_Ba_L_,
    ["BaBr2(s)"] = s_BaBr2_s_,
    ["BaBr2(L)"] = s_BaBr2_L_,
    ["BaCL2(a)"] = s_BaCL2_a_,
    ["BaCL2(b)"] = s_BaCL2_b_,
    ["BaCL2(L)"] = s_BaCL2_L_,
    ["BaF2(a)"] = s_BaF2_a_,
    ["BaF2(b,c)"] = s_BaF2_b_c_,
    ["BaF2(L)"] = s_BaF2_L_,
    ["BaO(s)"] = s_BaO_s_,
    ["BaO(L)"] = s_BaO_L_,
    ["BaO2H2(s)"] = s_BaO2H2_s_,
    ["BaO2H2(L)"] = s_BaO2H2_L_,
    ["BaS(s)"] = s_BaS_s_,
    ["Be(a)"] = s_Be_a_,
    ["Be(b)"] = s_Be_b_,
    ["Be(L)"] = s_Be_L_,
    ["BeAL2O4(s)"] = s_BeAL2O4_s_,
    ["BeAL2O4(L)"] = s_BeAL2O4_L_,
    ["BeBr2(s)"] = s_BeBr2_s_,
    ["BeCL2(s)"] = s_BeCL2_s_,
    ["BeCL2(L)"] = s_BeCL2_L_,
    ["BeF2(Lqz)"] = s_BeF2_Lqz_,
    ["BeF2(hqz)"] = s_BeF2_hqz_,
    ["BeF2(L)"] = s_BeF2_L_,
    ["BeI2(s)"] = s_BeI2_s_,
    ["BeI2(L)"] = s_BeI2_L_,
    ["BeO(a)"] = s_BeO_a_,
    ["BeO(b)"] = s_BeO_b_,
    ["BeO(L)"] = s_BeO_L_,
    ["BeO2H2(b)"] = s_BeO2H2_b_,
    ["BeS(s)"] = s_BeS_s_,
    ["Be2C(s)"] = s_Be2C_s_,
    ["Be2C(L)"] = s_Be2C_L_,
    ["Br2(cr)"] = s_Br2_cr_,
    ["Br2(L)"] = s_Br2_L_,
    ["C(gr)"] = s_C_gr_,
    ["C6H6(L)"] = s_C6H6_L_,
    ["C7H8(L)"] = s_C7H8_L_,
    ["C8H18(L),n-octa"] = s_C8H18_L__n_minusocta,
    ["Jet-A(L)"] = s_Jet_minusA_L_,
    ["Ca(a)"] = s_Ca_a_,
    ["Ca(b)"] = s_Ca_b_,
    ["Ca(L)"] = s_Ca_L_,
    ["CaBr2(s)"] = s_CaBr2_s_,
    ["CaBr2(L)"] = s_CaBr2_L_,
    ["CaCO3(caL)"] = s_CaCO3_caL_,
    ["CaCL2(s)"] = s_CaCL2_s_,
    ["CaCL2(L)"] = s_CaCL2_L_,
    ["CaF2(a)"] = s_CaF2_a_,
    ["CaF2(b)"] = s_CaF2_b_,
    ["CaF2(L)"] = s_CaF2_L_,
    ["CaO(s)"] = s_CaO_s_,
    ["CaO(L)"] = s_CaO_L_,
    ["CaO2H2(s)"] = s_CaO2H2_s_,
    ["CaS(s)"] = s_CaS_s_,
    ["CaSO4(s)"] = s_CaSO4_s_,
    ["Cr(cr)"] = s_Cr_cr_,
    ["Cr(L)"] = s_Cr_L_,
    ["CrN(s)"] = s_CrN_s_,
    ["Cr2N(s)"] = s_Cr2N_s_,
    ["Cr2O3(s)"] = s_Cr2O3_s_,
    ["Cr2O3(L)"] = s_Cr2O3_L_,
    ["Cs(cr)"] = s_Cs_cr_,
    ["Cs(L)"] = s_Cs_L_,
    ["CsCL(a)"] = s_CsCL_a_,
    ["CsCL(b)"] = s_CsCL_b_,
    ["CsCL(L)"] = s_CsCL_L_,
    ["CsF(s)"] = s_CsF_s_,
    ["CsF(L)"] = s_CsF_L_,
    ["CsOH(a)"] = s_CsOH_a_,
    ["CsOH(b)"] = s_CsOH_b_,
    ["CsOH(c)"] = s_CsOH_c_,
    ["CsOH(L)"] = s_CsOH_L_,
    ["Cs2SO4(II)"] = s_Cs2SO4_II_,
    ["Cs2SO4(I)"] = s_Cs2SO4_I_,
    ["Cs2SO4(L)"] = s_Cs2SO4_L_,
    ["Cu(cr)"] = s_Cu_cr_,
    ["Cu(L)"] = s_Cu_L_,
    ["CuF(s)"] = s_CuF_s_,
    ["CuF2(s)"] = s_CuF2_s_,
    ["CuF2(L)"] = s_CuF2_L_,
    ["CuO(s)"] = s_CuO_s_,
    ["CuO2H2(s)"] = s_CuO2H2_s_,
    ["CuSO4(s)"] = s_CuSO4_s_,
    ["Cu2O(s)"] = s_Cu2O_s_,
    ["Cu2O(L)"] = s_Cu2O_L_,
    ["Cu2O5S(s)"] = s_Cu2O5S_s_,
    ["Fe(a)"] = s_Fe_a_,
    ["Fe(c)"] = s_Fe_c_,
    ["Fe(d)"] = s_Fe_d_,
    ["Fe(L)"] = s_Fe_L_,
    ["FeC5O5(L)"] = s_FeC5O5_L_,
    ["FeCL2(s)"] = s_FeCL2_s_,
    ["FeCL2(L)"] = s_FeCL2_L_,
    ["FeCL3(s)"] = s_FeCL3_s_,
    ["FeCL3(L)"] = s_FeCL3_L_,
    ["FeO(s)"] = s_FeO_s_,
    ["FeO(L)"] = s_FeO_L_,
    ["Fe(OH)2(s)"] = s_Fe_OH_2_s_,
    ["Fe(OH)3(s)"] = s_Fe_OH_3_s_,
    ["FeS(a)"] = s_FeS_a_,
    ["FeS(b)"] = s_FeS_b_,
    ["FeS(c)"] = s_FeS_c_,
    ["FeS(L)"] = s_FeS_L_,
    ["FeSO4(s)"] = s_FeSO4_s_,
    ["FeS2(s)"] = s_FeS2_s_,
    ["Fe2O3(s)"] = s_Fe2O3_s_,
    ["Fe2S3O12(s)"] = s_Fe2S3O12_s_,
    ["Fe3O4(s)"] = s_Fe3O4_s_,
    ["H2O(s)"] = s_H2O_s_,
    ["H2O(L)"] = s_H2O_L_,
    ["H2SO4(L)"] = s_H2SO4_L_,
    ["Hg(cr)"] = s_Hg_cr_,
    ["Hg(L)"] = s_Hg_L_,
    ["HgBr2(s)"] = s_HgBr2_s_,
    ["HgBr2(L)"] = s_HgBr2_L_,
    ["HgO(s)"] = s_HgO_s_,
    ["I2(cr)"] = s_I2_cr_,
    ["I2(L)"] = s_I2_L_,
    ["K(cr)"] = s_K_cr_,
    ["K(L)"] = s_K_L_,
    ["KCN(s)"] = s_KCN_s_,
    ["KCN(L)"] = s_KCN_L_,
    ["KCL(s)"] = s_KCL_s_,
    ["KCL(L)"] = s_KCL_L_,
    ["KF(s)"] = s_KF_s_,
    ["KF(L)"] = s_KF_L_,
    ["KHF2(a)"] = s_KHF2_a_,
    ["KHF2(b)"] = s_KHF2_b_,
    ["KHF2(L)"] = s_KHF2_L_,
    ["KOH(a)"] = s_KOH_a_,
    ["KOH(b)"] = s_KOH_b_,
    ["KOH(L)"] = s_KOH_L_,
    ["KO2(s)"] = s_KO2_s_,
    ["K2CO3(s)"] = s_K2CO3_s_,
    ["K2CO3(L)"] = s_K2CO3_L_,
    ["K2O(s)"] = s_K2O_s_,
    ["K2O2(s)"] = s_K2O2_s_,
    ["K2S(1)"] = s_K2S_1_,
    ["K2S(2)"] = s_K2S_2_,
    ["K2S(3)"] = s_K2S_3_,
    ["K2S(L)"] = s_K2S_L_,
    ["K2SO4(a)"] = s_K2SO4_a_,
    ["K2SO4(b)"] = s_K2SO4_b_,
    ["K2SO4(L)"] = s_K2SO4_L_,
    ["Li(cr)"] = s_Li_cr_,
    ["Li(L)"] = s_Li_L_,
    ["LiALO2(s)"] = s_LiALO2_s_,
    ["LiALO2(L)"] = s_LiALO2_L_,
    ["LiCL(s)"] = s_LiCL_s_,
    ["LiCL(L)"] = s_LiCL_L_,
    ["LiF(s)"] = s_LiF_s_,
    ["LiF(L)"] = s_LiF_L_,
    ["LiH(s)"] = s_LiH_s_,
    ["LiH(L)"] = s_LiH_L_,
    ["LiOH(s)"] = s_LiOH_s_,
    ["LiOH(L)"] = s_LiOH_L_,
    ["Li2O(s)"] = s_Li2O_s_,
    ["Li2O(L)"] = s_Li2O_L_,
    ["Li2SO4(a)"] = s_Li2SO4_a_,
    ["Li2SO4(b)"] = s_Li2SO4_b_,
    ["Li2SO4(L)"] = s_Li2SO4_L_,
    ["Li3N(s)"] = s_Li3N_s_,
    ["Mg(cr)"] = s_Mg_cr_,
    ["Mg(L)"] = s_Mg_L_,
    ["MgAL2O4(s)"] = s_MgAL2O4_s_,
    ["MgAL2O4(L)"] = s_MgAL2O4_L_,
    ["MgBr2(s)"] = s_MgBr2_s_,
    ["MgBr2(L)"] = s_MgBr2_L_,
    ["MgCO3(s)"] = s_MgCO3_s_,
    ["MgCL2(s)"] = s_MgCL2_s_,
    ["MgCL2(L)"] = s_MgCL2_L_,
    ["MgF2(s)"] = s_MgF2_s_,
    ["MgF2(L)"] = s_MgF2_L_,
    ["MgI2(s)"] = s_MgI2_s_,
    ["MgI2(L)"] = s_MgI2_L_,
    ["MgO(s)"] = s_MgO_s_,
    ["MgO(L)"] = s_MgO_L_,
    ["MgO2H2(s)"] = s_MgO2H2_s_,
    ["MgS(s)"] = s_MgS_s_,
    ["MgSO4(s)"] = s_MgSO4_s_,
    ["MgSO4(L)"] = s_MgSO4_L_,
    ["MgSiO3(I)"] = s_MgSiO3_I_,
    ["MgSiO3(II)"] = s_MgSiO3_II_,
    ["MgSiO3(III)"] = s_MgSiO3_III_,
    ["MgSiO3(L)"] = s_MgSiO3_L_,
    ["MgTiO3(s)"] = s_MgTiO3_s_,
    ["MgTiO3(L)"] = s_MgTiO3_L_,
    ["MgTi2O5(s)"] = s_MgTi2O5_s_,
    ["MgTi2O5(L)"] = s_MgTi2O5_L_,
    ["Mg2SiO4(s)"] = s_Mg2SiO4_s_,
    ["Mg2SiO4(L)"] = s_Mg2SiO4_L_,
    ["Mg2TiO4(s)"] = s_Mg2TiO4_s_,
    ["Mg2TiO4(L)"] = s_Mg2TiO4_L_,
    ["Mo(cr)"] = s_Mo_cr_,
    ["Mo(L)"] = s_Mo_L_,
    ["NH4CL(a)"] = s_NH4CL_a_,
    ["NH4CL(b)"] = s_NH4CL_b_,
    ["Na(cr)"] = s_Na_cr_,
    ["Na(L)"] = s_Na_L_,
    ["NaALO2(a)"] = s_NaALO2_a_,
    ["NaALO2(b)"] = s_NaALO2_b_,
    ["NaBr(s)"] = s_NaBr_s_,
    ["NaBr(L)"] = s_NaBr_L_,
    ["NaCN(s)"] = s_NaCN_s_,
    ["NaCN(L)"] = s_NaCN_L_,
    ["NaCL(s)"] = s_NaCL_s_,
    ["NaCL(L)"] = s_NaCL_L_,
    ["NaF(s)"] = s_NaF_s_,
    ["NaF(L)"] = s_NaF_L_,
    ["NaI(s)"] = s_NaI_s_,
    ["NaI(L)"] = s_NaI_L_,
    ["NaOH(a)"] = s_NaOH_a_,
    ["NaOH(L)"] = s_NaOH_L_,
    ["NaO2(s)"] = s_NaO2_s_,
    ["Na2CO3(I)"] = s_Na2CO3_I_,
    ["Na2CO3(II)"] = s_Na2CO3_II_,
    ["Na2CO3(L)"] = s_Na2CO3_L_,
    ["Na2O(c)"] = s_Na2O_c_,
    ["Na2O(a)"] = s_Na2O_a_,
    ["Na2O(L)"] = s_Na2O_L_,
    ["Na2O2(a)"] = s_Na2O2_a_,
    ["Na2O2(b)"] = s_Na2O2_b_,
    ["Na2S(1)"] = s_Na2S_1_,
    ["Na2S(2)"] = s_Na2S_2_,
    ["Na2S(L)"] = s_Na2S_L_,
    ["Na2SO4(V)"] = s_Na2SO4_V_,
    ["Na2SO4(IV)"] = s_Na2SO4_IV_,
    ["Na2SO4(I)"] = s_Na2SO4_I_,
    ["Na2SO4(L)"] = s_Na2SO4_L_,
    ["Na3ALF6(a)"] = s_Na3ALF6_a_,
    ["Na3ALF6(b)"] = s_Na3ALF6_b_,
    ["Na3ALF6(L)"] = s_Na3ALF6_L_,
    ["Na5AL3F14(s)"] = s_Na5AL3F14_s_,
    ["Na5AL3F14(L)"] = s_Na5AL3F14_L_,
    ["Nb(cr)"] = s_Nb_cr_,
    ["Nb(L)"] = s_Nb_L_,
    ["NbO(s)"] = s_NbO_s_,
    ["NbO(L)"] = s_NbO_L_,
    ["NbO2(I)"] = s_NbO2_I_,
    ["NbO2(II)"] = s_NbO2_II_,
    ["NbO2(III)"] = s_NbO2_III_,
    ["NbO2(L)"] = s_NbO2_L_,
    ["Nb2O5(s)"] = s_Nb2O5_s_,
    ["Nb2O5(L)"] = s_Nb2O5_L_,
    ["Ni(cr)"] = s_Ni_cr_,
    ["Ni(L)"] = s_Ni_L_,
    ["NiS(b)"] = s_NiS_b_,
    ["NiS(a)"] = s_NiS_a_,
    ["NiS(L)"] = s_NiS_L_,
    ["NiS2(s)"] = s_NiS2_s_,
    ["NiS2(L)"] = s_NiS2_L_,
    ["Ni3S2(I)"] = s_Ni3S2_I_,
    ["Ni3S2(II)"] = s_Ni3S2_II_,
    ["Ni3S2(L)"] = s_Ni3S2_L_,
    ["Ni3S4(s)"] = s_Ni3S4_s_,
    ["P(cr)"] = s_P_cr_,
    ["P(L)"] = s_P_L_,
    ["P4O10(s)"] = s_P4O10_s_,
    ["Pb(cr)"] = s_Pb_cr_,
    ["Pb(L)"] = s_Pb_L_,
    ["PbBr2(s)"] = s_PbBr2_s_,
    ["PbBr2(L)"] = s_PbBr2_L_,
    ["PbCL2(s)"] = s_PbCL2_s_,
    ["PbCL2(L)"] = s_PbCL2_L_,
    ["PbF2(a)"] = s_PbF2_a_,
    ["PbF2(b)"] = s_PbF2_b_,
    ["PbF2(L)"] = s_PbF2_L_,
    ["PbI2(s)"] = s_PbI2_s_,
    ["PbI2(L)"] = s_PbI2_L_,
    ["PbO(rd)"] = s_PbO_rd_,
    ["PbO(yw)"] = s_PbO_yw_,
    ["PbO(L)"] = s_PbO_L_,
    ["PbO2(s)"] = s_PbO2_s_,
    ["PbS(s)"] = s_PbS_s_,
    ["PbS(L)"] = s_PbS_L_,
    ["Pb3O4(s)"] = s_Pb3O4_s_,
    ["S(cr1)"] = s_S_cr1_,
    ["S(cr2)"] = s_S_cr2_,
    ["S(L)"] = s_S_L_,
    ["SCL2(L)"] = s_SCL2_L_,
    ["S2CL2(L)"] = s_S2CL2_L_,
    ["Si(cr)"] = s_Si_cr_,
    ["Si(L)"] = s_Si_L_,
    ["SiC(b)"] = s_SiC_b_,
    ["SiO2(Lqz)"] = s_SiO2_Lqz_,
    ["SiO2(hqz)"] = s_SiO2_hqz_,
    ["SiO2(L)"] = s_SiO2_L_,
    ["Si2N2O(s)"] = s_Si2N2O_s_,
    ["Si3N4(a)"] = s_Si3N4_a_,
    ["Sr(a)"] = s_Sr_a_,
    ["Sr(b)"] = s_Sr_b_,
    ["Sr(L)"] = s_Sr_L_,
    ["SrCL2(a)"] = s_SrCL2_a_,
    ["SrCL2(b)"] = s_SrCL2_b_,
    ["SrCL2(L)"] = s_SrCL2_L_,
    ["SrF2(s)"] = s_SrF2_s_,
    ["SrF2(L)"] = s_SrF2_L_,
    ["SrO(s)"] = s_SrO_s_,
    ["SrO(L)"] = s_SrO_L_,
    ["SrO2H2(s)"] = s_SrO2H2_s_,
    ["SrO2H2(L)"] = s_SrO2H2_L_,
    ["SrS(s)"] = s_SrS_s_,
    ["Ta(cr)"] = s_Ta_cr_,
    ["Ta(L)"] = s_Ta_L_,
    ["TaC(s)"] = s_TaC_s_,
    ["TaC(L)"] = s_TaC_L_,
    ["Ta2O5(s)"] = s_Ta2O5_s_,
    ["Ta2O5(L)"] = s_Ta2O5_L_,
    ["Ti(a)"] = s_Ti_a_,
    ["Ti(b)"] = s_Ti_b_,
    ["Ti(L)"] = s_Ti_L_,
    ["TiC(s)"] = s_TiC_s_,
    ["TiC(L)"] = s_TiC_L_,
    ["TiCL2(s)"] = s_TiCL2_s_,
    ["TiCL3(s)"] = s_TiCL3_s_,
    ["TiCL4(L)"] = s_TiCL4_L_,
    ["TiN(s)"] = s_TiN_s_,
    ["TiN(L)"] = s_TiN_L_,
    ["TiO(a)"] = s_TiO_a_,
    ["TiO(b)"] = s_TiO_b_,
    ["TiO(L)"] = s_TiO_L_,
    ["TiO2(ru)"] = s_TiO2_ru_,
    ["TiO2(L)"] = s_TiO2_L_,
    ["Ti2O3(a)"] = s_Ti2O3_a_,
    ["Ti2O3(b)"] = s_Ti2O3_b_,
    ["Ti2O3(L)"] = s_Ti2O3_L_,
    ["Ti3O5(a)"] = s_Ti3O5_a_,
    ["Ti3O5(b)"] = s_Ti3O5_b_,
    ["Ti3O5(L)"] = s_Ti3O5_L_,
    ["Ti4O7(s)"] = s_Ti4O7_s_,
    ["Ti4O7(L)"] = s_Ti4O7_L_,
    ["V(cr)"] = s_V_cr_,
    ["V(L)"] = s_V_L_,
    ["VCL2(s)"] = s_VCL2_s_,
    ["VCL3(s)"] = s_VCL3_s_,
    ["VCL4(L)"] = s_VCL4_L_,
    ["VN(s)"] = s_VN_s_,
    ["VO(s)"] = s_VO_s_,
    ["VO(L)"] = s_VO_L_,
    ["V2O3(s)"] = s_V2O3_s_,
    ["V2O3(L)"] = s_V2O3_L_,
    ["V2O4(I)"] = s_V2O4_I_,
    ["V2O4(II)"] = s_V2O4_II_,
    ["V2O4(L)"] = s_V2O4_L_,
    ["V2O5(s)"] = s_V2O5_s_,
    ["V2O5(L)"] = s_V2O5_L_,
    ["Zn(cr)"] = s_Zn_cr_,
    ["Zn(L)"] = s_Zn_L_,
    ["ZnSO4(a)"] = s_ZnSO4_a_,
    ["ZnSO4(b)"] = s_ZnSO4_b_,
    ["Zr(a)"] = s_Zr_a_,
    ["Zr(b)"] = s_Zr_b_,
    ["Zr(L)"] = s_Zr_L_,
    ["ZrN(s)"] = s_ZrN_s_,
    ["ZrN(L)"] = s_ZrN_L_,
    ["ZrO2(a)"] = s_ZrO2_a_,
    ["ZrO2(b)"] = s_ZrO2_b_,
    ["ZrO2(L)"] = s_ZrO2_L_,
    ["Electron"] = s_Electron,
    ["AL"] = s_AL,
    ["AL+"] = s_AL_plus,
    ["AL-"] = s_AL_minus,
    ["ALBO2"] = s_ALBO2,
    ["ALBr"] = s_ALBr,
    ["ALBr3"] = s_ALBr3,
    ["ALC"] = s_ALC,
    ["ALCL"] = s_ALCL,
    ["ALCL+"] = s_ALCL_plus,
    ["ALCLF"] = s_ALCLF,
    ["ALCLF+"] = s_ALCLF_plus,
    ["ALCLF2"] = s_ALCLF2,
    ["ALCL2"] = s_ALCL2,
    ["ALCL2+"] = s_ALCL2_plus,
    ["ALCL2-"] = s_ALCL2_minus,
    ["ALCL2F"] = s_ALCL2F,
    ["ALCL3"] = s_ALCL3,
    ["ALF"] = s_ALF,
    ["ALF+"] = s_ALF_plus,
    ["ALF2"] = s_ALF2,
    ["ALF2+"] = s_ALF2_plus,
    ["ALF2-"] = s_ALF2_minus,
    ["ALF2O"] = s_ALF2O,
    ["ALF2O-"] = s_ALF2O_minus,
    ["ALF3"] = s_ALF3,
    ["ALF4-"] = s_ALF4_minus,
    ["ALH"] = s_ALH,
    ["ALI"] = s_ALI,
    ["ALI3"] = s_ALI3,
    ["ALN"] = s_ALN,
    ["ALO"] = s_ALO,
    ["ALO+"] = s_ALO_plus,
    ["ALO-"] = s_ALO_minus,
    ["ALOCL"] = s_ALOCL,
    ["ALOF"] = s_ALOF,
    ["ALOH"] = s_ALOH,
    ["ALOH+"] = s_ALOH_plus,
    ["ALOH-"] = s_ALOH_minus,
    ["ALO2"] = s_ALO2,
    ["ALO2-"] = s_ALO2_minus,
    ["ALO2H"] = s_ALO2H,
    ["ALS"] = s_ALS,
    ["AL2"] = s_AL2,
    ["AL2Br6"] = s_AL2Br6,
    ["AL2CL6"] = s_AL2CL6,
    ["AL2F6"] = s_AL2F6,
    ["AL2I6"] = s_AL2I6,
    ["AL2O"] = s_AL2O,
    ["AL2O+"] = s_AL2O_plus,
    ["AL2O2"] = s_AL2O2,
    ["AL2O2+"] = s_AL2O2_plus,
    ["Ar"] = s_Ar,
    ["Ar+"] = s_Ar_plus,
    ["B"] = s_B,
    ["B+"] = s_B_plus,
    ["B-"] = s_B_minus,
    ["BCL"] = s_BCL,
    ["BCL+"] = s_BCL_plus,
    ["BCLF"] = s_BCLF,
    ["BCL2"] = s_BCL2,
    ["BCL2+"] = s_BCL2_plus,
    ["BCL2-"] = s_BCL2_minus,
    ["BCL3"] = s_BCL3,
    ["BF"] = s_BF,
    ["BF2"] = s_BF2,
    ["BF2+"] = s_BF2_plus,
    ["BF2-"] = s_BF2_minus,
    ["BF3"] = s_BF3,
    ["BH"] = s_BH,
    ["BHF2"] = s_BHF2,
    ["BH2"] = s_BH2,
    ["BH3"] = s_BH3,
    ["BN"] = s_BN,
    ["BO"] = s_BO,
    ["BOCL"] = s_BOCL,
    ["BOF"] = s_BOF,
    ["BOF2"] = s_BOF2,
    ["BO2"] = s_BO2,
    ["BO2-"] = s_BO2_minus,
    ["BS"] = s_BS,
    ["B2"] = s_B2,
    ["B2O"] = s_B2O,
    ["B2O2"] = s_B2O2,
    ["B2O3"] = s_B2O3,
    ["B3O3CL3"] = s_B3O3CL3,
    ["B3O3F3"] = s_B3O3F3,
    ["B3O3H3"] = s_B3O3H3,
    ["Ba"] = s_Ba,
    ["BaBr"] = s_BaBr,
    ["BaBr2"] = s_BaBr2,
    ["BaCL"] = s_BaCL,
    ["BaCL2"] = s_BaCL2,
    ["BaF"] = s_BaF,
    ["BaF+"] = s_BaF_plus,
    ["BaF2"] = s_BaF2,
    ["BaOH"] = s_BaOH,
    ["BaOH+"] = s_BaOH_plus,
    ["BaO2H2"] = s_BaO2H2,
    ["BaS"] = s_BaS,
    ["Be"] = s_Be,
    ["Be+"] = s_Be_plus,
    ["BeBO2"] = s_BeBO2,
    ["BeBr"] = s_BeBr,
    ["BeBr2"] = s_BeBr2,
    ["BeCL"] = s_BeCL,
    ["BeCL+"] = s_BeCL_plus,
    ["BeCLF"] = s_BeCLF,
    ["BeCL2"] = s_BeCL2,
    ["BeF"] = s_BeF,
    ["BeF2"] = s_BeF2,
    ["BeH"] = s_BeH,
    ["BeH+"] = s_BeH_plus,
    ["BeI"] = s_BeI,
    ["BeI2"] = s_BeI2,
    ["BeN"] = s_BeN,
    ["BeO"] = s_BeO,
    ["BeOH"] = s_BeOH,
    ["BeOH+"] = s_BeOH_plus,
    ["BeO2H2"] = s_BeO2H2,
    ["BeS"] = s_BeS,
    ["Be2O"] = s_Be2O,
    ["Be2OF2"] = s_Be2OF2,
    ["Be2O2"] = s_Be2O2,
    ["Be3O3"] = s_Be3O3,
    ["Be4O4"] = s_Be4O4,
    ["Br"] = s_Br,
    ["Br2"] = s_Br2,
    ["C"] = s_C,
    ["C+"] = s_C_plus,
    ["C-"] = s_C_minus,
    ["CCL"] = s_CCL,
    ["CCLF3"] = s_CCLF3,
    ["CCL2"] = s_CCL2,
    ["CCL2F2"] = s_CCL2F2,
    ["CCL3"] = s_CCL3,
    ["CCL3F"] = s_CCL3F,
    ["CCL4"] = s_CCL4,
    ["CF"] = s_CF,
    ["CF+"] = s_CF_plus,
    ["CF2"] = s_CF2,
    ["CF2+"] = s_CF2_plus,
    ["CF3"] = s_CF3,
    ["CF3+"] = s_CF3_plus,
    ["CF4"] = s_CF4,
    ["CH"] = s_CH,
    ["CH+"] = s_CH_plus,
    ["CHCL"] = s_CHCL,
    ["CHCLF2"] = s_CHCLF2,
    ["CHCL2F"] = s_CHCL2F,
    ["CHCL3"] = s_CHCL3,
    ["CHF3"] = s_CHF3,
    ["CH2"] = s_CH2,
    ["CH2CLF"] = s_CH2CLF,
    ["CH2CL2"] = s_CH2CL2,
    ["CH2F2"] = s_CH2F2,
    ["CH3"] = s_CH3,
    ["CH3CL"] = s_CH3CL,
    ["CH3F"] = s_CH3F,
    ["CH2OH"] = s_CH2OH,
    ["CH3O"] = s_CH3O,
    ["CH4"] = s_CH4,
    ["CH3OH"] = s_CH3OH,
    ["CN"] = s_CN,
    ["CN+"] = s_CN_plus,
    ["CN-"] = s_CN_minus,
    ["CNN"] = s_CNN,
    ["CO"] = s_CO,
    ["CO+"] = s_CO_plus,
    ["COCL"] = s_COCL,
    ["COCLF"] = s_COCLF,
    ["COCL2"] = s_COCL2,
    ["COF"] = s_COF,
    ["COF2"] = s_COF2,
    ["COS"] = s_COS,
    ["CO2"] = s_CO2,
    ["CO2+"] = s_CO2_plus,
    ["COOH"] = s_COOH,
    ["CP"] = s_CP,
    ["CS"] = s_CS,
    ["CS2"] = s_CS2,
    ["C2"] = s_C2,
    ["C2+"] = s_C2_plus,
    ["C2-"] = s_C2_minus,
    ["C2CL2"] = s_C2CL2,
    ["C2CL4"] = s_C2CL4,
    ["C2CL6"] = s_C2CL6,
    ["C2F2"] = s_C2F2,
    ["C2F4"] = s_C2F4,
    ["C2H"] = s_C2H,
    ["C2HCL"] = s_C2HCL,
    ["C2HF"] = s_C2HF,
    ["CHCO,ketyl"] = s_CHCO_ketyl,
    ["C2H2,acetylene"] = s_C2H2_acetylene,
    ["C2H2,vinylidene"] = s_C2H2_vinylidene,
    ["CH2CO,ketene"] = s_CH2CO_ketene,
    ["C2H3,vinyl"] = s_C2H3_vinyl,
    ["CH3CN"] = s_CH3CN,
    ["CH3CO,acetyl"] = s_CH3CO_acetyl,
    ["C2H4"] = s_C2H4,
    ["C2H4O,ethylen"] = s_C2H4O_ethylen,
    ["CH3CHO,ethanal"] = s_CH3CHO_ethanal,
    ["CH3COOH"] = s_CH3COOH,
    ["(HCOOH)2"] = s__HCOOH_2,
    ["C2H5"] = s_C2H5,
    ["C2H6"] = s_C2H6,
    ["CH3N2CH3"] = s_CH3N2CH3,
    ["CH3OCH3"] = s_CH3OCH3,
    ["C2H5OH"] = s_C2H5OH,
    ["CCN"] = s_CCN,
    ["CNC"] = s_CNC,
    ["C2N2"] = s_C2N2,
    ["C2O"] = s_C2O,
    ["C3"] = s_C3,
    ["C3H3,propargyl"] = s_C3H3_propargyl,
    ["C3H4,allene"] = s_C3H4_allene,
    ["C3H4,propyne"] = s_C3H4_propyne,
    ["C3H4,cyclo-"] = s_C3H4_cyclo_minus,
    ["C3H5,allyl"] = s_C3H5_allyl,
    ["C3H6,propylene"] = s_C3H6_propylene,
    ["C3H6,cyclo-"] = s_C3H6_cyclo_minus,
    ["C3H6O"] = s_C3H6O,
    ["C3H7,n-propyl"] = s_C3H7_n_minuspropyl,
    ["C3H7,i-propyl"] = s_C3H7_i_minuspropyl,
    ["C3H8"] = s_C3H8,
    ["C3H8O,1propanol"] = s_C3H8O_1propanol,
    ["C3H8O,2propanol"] = s_C3H8O_2propanol,
    ["C3O2"] = s_C3O2,
    ["C4"] = s_C4,
    ["C4H2"] = s_C4H2,
    ["C4H4,1,3-cyclo-"] = s_C4H4_1_3_minuscyclo_minus,
    ["C4H6,butadiene"] = s_C4H6_butadiene,
    ["C4H6,2-butyne"] = s_C4H6_2_minusbutyne,
    ["C4H6,cyclo-"] = s_C4H6_cyclo_minus,
    ["C4H8,1-butene"] = s_C4H8_1_minusbutene,
    ["C4H8,cis2-buten"] = s_C4H8_cis2_minusbuten,
    ["C4H8,tr2-butene"] = s_C4H8_tr2_minusbutene,
    ["C4H8,isobutene"] = s_C4H8_isobutene,
    ["C4H8,cyclo-"] = s_C4H8_cyclo_minus,
    ["(CH3COOH)2"] = s__CH3COOH_2,
    ["C4H9,n-butyl"] = s_C4H9_n_minusbutyl,
    ["C4H9,i-butyl"] = s_C4H9_i_minusbutyl,
    ["C4H9,s-butyl"] = s_C4H9_s_minusbutyl,
    ["C4H9,t-butyl"] = s_C4H9_t_minusbutyl,
    ["C4H10,isobutane"] = s_C4H10_isobutane,
    ["C4H10,n-butane"] = s_C4H10_n_minusbutane,
    ["C4N2"] = s_C4N2,
    ["C5"] = s_C5,
    ["C5H6,1,3cyclo-"] = s_C5H6_1_3cyclo_minus,
    ["C5H8,cyclo-"] = s_C5H8_cyclo_minus,
    ["C5H10,1-pentene"] = s_C5H10_1_minuspentene,
    ["C5H10,cyclo-"] = s_C5H10_cyclo_minus,
    ["C5H11,pentyl"] = s_C5H11_pentyl,
    ["C5H11,t-pentyl"] = s_C5H11_t_minuspentyl,
    ["C5H12,n-pentane"] = s_C5H12_n_minuspentane,
    ["C5H12,i-pentane"] = s_C5H12_i_minuspentane,
    ["CH3C(CH3)2CH3"] = s_CH3C_CH3_2CH3,
    ["C6H2"] = s_C6H2,
    ["C6H5,phenyl"] = s_C6H5_phenyl,
    ["C6D5"] = s_C6D5,
    ["C6H5O,phenoxy"] = s_C6H5O_phenoxy,
    ["C6H6"] = s_C6H6,
    ["C6D6"] = s_C6D6,
    ["C6H5OH,phenol"] = s_C6H5OH_phenol,
    ["C6H10,cyclo-"] = s_C6H10_cyclo_minus,
    ["C6H12,1-hexene"] = s_C6H12_1_minushexene,
    ["C6H12,cyclo-"] = s_C6H12_cyclo_minus,
    ["C6H13,n-hexyl"] = s_C6H13_n_minushexyl,
    ["C7H7,benzyl"] = s_C7H7_benzyl,
    ["C7H8"] = s_C7H8,
    ["C7H8O,cresol"] = s_C7H8O_cresol,
    ["C7H14,1-heptene"] = s_C7H14_1_minusheptene,
    ["C7H15,n-heptyl"] = s_C7H15_n_minusheptyl,
    ["C7H16,n-heptane"] = s_C7H16_n_minusheptane,
    ["C8H8,styrene"] = s_C8H8_styrene,
    ["C8H10,ethylbenz"] = s_C8H10_ethylbenz,
    ["C8H16,1-octene"] = s_C8H16_1_minusoctene,
    ["C8H17,n-octyl"] = s_C8H17_n_minusoctyl,
    ["C8H18,isooctane"] = s_C8H18_isooctane,
    ["C8H18,n-octane"] = s_C8H18_n_minusoctane,
    ["C9H19,n-nonyl"] = s_C9H19_n_minusnonyl,
    ["C10H8,naphthale"] = s_C10H8_naphthale,
    ["C10H21,n-decyl"] = s_C10H21_n_minusdecyl,
    ["C12H9,o-bipheny"] = s_C12H9_o_minusbipheny,
    ["O-C12D9"] = s_O_minusC12D9,
    ["C12H10,bipheny"] = s_C12H10_bipheny,
    ["C12D10"] = s_C12D10,
    ["Jet-A(g)"] = s_Jet_minusA_g_,
    ["Ca"] = s_Ca,
    ["Ca+"] = s_Ca_plus,
    ["CaBr"] = s_CaBr,
    ["CaBr2"] = s_CaBr2,
    ["CaCL"] = s_CaCL,
    ["CaCL2"] = s_CaCL2,
    ["CaF"] = s_CaF,
    ["CaF2"] = s_CaF2,
    ["CaI"] = s_CaI,
    ["CaI2"] = s_CaI2,
    ["CaO"] = s_CaO,
    ["CaOH"] = s_CaOH,
    ["CaOH+"] = s_CaOH_plus,
    ["CaO2H2"] = s_CaO2H2,
    ["CaS"] = s_CaS,
    ["Ca2"] = s_Ca2,
    ["CL"] = s_CL,
    ["CL+"] = s_CL_plus,
    ["CL-"] = s_CL_minus,
    ["CLCN"] = s_CLCN,
    ["CLF"] = s_CLF,
    ["CLF3"] = s_CLF3,
    ["CLO"] = s_CLO,
    ["CLO2"] = s_CLO2,
    ["CL2"] = s_CL2,
    ["CL2O"] = s_CL2O,
    ["Cr"] = s_Cr,
    ["CrN"] = s_CrN,
    ["CrO"] = s_CrO,
    ["CrO2"] = s_CrO2,
    ["CrO3"] = s_CrO3,
    ["Cs"] = s_Cs,
    ["Cs+"] = s_Cs_plus,
    ["CsCL"] = s_CsCL,
    ["CsF"] = s_CsF,
    ["CsO"] = s_CsO,
    ["CsOH"] = s_CsOH,
    ["CsOH+"] = s_CsOH_plus,
    ["Cs2"] = s_Cs2,
    ["Cs2CL2"] = s_Cs2CL2,
    ["Cs2F2"] = s_Cs2F2,
    ["Cs2O"] = s_Cs2O,
    ["Cs2O2H2"] = s_Cs2O2H2,
    ["Cs2SO4"] = s_Cs2SO4,
    ["Cu"] = s_Cu,
    ["Cu+"] = s_Cu_plus,
    ["CuCL"] = s_CuCL,
    ["CuF"] = s_CuF,
    ["CuF2"] = s_CuF2,
    ["CuO"] = s_CuO,
    ["Cu2"] = s_Cu2,
    ["Cu3CL3"] = s_Cu3CL3,
    ["D"] = s_D,
    ["D+"] = s_D_plus,
    ["D-"] = s_D_minus,
    ["DCL"] = s_DCL,
    ["DF"] = s_DF,
    ["DOCL"] = s_DOCL,
    ["D2"] = s_D2,
    ["D2+"] = s_D2_plus,
    ["D2-"] = s_D2_minus,
    ["D2O"] = s_D2O,
    ["D2S"] = s_D2S,
    ["F"] = s_F,
    ["F+"] = s_F_plus,
    ["F-"] = s_F_minus,
    ["FCN"] = s_FCN,
    ["FO"] = s_FO,
    ["FO2"] = s_FO2,
    ["F2"] = s_F2,
    ["F2O"] = s_F2O,
    ["FS2F,fluorodisu"] = s_FS2F_fluorodisu,
    ["Fe"] = s_Fe,
    ["Fe+"] = s_Fe_plus,
    ["Fe-"] = s_Fe_minus,
    ["FeC5O5"] = s_FeC5O5,
    ["FeCL"] = s_FeCL,
    ["FeCL2"] = s_FeCL2,
    ["FeCL3"] = s_FeCL3,
    ["FeO"] = s_FeO,
    ["Fe(OH)2"] = s_Fe_OH_2,
    ["Fe2CL4"] = s_Fe2CL4,
    ["Fe2CL6"] = s_Fe2CL6,
    ["H"] = s_H,
    ["H+"] = s_H_plus,
    ["H-"] = s_H_minus,
    ["HALO"] = s_HALO,
    ["HBO"] = s_HBO,
    ["HBO+"] = s_HBO_plus,
    ["HBO-"] = s_HBO_minus,
    ["HBO2"] = s_HBO2,
    ["HBS"] = s_HBS,
    ["HBS+"] = s_HBS_plus,
    ["HBr"] = s_HBr,
    ["HCN"] = s_HCN,
    ["HCO"] = s_HCO,
    ["HCO+"] = s_HCO_plus,
    ["HCCN"] = s_HCCN,
    ["HCL"] = s_HCL,
    ["HD"] = s_HD,
    ["HD+"] = s_HD_plus,
    ["HD-"] = s_HD_minus,
    ["HDO"] = s_HDO,
    ["HF"] = s_HF,
    ["HI"] = s_HI,
    ["HNC"] = s_HNC,
    ["HNCO"] = s_HNCO,
    ["HNO"] = s_HNO,
    ["HNO2"] = s_HNO2,
    ["HNO3"] = s_HNO3,
    ["HOCL"] = s_HOCL,
    ["HOF"] = s_HOF,
    ["HO2"] = s_HO2,
    ["HSO3F"] = s_HSO3F,
    ["H2"] = s_H2,
    ["H2+"] = s_H2_plus,
    ["H2-"] = s_H2_minus,
    ["HCHO,formaldehy"] = s_HCHO_formaldehy,
    ["HCOOH"] = s_HCOOH,
    ["H2F2"] = s_H2F2,
    ["H2O"] = s_H2O,
    ["H2O+"] = s_H2O_plus,
    ["H2O2"] = s_H2O2,
    ["H2S"] = s_H2S,
    ["H2SO4"] = s_H2SO4,
    ["H3B3O6"] = s_H3B3O6,
    ["H3F3"] = s_H3F3,
    ["H3O+"] = s_H3O_plus,
    ["H4F4"] = s_H4F4,
    ["H5F5"] = s_H5F5,
    ["H6F6"] = s_H6F6,
    ["H7F7"] = s_H7F7,
    ["He"] = s_He,
    ["He+"] = s_He_plus,
    ["Hg"] = s_Hg,
    ["HgBr2"] = s_HgBr2,
    ["I"] = s_I,
    ["I2"] = s_I2,
    ["K"] = s_K,
    ["K+"] = s_K_plus,
    ["KBO2"] = s_KBO2,
    ["KCN"] = s_KCN,
    ["KCL"] = s_KCL,
    ["KF"] = s_KF,
    ["KF2-"] = s_KF2_minus,
    ["KH"] = s_KH,
    ["KO"] = s_KO,
    ["KO-"] = s_KO_minus,
    ["KOH"] = s_KOH,
    ["KOH+"] = s_KOH_plus,
    ["K2"] = s_K2,
    ["K2C2N2"] = s_K2C2N2,
    ["K2CL2"] = s_K2CL2,
    ["K2F2"] = s_K2F2,
    ["K2O2H2"] = s_K2O2H2,
    ["K2SO4"] = s_K2SO4,
    ["Kr"] = s_Kr,
    ["Kr+"] = s_Kr_plus,
    ["Li"] = s_Li,
    ["Li+"] = s_Li_plus,
    ["LiALF4"] = s_LiALF4,
    ["LiBO2"] = s_LiBO2,
    ["LiCL"] = s_LiCL,
    ["LiF"] = s_LiF,
    ["LiFO"] = s_LiFO,
    ["LiF2-"] = s_LiF2_minus,
    ["LiH"] = s_LiH,
    ["LiN"] = s_LiN,
    ["LiO"] = s_LiO,
    ["LiO-"] = s_LiO_minus,
    ["LiOH"] = s_LiOH,
    ["LiOH+"] = s_LiOH_plus,
    ["LiON"] = s_LiON,
    ["Li2"] = s_Li2,
    ["Li2CL2"] = s_Li2CL2,
    ["Li2F2"] = s_Li2F2,
    ["Li2O"] = s_Li2O,
    ["Li2O2"] = s_Li2O2,
    ["Li2O2H2"] = s_Li2O2H2,
    ["Li2SO4"] = s_Li2SO4,
    ["Li3CL3"] = s_Li3CL3,
    ["Li3F3"] = s_Li3F3,
    ["Mg"] = s_Mg,
    ["Mg+"] = s_Mg_plus,
    ["MgBr"] = s_MgBr,
    ["MgBr2"] = s_MgBr2,
    ["MgCL"] = s_MgCL,
    ["MgCL+"] = s_MgCL_plus,
    ["MgCLF"] = s_MgCLF,
    ["MgCL2"] = s_MgCL2,
    ["MgF"] = s_MgF,
    ["MgF+"] = s_MgF_plus,
    ["MgF2"] = s_MgF2,
    ["MgF2+"] = s_MgF2_plus,
    ["MgH"] = s_MgH,
    ["MgI"] = s_MgI,
    ["MgI2"] = s_MgI2,
    ["MgN"] = s_MgN,
    ["MgO"] = s_MgO,
    ["MgOH"] = s_MgOH,
    ["MgOH+"] = s_MgOH_plus,
    ["MgO2H2"] = s_MgO2H2,
    ["MgS"] = s_MgS,
    ["Mg2"] = s_Mg2,
    ["Mg2F4"] = s_Mg2F4,
    ["MoO3"] = s_MoO3,
    ["Mo2O6"] = s_Mo2O6,
    ["Mo3O9"] = s_Mo3O9,
    ["Mo4O12"] = s_Mo4O12,
    ["Mo5O15"] = s_Mo5O15,
    ["N"] = s_N,
    ["N+"] = s_N_plus,
    ["N-"] = s_N_minus,
    ["NCO"] = s_NCO,
    ["ND"] = s_ND,
    ["ND2"] = s_ND2,
    ["ND3"] = s_ND3,
    ["NF"] = s_NF,
    ["NF2"] = s_NF2,
    ["NF3"] = s_NF3,
    ["NH"] = s_NH,
    ["NH+"] = s_NH_plus,
    ["NHF"] = s_NHF,
    ["NHF2"] = s_NHF2,
    ["NH2"] = s_NH2,
    ["NH2F"] = s_NH2F,
    ["NH3"] = s_NH3,
    ["NH2OH"] = s_NH2OH,
    ["NH4+"] = s_NH4_plus,
    ["False"] = s_False,
    ["NO+"] = s_NO_plus,
    ["NOCL"] = s_NOCL,
    ["NOF"] = s_NOF,
    ["NOF3"] = s_NOF3,
    ["NO2"] = s_NO2,
    ["NO2-"] = s_NO2_minus,
    ["NO2CL"] = s_NO2CL,
    ["NO2F"] = s_NO2F,
    ["NO3"] = s_NO3,
    ["NO3-"] = s_NO3_minus,
    ["NO3F"] = s_NO3F,
    ["N2"] = s_N2,
    ["N2+"] = s_N2_plus,
    ["N2-"] = s_N2_minus,
    ["NCN"] = s_NCN,
    ["cis-N2D2"] = s_cis_minusN2D2,
    ["N2F2"] = s_N2F2,
    ["N2F4"] = s_N2F4,
    ["N2H2"] = s_N2H2,
    ["NH2NO2"] = s_NH2NO2,
    ["N2H4"] = s_N2H4,
    ["N2O"] = s_N2O,
    ["N2O+"] = s_N2O_plus,
    ["N2O3"] = s_N2O3,
    ["N2O4"] = s_N2O4,
    ["N2O5"] = s_N2O5,
    ["N3"] = s_N3,
    ["N3H"] = s_N3H,
    ["Na"] = s_Na,
    ["Na+"] = s_Na_plus,
    ["NaALF4"] = s_NaALF4,
    ["NaBO2"] = s_NaBO2,
    ["NaBr"] = s_NaBr,
    ["NaCN"] = s_NaCN,
    ["NaCL"] = s_NaCL,
    ["NaF"] = s_NaF,
    ["NaF2-"] = s_NaF2_minus,
    ["NaH"] = s_NaH,
    ["NaI"] = s_NaI,
    ["NaO"] = s_NaO,
    ["NaO-"] = s_NaO_minus,
    ["NaOH"] = s_NaOH,
    ["NaOH+"] = s_NaOH_plus,
    ["Na2"] = s_Na2,
    ["Na2C2N2"] = s_Na2C2N2,
    ["Na2CL2"] = s_Na2CL2,
    ["Na2F2"] = s_Na2F2,
    ["Na2O"] = s_Na2O,
    ["Na2O2H2"] = s_Na2O2H2,
    ["Na2SO4"] = s_Na2SO4,
    ["Nb"] = s_Nb,
    ["NbO"] = s_NbO,
    ["NbO2"] = s_NbO2,
    ["Ne"] = s_Ne,
    ["Ne+"] = s_Ne_plus,
    ["Ni"] = s_Ni,
    ["NiCL"] = s_NiCL,
    ["NiCL2"] = s_NiCL2,
    ["NiO"] = s_NiO,
    ["NiS"] = s_NiS,
    ["O"] = s_O,
    ["O+"] = s_O_plus,
    ["O-"] = s_O_minus,
    ["OD"] = s_OD,
    ["OH"] = s_OH,
    ["OH+"] = s_OH_plus,
    ["OH-"] = s_OH_minus,
    ["O2"] = s_O2,
    ["O2+"] = s_O2_plus,
    ["O2-"] = s_O2_minus,
    ["O3"] = s_O3,
    ["P"] = s_P,
    ["P+"] = s_P_plus,
    ["PCL3"] = s_PCL3,
    ["PF"] = s_PF,
    ["PF+"] = s_PF_plus,
    ["PF-"] = s_PF_minus,
    ["PF2"] = s_PF2,
    ["PF2+"] = s_PF2_plus,
    ["PF3"] = s_PF3,
    ["PF5"] = s_PF5,
    ["PH"] = s_PH,
    ["PH3"] = s_PH3,
    ["PO"] = s_PO,
    ["PO2"] = s_PO2,
    ["P2"] = s_P2,
    ["P4"] = s_P4,
    ["P4O10"] = s_P4O10,
    ["Pb"] = s_Pb,
    ["PbBr"] = s_PbBr,
    ["PbBr2"] = s_PbBr2,
    ["PbBr4"] = s_PbBr4,
    ["PbCL"] = s_PbCL,
    ["PbCL+"] = s_PbCL_plus,
    ["PbCL2"] = s_PbCL2,
    ["PbCL2+"] = s_PbCL2_plus,
    ["PbCL4"] = s_PbCL4,
    ["PbF"] = s_PbF,
    ["PbF2"] = s_PbF2,
    ["PbF4"] = s_PbF4,
    ["PbI"] = s_PbI,
    ["PbI2"] = s_PbI2,
    ["PbI4"] = s_PbI4,
    ["PbO"] = s_PbO,
    ["PbS"] = s_PbS,
    ["Pb2"] = s_Pb2,
    ["S"] = s_S,
    ["S+"] = s_S_plus,
    ["S-"] = s_S_minus,
    ["SCL"] = s_SCL,
    ["SCL2"] = s_SCL2,
    ["SCL2+"] = s_SCL2_plus,
    ["SD"] = s_SD,
    ["SF"] = s_SF,
    ["SF+"] = s_SF_plus,
    ["SF-"] = s_SF_minus,
    ["SF2"] = s_SF2,
    ["SF2+"] = s_SF2_plus,
    ["SF2-"] = s_SF2_minus,
    ["SF3"] = s_SF3,
    ["SF3+"] = s_SF3_plus,
    ["SF3-"] = s_SF3_minus,
    ["SF4"] = s_SF4,
    ["SF4+"] = s_SF4_plus,
    ["SF4-"] = s_SF4_minus,
    ["SF5"] = s_SF5,
    ["SF5+"] = s_SF5_plus,
    ["SF5-"] = s_SF5_minus,
    ["SF6"] = s_SF6,
    ["SF6-"] = s_SF6_minus,
    ["SH"] = s_SH,
    ["SN"] = s_SN,
    ["SO"] = s_SO,
    ["SOF2"] = s_SOF2,
    ["SO2"] = s_SO2,
    ["SO2CLF"] = s_SO2CLF,
    ["SO2CL2"] = s_SO2CL2,
    ["SO2F2"] = s_SO2F2,
    ["SO3"] = s_SO3,
    ["S2"] = s_S2,
    ["S2CL"] = s_S2CL,
    ["S2CL2"] = s_S2CL2,
    ["S2F2,thiothiony"] = s_S2F2_thiothiony,
    ["S2O"] = s_S2O,
    ["S8"] = s_S8,
    ["Si"] = s_Si,
    ["Si+"] = s_Si_plus,
    ["SiBr"] = s_SiBr,
    ["SiBr2"] = s_SiBr2,
    ["SiBr3"] = s_SiBr3,
    ["SiBr4"] = s_SiBr4,
    ["SiC"] = s_SiC,
    ["SiC2"] = s_SiC2,
    ["SiC4H12"] = s_SiC4H12,
    ["SiCL"] = s_SiCL,
    ["SiCL2"] = s_SiCL2,
    ["SiCL3"] = s_SiCL3,
    ["SiCL4"] = s_SiCL4,
    ["SiF"] = s_SiF,
    ["SiF2"] = s_SiF2,
    ["SiF3"] = s_SiF3,
    ["SiF4"] = s_SiF4,
    ["SiH"] = s_SiH,
    ["SiH+"] = s_SiH_plus,
    ["SiHBr3"] = s_SiHBr3,
    ["SiHCL3"] = s_SiHCL3,
    ["SiHF3"] = s_SiHF3,
    ["SiHI3"] = s_SiHI3,
    ["SiH2"] = s_SiH2,
    ["SiH2Br2"] = s_SiH2Br2,
    ["SiH2CL2"] = s_SiH2CL2,
    ["SiH2F2"] = s_SiH2F2,
    ["SiH2I2"] = s_SiH2I2,
    ["SiH3"] = s_SiH3,
    ["SiH3Br"] = s_SiH3Br,
    ["SiH3CL"] = s_SiH3CL,
    ["SiH3F"] = s_SiH3F,
    ["SiH3I"] = s_SiH3I,
    ["SiH4"] = s_SiH4,
    ["SiI"] = s_SiI,
    ["SiI2"] = s_SiI2,
    ["SiN"] = s_SiN,
    ["SiO"] = s_SiO,
    ["SiO2"] = s_SiO2,
    ["SiS"] = s_SiS,
    ["Si2"] = s_Si2,
    ["Si2C"] = s_Si2C,
    ["Si2N"] = s_Si2N,
    ["Si3"] = s_Si3,
    ["Sr"] = s_Sr,
    ["SrBr"] = s_SrBr,
    ["SrCL"] = s_SrCL,
    ["SrCL2"] = s_SrCL2,
    ["SrF"] = s_SrF,
    ["SrF+"] = s_SrF_plus,
    ["SrF2"] = s_SrF2,
    ["SrI2"] = s_SrI2,
    ["SrO"] = s_SrO,
    ["SrOH"] = s_SrOH,
    ["SrOH+"] = s_SrOH_plus,
    ["SrO2H2"] = s_SrO2H2,
    ["SrS"] = s_SrS,
    ["Ta"] = s_Ta,
    ["TaO"] = s_TaO,
    ["TaO2"] = s_TaO2,
    ["Ti"] = s_Ti,
    ["Ti+"] = s_Ti_plus,
    ["Ti-"] = s_Ti_minus,
    ["TiCL"] = s_TiCL,
    ["TiCL2"] = s_TiCL2,
    ["TiCL3"] = s_TiCL3,
    ["TiCL4"] = s_TiCL4,
    ["TiO"] = s_TiO,
    ["TiOCL"] = s_TiOCL,
    ["TiOCL2"] = s_TiOCL2,
    ["TiO2"] = s_TiO2,
    ["V"] = s_V,
    ["VCL4"] = s_VCL4,
    ["VN"] = s_VN,
    ["VO"] = s_VO,
    ["VO2"] = s_VO2,
    ["Xe"] = s_Xe,
    ["Xe+"] = s_Xe_plus,
    ["Zn"] = s_Zn,
    ["Zn+"] = s_Zn_plus,
    ["Zn-"] = s_Zn_minus,
    ["Zr"] = s_Zr,
    ["ZrN"] = s_ZrN,
    ["ZrO"] = s_ZrO,
    ["ZrO2"] = s_ZrO2,
}
