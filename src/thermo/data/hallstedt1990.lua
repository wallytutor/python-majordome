---@meta
---@diagnostic disable: undefined-global

-- Thermodynamic modeling of the CaO-Al2O3 system
-- Based on Hallstedt (1990)
-- 10.1111/j.1151-2916.1990.tb05083.x

-- Reference Substances (Pure Components)

local lime_s = Substance {
  name = "Lime_S",
  ranges = {
    Range(298.15, 3172.00, GibbsPolynomial {
       a = -6.53631356e+05,
       b =  3.15221233e+02,
       c = -5.18583000e+01,
       d = -1.21930000e-03,
       e = -2.40000000e-11,
       f =  0.00000000e+00,
       g =  4.68307000e+05
    }),
    Range(3172.00, 6000.00, GibbsPolynomial {
       a =  8.14363210e+04,
       b = -2.00182115e+03,
       c =  2.27015259e+02,
       d = -4.53854630e-02,
       e =  1.17119300e-06,
       f =  0.00000000e+00,
       g = -3.48614550e+08
    })
  },
  elements = { Ca = 1, O = 1 },
  aggregation_type = "Solid"
}

local lime_l = Substance {
  name = "Lime_L",
  ranges = {
    Range(298.15, 1830.00, GibbsPolynomial {
       a = -5.85630854e+05,
       b =  3.00654841e+02,
       c = -5.28620000e+01,
       d = -1.55450000e-04,
       e = -1.89185000e-07,
       f =  0.00000000e+00,
       g =  4.89415000e+05
    }),
    Range(1830.00, 2880.00, GibbsPolynomial {
       a = -7.93806269e+05,
       b =  1.51099330e+03,
       c = -2.12686000e+02,
       d =  5.49185000e-02,
       e = -3.78986700e-06,
       f =  0.00000000e+00,
       g =  5.17305000e+07
    }),
    Range(2880.00, 3172.00, GibbsPolynomial {
       a = -4.19194174e+06,
       b =  1.54589937e+04,
       c = -1.96124000e+03,
       d =  4.55435500e-01,
       e = -2.10193330e-05,
       f =  0.00000000e+00,
       g =  1.29185500e+09
    }),
    Range(3172.00, 6000.00, GibbsPolynomial {
       a = -6.63523922e+05,
       b =  5.73648795e+02,
       c = -8.40000000e+01,
       d =  0.00000000e+00,
       e =  0.00000000e+00,
       f =  0.00000000e+00,
       g =  0.00000000e+00
    })
  },
  elements = { Ca = 1, O = 1 },
  aggregation_type = "Liquid"
}

local corundum_s = Substance {
  name = "Corundum_S",
  ranges = {
    Range(298.15, 600.00, GibbsPolynomial {
       a = -1.70735130e+06,
       b =  4.48021092e+02,
       c = -6.74804000e+01,
       d = -6.74700000e-02,
       e =  1.42054330e-05,
       f =  0.00000000e+00,
       g =  9.38780000e+05
    }),
    Range(600.00, 1500.00, GibbsPolynomial {
       a = -1.72488606e+06,
       b =  7.54856573e+02,
       c = -1.16258000e+02,
       d = -7.22570000e-03,
       e =  2.78532000e-07,
       f =  0.00000000e+00,
       g =  2.12070000e+06
    }),
    Range(1500.00, 3000.00, GibbsPolynomial {
       a = -1.77216319e+06,
       b =  1.05345480e+03,
       c = -1.56058000e+02,
       d =  7.09105000e-03,
       e = -6.29402000e-07,
       f =  0.00000000e+00,
       g =  1.23666500e+07
    })
  },
  elements = { Al = 2, O = 3 },
  aggregation_type = "Solid"
}

local corundum_l = Substance {
  name = "Corundum_L",
  ranges = {
    Range(298.15, 600.00, GibbsPolynomial {
       a = -1.60785080e+06,
       b =  4.05559491e+02,
       c = -6.74804000e+01,
       d = -6.74700000e-02,
       e =  1.42054330e-05,
       f =  0.00000000e+00,
       g =  9.38780000e+05
    }),
    Range(600.00, 1500.00, GibbsPolynomial {
       a = -1.62538557e+06,
       b =  7.12394972e+02,
       c = -1.16258000e+02,
       d = -7.22570000e-03,
       e =  2.78532000e-07,
       f =  0.00000000e+00,
       g =  2.12070000e+06
    }),
    Range(1500.00, 1912.00, GibbsPolynomial {
       a = -1.67266269e+06,
       b =  1.01099320e+03,
       c = -1.56058000e+02,
       d =  7.09105000e-03,
       e = -6.29402000e-07,
       f =  0.00000000e+00,
       g =  1.23666500e+07
    }),
    Range(1912.00, 2327.00, GibbsPolynomial {
       a =  2.91780416e+07,
       b = -1.68360926e+05,
       c =  2.19871791e+04,
       d = -6.99552951e+00,
       e =  4.10226192e-04,
       f =  0.00000000e+00,
       g = -7.98843618e+09
    }),
    Range(2327.00, 4000.00, GibbsPolynomial {
       a = -1.75770205e+06,
       b =  1.34484833e+03,
       c = -1.92464000e+02,
       d =  0.00000000e+00,
       e =  0.00000000e+00,
       f =  0.00000000e+00,
       g =  0.00000000e+00
    })
  },
  elements = { Al = 2, O = 3 },
  aggregation_type = "Liquid"
}

-- Stoichiometric Phases Composed from References

local calcite = Substance {
  name = "HALITE",
  ranges = {
    Range(298.15, 6000.0, Compound {
      components = { { lime_s, 1.0 } }
    })
  },
  elements = { Ca = 1, O = 1 },
  aggregation_type = "Solid"
}

local corundum = Substance {
  name = "CORUNDUM",
  ranges = {
    Range(298.15, 6000.0, Compound {
      components = { { corundum_s, 1.0 } }
    })
  },
  elements = { Al = 2, O = 3 },
  aggregation_type = "Solid"
}

local c3a1 = Substance {
  name = "C3A1",
  ranges = {
    Range(298.15, 6000.0, Compound {
      components = {
        { lime_s, 3.0 },
        { corundum_s, 1.0 }
      },
      deviation = GibbsPolynomial {
        a = -4530.0,
        b = -55.4,
        c =  2.3,
        d =  0.0,
        e =  0.0,
        f =  0.0,
        g =  0.0
      }
    })
  },
  elements = { Ca = 3, Al = 2, O = 6 },
  aggregation_type = "Solid"
}

local c1a1 = Substance {
  name = "C1A1",
  ranges = {
    Range(298.15, 6000.0, Compound {
      components = {
        { lime_s, 1.0 },
        { corundum_s, 1.0 }
      },
      deviation = GibbsPolynomial {
        a = -14630.0,
        b = -44.2,
        c =  2.84,
        d =  0.0,
        e =  0.0,
        f =  0.0,
        g =  0.0
      }
    })
  },
  elements = { Ca = 1, Al = 2, O = 4 },
  aggregation_type = "Solid"
}

local c1a2 = Substance {
  name = "C1A2",
  ranges = {
    Range(298.15, 6000.0, Compound {
      components = {
        { lime_s, 1.0 },
        { corundum_s, 2.0 }
      },
      deviation = GibbsPolynomial {
        a = -10800.0,
        b = -60.9,
        c =  3.46,
        d =  0.0,
        e =  0.0,
        f =  0.0,
        g =  0.0
      }
    })
  },
  elements = { Ca = 1, Al = 4, O = 7 },
  aggregation_type = "Solid"
}

local c1a6 = Substance {
  name = "C1A6",
  ranges = {
    Range(298.15, 6000.0, Compound {
      components = {
        { lime_s, 1.0 },
        { corundum_s, 6.0 }
      },
      deviation = GibbsPolynomial {
        a = -22200.0,
        b = -35.7,
        c =  0.0,
        d =  0.0,
        e =  0.0,
        f =  0.0,
        g =  0.0
      }
    })
  },
  elements = { Ca = 1, Al = 12, O = 19 },
  aggregation_type = "Solid"
}

-- Draft Implementation of Liquid Phase (Ionic Liquid)
-- Note: This is a placeholder for a true solution model.
-- Currently represented as a Compound of liquid endpoints for the stoichiometric limits.

local liquid_ca = Substance {
  name = "LIQ_CA",
  ranges = {
    Range(298.15, 6000.0, Compound {
      components = { { lime_l, 2.0 } } -- G(IONIC_LIQ,CA+2:O-2) = 2*GCAO_L
    })
  },
  elements = { Ca = 2, O = 2 },
  aggregation_type = "Liquid"
}

local liquid_al = Substance {
  name = "LIQ_AL",
  ranges = {
    Range(298.15, 6000.0, Compound {
      components = { { corundum_l, 1.0 } } -- G(IONIC_LIQ,AL+3:O-2) = GAL2O3_L
    })
  },
  elements = { Al = 2, O = 3 },
  aggregation_type = "Liquid"
}

return {
  HALITE    = calcite,
  CORUNDUM  = corundum,
  C3A1      = c3a1,
  C1A1      = c1a1,
  C1A2      = c1a2,
  C1A6      = c1a6,
  -- References (hidden if needed, but included here)
  LIME_S    = lime_s,
  LIME_L    = lime_l,
  COR_S     = corundum_s,
  COR_L     = corundum_l,
  -- Draft endpoints
  LIQ_CA    = liquid_ca,
  LIQ_AL    = liquid_al,
}
