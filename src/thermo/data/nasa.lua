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
    name = "AL(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 933.61, NASA7 { 1.0104019100e+00, 1.2076974300e-02, -2.6208355600e-05, 2.6428241300e-08, -9.0191651300e-12, -6.5445419600e+02, -5.0047125400e+00 })
    },
    elements = { ["Al"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_AL_L_ = Substance {
    name = "AL(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(933.61, 6000.0, NASA7 { 3.8186255100e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.4965180800e+01, -1.7522970400e+01 })
    },
    elements = { ["Al"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_ALBr3_s_ = Substance {
    name = "ALBr3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 370.6, NASA7 { 5.8447956000e+00, 2.0926334000e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.4170510000e+04, -1.7876901000e+01 })
    },
    elements = { ["Al"] = 1, ["Br"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ALBr3_L_ = Substance {
    name = "ALBr3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(370.6, 5000.0, NASA7 { 1.5029750000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.4783729000e+04, -6.0799101000e+01 })
    },
    elements = { ["Al"] = 1, ["Br"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_ALCL3_s_ = Substance {
    name = "ALCL3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 465.7, NASA7 { 7.8093375000e+00, 1.0570985000e-02, -3.2859248000e-09, 0.0000000000e+00, 0.0000000000e+00, -8.7666783000e+04, -3.4501722000e+01 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ALCL3_L_ = Substance {
    name = "ALCL3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(465.7, 5000.0, NASA7 { 1.5096679000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -8.5662079000e+04, -6.5218419000e+01 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_ALF3_a_ = Substance {
    name = "ALF3(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 728.0, NASA7 { -3.0835272000e+00, 7.0350317000e-02, -1.2249405000e-04, 7.6241362000e-08, 1.5843687000e-12, -1.8294032000e+05, 9.3570683000e+00 })
    },
    elements = { ["Al"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ALF3_b_ = Substance {
    name = "ALF3(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(728.0, 1000.0, NASA7 { 9.5034505000e+00, 5.1302509000e-03, -3.7116764000e-06, 1.2052357000e-09, 0.0000000000e+00, -1.8469555000e+05, -4.7736147000e+01 }),
        Range(1000.0, 2523.0, NASA7 { 1.0419470000e+01, 2.3376501000e-03, -8.8083077000e-07, 2.8557883000e-10, -3.4607263000e-14, -1.8492205000e+05, -5.2371402000e+01 })
    },
    elements = { ["Al"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ALF3_L_ = Substance {
    name = "ALF3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2523.0, 5000.0, NASA7 { 1.5096679000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7998686000e+05, -8.0049103000e+01 })
    },
    elements = { ["Al"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_ALI3_s_ = Substance {
    name = "ALI3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 464.14, NASA7 { 8.5241600000e+00, 1.1257799000e-02, 1.6443005000e-07, 0.0000000000e+00, 0.0000000000e+00, -3.9476666000e+04, -2.8344595000e+01 })
    },
    elements = { ["Al"] = 1, ["I"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ALI3_L_ = Substance {
    name = "ALI3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(464.14, 5000.0, NASA7 { 1.4593456000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.9163332000e+04, -5.6248322000e+01 })
    },
    elements = { ["Al"] = 1, ["I"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_ALN_s_ = Substance {
    name = "ALN(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.5450031000e+00, 2.7632249000e-02, -4.3539464000e-05, 3.3092666000e-08, -9.8010524000e-12, -3.8688614000e+04, 4.6492822000e+00 }),
        Range(1000.0, 3000.0, NASA7 { 4.0841212000e+00, 3.1881496000e-03, -1.9029765000e-06, 5.2523411000e-10, -5.5133066000e-14, -3.9781843000e+04, -2.2190145000e+01 })
    },
    elements = { ["Al"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_AL2O3_a_ = Substance {
    name = "AL2O3(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -4.9138309000e+00, 7.9398443000e-02, -1.3237918000e-04, 1.0446750000e-07, -3.1566330000e-11, -2.0262622000e+05, 1.5478073000e+01 }),
        Range(1000.0, 2327.0, NASA7 { 1.1833666000e+01, 3.7708878000e-03, -1.7863191000e-07, -5.6008807000e-10, 1.4076825000e-13, -2.0571131000e+05, -6.3599835000e+01 })
    },
    elements = { ["Al"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_AL2O3_L_ = Substance {
    name = "AL2O3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2327.0, 6000.0, NASA7 { 2.3148241000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.1140520000e+05, -1.3860205000e+02 })
    },
    elements = { ["Al"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_AL2SiO5_an_ = Substance {
    name = "AL2SiO5(an)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -9.2866342000e+00, 1.3476720000e-01, -2.3237000000e-04, 1.8760919000e-07, -5.7381483000e-11, -3.1327664000e+05, 3.2715859000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 1.7351742000e+01, 8.7438135000e-03, -3.7084718000e-06, 1.0688283000e-09, -1.1763950000e-13, -3.1794151000e+05, -9.1738744000e+01 })
    },
    elements = { ["Al"] = 2, ["Si"] = 1, ["O"] = 5 },
    reference = "",
    aggregation_type = "Solid",
}

local s_AL6Si2O13_s_ = Substance {
    name = "AL6Si2O13(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.1034671000e+01, 2.6675643000e-01, -4.1524763000e-04, 3.1376972000e-07, -9.2497597000e-11, -8.2565870000e+05, 3.2254791000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 4.5238364000e+01, 2.7661424000e-02, -1.4675512000e-05, 3.8885848000e-09, -3.6660482000e-13, -8.3686417000e+05, -2.3739565000e+02 })
    },
    elements = { ["Al"] = 6, ["Si"] = 2, ["O"] = 13 },
    reference = "",
    aggregation_type = "Solid",
}

local s_B_b_ = Substance {
    name = "B(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -1.1593169300e+00, 1.1377714500e-02, -1.0698598800e-05, 2.7610644300e-09, 7.3174699600e-13, -7.1333921000e+01, 4.3643989500e+00 }),
        Range(1000.0, 2350.0, NASA7 { 1.8349409400e+00, 1.7919870200e-03, -7.9787949800e-07, 2.0276451200e-10, -1.9202834500e-14, -7.8320289900e+02, -1.0643329800e+01 })
    },
    elements = { ["B"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_B_L_ = Substance {
    name = "B(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2350.0, 6000.0, NASA7 { 3.8186255100e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 3.3609927500e+03, -2.0732647300e+01 })
    },
    elements = { ["B"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BN_s_ = Substance {
    name = "BN(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -6.9282770000e-01, 1.1798440100e-02, -3.3933983500e-06, -7.1413699300e-09, 4.7716213700e-12, -3.0453900200e+04, 2.4136116600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.6873993000e+00, 4.2467431100e-03, -1.9281770500e-06, 3.6017074800e-10, -2.3670605500e-14, -3.1463012600e+04, -1.5418773500e+01 })
    },
    elements = { ["B"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_B2O3_L_ = Substance {
    name = "B2O3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1433274000e+01, -2.1578039000e-01, 6.4057986000e-04, -7.0572420000e-07, 2.6509150000e-10, -1.5490139000e+05, -1.2803880000e+02 }),
        Range(1000.0, 5000.0, NASA7 { 1.5600114000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.5684455000e+05, -8.3126444000e+01 })
    },
    elements = { ["B"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_B3O3H3_cr_ = Substance {
    name = "B3O3H3(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 8.1595137300e+00, -7.0668335000e-03, 9.2492469400e-05, -1.0283390500e-07, 3.5015057100e-11, -1.5456963000e+05, -2.7525403500e+01 }),
        Range(1000.0, 2000.0, NASA7 { -1.2847051700e+01, 9.1958132200e-02, -8.1060943600e-05, 3.2732284000e-08, -5.0161194800e-12, -1.5110972200e+05, 7.0153615000e+01 })
    },
    elements = { ["B"] = 3, ["H"] = 3, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ba_cr_ = Substance {
    name = "Ba(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.7733444300e+00, 2.0375223600e-03, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.1743381000e+02, -8.9097062600e+00 })
    },
    elements = { ["Ba"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ba_L_ = Substance {
    name = "Ba(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1000.0, 6000.0, NASA7 { 4.8108667900e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.9206238100e+02, -2.0002757100e+01 })
    },
    elements = { ["Ba"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BaBr2_s_ = Substance {
    name = "BaBr2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 8.4982232000e+00, 2.5139224000e-03, 2.4390658000e-07, -2.9695440000e-10, 1.2874989000e-13, -9.3782241000e+04, -3.1312732000e+01 }),
        Range(1000.0, 1130.0, NASA7 { 8.2135924000e+00, 3.1143715000e-03, -2.4011629000e-07, 0.0000000000e+00, 0.0000000000e+00, -9.3684982000e+04, -2.9771808000e+01 })
    },
    elements = { ["Ba"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BaBr2_L_ = Substance {
    name = "BaBr2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1130.0, 5000.0, NASA7 { 1.2610931000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.2936418000e+04, -5.3916673000e+01 })
    },
    elements = { ["Ba"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BaCL2_a_ = Substance {
    name = "BaCL2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.7202472000e+00, 6.9224178000e-03, -1.0960927000e-05, 9.6991621000e-09, -2.6198443000e-12, -1.0579202000e+05, -3.0768305000e+01 }),
        Range(1000.0, 1198.0, NASA7 { 1.1096404000e+01, -1.1135002000e-03, -8.1801937000e-07, -2.3651376000e-10, 1.8326840000e-12, -1.0693777000e+05, -4.8926746000e+01 })
    },
    elements = { ["Ba"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BaCL2_b_ = Substance {
    name = "BaCL2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1198.0, 1235.0, NASA7 { 1.4895592000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.0994135000e+05, -7.5272702000e+01 })
    },
    elements = { ["Ba"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BaCL2_L_ = Substance {
    name = "BaCL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1235.0, 5000.0, NASA7 { 1.3083967000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.0578059000e+05, -6.0818647000e+01 })
    },
    elements = { ["Ba"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BaF2_a_ = Substance {
    name = "BaF2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3203290000e+00, 2.7626147000e-02, -5.9430348000e-05, 6.0630147000e-08, -2.2110793000e-11, -1.4745246000e+05, -1.9121916000e+01 }),
        Range(1000.0, 1480.0, NASA7 { -2.8439288000e+00, -2.1997213000e-02, 4.4201061000e-05, 5.5824690000e-09, -1.3906912000e-11, -1.3789919000e+05, 4.4472932000e+01 })
    },
    elements = { ["Ba"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BaF2_b_c_ = Substance {
    name = "BaF2(b,c)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1480.0, 1641.0, NASA7 { 1.2948094000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.5033175000e+05, -6.5383663000e+01 })
    },
    elements = { ["Ba"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BaF2_L_ = Substance {
    name = "BaF2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1641.0, 5000.0, NASA7 { 1.2006552000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4597715000e+05, -5.6701282000e+01 })
    },
    elements = { ["Ba"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BaO_s_ = Substance {
    name = "BaO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9200067000e+00, 8.9115648000e-03, -1.2531282000e-05, 9.1868703000e-09, -2.6129069000e-12, -6.7394369000e+04, -1.5842468000e+01 }),
        Range(1000.0, 2286.0, NASA7 { 5.5970566000e+00, 1.7242864000e-03, -6.0249513000e-07, 1.7400017000e-10, -1.8594791000e-14, -6.7719687000e+04, -2.3848521000e+01 })
    },
    elements = { ["Ba"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BaO_L_ = Substance {
    name = "BaO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2286.0, 5000.0, NASA7 { 8.0516715000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.3223737000e+04, -3.6818601000e+01 })
    },
    elements = { ["Ba"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BaO2H2_s_ = Substance {
    name = "BaO2H2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 681.15, NASA7 { -1.5429168000e-01, 7.5108738000e-02, -1.4915072000e-04, 1.3462514000e-07, -4.2715409000e-11, -1.1603552000e+05, -3.1075078000e+00 })
    },
    elements = { ["Ba"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BaO2H2_L_ = Substance {
    name = "BaO2H2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(681.15, 5000.0, NASA7 { 1.6958833000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1797498000e+05, -8.3351611000e+01 })
    },
    elements = { ["Ba"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BaS_s_ = Substance {
    name = "BaS(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.3658676000e+00, 1.2418284000e-03, 3.9804590000e-06, -6.6215428000e-09, 2.9678898000e-12, -5.7436270000e+04, -2.1638102000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 5.9096631000e+00, 1.1593561000e-03, -1.9279810000e-07, 6.6609007000e-11, -8.3280411000e-15, -5.7624538000e+04, -2.4710737000e+01 })
    },
    elements = { ["Ba"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Be_a_ = Substance {
    name = "Be(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { -1.3477490200e+00, 1.9234083400e-02, -3.5416342300e-05, 3.0889514300e-08, -1.0081474400e-11, -1.9644600500e+02, 4.4083582200e+00 }),
        Range(1000.0, 1543.0, NASA7 { 8.0603646800e-01, 5.3732594600e-03, -4.8624175700e-06, 2.3983401700e-09, -4.3718655200e-13, -4.1052512900e+02, -4.7996171600e+00 })
    },
    elements = { ["Be"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Be_b_ = Substance {
    name = "Be(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1543.0, 1563.0, NASA7 { 3.6081500900e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -8.5222919200e+02, -2.0029102400e+01 })
    },
    elements = { ["Be"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Be_L_ = Substance {
    name = "Be(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1563.0, 6000.0, NASA7 { 3.5456088200e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 2.0747558000e+02, -1.8953412600e+01 })
    },
    elements = { ["Be"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BeAL2O4_s_ = Substance {
    name = "BeAL2O4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -8.0547380000e+00, 1.1357240000e-01, -1.8782728000e-04, 1.4806857000e-07, -4.4807278000e-11, -2.7798044000e+05, 2.7135719000e+01 }),
        Range(1000.0, 2146.0, NASA7 { 2.0265559000e+01, -1.0466649000e-02, 2.3043954000e-05, -1.5493683000e-08, 3.6024940000e-12, -2.8336301000e+05, -1.0747222000e+02 })
    },
    elements = { ["Be"] = 1, ["Al"] = 2, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeAL2O4_L_ = Substance {
    name = "BeAL2O4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2146.0, 5000.0, NASA7 { 2.9636291000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.8056982000e+05, -1.7116954000e+02 })
    },
    elements = { ["Be"] = 1, ["Al"] = 2, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BeBr2_s_ = Substance {
    name = "BeBr2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.8551058000e+00, 7.2991764000e-03, 1.2678045000e-06, -9.1781097000e-09, 4.8306770000e-12, -4.4840483000e+04, -2.3444886000e+01 }),
        Range(1000.0, 1500.0, NASA7 { -2.2718329000e+00, 3.7185084000e-02, -4.3321639000e-05, 2.3058006000e-08, -4.5749641000e-12, -4.2971251000e+04, 1.6708869000e+01 })
    },
    elements = { ["Be"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeCL2_s_ = Substance {
    name = "BeCL2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 688.0, NASA7 { 3.0065745000e+00, 1.9539559000e-02, -4.8913605000e-06, -2.9604158000e-08, 2.3534861000e-11, -6.0722100000e+04, -1.2579772000e+01 })
    },
    elements = { ["Be"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeCL2_L_ = Substance {
    name = "BeCL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(688.0, 5000.0, NASA7 { 1.4603719000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.4498417000e+04, -7.6448784000e+01 })
    },
    elements = { ["Be"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BeF2_Lqz_ = Substance {
    name = "BeF2(Lqz)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 500.0, NASA7 { 2.0593770000e+01, -6.6396930000e-02, -1.2032398000e-04, 8.9800555000e-07, -9.6669264000e-10, -1.2693708000e+05, -9.1785113000e+01 })
    },
    elements = { ["Be"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeF2_hqz_ = Substance {
    name = "BeF2(hqz)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(500.0, 825.0, NASA7 { 5.6965576000e+00, 4.0258358000e-03, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.2528884000e+05, -2.7091389000e+01 })
    },
    elements = { ["Be"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeF2_L_ = Substance {
    name = "BeF2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(825.0, 1000.0, NASA7 { 7.7423361000e+00, -6.9680065000e-04, 2.6743406000e-06, 3.1262542000e-09, -2.5456279000e-12, -1.2546530000e+05, -3.7440304000e+01 }),
        Range(1000.0, 2000.0, NASA7 { 6.0489639000e+00, 4.3328498000e-03, 1.8754403000e-07, -3.6019482000e-10, 9.1338822000e-14, -1.2511361000e+05, -2.9026248000e+01 })
    },
    elements = { ["Be"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BeI2_s_ = Substance {
    name = "BeI2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 753.0, NASA7 { 2.6772295000e+00, 2.6923092000e-02, -2.8895204000e-05, 4.0076604000e-09, 6.4051702000e-12, -2.4446968000e+04, -7.5530919000e+00 })
    },
    elements = { ["Be"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeI2_L_ = Substance {
    name = "BeI2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(753.0, 5000.0, NASA7 { 1.3587196000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.5993312000e+04, -6.3313573000e+01 })
    },
    elements = { ["Be"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BeO_a_ = Substance {
    name = "BeO(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -3.0699522500e+00, 3.2209941400e-02, -4.8514143600e-05, 3.5126313300e-08, -9.8260085800e-12, -7.3320234000e+04, 1.1409497900e+01 }),
        Range(1000.0, 2373.001, NASA7 { 3.2237548800e+00, 4.8927624400e-03, -3.0583259100e-06, 9.9140143300e-10, -1.2344257100e-13, -7.4514076100e+04, -1.8523958200e+01 })
    },
    elements = { ["Be"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeO_b_ = Substance {
    name = "BeO(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2373.001, 2821.22, NASA7 { 1.2393347100e+01, -1.0322307500e-02, 6.5273359100e-06, -1.7309388900e-09, 1.7098649400e-13, -7.8175961000e+04, -7.0541763100e+01 })
    },
    elements = { ["Be"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeO_L_ = Substance {
    name = "BeO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2821.22, 6000.0, NASA7 { 9.5612316400e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.4201641300e+04, -5.8063544200e+01 })
    },
    elements = { ["Be"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_BeO2H2_b_ = Substance {
    name = "BeO2H2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -7.0168325000e+00, 8.3005654000e-02, -1.4152029000e-04, 1.1421665000e-07, -3.5105535000e-11, -1.0950711000e+05, 2.6616061000e+01 })
    },
    elements = { ["Be"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_BeS_s_ = Substance {
    name = "BeS(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -2.8730005000e+00, 3.8078704000e-02, -6.2506705000e-05, 4.8904278000e-08, -1.4638581000e-11, -2.8555182000e+04, 1.1842922000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 3.4787036000e+00, 6.5106233000e-03, -4.1314045000e-06, 1.2449930000e-09, -1.3821947000e-13, -2.9566530000e+04, -1.7391326000e+01 })
    },
    elements = { ["Be"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Be2C_s_ = Substance {
    name = "Be2C(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 2400.0, NASA7 { 4.4374170000e+00, 2.5694538000e-03, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.5507324000e+04, -2.4086121000e+01 })
    },
    elements = { ["Be"] = 2, ["C"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Be2C_L_ = Substance {
    name = "Be2C(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2400.0, 5000.0, NASA7 { 1.1070897000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4969641000e+04, -6.5775116000e+01 })
    },
    elements = { ["Be"] = 2, ["C"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Br2_cr_ = Substance {
    name = "Br2(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 265.9, NASA7 { 9.1254599400e+00, -8.2616088100e-02, 6.9986151700e-04, -2.4084306400e-06, 3.2110601600e-09, -3.3040882000e+03, -3.0172799600e+01 })
    },
    elements = { ["Br"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Br2_L_ = Substance {
    name = "Br2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(265.9, 332.503, NASA7 { 1.0425293700e+01, 1.1118122700e-01, -1.0685698800e-03, 3.2597657200e-06, -3.2749039800e-09, -3.5062040300e+03, -4.9075708300e+01 }),
        Range(332.503, 6000.0, NASA7 { 9.0566972700e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.6998801700e+03, -3.3293628100e+01 })
    },
    elements = { ["Br"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_C_gr_ = Substance {
    name = "C(gr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -3.1087207200e-01, 4.4035368600e-03, 1.9039411800e-06, -6.3854696600e-09, 2.9896424800e-12, -1.0865079400e+02, 1.1138295300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.4557182900e+00, 1.7170221600e-03, -6.9756278600e-07, 1.3527703200e-10, -9.6759065200e-15, -6.9513881400e+02, -8.5258303300e+00 })
    },
    elements = { ["C"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_C6H6_L_ = Substance {
    name = "C6H6(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(278.68, 500.0, NASA7 { 6.3669022900e+01, -6.0053439800e-01, 2.6679281000e-03, -5.0630882800e-06, 3.6395556200e-09, -1.6708547200e+03, -2.4389179700e+02 })
    },
    elements = { ["C"] = 6, ["H"] = 6 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_C7H8_L_ = Substance {
    name = "C7H8(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(178.15, 500.0, NASA7 { 2.9367602200e+01, -1.9472268600e-01, 9.7477309600e-04, -1.9147268900e-06, 1.4809701900e-09, -4.1631844200e+03, -1.1201996600e+02 })
    },
    elements = { ["C"] = 7, ["H"] = 8 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_C8H18_L__n_minusocta = Substance {
    name = "C8H18(L),n-octa",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(220.0, 300.0, NASA7 { 7.1413393000e+01, -5.0207950000e-01, 1.8341990000e-03, -2.0450165000e-06, 0.0000000000e+00, -4.1243725000e+04, -2.7722240000e+02 })
    },
    elements = { ["C"] = 8, ["H"] = 18 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Jet_minusA_L_ = Substance {
    name = "Jet-A(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(220.0, 550.0, NASA7 { 1.9049613000e+01, -1.6918532000e-02, 6.3022035000e-04, -1.3336577000e-06, 9.4335638000e-10, -4.4803964000e+04, -6.7690200000e+01 })
    },
    elements = { ["C"] = 12, ["H"] = 23 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ca_a_ = Substance {
    name = "Ca(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 716.0, NASA7 { 3.0332564900e+00, -1.4180006400e-03, 7.2448757400e-06, -6.6879059400e-09, 2.4990388900e-12, -8.9331050800e+02, -1.2011428800e+01 })
    },
    elements = { ["Ca"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ca_b_ = Substance {
    name = "Ca(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(716.0, 1115.0, NASA7 { 5.7011176800e+00, -5.8105649000e-03, 4.0221251800e-06, 0.0000000000e+00, 0.0000000000e+00, -1.5167636100e+03, -2.6075813400e+01 })
    },
    elements = { ["Ca"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ca_L_ = Substance {
    name = "Ca(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1115.0, 6000.0, NASA7 { 4.5703234500e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.8224330800e+02, -2.1198864300e+01 })
    },
    elements = { ["Ca"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CaBr2_s_ = Substance {
    name = "CaBr2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.2693394000e+00, 2.3697805000e-02, -4.9799909000e-05, 4.6707224000e-08, -1.5216097000e-11, -8.4447367000e+04, -1.9659445000e+01 }),
        Range(1000.0, 1015.0, NASA7 { 6.6299707000e+00, 4.0283910000e-03, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -8.3939674000e+04, -2.2523843000e+01 })
    },
    elements = { ["Ca"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CaBr2_L_ = Substance {
    name = "CaBr2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1015.0, 5000.0, NASA7 { 1.3587196000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -8.5428738000e+04, -6.3151659000e+01 })
    },
    elements = { ["Ca"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CaCO3_caL_ = Substance {
    name = "CaCO3(caL)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { -1.7696895300e+00, 6.1888468500e-02, -8.8238013900e-05, 4.6190901500e-08, -2.9872974000e-12, -1.4669181200e+05, 6.3241253200e+00 }),
        Range(1000.0, 1200.0, NASA7 { 1.4438816200e+01, -1.3977780700e-03, 2.0433310300e-06, 0.0000000000e+00, 0.0000000000e+00, -1.5040071000e+05, -7.2844548900e+01 })
    },
    elements = { ["Ca"] = 1, ["C"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CaCL2_s_ = Substance {
    name = "CaCL2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.3554675000e+00, 1.3784310000e-02, -2.4421403000e-05, 1.9551280000e-08, -4.9534169000e-12, -9.8041783000e+04, -2.6814146000e+01 }),
        Range(1000.0, 1045.0, NASA7 { 8.7332408000e+00, 2.3955141000e-04, 9.4467377000e-07, 4.5851863000e-10, -5.9749529000e-14, -9.8308080000e+04, -3.7236667000e+01 })
    },
    elements = { ["Ca"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CaCL2_L_ = Substance {
    name = "CaCL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1045.0, 5000.0, NASA7 { 1.2332141000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.8023952000e+04, -5.8047468000e+01 })
    },
    elements = { ["Ca"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CaF2_a_ = Substance {
    name = "CaF2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -3.9153717600e-01, 5.7466474200e-02, -1.3083425900e-04, 1.3273828400e-07, -4.8164163400e-11, -1.4896361400e+05, -1.9179687300e+00 }),
        Range(1000.0, 1424.0, NASA7 { 1.0343990800e+00, 2.1840248900e-02, -2.0479611300e-05, 1.0338199600e-08, -1.9184376800e-12, -1.4801044500e+05, -2.0804892500e+00 })
    },
    elements = { ["Ca"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CaF2_b_ = Substance {
    name = "CaF2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1424.0, 1691.0, NASA7 { 1.4286610500e+01, -1.1024943700e-03, 1.4177540100e-06, -2.8123208200e-10, 0.0000000000e+00, -1.5545332000e+05, -7.9186636000e+01 })
    },
    elements = { ["Ca"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CaF2_L_ = Substance {
    name = "CaF2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1691.0, 6000.0, NASA7 { 1.2016814000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4790829200e+05, -6.0492798400e+01 })
    },
    elements = { ["Ca"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CaO_s_ = Substance {
    name = "CaO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.6937688000e+00, 1.8149663000e-02, -2.8372609000e-05, 2.0513539000e-08, -5.5175768000e-12, -7.7482769000e+04, -9.3710081000e+00 }),
        Range(1000.0, 3200.0, NASA7 { 5.6557517000e+00, 1.0165439000e-03, -2.5576899000e-07, 5.4514395000e-11, -4.2579950000e-15, -7.8238381000e+04, -2.8223372000e+01 })
    },
    elements = { ["Ca"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CaO_L_ = Substance {
    name = "CaO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(3200.0, 5000.0, NASA7 { 7.5484421000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.1179292000e+04, -3.8083948000e+01 })
    },
    elements = { ["Ca"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CaO2H2_s_ = Substance {
    name = "CaO2H2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -7.4022767000e-01, 6.7566468000e-02, -1.3191281000e-04, 1.1989068000e-07, -4.0613045000e-11, -1.2043543000e+05, -1.0097075000e+00 })
    },
    elements = { ["Ca"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CaS_s_ = Substance {
    name = "CaS(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.6475558000e+00, 4.9315516000e-03, -5.5308903000e-06, 3.0663959000e-09, -6.0785610000e-13, -5.8477047000e+04, -2.0922710000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 5.6530519000e+00, 1.3625874000e-03, -7.2781176000e-07, 2.4989763000e-10, -3.0968126000e-14, -5.8710341000e+04, -2.5906395000e+01 })
    },
    elements = { ["Ca"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CaSO4_s_ = Substance {
    name = "CaSO4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 5000.0, NASA7 { 8.4441905000e+00, 1.1876215000e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7553242000e+05, -3.8820134000e+01 })
    },
    elements = { ["Ca"] = 1, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cr_cr_ = Substance {
    name = "Cr(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 311.5, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=7.8482602400e+00, a4=-1.1627602000e-01, a5=8.1236925100e-04, a6=-2.3080708600e-06, a7=2.3532814200e-09, a8=-8.9801394600e+02, a9=-2.7573313900e+01 }),
        Range(311.5, 1000.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=1.8286347100e+00, a4=4.1956226700e-03, a5=-2.8273508200e-06, a6=-9.1599057800e-10, a7=1.5520304000e-12, a8=-7.0550266300e+02, a9=-8.6980610300e+00 }),
        Range(1000.0, 2130.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=4.5978263700e+00, a4=-4.8179113200e-03, a5=5.8412975400e-06, a6=-2.0703684700e-09, a7=2.8210226800e-13, a8=-1.3148966800e+03, a9=-2.2445474800e+01 })
    },
    elements = { ["Cr"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cr_L_ = Substance {
    name = "Cr(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2130.0, 6000.0, NASA7 { 4.7302847700e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 5.7535922100e+02, -2.4531830900e+01 })
    },
    elements = { ["Cr"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CrN_s_ = Substance {
    name = "CrN(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 9.7152904000e+00, -2.3775372000e-02, 5.2561015000e-05, -4.8390747000e-08, 1.6270757000e-11, -1.6323422000e+04, -4.5730050000e+01 }),
        Range(1000.0, 2500.0, NASA7 { 5.6944539000e+00, 5.3011690000e-04, 2.2705829000e-07, -8.1483254000e-11, 1.0803796000e-14, -1.5836002000e+04, -2.8131704000e+01 })
    },
    elements = { ["Cr"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cr2N_s_ = Substance {
    name = "Cr2N(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.0303388000e+00, 3.4006441000e-02, -6.1524946000e-05, 5.3142548000e-08, -1.6769521000e-11, -1.6768313000e+04, -1.1600698000e+01 }),
        Range(1000.0, 2500.0, NASA7 { 8.0984185000e+00, 1.8533611000e-03, 1.4227306000e-06, -5.5896390000e-10, 6.9307110000e-14, -1.7684801000e+04, -3.9147472000e+01 })
    },
    elements = { ["Cr"] = 2, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cr2O3_s_ = Substance {
    name = "Cr2O3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9332773000e+01, -1.0207385000e-01, 2.3601103000e-04, -2.2578019000e-07, 7.7799289000e-11, -1.4240406000e+05, -1.3574281000e+02 }),
        Range(1000.0, 2603.0, NASA7 { 1.4012235000e+01, 1.3823978000e-03, -2.3779226000e-07, 1.6995085000e-10, -3.7705857000e-14, -1.4098217000e+05, -7.1101569000e+01 })
    },
    elements = { ["Cr"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cr2O3_L_ = Substance {
    name = "Cr2O3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2603.0, 5000.0, NASA7 { 1.8871105000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.3369498000e+05, -9.9961470000e+01 })
    },
    elements = { ["Cr"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Cs_cr_ = Substance {
    name = "Cs(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(100.0, 301.59, NASA7 { 3.3115719400e+00, -9.6797479300e-03, 1.1992657600e-04, -5.2060808400e-07, 8.3341592700e-10, -9.8084443500e+02, -8.1086687100e+00 })
    },
    elements = { ["Cs"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cs_L_ = Substance {
    name = "Cs(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(301.59, 1000.0, NASA7 { 3.2035813000e+00, 6.5356020600e-03, -1.8860930200e-05, 1.8826249000e-08, -6.1037178200e-12, -8.6134185500e+02, -8.4310038800e+00 }),
        Range(1000.0, 2000.0, NASA7 { 5.1151295500e+00, -3.8397029100e-03, 2.0155525700e-06, 3.6420259900e-10, -5.4397450100e-14, -1.1384176700e+03, -1.7056762400e+01 })
    },
    elements = { ["Cs"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CsCL_a_ = Substance {
    name = "CsCL(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 743.0, NASA7 { 5.5453400000e+00, 2.3805834000e-03, 8.3570330000e-07, -9.9571640000e-10, 3.8054803000e-13, -5.5026535000e+04, -2.0164260000e+01 })
    },
    elements = { ["Cs"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CsCL_b_ = Substance {
    name = "CsCL(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(743.0, 918.0, NASA7 { 8.1610737000e+00, -1.7623568000e-03, -2.2508516000e-07, 3.9307317000e-09, -2.3452341000e-12, -5.5480431000e+04, -3.3941396000e+01 })
    },
    elements = { ["Cs"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CsCL_L_ = Substance {
    name = "CsCL(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(918.0, 5000.0, NASA7 { 9.3097452000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -5.5031161000e+04, -4.0810133000e+01 })
    },
    elements = { ["Cs"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CsF_s_ = Substance {
    name = "CsF(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 976.0, NASA7 { 5.6489993000e+00, 1.8711398000e-03, 6.6242382000e-07, -6.3084871000e-10, 1.8692339000e-13, -6.8485102000e+04, -2.2149959000e+01 })
    },
    elements = { ["Cs"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CsF_L_ = Substance {
    name = "CsF(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(976.0, 5000.0, NASA7 { 8.9071617000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.8066817000e+04, -3.9912774000e+01 })
    },
    elements = { ["Cs"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CsOH_a_ = Substance {
    name = "CsOH(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 410.0, NASA7 { 5.8894605100e+00, 6.1318998200e-03, 8.6076395200e-06, -1.2061468900e-08, 0.0000000000e+00, -5.2201034100e+04, -2.3784012700e+01 })
    },
    elements = { ["Cs"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CsOH_b_ = Substance {
    name = "CsOH(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(410.0, 493.0, NASA7 { 4.9210462400e+00, 1.0065511600e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -5.1866068100e+04, -1.8743811300e+01 })
    },
    elements = { ["Cs"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CsOH_c_ = Substance {
    name = "CsOH(c)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(493.0, 588.0, NASA7 { 1.0064454400e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -5.2448865000e+04, -4.4193147800e+01 })
    },
    elements = { ["Cs"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CsOH_L_ = Substance {
    name = "CsOH(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(588.0, 6000.0, NASA7 { 9.8128430000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -5.1752472200e+04, -4.1655960500e+01 })
    },
    elements = { ["Cs"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Cs2SO4_II_ = Substance {
    name = "Cs2SO4(II)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 940.0, NASA7 { -2.9789307000e+00, 1.2650884000e-01, -2.9553206000e-04, 3.3207308000e-07, -1.3104991000e-10, -1.7623352000e+05, 1.5185747000e+01 })
    },
    elements = { ["Cs"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cs2SO4_I_ = Substance {
    name = "Cs2SO4(I)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(940.0, 1000.0, NASA7 { 4.7349836000e+00, 1.8619600000e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7154139000e+05, 1.3737046000e-01 }),
        Range(1000.0, 1278.0, NASA7 { -2.7232722000e-02, 3.1354036000e-02, -1.1300531000e-05, 3.3283108000e-09, 0.0000000000e+00, -1.7021163000e+05, 2.4839988000e+01 })
    },
    elements = { ["Cs"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cs2SO4_L_ = Substance {
    name = "Cs2SO4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1278.0, 5000.0, NASA7 { 2.4859198000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7776198000e+05, -1.1665744000e+02 })
    },
    elements = { ["Cs"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Cu_cr_ = Substance {
    name = "Cu(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.7667207400e+00, 7.3469943200e-03, -1.5471296000e-05, 1.5053959100e-08, -5.2486133500e-12, -7.4388208700e+02, -7.7045404400e+00 }),
        Range(1000.0, 1358.0, NASA7 { 3.4200891000e+00, -1.6120139400e-03, 3.0514591700e-06, -2.1116278800e-09, 6.9985839700e-13, -9.9029563600e+02, -1.5193229400e+01 })
    },
    elements = { ["Cu"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cu_L_ = Substance {
    name = "Cu(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1358.0, 6000.0, NASA7 { 3.9449107600e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.1063466900e+02, -1.8358567600e+01 })
    },
    elements = { ["Cu"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CuF_s_ = Substance {
    name = "CuF(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.4421288000e+00, 7.9669076000e-03, -7.2807311000e-06, 2.7637773000e-09, -2.7318842000e-13, -3.5336168000e+04, -1.9585170000e+01 }),
        Range(1000.0, 2000.0, NASA7 { 5.3215506000e+00, 4.8549832000e-03, -3.5440048000e-06, 1.1109023000e-09, -1.2453716000e-13, -3.5521715000e+04, -2.3902643000e+01 })
    },
    elements = { ["Cu"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CuF2_s_ = Substance {
    name = "CuF2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3873676000e+00, 1.4397109000e-02, -8.6213497000e-06, -1.9830446000e-09, 2.6896740000e-12, -6.6685585000e+04, -1.9580561000e+01 }),
        Range(1000.0, 1109.0, NASA7 { 2.3557676000e+00, 1.4913508000e-02, -6.3995193000e-06, 0.0000000000e+00, 0.0000000000e+00, -6.5610622000e+04, -7.1626757000e+00 })
    },
    elements = { ["Cu"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CuF2_L_ = Substance {
    name = "CuF2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1109.0, 5000.0, NASA7 { 1.2077507000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.3487998000e+04, -5.6730370000e+01 })
    },
    elements = { ["Cu"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_CuO_s_ = Substance {
    name = "CuO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 8.8403866000e-01, 2.4158852000e-02, -4.3894142000e-05, 3.7586181000e-08, -1.2088275000e-11, -1.9788382000e+04, -5.4723880000e+00 }),
        Range(1000.0, 2000.0, NASA7 { 5.0258124000e+00, 2.5424077000e-03, -1.3768294000e-06, 5.3492831000e-10, -7.9664281000e-14, -2.0433281000e+04, -2.4376695000e+01 })
    },
    elements = { ["Cu"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CuO2H2_s_ = Substance {
    name = "CuO2H2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0451185000e+01, 1.3458205000e-03, 8.6602339000e-06, -6.8092349000e-09, 7.4435859000e-13, -5.7406865000e+04, -4.7238803000e+01 }),
        Range(1000.0, 1500.0, NASA7 { 8.6730787000e+00, 1.0385762000e-02, -4.6994841000e-06, -5.0292513000e-10, 5.3593160000e-13, -5.7230382000e+04, -3.9366161000e+01 })
    },
    elements = { ["Cu"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_CuSO4_s_ = Substance {
    name = "CuSO4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3019166000e+00, 3.7012321000e-02, -2.8990804000e-05, 4.5314045000e-09, 2.6388445000e-12, -9.4993621000e+04, -1.5465878000e+01 }),
        Range(1000.0, 2000.0, NASA7 { 1.1314536000e+01, 1.4050352000e-02, -1.0063568000e-05, 3.7204221000e-09, -5.2805914000e-13, -9.6998208000e+04, -5.6254690000e+01 })
    },
    elements = { ["Cu"] = 1, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cu2O_s_ = Substance {
    name = "Cu2O(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3832466000e+00, 2.2954176000e-02, -3.9542304000e-05, 3.4020401000e-08, -1.1043809000e-11, -2.2273157000e+04, -1.3530713000e+01 }),
        Range(1000.0, 1516.72, NASA7 { 1.4755641000e+01, -1.5876657000e-02, 1.4971193000e-05, -4.4840264000e-09, 4.0556005000e-13, -2.5065068000e+04, -7.0541877000e+01 })
    },
    elements = { ["Cu"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Cu2O_L_ = Substance {
    name = "Cu2O(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1516.72, 5000.0, NASA7 { 1.2017120000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.9252387000e+04, -5.6886866000e+01 })
    },
    elements = { ["Cu"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Cu2O5S_s_ = Substance {
    name = "Cu2O5S(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5257178000e+00, 7.2205958000e-02, -9.7855665000e-05, 6.5432499000e-08, -1.6744453000e-11, -1.1478646000e+05, -1.3196112000e+01 }),
        Range(1000.0, 1500.0, NASA7 { 1.6011634000e+01, 1.9424668000e-02, -1.8448251000e-05, 1.1187204000e-08, -2.6111983000e-12, -1.1761620000e+05, -7.8727489000e+01 })
    },
    elements = { ["Cu"] = 2, ["O"] = 5, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Fe_a_ = Substance {
    name = "Fe(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=2.4133747600e+00, a4=-1.5778074400e-03, a5=2.1470133900e-05, a6=-3.8017143800e-08, a7=2.2042698400e-11, a8=-7.7438099800e+02, a9=-1.0656029600e+01 }),
        Range(1000.0, 1042.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=4.6908017300e+03, a4=-9.9065999100e+00, a5=2.6942744600e-03, a6=5.5444532100e-06, a7=-3.0165982300e-09, a8=-1.4154758600e+06, a9=-2.4929438700e+04 }),
        Range(1042.0, 1184.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=6.5967880900e+02, a4=-1.1405821700e+00, a5=4.9630699700e-04, a6=0.0000000000e+00, a7=0.0000000000e+00, a8=-2.5210680200e+05, a9=-3.6566523600e+03 })
    },
    elements = { ["Fe"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Fe_c_ = Substance {
    name = "Fe(c)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1184.0, 1665.0, NASA7 { 6.1010999000e+01, -1.6094506100e-01, 1.6836949300e-04, -7.7456370200e-08, 1.3309129000e-11, -1.6533545400e+04, -3.1371066800e+02 })
    },
    elements = { ["Fe"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Fe_d_ = Substance {
    name = "Fe(d)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1665.0, 1809.0, NASA7 { -4.3590469800e+02, 7.6848944800e-01, -4.4689889200e-04, 8.6707091300e-08, 0.0000000000e+00, 1.8792553400e+05, 2.4505761900e+03 })
    },
    elements = { ["Fe"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Fe_L_ = Substance {
    name = "Fe(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1809.0, 6000.0, NASA7 { 5.5353833200e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.2742894100e+03, -2.9477227100e+01 })
    },
    elements = { ["Fe"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_FeC5O5_L_ = Substance {
    name = "FeC5O5(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 5000.0, NASA7 { 2.8118450000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.0052483000e+05, -1.1966541000e+02 })
    },
    elements = { ["Fe"] = 1, ["C"] = 5, ["O"] = 5 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_FeCL2_s_ = Substance {
    name = "FeCL2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 950.0, NASA7 { 7.1122271000e+00, 1.1086953000e-02, -1.7072742000e-05, 1.3515817000e-08, -4.1365036000e-12, -4.3600985000e+04, -2.8994055000e+01 })
    },
    elements = { ["Fe"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_FeCL2_L_ = Substance {
    name = "FeCL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(950.0, 5000.0, NASA7 { 1.2288863000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.1109821000e+04, -5.3193057000e+01 })
    },
    elements = { ["Fe"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_FeCL3_s_ = Substance {
    name = "FeCL3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 577.0, NASA7 { -7.3955685500e+00, 2.0260843400e-01, -8.4450592300e-04, 1.5928660200e-06, -1.0798932100e-09, -5.0014466400e+04, 2.4445093500e+01 })
    },
    elements = { ["Fe"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_FeCL3_L_ = Substance {
    name = "FeCL3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(577.0, 6000.0, NASA7 { 1.6103127000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.8413527800e+04, -6.7575899000e+01 })
    },
    elements = { ["Fe"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_FeO_s_ = Substance {
    name = "FeO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.3195475000e+00, 2.2096591000e-03, 1.0721775000e-06, -2.7929729000e-09, 1.3320733000e-12, -3.4407165000e+04, -2.3686034000e+01 }),
        Range(1000.0, 1650.0, NASA7 { 5.8316489000e+00, 1.4275156000e-03, -9.3208143000e-08, -6.5997763000e-12, -2.2512143000e-14, -3.4566902000e+04, -2.6446990000e+01 })
    },
    elements = { ["Fe"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_FeO_L_ = Substance {
    name = "FeO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1650.0, 5000.0, NASA7 { 8.2022482000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.3848615000e+04, -4.0079129000e+01 })
    },
    elements = { ["Fe"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Fe_OH_2_s_ = Substance {
    name = "Fe(OH)2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0091218000e+01, 4.4523141000e-03, 4.0666855000e-06, -4.0094525000e-09, 2.3947164000e-13, -7.2277688000e+04, -4.8400034000e+01 }),
        Range(1000.0, 1500.0, NASA7 { 7.4031808000e+00, 1.1981742000e-02, -1.4957611000e-06, -5.0526359000e-09, 2.0037111000e-12, -7.1592266000e+04, -3.4673267000e+01 })
    },
    elements = { ["Fe"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Fe_OH_3_s_ = Substance {
    name = "Fe(OH)3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.4116836000e+00, 3.2682462000e-02, -2.2393815000e-05, 2.8646792000e-09, 2.2622321000e-12, -1.0271834000e+05, -2.1331014000e+01 }),
        Range(1000.0, 1500.0, NASA7 { 8.0223926000e+00, 1.6420135000e-02, -1.2369378000e-07, -6.8192838000e-09, 2.3276907000e-12, -1.0321336000e+05, -3.7934020000e+01 })
    },
    elements = { ["Fe"] = 1, ["O"] = 3, ["H"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_FeS_a_ = Substance {
    name = "FeS(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 411.0, NASA7 { 1.8977627000e+01, -1.0954282000e-01, 2.2186016000e-04, 0.0000000000e+00, 0.0000000000e+00, -1.4995242000e+04, -7.8125435000e+01 })
    },
    elements = { ["Fe"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_FeS_b_ = Substance {
    name = "FeS(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(411.0, 598.0, NASA7 { 8.7028505000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4689738000e+04, -4.2082102000e+01 })
    },
    elements = { ["Fe"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_FeS_c_ = Substance {
    name = "FeS(c)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(598.0, 1000.0, NASA7 { 9.3724176000e+00, 9.4162059000e-04, -1.5829864000e-05, 1.8380881000e-08, -5.7707067000e-12, -1.4581685000e+04, -4.5141516000e+01 }),
        Range(1000.0, 1463.0, NASA7 { -2.6830483000e+00, 3.6765104000e-02, -5.2182274000e-05, 3.1607170000e-08, -6.4126041000e-12, -1.1498684000e+04, 1.6239124000e+01 })
    },
    elements = { ["Fe"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_FeS_L_ = Substance {
    name = "FeS(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1463.0, 5000.0, NASA7 { 7.5232806000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.0164237000e+04, -3.1970930000e+01 })
    },
    elements = { ["Fe"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_FeSO4_s_ = Substance {
    name = "FeSO4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5057684000e+00, 3.7029701000e-02, -2.9033531000e-05, 4.5778589000e-09, 2.6202087000e-12, -1.1416250000e+05, -1.5223241000e+01 }),
        Range(1000.0, 2000.0, NASA7 { 1.1608929000e+01, 1.3804697000e-02, -9.8126380000e-06, 3.6087811000e-09, -5.0976279000e-13, -1.1619186000e+05, -5.6477817000e+01 })
    },
    elements = { ["Fe"] = 1, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_FeS2_s_ = Substance {
    name = "FeS2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0345663000e-01, 4.2674684000e-02, -8.4030626000e-05, 7.6301441000e-08, -2.5432316000e-11, -2.2045927000e+04, -5.5456393000e+00 }),
        Range(1000.0, 1400.0, NASA7 { -8.8515320000e+01, 3.2748931000e-01, -4.1057439000e-04, 2.2928146000e-07, -4.7764415000e-11, -4.6512476000e+02, 4.4173045000e+02 })
    },
    elements = { ["Fe"] = 1, ["S"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Fe2O3_s_ = Substance {
    name = "Fe2O3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -7.7037843000e+00, 1.3647471000e-01, -3.2905655000e-04, 3.8150478000e-07, -1.6310285000e-10, -1.0080076000e+05, 2.5292085000e+01 }),
        Range(1000.0, 2500.0, NASA7 { 4.0497530000e+01, -4.6131596000e-02, 3.1826406000e-05, -8.9226331000e-09, 8.4655417000e-13, -1.1317627000e+05, -2.1635088000e+02 })
    },
    elements = { ["Fe"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Fe2S3O12_s_ = Substance {
    name = "Fe2S3O12(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.1116955000e+01, 8.3706778000e-02, -4.1365075000e-05, -2.5279222000e-08, 2.1041435000e-11, -3.1729782000e+05, -4.9288750000e+01 }),
        Range(1000.0, 2000.0, NASA7 { 3.9114438000e+01, 1.1796327000e-02, -3.3871014000e-08, -2.2970399000e-09, 6.4101986000e-13, -3.2478262000e+05, -1.9400429000e+02 })
    },
    elements = { ["Fe"] = 2, ["S"] = 3, ["O"] = 12 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Fe3O4_s_ = Substance {
    name = "Fe3O4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6198148000e+01, -1.7437976000e-01, 5.2475673000e-04, -5.4238219000e-07, 1.7996202000e-10, -1.4138730000e+05, -1.5556683000e+02 }),
        Range(1000.0, 5000.0, NASA7 { 2.4133720000e+01, 4.1592226000e-05, -2.6331492000e-08, 6.6035094000e-12, -5.6924680000e-16, -1.4121052000e+05, -1.2006412000e+02 })
    },
    elements = { ["Fe"] = 3, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_H2O_s_ = Substance {
    name = "H2O(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 273.15, NASA7 { 5.2967797000e+00, -6.7574924700e-02, 5.1694210900e-04, -1.4385336000e-06, 1.5256479400e-09, -3.6226655700e+04, -1.7922042800e+01 })
    },
    elements = { ["H"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_H2O_L_ = Substance {
    name = "H2O(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(273.15, 600.0, NASA7 { 7.2557500500e+01, -6.6244540200e-01, 2.5619874600e-03, -4.3659192300e-06, 2.7817898100e-09, -4.1886549900e+04, -2.8828013700e+02 })
    },
    elements = { ["H"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_H2SO4_L_ = Substance {
    name = "H2SO4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 9.9421525000e+00, 2.1786369000e-02, 3.4974458000e-06, -3.3548857000e-09, 1.1699586000e-12, -1.0185979000e+05, -4.4398695000e+01 })
    },
    elements = { ["H"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Hg_cr_ = Substance {
    name = "Hg(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 234.29, NASA7 { 2.4310338500e+00, 4.2464665800e-03, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1788680600e+03, -7.1124811400e+00 })
    },
    elements = { ["Hg"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Hg_L_ = Substance {
    name = "Hg(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(234.29, 1000.0, NASA7 { 3.7968524800e+00, -2.0902610900e-03, 2.2226710700e-06, -1.0860565500e-10, -4.2808724800e-13, -1.0583463100e+03, -1.1962693600e+01 }),
        Range(1000.0, 2000.0, NASA7 { 3.0365348700e+00, 3.1600666600e-04, 6.4390117200e-08, -2.9230699100e-11, 4.8686091800e-15, -8.8817050200e+02, -8.1724301800e+00 })
    },
    elements = { ["Hg"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_HgBr2_s_ = Substance {
    name = "HgBr2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 514.0, NASA7 { 8.2829714000e+00, 1.6302364000e-03, 3.4229879000e-06, 7.0961992000e-10, -4.3353862000e-12, -2.2952438000e+04, -2.7345276000e+01 })
    },
    elements = { ["Hg"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_HgBr2_L_ = Substance {
    name = "HgBr2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(514.0, 5000.0, NASA7 { 1.2278799000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.2500898000e+04, -4.6851212000e+01 })
    },
    elements = { ["Hg"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_HgO_s_ = Substance {
    name = "HgO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4170866000e+00, 7.1160570000e-03, -1.4896996000e-06, -4.4913548000e-09, 2.5937924000e-12, -1.2233270000e+04, -1.3037185000e+01 })
    },
    elements = { ["Hg"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_I2_cr_ = Substance {
    name = "I2(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 386.75, NASA7 { -1.0575771300e+01, 2.2690565300e-01, -1.1246164500e-03, 2.4167845200e-06, -1.8490137700e-09, -8.9972161500e+02, 3.8859896400e+01 })
    },
    elements = { ["I"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_I2_L_ = Substance {
    name = "I2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(386.75, 6000.0, NASA7 { 9.5682126800e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.2045194800e+03, -3.6373392700e+01 })
    },
    elements = { ["I"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_K_cr_ = Substance {
    name = "K(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 336.86, NASA7 { -2.0895112300e+00, 6.1632019300e-02, -2.4073190300e-04, 3.2725582300e-07, 0.0000000000e+00, -6.3609805900e+02, 9.1173691000e+00 })
    },
    elements = { ["K"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K_L_ = Substance {
    name = "K(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(336.86, 1000.0, NASA7 { 4.2291056300e+00, -7.0688554300e-04, -2.1296584800e-06, 3.3622727000e-09, -1.0590260200e-12, -9.4511751400e+02, -1.5234005400e+01 }),
        Range(1000.0, 2200.0, NASA7 { 4.6495493100e+00, -2.7917410600e-03, 1.8083633700e-06, 3.4124486800e-11, -4.4878218400e-15, -1.0146779700e+03, -1.7176734700e+01 })
    },
    elements = { ["K"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_KCN_s_ = Substance {
    name = "KCN(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 895.0, NASA7 { 8.1799728000e+00, -1.4010782000e-03, 3.4237725000e-06, -3.4961738000e-09, 1.3052780000e-12, -1.6048201000e+04, -3.0944525000e+01 })
    },
    elements = { ["K"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_KCN_L_ = Substance {
    name = "KCN(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(895.0, 5000.0, NASA7 { 9.0581305000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.5226717000e+04, -3.5454083000e+01 })
    },
    elements = { ["K"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_KCL_s_ = Substance {
    name = "KCL(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.3934311000e+00, 2.6535242000e-03, 9.6075655000e-07, -5.0251843000e-09, 4.0721228000e-12, -5.4248389000e+04, -2.1596814000e+01 }),
        Range(1000.0, 1044.0, NASA7 { 3.9157169000e+00, -2.0927271000e-03, 4.7310182000e-06, 7.0152537000e-09, -5.5146098000e-12, -5.2747066000e+04, -1.0144800000e+01 })
    },
    elements = { ["K"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_KCL_L_ = Substance {
    name = "KCL(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1044.0, 5000.0, NASA7 { 8.8518064000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -5.3369478000e+04, -4.0010059000e+01 })
    },
    elements = { ["K"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_KF_s_ = Substance {
    name = "KF(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.9843972000e+00, 3.5943190000e-03, -1.7696401000e-06, -4.8106141000e-10, 1.0280730000e-12, -7.0018149000e+04, -2.1384504000e+01 }),
        Range(1000.0, 1131.0, NASA7 { 9.4627782000e+00, -6.4057512000e-03, 6.3913262000e-08, 7.5949589000e-09, -3.3598104000e-12, -7.1249107000e+04, -4.4831804000e+01 })
    },
    elements = { ["K"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_KF_L_ = Substance {
    name = "KF(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1131.0, 5000.0, NASA7 { 8.6555469000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.9268025000e+04, -4.1179932000e+01 })
    },
    elements = { ["K"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_KHF2_a_ = Substance {
    name = "KHF2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 469.85, NASA7 { -9.1298498000e+00, 8.6618889000e-02, 4.3904412000e-05, -6.6867599000e-07, 8.0454163000e-10, -1.1258259000e+05, 4.1082800000e+01 })
    },
    elements = { ["K"] = 1, ["H"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_KHF2_b_ = Substance {
    name = "KHF2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(469.85, 511.95, NASA7 { 1.2057378000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1457126000e+05, -5.4170140000e+01 })
    },
    elements = { ["K"] = 1, ["H"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_KHF2_L_ = Substance {
    name = "KHF2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(511.95, 6000.0, NASA7 { 1.2580737000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1404309000e+05, -5.5879915000e+01 })
    },
    elements = { ["K"] = 1, ["H"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_KOH_a_ = Substance {
    name = "KOH(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 516.0, NASA7 { 6.4400977000e+00, 1.1310168000e-03, 1.5073272000e-05, -1.4906119000e-08, 1.0556325000e-11, -5.3161898000e+04, -2.8098853000e+01 })
    },
    elements = { ["K"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_KOH_b_ = Substance {
    name = "KOH(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(516.0, 679.0, NASA7 { 9.4607140000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -5.3291648000e+04, -4.3369326000e+01 })
    },
    elements = { ["K"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_KOH_L_ = Substance {
    name = "KOH(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(679.0, 5000.0, NASA7 { 9.9956469000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -5.2620731000e+04, -4.5334392000e+01 })
    },
    elements = { ["K"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_KO2_s_ = Substance {
    name = "KO2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8775487000e+00, 3.0157031000e-02, -5.1182251000e-05, 4.1633872000e-08, -1.3072956000e-11, -3.6340727000e+04, -1.4419032000e+01 }),
        Range(1000.0, 1500.0, NASA7 { -1.0494545000e+01, 6.8858988000e-02, -8.1402307000e-05, 4.2947692000e-08, -8.4965832000e-12, -3.2489989000e+04, 5.9685913000e+01 })
    },
    elements = { ["K"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2CO3_s_ = Substance {
    name = "K2CO3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 8.4398632000e+00, 1.8836256000e-02, -4.6827483000e-07, -1.0519610000e-08, 6.4318412000e-12, -1.4166744000e+05, -3.4894424000e+01 }),
        Range(1000.0, 1174.0, NASA7 { 2.2824341000e+01, -1.3580993000e-02, 8.7409890000e-06, 1.1494425000e-08, -6.7588149000e-12, -1.4577844000e+05, -1.1048665000e+02 })
    },
    elements = { ["K"] = 2, ["C"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2CO3_L_ = Substance {
    name = "K2CO3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1174.0, 5000.0, NASA7 { 2.5161469000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4740138000e+05, -1.3110730000e+02 })
    },
    elements = { ["K"] = 2, ["C"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_K2O_s_ = Substance {
    name = "K2O(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.4303987200e-01, 6.2063770500e-02, -1.3623107300e-04, 1.3637697200e-07, -4.9016386000e-11, -4.5612586200e+04, -4.7590347000e+00 }),
        Range(1000.0, 2000.0, NASA7 { 7.1870264000e+00, 9.1149236500e-03, -4.1806688000e-06, 1.7989826700e-09, -2.8394125100e-13, -4.6000942600e+04, -3.1744980200e+01 })
    },
    elements = { ["K"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2O2_s_ = Substance {
    name = "K2O2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 8.8267420800e+00, 1.3262126400e-02, -1.1143957800e-05, 1.0958856300e-08, -4.2410160500e-12, -6.2773525400e+04, -4.0251432100e+01 }),
        Range(1000.0, 2000.0, NASA7 { 1.0481629900e+01, 6.9086180700e-03, 4.8656703800e-07, -2.5490272300e-10, 4.0838618600e-14, -6.3181431800e+04, -4.8477290200e+01 })
    },
    elements = { ["K"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2S_1_ = Substance {
    name = "K2S(1)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1364431000e+01, -1.8810663000e-01, 5.6005727000e-04, -6.9703555000e-07, 3.1249094000e-10, -4.9997406000e+04, -1.2810455000e+02 }),
        Range(1000.0, 1050.0, NASA7 { -7.4849337000e+01, 9.3619796000e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.7217939000e+03, 4.4967393000e+02 })
    },
    elements = { ["K"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2S_2_ = Substance {
    name = "K2S(2)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1050.0, 1100.0, NASA7 { 1.5642816000e+02, -1.2664444000e-01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.3114419000e+05, -9.2794275000e+02 })
    },
    elements = { ["K"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2S_3_ = Substance {
    name = "K2S(3)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1100.0, 1221.0, NASA7 { 1.7119867000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -5.4524953000e+04, -9.1666511000e+01 })
    },
    elements = { ["K"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2S_L_ = Substance {
    name = "K2S(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1221.0, 5000.0, NASA7 { 1.2142927000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.6520349000e+04, -5.4716043000e+01 })
    },
    elements = { ["K"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_K2SO4_a_ = Substance {
    name = "K2SO4(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 857.0, NASA7 { 1.7026526000e+00, 8.4709714000e-02, -1.7632573000e-04, 1.9282803000e-07, -7.6470890000e-11, -1.7598087000e+05, -7.5631951000e+00 })
    },
    elements = { ["K"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2SO4_b_ = Substance {
    name = "K2SO4(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(857.0, 1000.0, NASA7 { 1.3807177000e+01, 9.6730590000e-03, 4.5658551000e-08, 0.0000000000e+00, 0.0000000000e+00, -1.7585326000e+05, -5.8441296000e+01 }),
        Range(1000.0, 1342.0, NASA7 { -2.9019866000e+02, 1.0569631000e+00, -1.3475299000e-03, 7.6766576000e-07, -1.6337440000e-10, -1.0554214000e+05, 1.4530094000e+03 })
    },
    elements = { ["K"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_K2SO4_L_ = Substance {
    name = "K2SO4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1342.0, 5000.0, NASA7 { 2.4230499000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7695519000e+05, -1.1740222000e+02 })
    },
    elements = { ["K"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Li_cr_ = Substance {
    name = "Li(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 453.69, NASA7 { 6.1090994200e-01, 1.4104121700e-02, -1.7495817000e-05, -3.3374102300e-08, 7.7662966500e-11, -6.2512120800e+02, -3.2644994700e+00 })
    },
    elements = { ["Li"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Li_L_ = Substance {
    name = "Li(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(453.69, 1000.0, NASA7 { 4.6226663800e+00, -4.0616420500e-03, 5.9166617000e-06, -4.2496008500e-09, 1.2351747300e-12, -9.5881126700e+02, -2.1277850100e+01 }),
        Range(1000.0, 3000.0, NASA7 { 3.8931422300e+00, -8.4278769600e-04, 4.4554632800e-07, -3.6533745400e-11, 3.8927922000e-15, -8.2201955600e+02, -1.7818307700e+01 })
    },
    elements = { ["Li"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_LiALO2_s_ = Substance {
    name = "LiALO2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -5.2841156000e+00, 7.8452587000e-02, -1.4541578000e-04, 1.2462958000e-07, -4.0113705000e-11, -1.4381831000e+05, 1.8576733000e+01 }),
        Range(1000.0, 1973.0, NASA7 { 8.5440894000e+00, 6.4886791000e-03, -4.0863969000e-06, 1.5471466000e-09, -2.2495038000e-13, -1.4598150000e+05, -4.4590618000e+01 })
    },
    elements = { ["Li"] = 1, ["Al"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_LiALO2_L_ = Substance {
    name = "LiALO2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1973.0, 5000.0, NASA7 { 1.5096679000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4165839000e+05, -8.0993767000e+01 })
    },
    elements = { ["Li"] = 1, ["Al"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_LiCL_s_ = Substance {
    name = "LiCL(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 883.0, NASA7 { 4.1095245000e+00, 8.1981003000e-03, -1.1541874000e-05, 1.0585386000e-08, -3.6457022000e-12, -5.0608266000e+04, -1.8298894000e+01 })
    },
    elements = { ["Li"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_LiCL_L_ = Substance {
    name = "LiCL(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(883.0, 1000.0, NASA7 { 1.0383028000e+01, -4.7179699000e-03, -1.6138317000e-06, 8.0807174000e-09, -4.4459493000e-12, -5.0539120000e+04, -4.9921960000e+01 }),
        Range(1000.0, 2000.0, NASA7 { 8.2149477000e+00, 5.6391361000e-04, -1.7350331000e-06, 7.6595008000e-10, -1.2378477000e-13, -5.0007322000e+04, -3.8808961000e+01 })
    },
    elements = { ["Li"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_LiF_s_ = Substance {
    name = "LiF(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.7694325000e+00, 1.7505224000e-02, -2.8038751000e-05, 2.2893385000e-08, -6.9633658000e-12, -7.5299278000e+04, -9.9478057000e+00 }),
        Range(1000.0, 1121.3, NASA7 { 5.5405738000e+00, -1.3421080000e-04, 1.7825606000e-06, 8.8996444000e-10, -9.1296654000e-13, -7.5900365000e+04, -2.7447276000e+01 })
    },
    elements = { ["Li"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_LiF_L_ = Substance {
    name = "LiF(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1121.3, 5000.0, NASA7 { 7.7195401000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.4304347000e+04, -3.8815487000e+01 })
    },
    elements = { ["Li"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_LiH_s_ = Substance {
    name = "LiH(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 961.8, NASA7 { 3.8611812000e-01, 1.2127957000e-02, -8.6900336000e-06, 5.6311555000e-09, -1.2693483000e-12, -1.1486991000e+04, -3.0654575000e+00 })
    },
    elements = { ["Li"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_LiH_L_ = Substance {
    name = "LiH(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(961.8, 5000.0, NASA7 { 7.4981191000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1581826000e+04, -4.0047278000e+01 })
    },
    elements = { ["Li"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_LiOH_s_ = Substance {
    name = "LiOH(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 744.3, NASA7 { 6.3227797000e-01, 2.5340538000e-02, -2.7897950000e-05, 8.6925893000e-09, 4.1499894000e-12, -5.9412680000e+04, -4.8382697000e+00 })
    },
    elements = { ["Li"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_LiOH_L_ = Substance {
    name = "LiOH(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(744.3, 5000.0, NASA7 { 1.0474218000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.0185671000e+04, -5.3897140000e+01 })
    },
    elements = { ["Li"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Li2O_s_ = Substance {
    name = "Li2O(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -3.1727239000e-01, 3.6149356000e-02, -5.5455921000e-05, 4.1796437000e-08, -1.1804048000e-11, -7.3106196000e+04, -2.2888330000e+00 }),
        Range(1000.0, 1843.0, NASA7 { 4.2774776000e+00, 7.8521672000e-03, -5.2225090000e-07, -1.7864426000e-09, 5.3961035000e-13, -7.3396278000e+04, -2.1765497000e+01 })
    },
    elements = { ["Li"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Li2O_L_ = Substance {
    name = "Li2O(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1843.0, 5000.0, NASA7 { 1.2076931000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.1337921000e+04, -6.5174974000e+01 })
    },
    elements = { ["Li"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Li2SO4_a_ = Substance {
    name = "Li2SO4(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 848.0, NASA7 { -4.1387359700e+00, 1.0694056800e-01, -2.0934605200e-04, 2.1289282200e-07, -8.0162510600e-11, -1.7480677600e+05, 1.2983577300e+01 })
    },
    elements = { ["Li"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Li2SO4_b_ = Substance {
    name = "Li2SO4(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(848.0, 1000.0, NASA7 { 2.5795481200e+01, -2.8462505200e-04, 1.5330112900e-07, 0.0000000000e+00, 0.0000000000e+00, -1.8030844500e+05, -1.3631216800e+02 }),
        Range(1000.0, 1132.0, NASA7 { 2.6102651300e+01, -8.2930472800e-04, 3.9081073500e-07, 0.0000000000e+00, 0.0000000000e+00, -1.8042244500e+05, -1.3800809900e+02 })
    },
    elements = { ["Li"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Li2SO4_L_ = Substance {
    name = "Li2SO4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1132.0, 6000.0, NASA7 { 2.4657913200e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7809779800e+05, -1.2762615800e+02 })
    },
    elements = { ["Li"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Li3N_s_ = Substance {
    name = "Li3N(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9225558000e+00, 2.8598702000e-02, -3.5336947000e-05, 3.1861985000e-08, -1.1093501000e-11, -2.1678029000e+04, -1.6331057000e+01 }),
        Range(1000.0, 1300.0, NASA7 { 5.4422503000e+00, 1.3477737000e-02, -1.9422322000e-06, -2.4960109000e-11, 0.0000000000e+00, -2.2015776000e+04, -2.7457275000e+01 })
    },
    elements = { ["Li"] = 3, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Mg_cr_ = Substance {
    name = "Mg(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 923.0, NASA7 { 1.4788494400e+00, 9.2743052600e-03, -1.9505078800e-05, 1.9821552700e-08, -7.0492737400e-12, -7.1664929900e+02, -6.5722269500e+00 })
    },
    elements = { ["Mg"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Mg_L_ = Substance {
    name = "Mg(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(923.0, 6000.0, NASA7 { 4.1253182700e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.5893434100e+02, -1.9378689400e+01 })
    },
    elements = { ["Mg"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgAL2O4_s_ = Substance {
    name = "MgAL2O4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -6.3912625000e+00, 1.1718860000e-01, -2.1325178000e-04, 1.8277405000e-07, -5.8831991000e-11, -2.7827141000e+05, 2.0132701000e+01 }),
        Range(1000.0, 2408.0, NASA7 { 1.4697679000e+01, 9.3304797000e-03, -3.5522598000e-06, 1.1550530000e-09, -1.4334531000e-13, -2.8166411000e+05, -7.6668685000e+01 })
    },
    elements = { ["Mg"] = 1, ["Al"] = 2, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgAL2O4_L_ = Substance {
    name = "MgAL2O4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2408.0, 5000.0, NASA7 { 2.6419188000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.6883536000e+05, -1.4198581000e+02 })
    },
    elements = { ["Mg"] = 1, ["Al"] = 2, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgBr2_s_ = Substance {
    name = "MgBr2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 984.0, NASA7 { 5.1966422000e+00, 2.0670253000e-02, -3.7253939000e-05, 3.1937564000e-08, -9.9507016000e-12, -6.5252616000e+04, -2.0288910000e+01 })
    },
    elements = { ["Mg"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgBr2_L_ = Substance {
    name = "MgBr2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(984.0, 5000.0, NASA7 { 1.2580737000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.3962982000e+04, -5.6255460000e+01 })
    },
    elements = { ["Mg"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgCO3_s_ = Substance {
    name = "MgCO3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.3491924000e+00, 3.6934112000e-02, -4.4492952000e-05, 3.1815906000e-08, -9.7545300000e-12, -1.3541685000e+05, -9.0618732000e+00 })
    },
    elements = { ["Mg"] = 1, ["C"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgCL2_s_ = Substance {
    name = "MgCL2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 987.0, NASA7 { 5.4491296000e+00, 1.6745224000e-02, -2.5956907000e-05, 1.9111573000e-08, -5.1059014000e-12, -7.9343894000e+04, -2.4261084000e+01 })
    },
    elements = { ["Mg"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgCL2_L_ = Substance {
    name = "MgCL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(987.0, 5000.0, NASA7 { 1.1071048000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.6294618000e+04, -4.8972588000e+01 })
    },
    elements = { ["Mg"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgF2_s_ = Substance {
    name = "MgF2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.6036110000e+00, 3.1794486000e-02, -5.2685798000e-05, 4.1587706000e-08, -1.2619495000e-11, -1.3672034000e+05, -9.7323171000e+00 }),
        Range(1000.0, 1536.0, NASA7 { -2.1022427000e+00, 3.5024228000e-02, -3.9749893000e-05, 2.0461859000e-08, -3.9534410000e-12, -1.3539308000e+05, 1.1044555000e+01 })
    },
    elements = { ["Mg"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgF2_L_ = Substance {
    name = "MgF2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1536.0, 5000.0, NASA7 { 1.1416767000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.3408410000e+05, -5.7425069000e+01 })
    },
    elements = { ["Mg"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgI2_s_ = Substance {
    name = "MgI2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 907.0, NASA7 { 6.7017159000e+00, 1.1697022000e-02, -1.6836308000e-05, 1.3143809000e-08, -4.0099957000e-12, -4.6527761000e+04, -2.5432043000e+01 })
    },
    elements = { ["Mg"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgI2_L_ = Substance {
    name = "MgI2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(907.0, 5000.0, NASA7 { 1.2077507000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.5525660000e+04, -5.1883526000e+01 })
    },
    elements = { ["Mg"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgO_s_ = Substance {
    name = "MgO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -4.5403953000e-01, 2.7873269000e-02, -4.9062247000e-05, 4.0474151000e-08, -1.2670344000e-11, -7.3057948000e+04, -6.3552020000e-01 }),
        Range(1000.0, 3105.0, NASA7 { 5.0448681000e+00, 1.6898201000e-03, -7.5617695000e-07, 2.0286893000e-10, -2.0591271000e-14, -7.4029285000e+04, -2.6328892000e+01 })
    },
    elements = { ["Mg"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgO_L_ = Substance {
    name = "MgO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(3105.0, 5000.0, NASA7 { 8.0516715000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.9879451000e+04, -4.4343825000e+01 })
    },
    elements = { ["Mg"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgO2H2_s_ = Substance {
    name = "MgO2H2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -4.1664248000e+00, 7.6844987000e-02, -1.3720767000e-04, 1.1426859000e-07, -3.5925837000e-11, -1.1238434000e+05, 1.3592637000e+01 })
    },
    elements = { ["Mg"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgS_s_ = Substance {
    name = "MgS(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0972877000e+00, 6.9297858000e-03, -9.2029286000e-06, 5.6329335000e-09, -1.2170330000e-12, -4.3040759000e+04, -1.8996001000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 5.3501229000e+00, 1.3433655000e-03, -6.2905000000e-07, 1.9819858000e-10, -2.2591648000e-14, -4.3238548000e+04, -2.4837831000e+01 })
    },
    elements = { ["Mg"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgSO4_s_ = Substance {
    name = "MgSO4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.1534059000e+00, 4.8756532000e-02, -7.3665030000e-05, 5.9427787000e-08, -1.8433708000e-11, -1.5680962000e+05, -1.3028444000e+01 }),
        Range(1000.0, 1400.0, NASA7 { -6.4476920000e+01, 2.6375317000e-01, -3.2491884000e-04, 1.8257234000e-07, -3.8690767000e-11, -1.4066107000e+05, 3.2188389000e+02 })
    },
    elements = { ["Mg"] = 1, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgSO4_L_ = Substance {
    name = "MgSO4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1400.0, 5000.0, NASA7 { 1.9122720000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.6092876000e+05, -1.0180465000e+02 })
    },
    elements = { ["Mg"] = 1, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgSiO3_I_ = Substance {
    name = "MgSiO3(I)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 903.0, NASA7 { 1.3377779000e+00, 4.4453222000e-02, -6.5973753000e-05, 4.7414257000e-08, -1.2331098000e-11, -1.8817226000e+05, -1.0178936000e+01 })
    },
    elements = { ["Mg"] = 1, ["Si"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgSiO3_II_ = Substance {
    name = "MgSiO3(II)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(903.0, 1258.0, NASA7 { 1.4473886000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.9162172000e+05, -7.6659464000e+01 })
    },
    elements = { ["Mg"] = 1, ["Si"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgSiO3_III_ = Substance {
    name = "MgSiO3(III)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1258.0, 1850.0, NASA7 { 1.4725501000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.9174199000e+05, -7.8299298000e+01 })
    },
    elements = { ["Mg"] = 1, ["Si"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgSiO3_L_ = Substance {
    name = "MgSiO3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1850.0, 5000.0, NASA7 { 1.7613031000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.8802579000e+05, -9.5125731000e+01 })
    },
    elements = { ["Mg"] = 1, ["Si"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgTiO3_s_ = Substance {
    name = "MgTiO3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.5777743000e-01, 6.2018397000e-02, -1.0480596000e-04, 8.4940925000e-08, -2.6367295000e-11, -1.9107738000e+05, -4.6616535000e+00 }),
        Range(1000.0, 1953.0, NASA7 { 1.0288224000e+01, 1.0343730000e-02, -7.4012179000e-06, 2.7928824000e-09, -3.9532448000e-13, -1.9281168000e+05, -5.2958088000e+01 })
    },
    elements = { ["Mg"] = 1, ["Ti"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgTiO3_L_ = Substance {
    name = "MgTiO3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1953.0, 5000.0, NASA7 { 1.9625949000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.9091812000e+05, -1.0656204000e+02 })
    },
    elements = { ["Mg"] = 1, ["Ti"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_MgTi2O5_s_ = Substance {
    name = "MgTi2O5(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.2716311000e+00, 9.2663794000e-02, -1.6369502000e-04, 1.3903373000e-07, -4.4513232000e-11, -3.0511613000e+05, -1.2422102000e+01 }),
        Range(1000.0, 1963.0, NASA7 { 1.6776608000e+01, 1.2237791000e-02, -6.3013160000e-06, 2.4019488000e-09, -3.5412930000e-13, -3.0754655000e+05, -8.3293390000e+01 })
    },
    elements = { ["Mg"] = 1, ["Ti"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Solid",
}

local s_MgTi2O5_L_ = Substance {
    name = "MgTi2O5(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1963.0, 5000.0, NASA7 { 3.1401519000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.0410001000e+05, -1.6858649000e+02 })
    },
    elements = { ["Mg"] = 1, ["Ti"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Mg2SiO4_s_ = Substance {
    name = "Mg2SiO4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.3428982000e+00, 6.6866588000e-02, -9.6445625000e-05, 6.6423960000e-08, -1.7183990000e-11, -2.6446901000e+05, -1.2399162000e+01 }),
        Range(1000.0, 2171.0, NASA7 { 1.5752679000e+01, 6.8004650000e-03, -1.6203951000e-06, 7.7368112000e-12, 6.3337573000e-14, -2.6729955000e+05, -8.1457992000e+01 })
    },
    elements = { ["Mg"] = 2, ["Si"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Mg2SiO4_L_ = Substance {
    name = "Mg2SiO4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2171.0, 5000.0, NASA7 { 2.4658244000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.6692549000e+05, -1.3461510000e+02 })
    },
    elements = { ["Mg"] = 2, ["Si"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Mg2TiO4_s_ = Substance {
    name = "Mg2TiO4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -5.0441156000e-02, 8.8086424000e-02, -1.5683789000e-04, 1.3401847000e-07, -4.3123787000e-11, -2.6307865000e+05, -6.2537507000e+00 }),
        Range(1000.0, 2013.0, NASA7 { 1.4772577000e+01, 1.0824147000e-02, -4.9907560000e-06, 1.7407944000e-09, -2.5398195000e-13, -2.6539078000e+05, -7.3933710000e+01 })
    },
    elements = { ["Mg"] = 2, ["Ti"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Mg2TiO4_L_ = Substance {
    name = "Mg2TiO4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2013.0, 5000.0, NASA7 { 2.7476329000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.6153559000e+05, -1.4745837000e+02 })
    },
    elements = { ["Mg"] = 2, ["Ti"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Mo_cr_ = Substance {
    name = "Mo(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.3288414100e+00, 9.8255368900e-03, -2.1092982500e-05, 2.0950952800e-08, -7.6070324400e-12, -6.8436478900e+02, -6.2928653800e+00 }),
        Range(1000.0, 2896.0, NASA7 { 5.3843282300e+00, -6.0162218000e-03, 6.0148252600e-06, -2.3296233800e-09, 3.5200780800e-13, -1.6265722000e+03, -2.6248889100e+01 })
    },
    elements = { ["Mo"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Mo_L_ = Substance {
    name = "Mo(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2896.0, 6000.0, NASA7 { 4.5289499900e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 2.0214066700e+03, -2.2807475200e+01 })
    },
    elements = { ["Mo"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NH4CL_a_ = Substance {
    name = "NH4CL(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 458.0, NASA7 { 4.6749383000e+00, 1.9273425000e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.0082751000e+04, -2.0959133000e+01 })
    },
    elements = { ["N"] = 1, ["H"] = 4, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NH4CL_b_ = Substance {
    name = "NH4CL(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(458.0, 793.2, NASA7 { 4.1666850000e+00, 1.3436049000e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.8762693000e+04, -1.4134402000e+01 })
    },
    elements = { ["N"] = 1, ["H"] = 4, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na_cr_ = Substance {
    name = "Na(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 371.01, NASA7 { 1.2395424200e+00, 2.0056218900e-02, -7.3641825200e-05, 1.0271214900e-07, 0.0000000000e+00, -8.1332091600e+02, -4.5065139100e+00 })
    },
    elements = { ["Na"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na_L_ = Substance {
    name = "Na(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(371.01, 1000.0, NASA7 { 4.3238241900e+00, -1.4114545100e-03, -1.3106884600e-07, 9.1745767900e-10, -2.3506507000e-13, -9.3652226300e+02, -1.7272263800e+01 }),
        Range(1000.0, 2300.0, NASA7 { 4.5985854300e+00, -2.4245940600e-03, 1.3245379400e-06, -4.1237531700e-11, 6.4016708100e-15, -9.9853553400e+02, -1.8625712700e+01 })
    },
    elements = { ["Na"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NaALO2_a_ = Substance {
    name = "NaALO2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 740.0, NASA7 { -8.0504780000e-01, 5.8434968000e-02, -1.1884415000e-04, 1.1970042000e-07, -4.6224793000e-11, -1.3781665000e+05, -5.3335282000e-02 })
    },
    elements = { ["Na"] = 1, ["Al"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NaALO2_b_ = Substance {
    name = "NaALO2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(740.0, 1000.0, NASA7 { 1.0542343000e+01, 8.8483907000e-04, 1.3906763000e-06, -5.1391393000e-10, 0.0000000000e+00, -1.3958060000e+05, -5.2371362000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 1.1966215000e+01, -2.2817277000e-03, 3.7713741000e-06, -1.2932670000e-09, 1.4135022000e-13, -1.4004818000e+05, -6.0006455000e+01 })
    },
    elements = { ["Na"] = 1, ["Al"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NaBr_s_ = Substance {
    name = "NaBr(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.8766461000e+00, 6.8318928000e-03, -1.0641163000e-05, 9.1613928000e-09, -2.8816297000e-12, -4.5148644000e+04, -1.8982545000e+01 }),
        Range(1000.0, 1020.0, NASA7 { 6.6246448000e+00, 1.2382983000e-04, 4.0990276000e-07, 2.0683651000e-10, -1.8076485000e-14, -4.5560372000e+04, -2.7605800000e+01 })
    },
    elements = { ["Na"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NaBr_L_ = Substance {
    name = "NaBr(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1020.0, 5000.0, NASA7 { 7.4981191000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.3049770000e+04, -3.0170451000e+01 })
    },
    elements = { ["Na"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NaCN_s_ = Substance {
    name = "NaCN(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 835.0, NASA7 { 7.9967732000e+00, 1.9154550000e-03, -5.3421591000e-06, 6.8091642000e-09, -3.1414911000e-12, -1.3340294000e+04, -3.1703933000e+01 })
    },
    elements = { ["Na"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NaCN_L_ = Substance {
    name = "NaCN(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(835.0, 5000.0, NASA7 { 9.5613600000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.3386407000e+04, -4.0287309000e+01 })
    },
    elements = { ["Na"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NaCL_s_ = Substance {
    name = "NaCL(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.0240778000e+00, 5.1949066000e-03, -7.2833730000e-06, 6.0671979000e-09, -1.2013424000e-12, -5.1123335000e+04, -2.1227201000e+01 }),
        Range(1000.0, 1073.8, NASA7 { 2.2134927000e+00, 1.5859902000e-03, 5.0486383000e-06, 2.6020549000e-09, -3.6487096000e-12, -4.9263203000e+04, -2.6025660000e+00 })
    },
    elements = { ["Na"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NaCL_L_ = Substance {
    name = "NaCL(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1073.8, 5000.0, NASA7 { 1.2358488000e+01, -6.3071201000e-03, 3.2004723000e-06, -6.7717362000e-10, 5.1015612000e-14, -5.1423265000e+04, -6.0585530000e+01 })
    },
    elements = { ["Na"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NaF_s_ = Substance {
    name = "NaF(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6977552000e+00, 1.0520572000e-02, -1.7235656000e-05, 1.4125911000e-08, -3.9514529000e-12, -7.0647183000e+04, -1.7393633000e+01 }),
        Range(1000.0, 1269.0, NASA7 { 7.8342026000e+00, -9.4839180000e-04, -5.4843986000e-06, 8.6843022000e-09, -2.9285860000e-12, -7.1810405000e+04, -3.8815710000e+01 })
    },
    elements = { ["Na"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NaF_L_ = Substance {
    name = "NaF(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1269.0, 3500.0, NASA7 { 1.0963261000e+01, -3.2068459000e-03, 1.1611662000e-06, -1.6299297000e-10, 5.2456141000e-15, -7.0673943000e+04, -5.6375695000e+01 })
    },
    elements = { ["Na"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NaI_s_ = Substance {
    name = "NaI(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 933.0, NASA7 { 5.4995984000e+00, 3.5668053000e-03, -3.9965630000e-06, 3.1841073000e-09, -9.5308722000e-13, -3.6390356000e+04, -2.0399251000e+01 })
    },
    elements = { ["Na"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NaI_L_ = Substance {
    name = "NaI(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(933.0, 5000.0, NASA7 { 7.8000568000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.4759568000e+04, -3.0818881000e+01 })
    },
    elements = { ["Na"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NaOH_a_ = Substance {
    name = "NaOH(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 596.0, NASA7 { 8.5879494000e+00, -3.5406013000e-03, -4.5533394000e-05, 1.8418483000e-07, -1.5018973000e-10, -5.3511851000e+04, -3.9407585000e+01 })
    },
    elements = { ["Na"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NaOH_L_ = Substance {
    name = "NaOH(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(596.0, 1000.0, NASA7 { 9.0556775000e+00, 4.3025041000e-03, -2.4259132000e-06, -3.5479664000e-09, 2.6889420000e-12, -5.2942445000e+04, -4.3515140000e+01 }),
        Range(1000.0, 2500.0, NASA7 { 9.4972321000e+00, 2.2717972000e-03, -2.3977934000e-06, 7.8398477000e-10, -8.1976472000e-14, -5.2906824000e+04, -4.5299900000e+01 })
    },
    elements = { ["Na"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NaO2_s_ = Substance {
    name = "NaO2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.2798882000e+00, 4.4160721000e-03, 1.2413921000e-06, -1.2921171000e-09, 4.8259479000e-13, -3.3726561000e+04, -2.8899807000e+01 }),
        Range(1000.0, 2000.0, NASA7 { 6.6753177000e+00, 6.4234513000e-03, -1.5437773000e-06, 6.8357774000e-10, -1.1073922000e-13, -3.3572546000e+04, -2.5848608000e+01 })
    },
    elements = { ["Na"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2CO3_I_ = Substance {
    name = "Na2CO3(I)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 723.15, NASA7 { 6.7835659000e+00, 3.8829701000e-02, -9.8262455000e-05, 1.6543084000e-07, -8.3294515000e-11, -1.3917010000e+05, -3.0463293000e+01 })
    },
    elements = { ["Na"] = 2, ["C"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2CO3_II_ = Substance {
    name = "Na2CO3(II)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(723.15, 1000.0, NASA7 { 1.1848341000e+01, -3.5138986000e-03, 2.0615569000e-05, -7.3965175000e-09, 0.0000000000e+00, -1.3814187000e+05, -4.8064368000e+01 }),
        Range(1000.0, 1123.15, NASA7 { 8.2817755000e+00, 1.1275389000e-02, 1.9963294000e-06, 0.0000000000e+00, 0.0000000000e+00, -1.3761266000e+05, -3.1372580000e+01 })
    },
    elements = { ["Na"] = 2, ["C"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2CO3_L_ = Substance {
    name = "Na2CO3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1123.15, 5000.0, NASA7 { 2.2796295000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4229218000e+05, -1.1622121000e+02 })
    },
    elements = { ["Na"] = 2, ["C"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Na2O_c_ = Substance {
    name = "Na2O(c)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.2654583000e+00, 1.1116872000e-02, -6.3875382000e-07, -9.6993207000e-09, 5.3720071000e-12, -5.2314345000e+04, -2.4187024000e+01 }),
        Range(1000.0, 1243.2, NASA7 { 2.4168956000e+01, -2.5279744000e-02, -4.7390658000e-06, 3.1836387000e-08, -1.4570265000e-11, -5.8048236000e+04, -1.2518065000e+02 })
    },
    elements = { ["Na"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2O_a_ = Substance {
    name = "Na2O(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1243.2, 1405.2, NASA7 { -1.4906590000e+02, 2.2799038000e-01, 3.8391268000e-05, -1.7099919000e-07, 6.1395926000e-11, 1.1614795000e+04, 8.4689268000e+02 })
    },
    elements = { ["Na"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2O_L_ = Substance {
    name = "Na2O(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1405.2, 5000.0, NASA7 { 1.2580737000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.8594857000e+04, -6.0661549000e+01 })
    },
    elements = { ["Na"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Na2O2_a_ = Substance {
    name = "Na2O2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 785.0, NASA7 { 4.5815278000e+00, 3.2455910000e-02, -5.1154201000e-05, 4.2663979000e-08, -1.3991637000e-11, -6.4161053000e+04, -2.2455453000e+01 })
    },
    elements = { ["Na"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2O2_b_ = Substance {
    name = "Na2O2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(785.0, 5000.0, NASA7 { 1.3662680000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.5632571000e+04, -6.6841551000e+01 })
    },
    elements = { ["Na"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2S_1_ = Substance {
    name = "Na2S(1)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 9.7075599000e+00, -3.1126183000e-04, 5.5121161000e-06, -6.0435072000e-09, 2.3017549000e-12, -4.6950379000e+04, -4.3837613000e+01 }),
        Range(1000.0, 1276.0, NASA7 { 4.4675560000e+02, -1.0585111000e+00, 8.1170093000e-04, -1.8877878000e-07, 0.0000000000e+00, -1.7748394000e+05, -2.3462659000e+03 })
    },
    elements = { ["Na"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2S_2_ = Substance {
    name = "Na2S(2)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1276.0, 1445.0, NASA7 { -5.6793549000e+05, 1.6804121000e+03, -1.8622679000e+00, 9.1620588000e-04, -1.6884879000e-07, 1.5332805000e+08, 2.9108687000e+06 })
    },
    elements = { ["Na"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2S_L_ = Substance {
    name = "Na2S(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1445.0, 5000.0, NASA7 { 1.1071048000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.2790930000e+04, -4.8615889000e+01 })
    },
    elements = { ["Na"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Na2SO4_V_ = Substance {
    name = "Na2SO4(V)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 458.0, NASA7 { 5.8339318600e+00, 3.0820199200e-02, 5.9798635000e-05, -2.5977907800e-07, 2.4785399800e-10, -1.7015607500e+05, -2.5288642700e+01 })
    },
    elements = { ["Na"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2SO4_IV_ = Substance {
    name = "Na2SO4(IV)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(458.0, 514.0, NASA7 { 9.7196778400e+00, 2.1882042000e-02, -6.1977074700e-06, 0.0000000000e+00, 0.0000000000e+00, -1.7071281900e+05, -4.3606336900e+01 })
    },
    elements = { ["Na"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2SO4_I_ = Substance {
    name = "Na2SO4(I)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(514.0, 1000.0, NASA7 { 1.5485438900e+01, 1.9261377700e-02, -3.3225733200e-05, 3.5628330200e-08, -1.3057721400e-11, -1.7132292300e+05, -7.3512701500e+01 }),
        Range(1000.0, 1157.0, NASA7 { 1.6115738900e+01, 8.2092589100e-03, -2.3330554700e-07, 0.0000000000e+00, 0.0000000000e+00, -1.7112910100e+05, -7.4699074800e+01 })
    },
    elements = { ["Na"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na2SO4_L_ = Substance {
    name = "Na2SO4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1157.0, 6000.0, NASA7 { 2.3697772900e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7165891200e+05, -1.1635848200e+02 })
    },
    elements = { ["Na"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Na3ALF6_a_ = Substance {
    name = "Na3ALF6(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 836.0, NASA7 { 2.2592958000e+00, 1.5569666000e-01, -3.6161844000e-04, 4.0479080000e-07, -1.6505552000e-10, -4.0405993000e+05, -1.7798545000e+01 })
    },
    elements = { ["Na"] = 3, ["Al"] = 1, ["F"] = 6 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na3ALF6_b_ = Substance {
    name = "Na3ALF6(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(836.0, 1000.0, NASA7 { 1.6593657000e+01, 1.6911694000e-02, 1.0316600000e-06, 0.0000000000e+00, 0.0000000000e+00, -4.0108689000e+05, -6.4910792000e+01 }),
        Range(1000.0, 1285.0, NASA7 { 9.5543957000e+00, 3.5201542000e-02, -1.4620994000e-05, 4.4020669000e-09, 0.0000000000e+00, -3.9907552000e+05, -2.8216177000e+01 })
    },
    elements = { ["Na"] = 3, ["Al"] = 1, ["F"] = 6 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na3ALF6_L_ = Substance {
    name = "Na3ALF6(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1285.0, 5000.0, NASA7 { 4.7567623000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.1296538000e+05, -2.5375880000e+02 })
    },
    elements = { ["Na"] = 3, ["Al"] = 1, ["F"] = 6 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Na5AL3F14_s_ = Substance {
    name = "Na5AL3F14(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.3728171000e+01, 2.3298300000e-01, -4.1672172000e-04, 3.5373268000e-07, -1.1276774000e-10, -9.2325582000e+05, -7.3913754000e+01 }),
        Range(1000.0, 1010.0, NASA7 { 6.0805376000e+01, 1.0149015000e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.3194365000e+05, -2.9491948000e+02 })
    },
    elements = { ["Na"] = 5, ["Al"] = 3, ["F"] = 14 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Na5AL3F14_L_ = Substance {
    name = "Na5AL3F14(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1010.0, 5000.0, NASA7 { 1.1713010000e+02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.5612884000e+05, -6.4705309000e+02 })
    },
    elements = { ["Na"] = 5, ["Al"] = 3, ["F"] = 14 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Nb_cr_ = Substance {
    name = "Nb(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.9120055700e+00, 6.9239627500e-03, -1.5608120100e-05, 1.6180409000e-08, -6.0460204300e-12, -7.6903719600e+02, -8.0099026100e+00 }),
        Range(1000.0, 2750.0, NASA7 { 4.2149998600e+00, -2.9068649100e-03, 3.1239699000e-06, -1.2790974900e-09, 2.0922940600e-13, -1.2868210200e+03, -1.9197617900e+01 })
    },
    elements = { ["Nb"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Nb_L_ = Substance {
    name = "Nb(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2750.0, 6000.0, NASA7 { 4.0257333300e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.4270404700e+03, -1.8579055200e+01 })
    },
    elements = { ["Nb"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NbO_s_ = Substance {
    name = "NbO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9821260000e+00, 1.0217545000e-02, -1.5178895000e-05, 1.1308467000e-08, -3.1382858000e-12, -5.1703369000e+04, -1.3918597000e+01 }),
        Range(1000.0, 2210.0, NASA7 { 5.1236553000e+00, 8.9375860000e-04, 3.0930845000e-07, -1.6433702000e-10, 2.8569835000e-14, -5.2110910000e+04, -2.4099520000e+01 })
    },
    elements = { ["Nb"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NbO_L_ = Substance {
    name = "NbO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2210.0, 5000.0, NASA7 { 7.5484421000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.4587138000e+04, -3.5817340000e+01 })
    },
    elements = { ["Nb"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NbO2_I_ = Substance {
    name = "NbO2(I)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -1.5484179200e+00, 5.4553642800e-02, -1.2067462600e-04, 1.2377777000e-07, -4.5615480800e-11, -9.6731163000e+04, 3.4726821500e+00 }),
        Range(1000.0, 1090.0, NASA7 { 5.2890271600e+00, 5.2038606200e-03, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.7297246100e+04, -2.4890859700e+01 })
    },
    elements = { ["Nb"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NbO2_II_ = Substance {
    name = "NbO2(II)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1090.0, 1200.0, NASA7 { 1.1171410000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.0020599800e+05, -5.9981944100e+01 })
    },
    elements = { ["Nb"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NbO2_III_ = Substance {
    name = "NbO2(III)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1200.0, 2175.0, NASA7 { 9.9888508200e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.8786927400e+04, -5.1597508800e+01 })
    },
    elements = { ["Nb"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NbO2_L_ = Substance {
    name = "NbO2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2175.0, 6000.0, NASA7 { 1.1322375000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.0616575800e+04, -5.6755346200e+01 })
    },
    elements = { ["Nb"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Nb2O5_s_ = Substance {
    name = "Nb2O5(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 8.5053488000e+00, 3.4401214000e-02, -3.7698748000e-05, 1.9863720000e-08, -3.9610267000e-12, -2.3223229000e+05, -4.0684920000e+01 }),
        Range(1000.0, 1785.0, NASA7 { 1.7054892000e+01, 4.9140558000e-03, 4.7294644000e-07, -1.8376071000e-09, 5.0621922000e-13, -2.3423027000e+05, -8.3224799000e+01 })
    },
    elements = { ["Nb"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Nb2O5_L_ = Substance {
    name = "Nb2O5(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1785.0, 5000.0, NASA7 { 2.9136987000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.3736025000e+05, -1.5933396000e+02 })
    },
    elements = { ["Nb"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ni_cr_ = Substance {
    name = "Ni(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 631.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=3.9209761400e+00, a4=-2.3418471900e-02, a5=1.3423014500e-04, a6=-2.7597163900e-07, a7=1.9853086100e-10, a8=-8.6238720600e+02, a9=-1.5685618600e+01 }),
        Range(631.0, 1000.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=4.8548487700e+02, a4=-2.3039538000e+00, a5=4.1062263400e-03, a6=-3.2335010100e-06, a7=9.4961738100e-10, a8=-8.1170908500e+04, a9=-2.2542896000e+03 }),
        Range(1000.0, 1728.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=9.5820857200e+00, a4=-1.7894512200e-02, a5=1.9718511200e-05, a6=-9.1195795200e-09, a7=1.5872860900e-12, a8=-2.6178218500e+03, a9=-4.7461239300e+01 })
    },
    elements = { ["Ni"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ni_L_ = Substance {
    name = "Ni(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1728.0, 6000.0, NASA7 { 4.6798909400e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.2223834600e+02, -2.3351779700e+01 })
    },
    elements = { ["Ni"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NiS_b_ = Substance {
    name = "NiS(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 652.0, NASA7 { 2.5150513000e+00, 1.9810879000e-02, -4.4751713000e-05, 5.3552736000e-08, -2.4739151000e-11, -1.1897275000e+04, -1.2298805000e+01 })
    },
    elements = { ["Ni"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NiS_a_ = Substance {
    name = "NiS(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(652.0, 1000.0, NASA7 { 1.5977855000e+00, 1.6279159000e-02, -2.3959264000e-05, 1.9665247000e-08, -5.9993592000e-12, -1.0605192000e+04, -4.9988414000e+00 }),
        Range(1000.0, 1249.0, NASA7 { -2.1688277000e+00, 2.0467261000e-02, -1.5239068000e-05, 4.5242039000e-09, 0.0000000000e+00, -9.2539731000e+03, 1.6018976000e+01 })
    },
    elements = { ["Ni"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NiS_L_ = Substance {
    name = "NiS(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1249.0, 5000.0, NASA7 { 9.2342608000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1053652000e+04, -4.5769736000e+01 })
    },
    elements = { ["Ni"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_NiS2_s_ = Substance {
    name = "NiS2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.7449349000e+00, 2.5351714000e-03, -9.9767587000e-08, 1.0782950000e-10, -4.1912941000e-14, -1.8222539000e+04, -3.6224388000e+01 }),
        Range(1000.0, 1280.0, NASA7 { 5.2742640000e+00, 9.0870931000e-03, -5.8201099000e-06, 1.7050081000e-09, 0.0000000000e+00, -1.7528725000e+04, -2.3392219000e+01 })
    },
    elements = { ["Ni"] = 1, ["S"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_NiS2_L_ = Substance {
    name = "NiS2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1280.0, 5000.0, NASA7 { 1.0945241000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.2344925000e+04, -4.9720624000e+01 })
    },
    elements = { ["Ni"] = 1, ["S"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ni3S2_I_ = Substance {
    name = "Ni3S2(I)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 829.0, NASA7 { 6.9238300000e+00, 4.0446680000e-02, -7.3073957000e-05, 7.1007076000e-08, -2.6221859000e-11, -2.9362196000e+04, -3.2735052000e+01 })
    },
    elements = { ["Ni"] = 3, ["S"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ni3S2_II_ = Substance {
    name = "Ni3S2(II)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(829.0, 1062.0, NASA7 { 2.2685585000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.9313479000e+04, -1.1168978000e+02 })
    },
    elements = { ["Ni"] = 3, ["S"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ni3S2_L_ = Substance {
    name = "Ni3S2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1062.0, 5000.0, NASA7 { 2.3068039000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.7344402000e+04, -1.1211811000e+02 })
    },
    elements = { ["Ni"] = 3, ["S"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ni3S4_s_ = Substance {
    name = "Ni3S4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.4671193000e+01, 1.7277164000e-02, -2.7569284000e-09, 1.0233858000e-11, -6.2983956000e-15, -4.1358479000e+04, -6.6312939000e+01 }),
        Range(1000.0, 1100.0, NASA7 { 1.4673818000e+01, 1.7275718000e-02, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.1360001000e+04, -6.6329162000e+01 })
    },
    elements = { ["Ni"] = 3, ["S"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_P_cr_ = Substance {
    name = "P(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(195.4, 317.3, NASA7 { 8.0246968100e-01, 1.8577934700e-02, -8.3408074800e-05, 2.1110487600e-07, -2.0965889400e-10, -6.4636257000e+02, -2.9128102700e+00 })
    },
    elements = { ["P"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_P_L_ = Substance {
    name = "P(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(317.3, 6000.0, NASA7 { 3.1414960100e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -8.6214856400e+02, -1.2722747200e+01 })
    },
    elements = { ["P"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_P4O10_s_ = Substance {
    name = "P4O10(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9556099000e-01, 1.1333817000e-01, -1.2409982000e-04, 9.7715601000e-08, -3.4107839000e-11, -3.6625644300e+05, -3.8090697000e+00 }),
        Range(1000.0, 1500.0, NASA7 { -4.3300625000e+01, 2.1567376000e-01, -1.7686344000e-04, 6.7642852000e-08, -9.9108710000e-12, -3.5346139300e+05, 2.2605472000e+02 })
    },
    elements = { ["P"] = 4, ["O"] = 10 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Pb_cr_ = Substance {
    name = "Pb(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 600.65, NASA7 { 3.3601424800e+00, -4.3152551400e-03, 2.1040441100e-05, -3.3589735700e-08, 1.9185098800e-11, -9.3859300700e+02, -1.0740868700e+01 })
    },
    elements = { ["Pb"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Pb_L_ = Substance {
    name = "Pb(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(600.65, 1000.0, NASA7 { 3.4067993500e+00, 2.0322192700e-03, -4.1741747000e-06, 3.0839702200e-09, -8.1653143800e-13, -5.9202776900e+02, -1.1337795500e+01 }),
        Range(1000.0, 3600.0, NASA7 { 4.1819135500e+00, -9.8415097900e-04, 3.5533980900e-07, -1.7580834900e-11, -3.2388441900e-15, -7.5606576900e+02, -1.5109954500e+01 })
    },
    elements = { ["Pb"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_PbBr2_s_ = Substance {
    name = "PbBr2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 644.0, NASA7 { 1.0557554000e+01, -7.0617393000e-03, 1.0187602000e-05, 1.3052876000e-08, -1.6373094000e-11, -3.6304801000e+04, -3.9199032000e+01 })
    },
    elements = { ["Pb"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbBr2_L_ = Substance {
    name = "PbBr2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(644.0, 5000.0, NASA7 { 1.3486549000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.6572201000e+04, -5.7049087000e+01 })
    },
    elements = { ["Pb"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_PbCL2_s_ = Substance {
    name = "PbCL2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 774.0, NASA7 { 8.2802690000e+00, 3.0414343000e-03, 1.5602580000e-06, -2.2284610000e-09, 1.1115440000e-12, -4.5841218000e+04, -3.1781242000e+01 })
    },
    elements = { ["Pb"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbCL2_L_ = Substance {
    name = "PbCL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(774.0, 5000.0, NASA7 { 1.3411065000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.6167077000e+04, -5.9932654000e+01 })
    },
    elements = { ["Pb"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_PbF2_a_ = Substance {
    name = "PbF2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 583.0, NASA7 { 2.4696647100e+01, -1.5965888600e-01, 5.6767631800e-04, -8.5103052400e-07, 4.6684198500e-10, -8.5241331700e+04, -9.8157371400e+01 })
    },
    elements = { ["Pb"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbF2_b_ = Substance {
    name = "PbF2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(583.0, 1000.0, NASA7 { -9.6352495700e+02, 4.5058745300e+00, -7.5822410700e-03, 5.5231552400e-06, -1.4718392300e-09, 7.8523125500e+04, 4.4953173600e+03 }),
        Range(1000.0, 1103.0, NASA7 { 9.9328467400e+02, -1.8725594300e+00, 8.9069927300e-04, 0.0000000000e+00, 0.0000000000e+00, -4.2696200800e+05, -5.4067889700e+03 })
    },
    elements = { ["Pb"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbF2_L_ = Substance {
    name = "PbF2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1103.0, 6000.0, NASA7 { 1.3134064800e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -8.4755215200e+04, -6.2071327800e+01 })
    },
    elements = { ["Pb"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_PbI2_s_ = Substance {
    name = "PbI2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 683.0, NASA7 { 8.4424431000e+00, 5.9195772000e-03, -1.3888686000e-05, 1.3221393000e-08, 1.6164068000e-12, -2.3779049000e+04, -2.8337900000e+01 })
    },
    elements = { ["Pb"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbI2_L_ = Substance {
    name = "PbI2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(683.0, 5000.0, NASA7 { 1.3058805000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.3440932000e+04, -5.2044807000e+01 })
    },
    elements = { ["Pb"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_PbO_rd_ = Substance {
    name = "PbO(rd)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 762.0, NASA7 { 2.8646010000e+00, 1.0772372000e-02, -3.6613096000e-06, -1.2281087000e-08, 1.0066435000e-11, -2.7670174000e+04, -1.1304513000e+01 })
    },
    elements = { ["Pb"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbO_yw_ = Substance {
    name = "PbO(yw)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(762.0, 1000.0, NASA7 { 4.2073253000e+00, 5.2176481000e-03, -3.8613587000e-06, 1.3840146000e-09, 0.0000000000e+00, -2.7665601000e+04, -1.7064476000e+01 }),
        Range(1000.0, 1159.0, NASA7 { 5.1124626000e+00, 2.0394489000e-03, -2.0428228000e-07, 0.0000000000e+00, 0.0000000000e+00, -2.7854661000e+04, -2.1505944000e+01 })
    },
    elements = { ["Pb"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbO_L_ = Substance {
    name = "PbO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1159.0, 5000.0, NASA7 { 7.8176698000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.6656533000e+04, -3.5716934000e+01 })
    },
    elements = { ["Pb"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_PbO2_s_ = Substance {
    name = "PbO2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.3429785000e+00, 2.6612910000e-02, -4.1212633000e-05, 3.0723240000e-08, -8.9287875000e-12, -3.4585291000e+04, -1.1069931000e+01 }),
        Range(1000.0, 1200.0, NASA7 { 6.8695490000e+00, 4.6887940000e-03, -2.0206349000e-06, 0.0000000000e+00, 0.0000000000e+00, -3.5318750000e+04, -3.2001372000e+01 })
    },
    elements = { ["Pb"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbS_s_ = Substance {
    name = "PbS(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.5160970000e+00, 1.7196688000e-03, -1.2658604000e-06, 1.2505685000e-09, -4.6278508000e-13, -1.3538180000e+04, -2.0909267000e+01 }),
        Range(1000.0, 1386.5, NASA7 { 4.8695408000e+00, 2.5509848000e-03, -3.8042879000e-07, -5.4814638000e-10, 2.6573819000e-13, -1.3298452000e+04, -1.7299606000e+01 })
    },
    elements = { ["Pb"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_PbS_L_ = Substance {
    name = "PbS(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1386.5, 5000.0, NASA7 { 8.0516715000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.3566060000e+04, -3.5757796000e+01 })
    },
    elements = { ["Pb"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Pb3O4_s_ = Substance {
    name = "Pb3O4(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4709357000e+00, 8.9867009000e-02, -1.5231311000e-04, 1.1988500000e-07, -3.4949652000e-11, -9.0047726000e+04, -9.6062235000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.9927203000e+01, 5.0336233000e-03, -8.3439217000e-10, 2.0760899000e-13, -1.7770880000e-17, -9.2876787000e+04, -9.0288407000e+01 })
    },
    elements = { ["Pb"] = 3, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_S_cr1_ = Substance {
    name = "S(cr1)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 368.3, NASA7 { 3.7136951200e-01, 1.5337350100e-02, -3.3544110700e-05, 2.8924950000e-08, 0.0000000000e+00, -5.5321385000e+02, -1.5962449800e+00 })
    },
    elements = { ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_S_cr2_ = Substance {
    name = "S(cr2)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(368.3, 388.36, NASA7 { 2.0803314600e+00, 2.4413755400e-03, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.8530669500e+02, -8.6071548700e+00 })
    },
    elements = { ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_S_L_ = Substance {
    name = "S(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(388.36, 1000.0, NASA7 { -7.2740568400e+01, 4.8122253400e-01, -1.0784223300e-03, 1.0325772800e-06, -3.5888449000e-10, 8.2913485600e+03, 3.1526974300e+02 }),
        Range(1000.0, 6000.0, NASA7 { 3.5007841000e+00, 3.8166210000e-04, -1.5556996200e-07, 2.7278368900e-11, -1.7281255400e-15, -5.9087303500e+02, -1.5216727000e+01 })
    },
    elements = { ["S"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_SCL2_L_ = Substance {
    name = "SCL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 5000.0, NASA7 { 1.0945241000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.2517543000e+03, -4.0269795000e+01 })
    },
    elements = { ["S"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_S2CL2_L_ = Substance {
    name = "S2CL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 5000.0, NASA7 { 1.4948935000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1451915000e+04, -5.8250225000e+01 })
    },
    elements = { ["S"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Si_cr_ = Substance {
    name = "Si(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -1.2917691200e-01, 1.4720313900e-02, -2.7651016000e-05, 2.4187825100e-08, -7.9345291200e-12, -4.1551641700e+02, -3.5957000800e-01 }),
        Range(1000.0, 1690.0, NASA7 { 1.7554738200e+00, 3.1728549700e-03, -2.7823640200e-06, 1.2645806500e-09, -2.1712846400e-13, -6.2865736300e+02, -8.5534117700e+00 })
    },
    elements = { ["Si"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Si_L_ = Substance {
    name = "Si(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1690.0, 6000.0, NASA7 { 3.2713894100e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 4.8828679500e+03, -1.3266547700e+01 })
    },
    elements = { ["Si"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_SiC_b_ = Substance {
    name = "SiC(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -2.4715907000e+00, 3.0693783000e-02, -4.9263085000e-05, 3.8626389000e-08, -1.1761621000e-11, -9.0691260000e+03, 8.8009214000e+00 }),
        Range(1000.0, 4000.0, NASA7 { 3.7974809000e+00, 3.1872886000e-03, -1.4502334000e-06, 3.1549744000e-10, -2.6158991000e-14, -1.0291937000e+04, -2.1067791000e+01 })
    },
    elements = { ["Si"] = 1, ["C"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_SiO2_Lqz_ = Substance {
    name = "SiO2(Lqz)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 847.0, NASA7 { -7.5851138000e-01, 3.0577398900e-02, -4.0086185500e-05, 2.1619484900e-08, -6.1724904200e-13, -1.1037148300e+05, 1.7838452900e+00 })
    },
    elements = { ["Si"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_SiO2_hqz_ = Substance {
    name = "SiO2(hqz)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(847.0, 1000.0, NASA7 { 7.1178762100e+00, 1.1381952700e-03, 3.6973423400e-08, 0.0000000000e+00, 0.0000000000e+00, -1.1179419400e+05, -3.6370806400e+01 }),
        Range(1000.0, 1696.0, NASA7 { 7.2353710600e+00, 7.6184222700e-04, 4.8950229400e-07, -2.3575459100e-10, 4.2083913100e-14, -1.1182383400e+05, -3.6964279600e+01 })
    },
    elements = { ["Si"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_SiO2_L_ = Substance {
    name = "SiO2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1696.0, 6000.0, NASA7 { 1.0316065700e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1460056300e+05, -5.7626660300e+01 })
    },
    elements = { ["Si"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Si2N2O_s_ = Substance {
    name = "Si2N2O(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { -4.1226854000e+00, 5.4172814000e-02, -4.2392930000e-05, -1.0724595000e-08, 1.7366858000e-11, -1.1474600000e+05, 1.4822158000e+01 }),
        Range(1000.0, 2500.0, NASA7 { 1.1849023000e+01, 2.4244681000e-03, 3.6529235000e-07, -4.2578829000e-10, 8.6275930000e-14, -1.1821494000e+05, -6.4250092000e+01 })
    },
    elements = { ["Si"] = 2, ["N"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Si3N4_a_ = Substance {
    name = "Si3N4(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.1635680000e+00, 1.9007111000e-02, -1.1469333000e-05, 7.0665915000e-09, -2.7458640000e-12, -9.2466651000e+04, -3.2442431000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 2.7981745000e+00, 2.7975018000e-02, -1.5020578000e-05, 3.5872288000e-09, -3.1776969000e-13, -9.1017241000e+04, -8.9268819000e+00 })
    },
    elements = { ["Si"] = 3, ["N"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Sr_a_ = Substance {
    name = "Sr(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 820.0, NASA7 { 2.6112185500e+00, 3.0692389600e-03, -4.4398085400e-06, 4.0352478900e-09, -1.4808783500e-12, -8.8300267500e+02, -9.0133109300e+00 })
    },
    elements = { ["Sr"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Sr_b_ = Substance {
    name = "Sr(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(820.0, 1041.0, NASA7 { 3.1903263100e+00, 4.8373265500e-04, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -8.5608062900e+02, -1.1572346600e+01 })
    },
    elements = { ["Sr"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Sr_L_ = Substance {
    name = "Sr(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1041.0, 6000.0, NASA7 { 4.4500517800e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -9.4317554000e+02, -1.8896996200e+01 })
    },
    elements = { ["Sr"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_SrCL2_a_ = Substance {
    name = "SrCL2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.9369635000e+00, 1.0787600000e-02, -1.3907940000e-05, 5.8982276000e-09, 3.0133326000e-12, -1.0212719000e+05, -2.8370882000e+01 })
    },
    elements = { ["Sr"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_SrCL2_b_ = Substance {
    name = "SrCL2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1000.0, 1147.0, NASA7 { 1.4794947000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.0642750000e+05, -7.5376228000e+01 })
    },
    elements = { ["Sr"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_SrCL2_L_ = Substance {
    name = "SrCL2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1147.0, 5000.0, NASA7 { 1.2580737000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.0193677000e+05, -5.8076353000e+01 })
    },
    elements = { ["Sr"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_SrF2_s_ = Substance {
    name = "SrF2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.2916213000e+00, 1.5537655000e-02, -1.9211908000e-05, 7.4965232000e-09, 9.4000573000e-13, -1.4853050000e+05, -2.4089153000e+01 }),
        Range(1000.0, 1750.0, NASA7 { 8.8747168000e+01, -1.6376508000e-01, 6.5196899000e-05, 4.3548395000e-08, -2.3673474000e-11, -1.7456122000e+05, -4.6934523000e+02 })
    },
    elements = { ["Sr"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_SrF2_L_ = Substance {
    name = "SrF2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1750.0, 5000.0, NASA7 { 1.1912951000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4642808000e+05, -5.8022842000e+01 })
    },
    elements = { ["Sr"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_SrO_s_ = Substance {
    name = "SrO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5631372000e+00, 9.2717846000e-03, -1.1646579000e-05, 7.0851832000e-09, -1.5259906000e-12, -7.2591404000e+04, -1.5928796000e+01 }),
        Range(1000.0, 2938.0, NASA7 { 5.6477935000e+00, 1.3153999000e-03, -2.7640412000e-07, 6.7308331000e-11, -6.5626353000e-15, -7.3037344000e+04, -2.6098360000e+01 })
    },
    elements = { ["Sr"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_SrO_L_ = Substance {
    name = "SrO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2938.0, 5000.0, NASA7 { 8.0516715000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.6734769000e+04, -3.9092944000e+01 })
    },
    elements = { ["Sr"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_SrO2H2_s_ = Substance {
    name = "SrO2H2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 783.15, NASA7 { 4.1706956000e+00, 1.6503701000e-02, -1.3029745000e-06, 1.3971819000e-09, -5.3948942000e-13, -1.1850056000e+05, -1.6962813000e+01 })
    },
    elements = { ["Sr"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_SrO2H2_L_ = Substance {
    name = "SrO2H2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(783.15, 5000.0, NASA7 { 1.8971751000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.2261174000e+05, -9.9660501000e+01 })
    },
    elements = { ["Sr"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_SrS_s_ = Substance {
    name = "SrS(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.7444232000e+00, -2.0363610000e-03, 1.1983340000e-05, -1.4889643000e-08, 5.9616443000e-12, -5.8062998000e+04, -2.4307318000e+01 }),
        Range(1000.0, 3000.0, NASA7 { 5.9405463000e+00, 1.0447328000e-03, -3.0794392000e-07, 9.7198545000e-11, -1.1129685000e-14, -5.8254729000e+04, -2.6099961000e+01 })
    },
    elements = { ["Sr"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ta_cr_ = Substance {
    name = "Ta(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.3299849900e+00, 4.4502840200e-03, -9.5224281900e-06, 9.8782915900e-09, -3.7830840600e-12, -8.2609146700e+02, -9.2709364600e+00 }),
        Range(1000.0, 3258.0, NASA7 { 2.8959496300e+00, 5.3375913300e-04, -3.5914472100e-08, -7.2076146100e-11, 3.1330200800e-14, -8.7125582600e+02, -1.1644028000e+01 })
    },
    elements = { ["Ta"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ta_L_ = Substance {
    name = "Ta(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(3258.0, 6000.0, NASA7 { 5.0321666600e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.4422375800e+02, -2.5973657700e+01 })
    },
    elements = { ["Ta"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_TaC_s_ = Substance {
    name = "TaC(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0249717000e+00, 1.7628620000e-02, -2.5515859000e-05, 1.7313308000e-08, -4.3057858000e-12, -1.8226597000e+04, -5.0093127000e+00 }),
        Range(1000.0, 4273.0, NASA7 { 5.0027056000e+00, 1.2849041000e-03, -1.7495939000e-07, 3.5245581000e-11, -2.6429260000e-15, -1.9020553000e+04, -2.4129691000e+01 })
    },
    elements = { ["Ta"] = 1, ["C"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_TaC_L_ = Substance {
    name = "TaC(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(4273.0, 5000.0, NASA7 { 8.0516715000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.0103338000e+04, -4.2085545000e+01 })
    },
    elements = { ["Ta"] = 1, ["C"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ta2O5_s_ = Substance {
    name = "Ta2O5(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0119942000e+01, 2.5537559000e-02, -1.6847351000e-05, 3.4734078000e-11, 3.1268011000e-12, -2.5008174000e+05, -4.7310877000e+01 }),
        Range(1000.0, 2058.0, NASA7 { 1.8473684000e+01, 3.4902433000e-03, 9.1156584000e-07, -1.1508287000e-09, 2.4702060000e-13, -2.5245911000e+05, -9.0733491000e+01 })
    },
    elements = { ["Ta"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ta2O5_L_ = Substance {
    name = "Ta2O5(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2058.0, 5000.0, NASA7 { 2.9187309000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.5336245000e+05, -1.5857774000e+02 })
    },
    elements = { ["Ta"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ti_a_ = Substance {
    name = "Ti(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.3282964000e+00, 1.0477611700e-02, -2.1981653900e-05, 2.1746899800e-08, -7.6606042800e-12, -7.0688104400e+02, -6.1972291200e+00 }),
        Range(1000.0, 1156.0, NASA7 { 2.9798717100e+01, -5.6736902400e-02, 3.0848735000e-05, 0.0000000000e+00, 0.0000000000e+00, -9.2755702500e+03, -1.5673079300e+02 })
    },
    elements = { ["Ti"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ti_b_ = Substance {
    name = "Ti(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1156.0, 1944.0, NASA7 { 4.5505093800e+00, -5.7844683400e-03, 6.5842877600e-06, -2.6052348400e-09, 4.0693021800e-13, -1.8669572400e+02, -1.9795304000e+01 })
    },
    elements = { ["Ti"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ti_L_ = Substance {
    name = "Ti(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1944.0, 6000.0, NASA7 { 5.6287141400e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.3750959800e+03, -3.0787269100e+01 })
    },
    elements = { ["Ti"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_TiC_s_ = Substance {
    name = "TiC(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.3633942000e+00, 2.8252237000e-02, -4.1175211000e-05, 2.6788858000e-08, -6.3469868000e-12, -2.2678352000e+04, 3.8626483000e+00 }),
        Range(1000.0, 3290.0, NASA7 { 5.9413936000e+00, -3.7279967000e-04, 7.1209953000e-07, -1.3517090000e-10, 9.9803660000e-15, -2.4173445000e+04, -3.1530222000e+01 })
    },
    elements = { ["Ti"] = 1, ["C"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_TiC_L_ = Substance {
    name = "TiC(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(3290.0, 5000.0, NASA7 { 7.5484421000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7660204000e+04, -4.0629661000e+01 })
    },
    elements = { ["Ti"] = 1, ["C"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_TiCL2_s_ = Substance {
    name = "TiCL2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.7567518000e+00, 1.3631033000e-02, -2.0416229000e-05, 1.5909888000e-08, -4.5451104000e-12, -6.4169918000e+04, -2.5585456000e+01 }),
        Range(1000.0, 2000.0, NASA7 { 7.9684147000e+00, 2.5447925000e-03, -2.8648119000e-07, 1.3187806000e-10, -2.2270826000e-14, -6.4508442000e+04, -3.5713089000e+01 })
    },
    elements = { ["Ti"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_TiCL3_s_ = Substance {
    name = "TiCL3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0937936000e+01, 2.6622736000e-03, -1.4785923000e-07, -1.5406768000e-09, 9.2218774000e-13, -9.0182668000e+04, -4.6287287000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.1462658000e+01, 1.4017806000e-03, -3.0689724000e-08, 1.2339007000e-13, -1.0561298000e-17, -9.0316960000e+04, -4.8993078000e+01 })
    },
    elements = { ["Ti"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_TiCL4_L_ = Substance {
    name = "TiCL4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.7066042000e+01, 1.5777168000e-03, -1.0870376000e-06, 1.0390303000e-09, -3.6022530000e-13, -1.0187134000e+05, -6.7308228000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.7142643000e+01, 1.0937087000e-03, -1.0690311000e-09, 2.6616757000e-13, -2.2794480000e-17, -1.0188027000e+05, -6.7640142000e+01 })
    },
    elements = { ["Ti"] = 1, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_TiN_s_ = Substance {
    name = "TiN(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -2.5320119000e+00, 4.1174856000e-02, -7.7055776000e-05, 6.5289869000e-08, -2.0605187000e-11, -4.1124666000e+04, 8.6750796000e+00 }),
        Range(1000.0, 3220.0, NASA7 { 5.6010051000e+00, 3.5645939000e-04, 3.9521803000e-07, -8.8718002000e-11, 7.7844513000e-15, -4.2443430000e+04, -2.8773293000e+01 })
    },
    elements = { ["Ti"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_TiN_L_ = Substance {
    name = "TiN(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(3220.0, 5000.0, NASA7 { 7.5484421000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.6261709000e+04, -3.9583906000e+01 })
    },
    elements = { ["Ti"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_TiO_a_ = Substance {
    name = "TiO(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 8.9809564000e-01, 2.1354383000e-02, -3.5842873000e-05, 3.0408157000e-08, -9.7121635000e-12, -6.6224332000e+04, -5.9567004000e+00 }),
        Range(1000.0, 1265.0, NASA7 { 2.6516785000e+00, 7.9963203000e-03, -4.9552828000e-06, 1.4128842000e-09, 0.0000000000e+00, -6.6288361000e+04, -1.2918703000e+01 })
    },
    elements = { ["Ti"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_TiO_b_ = Substance {
    name = "TiO(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1265.0, 2023.0, NASA7 { 1.7971419000e+00, 1.0128863000e-02, -7.4585571000e-06, 3.0835815000e-09, -4.7561747000e-13, -6.5482773000e+04, -7.9349175000e+00 })
    },
    elements = { ["Ti"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_TiO_L_ = Substance {
    name = "TiO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2023.0, 5000.0, NASA7 { 8.0516715000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -6.3272138000e+04, -4.1312109000e+01 })
    },
    elements = { ["Ti"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_TiO2_ru_ = Substance {
    name = "TiO2(ru)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.6117517000e-01, 3.7966660000e-02, -6.5154750000e-05, 5.2552136000e-08, -1.6200051000e-11, -1.1478897000e+05, -1.8874035000e+00 }),
        Range(1000.0, 2130.0, NASA7 { 6.8489151000e+00, 4.2463461000e-03, -3.0088984000e-06, 1.0602519000e-09, -1.4379597000e-13, -1.1599246000e+05, -3.4514106000e+01 })
    },
    elements = { ["Ti"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_TiO2_L_ = Substance {
    name = "TiO2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2130.0, 5000.0, NASA7 { 1.2077507000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1494230000e+05, -6.5910759000e+01 })
    },
    elements = { ["Ti"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ti2O3_a_ = Substance {
    name = "Ti2O3(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 470.0, NASA7 { 1.4623542000e+01, -3.7161717000e-02, 9.0026470000e-05, 0.0000000000e+00, 0.0000000000e+00, -1.8641693000e+05, -6.6914899000e+01 })
    },
    elements = { ["Ti"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ti2O3_b_ = Substance {
    name = "Ti2O3(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(470.0, 1000.0, NASA7 { 1.6977485000e+00, 5.7137434000e-02, -8.3320681000e-05, 5.7299528000e-08, -1.5211685000e-11, -1.8525036000e+05, -1.4066559000e+01 }),
        Range(1000.0, 2115.0, NASA7 { 1.4874222000e+01, 4.5465695000e-03, -2.3646363000e-06, 5.9960392000e-10, -5.3414260000e-14, -1.8797342000e+05, -7.7863165000e+01 })
    },
    elements = { ["Ti"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ti2O3_L_ = Substance {
    name = "Ti2O3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2115.0, 5000.0, NASA7 { 1.8871105000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7858698000e+05, -9.6567257000e+01 })
    },
    elements = { ["Ti"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ti3O5_a_ = Substance {
    name = "Ti3O5(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 450.0, NASA7 { -3.7337434000e+00, 1.0619319000e-01, -1.0472381000e-04, 0.0000000000e+00, 0.0000000000e+00, -2.9845617000e+05, 9.8241016000e+00 })
    },
    elements = { ["Ti"] = 3, ["O"] = 5 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ti3O5_b_ = Substance {
    name = "Ti3O5(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(450.0, 1000.0, NASA7 { 1.8692817000e+01, 8.5051062000e-03, -5.1246208000e-06, 4.6119875000e-09, -1.5238557000e-12, -3.0012895000e+05, -8.9889586000e+01 }),
        Range(1000.0, 2050.0, NASA7 { 1.8415159000e+01, 8.0013102000e-03, -1.9907056000e-06, 8.7812397000e-10, -1.4245275000e-13, -2.9998684000e+05, -8.8135479000e+01 })
    },
    elements = { ["Ti"] = 3, ["O"] = 5 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ti3O5_L_ = Substance {
    name = "Ti3O5(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2050.0, 5000.0, NASA7 { 3.2206686000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.9368541000e+05, -1.6912703000e+02 })
    },
    elements = { ["Ti"] = 3, ["O"] = 5 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Ti4O7_s_ = Substance {
    name = "Ti4O7(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -8.6333560000e-01, 1.4160462000e-01, -2.3242305000e-04, 1.8194073000e-07, -5.4801413000e-11, -4.1379484000e+05, -4.5637580000e+00 }),
        Range(1000.0, 1950.0, NASA7 { 2.4112915000e+01, 2.2927714000e-02, -1.7119163000e-05, 6.4849206000e-09, -9.4883811000e-13, -4.1810716000e+05, -1.2104650000e+02 })
    },
    elements = { ["Ti"] = 4, ["O"] = 7 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Ti4O7_L_ = Substance {
    name = "Ti4O7(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1950.0, 5000.0, NASA7 { 4.4284194000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.1089673000e+05, -2.3516043000e+02 })
    },
    elements = { ["Ti"] = 4, ["O"] = 7 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_V_cr_ = Substance {
    name = "V(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 8.6427302300e-01, 1.4030127000e-02, -3.1522849500e-05, 3.1672863800e-08, -1.1432745900e-11, -6.5996958600e+02, -4.4833226800e+00 }),
        Range(1000.0, 2190.0, NASA7 { 4.4821558900e+00, -4.2572805300e-03, 5.3832521100e-06, -2.4204401600e-09, 4.2398119200e-13, -1.2842019500e+03, -2.1240162500e+01 })
    },
    elements = { ["V"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_V_L_ = Substance {
    name = "V(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2190.0, 6000.0, NASA7 { 5.5570322200e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.8995816300e+03, -3.0703430800e+01 })
    },
    elements = { ["V"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_VCL2_s_ = Substance {
    name = "VCL2(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.7395599000e+00, 1.0487223000e-02, -1.7226780000e-05, 1.4768831000e-08, -4.7550706000e-12, -5.6698886000e+04, -2.9205704000e+01 }),
        Range(1000.0, 1300.0, NASA7 { 6.2711216000e+00, 7.4890046000e-03, -5.2531000000e-06, 1.5067369000e-09, 0.0000000000e+00, -5.6358056000e+04, -2.5726538000e+01 })
    },
    elements = { ["V"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_VCL3_s_ = Substance {
    name = "VCL3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.9770413000e+00, 2.3542011000e-02, -4.0745272000e-05, 3.4928483000e-08, -1.1244900000e-11, -7.2678169000e+04, -2.9493712000e+01 })
    },
    elements = { ["V"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_VCL4_L_ = Substance {
    name = "VCL4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 2000.0, NASA7 { 1.7462063000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.3695845000e+04, -6.8794792000e+01 })
    },
    elements = { ["V"] = 1, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_VN_s_ = Substance {
    name = "VN(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 8.1271357000e-01, 2.0101043000e-02, -3.1178004000e-05, 2.3103689000e-08, -6.3845144000e-12, -2.7020094000e+04, -4.9457436000e+00 }),
        Range(1000.0, 3500.0, NASA7 { 4.8368740000e+00, 1.8900147000e-03, -3.1610463000e-07, 4.6050660000e-11, -1.9102037000e-15, -2.7738152000e+04, -2.3873353000e+01 })
    },
    elements = { ["V"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_VO_s_ = Substance {
    name = "VO(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5380401000e+00, 1.6447078000e-02, -2.8559810000e-05, 2.4836392000e-08, -7.9886948000e-12, -5.3211919000e+04, -1.3599758000e+01 }),
        Range(1000.0, 2063.0, NASA7 { 5.3398715000e+00, 1.7591703000e-03, 3.8477617000e-07, -2.6182471000e-10, 5.1009395000e-14, -5.3651379000e+04, -2.6382364000e+01 })
    },
    elements = { ["V"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_VO_L_ = Substance {
    name = "VO(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2063.0, 5000.0, NASA7 { 7.5484421000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.7600474000e+04, -3.6154213000e+01 })
    },
    elements = { ["V"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_V2O3_s_ = Substance {
    name = "V2O3(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.2877033000e+00, 5.7632763000e-02, -9.6738556000e-05, 7.4066916000e-08, -2.0658389000e-11, -1.4911189000e+05, -1.4723446000e+01 }),
        Range(1000.0, 2340.0, NASA7 { 1.3964211000e+01, 1.6871298000e-03, 1.1371206000e-06, -2.0806007000e-10, 1.0028325000e-14, -1.5100575000e+05, -6.8782894000e+01 })
    },
    elements = { ["V"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Solid",
}

local s_V2O3_L_ = Substance {
    name = "V2O3(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2340.0, 5000.0, NASA7 { 1.8871105000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.4034063000e+05, -9.4580920000e+01 })
    },
    elements = { ["V"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_V2O4_I_ = Substance {
    name = "V2O4(I)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 340.0, NASA7 { 6.8914542000e+00, 9.9142022000e-03, 5.7837101000e-05, 4.3053919000e-08, -2.8482694000e-10, -1.7460864000e+05, -3.2157358000e+01 })
    },
    elements = { ["V"] = 2, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_V2O4_II_ = Substance {
    name = "V2O4(II)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(340.0, 1000.0, NASA7 { 4.9003624000e+00, 5.0026952000e-02, -7.1316332000e-05, 4.6515567000e-08, -1.0783268000e-11, -1.7373676000e+05, -2.4503375000e+01 }),
        Range(1000.0, 1818.0, NASA7 { 1.6610256000e+01, 2.3329419000e-03, 9.8904786000e-07, -7.5032496000e-10, 1.6135461000e-13, -1.7607389000e+05, -8.0831997000e+01 })
    },
    elements = { ["V"] = 2, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_V2O4_L_ = Substance {
    name = "V2O4(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1818.0, 5000.0, NASA7 { 2.5664703000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.7463009000e+05, -1.3655940000e+02 })
    },
    elements = { ["V"] = 2, ["O"] = 4 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_V2O5_s_ = Substance {
    name = "V2O5(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 943.0, NASA7 { -1.1640360000e+00, 9.3535884000e-02, -1.5675097000e-04, 1.2223524000e-07, -3.5738845000e-11, -1.8914531000e+05, 4.0722753000e-01 })
    },
    elements = { ["V"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Solid",
}

local s_V2O5_L_ = Substance {
    name = "V2O5(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(943.0, 5000.0, NASA7 { 2.2947264000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.8751447000e+05, -1.1089277000e+02 })
    },
    elements = { ["V"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Zn_cr_ = Substance {
    name = "Zn(cr)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 692.73, NASA7 { 1.8506892900e+00, 9.1779141000e-03, -2.6104700900e-05, 3.3856876700e-08, -1.3943070900e-11, -7.8940313300e+02, -7.3852633300e+00 })
    },
    elements = { ["Zn"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Zn_L_ = Substance {
    name = "Zn(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(692.73, 6000.0, NASA7 { 3.7765304300e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -4.3169529800e+02, -1.5670843700e+01 })
    },
    elements = { ["Zn"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_ZnSO4_a_ = Substance {
    name = "ZnSO4(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 540.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=5.1657364000e+00, a4=2.3977394000e-02, a5=-3.0700744000e-06, a6=-4.8450164000e-09, a7=0.0000000000e+00, a8=-1.2045359000e+05, a9=-2.3105369000e+01 }),
        Range(540.0, 1000.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=1.5553495000e+01, a4=2.7737319000e-03, a5=-3.8034721000e-06, a6=4.0845543000e-09, a7=-1.5289562000e-12, a8=-1.2250490000e+05, a9=-7.6221684000e+01 }),
        Range(1000.0, 1013.0, { type = "NASA9", a1=0.0000000000e+00, a2=0.0000000000e+00, a3=1.5895259000e+01, a4=1.1840942000e-03, a5=0.0000000000e+00, a6=0.0000000000e+00, a7=0.0000000000e+00, a8=-1.2260433000e+05, a9=-7.7915322000e+01 })
    },
    elements = { ["Zn"] = 1, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ZnSO4_b_ = Substance {
    name = "ZnSO4(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1013.0, 5000.0, NASA7 { 1.7461825000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.2113806000e+05, -8.5143253000e+01 })
    },
    elements = { ["Zn"] = 1, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Zr_a_ = Substance {
    name = "Zr(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.1828884000e+00, 5.4288639300e-03, -1.2146395200e-05, 1.3113272900e-08, -4.8381835500e-12, -8.0844135500e+02, -8.9474183600e+00 }),
        Range(1000.0, 1135.0, NASA7 { 2.2811954600e+00, 1.4697168400e-03, -1.0465761600e-08, 0.0000000000e+00, 0.0000000000e+00, -6.6180314700e+02, -8.5737719800e+00 })
    },
    elements = { ["Zr"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Zr_b_ = Substance {
    name = "Zr(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1135.0, 2125.0, NASA7 { 4.0687624500e+00, -1.5848972100e-03, 1.0299512900e-06, -1.5576755700e-10, 2.3028461100e-14, -6.9117226100e+02, -1.7859340300e+01 })
    },
    elements = { ["Zr"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_Zr_L_ = Substance {
    name = "Zr(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2125.0, 6000.0, NASA7 { 5.0321666600e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.1008462600e+03, -2.5479758700e+01 })
    },
    elements = { ["Zr"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_ZrN_s_ = Substance {
    name = "ZrN(s)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8556290000e+00, 8.6166970000e-03, -5.3486638000e-06, -2.8804219000e-09, 3.1087849000e-12, -4.5112020000e+04, -1.3901069000e+01 }),
        Range(1000.0, 3225.0, NASA7 { 5.5407820000e+00, 6.1839353000e-04, 2.9542110000e-07, -1.1784311000e-10, 1.5241430000e-14, -4.5751324000e+04, -2.7420654000e+01 })
    },
    elements = { ["Zr"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ZrN_L_ = Substance {
    name = "ZrN(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(3225.0, 5000.0, NASA7 { 7.0451164000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.8105527000e+04, -3.4436264000e+01 })
    },
    elements = { ["Zr"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_ZrO2_a_ = Substance {
    name = "ZrO2(a)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -7.9537106000e-01, 4.3933458000e-02, -8.1214444000e-05, 6.9567648000e-08, -2.2380947000e-11, -1.3311967000e+05, 5.3221009000e-01 }),
        Range(1000.0, 1478.0, NASA7 { -2.2144395000e+01, 9.9639763000e-02, -1.2006688000e-04, 6.4686736000e-08, -1.3004881000e-11, -1.2732797000e+05, 1.1100891000e+02 })
    },
    elements = { ["Zr"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ZrO2_b_ = Substance {
    name = "ZrO2(b)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(1478.0, 2950.0, NASA7 { 8.9573629000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.3414354000e+05, -4.5274017000e+01 })
    },
    elements = { ["Zr"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Solid",
}

local s_ZrO2_L_ = Substance {
    name = "ZrO2(L)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(2950.0, 5000.0, NASA7 { 1.0567675000e+01, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -1.2842745000e+05, -5.4592264000e+01 })
    },
    elements = { ["Zr"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Liquid",
}

local s_Electron = Substance {
    name = "Electron",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.4537500000e+02, -1.1724690200e+01 })
    },
    elements = { ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL = Substance {
    name = "AL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.1111243300e+00, -3.5938231000e-03, 8.1474931300e-06, -8.0880896600e-09, 2.9313246300e-12, 3.8828339000e+04, 2.8404572400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5338570100e+00, -4.6585949200e-05, 2.8279804800e-08, -8.5436201300e-12, 1.0220798300e-15, 3.8904566200e+04, 5.3798417300e+00 })
    },
    elements = { ["Al"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL_plus = Substance {
    name = "AL+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.0902814100e+05, 3.7910058600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5121533700e+00, -2.6101130000e-05, 1.9036046300e-08, -5.6888149300e-12, 6.0052999500e-16, 1.0902399500e+05, 3.7253826100e+00 })
    },
    elements = { ["Al"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL_minus = Substance {
    name = "AL-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.6473189800e+00, -7.2037159200e-04, 1.0253961200e-06, -3.5111819700e-11, -2.3893297400e-13, 3.3004925200e+04, 5.3087666500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.1896348900e+00, 8.0344621100e-04, -3.7938953500e-07, 6.9005985300e-11, -4.3988411600e-15, 3.3096026000e+04, 7.5555718700e+00 })
    },
    elements = { ["Al"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALBO2 = Substance {
    name = "ALBO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.3087234000e+00, 1.8890539000e-02, -2.0633348000e-05, 1.0251324000e-08, -1.6941283000e-12, -6.6482167000e+04, 1.4477018500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.1722995000e+00, 2.9780741000e-03, -1.2431107000e-06, 2.3188779000e-10, -1.6041208000e-14, -6.7683682000e+04, -9.9817397600e+00 })
    },
    elements = { ["Al"] = 1, ["B"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALBr = Substance {
    name = "ALBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4900611000e+00, 4.5476797000e-03, -8.1935578000e-06, 6.8666152000e-09, -2.1765058000e-12, 7.2945306000e+02, 7.8866475700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3822424000e+00, 2.1200707000e-04, -7.0764447000e-08, 1.0659018000e-11, 1.4830266000e-16, 5.7616849000e+02, 3.7391085700e+00 })
    },
    elements = { ["Al"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALBr3 = Substance {
    name = "ALBr3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.2537206000e+00, 1.6080217000e-02, -2.8659758000e-05, 2.3616076000e-08, -7.3931314000e-12, -5.1735211000e+04, 2.6836580700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.6150590000e+00, 4.4468546000e-04, -1.9902983000e-07, 3.9251818000e-11, -2.8427975000e-15, -5.2349544000e+04, -1.3119109000e+01 })
    },
    elements = { ["Al"] = 1, ["Br"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALC = Substance {
    name = "ALC",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6422483000e+00, 6.4465161000e-03, -9.5892376000e-06, 6.9040805000e-09, -1.9430779000e-12, 8.1929874000e+04, 1.0267362000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.1564478000e+00, 4.4692490000e-04, -1.7467040000e-07, 3.4304336000e-11, -2.4772706000e-15, 8.1606605000e+04, 2.9047252100e+00 })
    },
    elements = { ["Al"] = 1, ["C"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCL = Substance {
    name = "ALCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1222286000e+00, 5.9280474000e-03, -1.0415832000e-05, 8.5551065000e-09, -2.6722380000e-12, -7.3075839000e+03, 8.2533561400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3395271000e+00, 2.4838874000e-04, -8.2921852000e-08, 1.2342319000e-11, -2.3755818000e-17, -7.5281081000e+03, 2.5372942400e+00 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCL_plus = Substance {
    name = "ALCL+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8698352000e+00, 6.6534586000e-03, -1.1327707000e-05, 9.0702974000e-09, -2.7794640000e-12, 1.0259741000e+05, 1.0019952600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.6284965000e+00, -3.4750535000e-04, 2.2997351000e-07, -2.4279798000e-11, -2.6440544000e-16, 1.0220447000e+05, 1.4303998900e+00 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCLF = Substance {
    name = "ALCLF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2175968000e+00, 1.4524549000e-02, -2.3922488000e-05, 1.8621609000e-08, -5.5903667000e-12, -6.0305508000e+04, 1.2271818500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.4262622000e+00, 6.7861168000e-04, -3.1186392000e-07, 6.2142379000e-11, -4.2519573000e-15, -6.0938769000e+04, -3.0622707600e+00 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCLF_plus = Substance {
    name = "ALCLF+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7341292000e+00, 1.3889043000e-02, -2.2222539000e-05, 1.6937683000e-08, -5.0061342000e-12, 3.1647755000e+04, 6.6691474700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8835905000e+00, 7.0509366000e-04, -3.1366088000e-07, 6.1607310000e-11, -4.4490537000e-15, 3.1005990000e+04, -8.4821135300e+00 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 1, ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCLF2 = Substance {
    name = "ALCLF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4905245000e+00, 2.3410622000e-02, -3.6730802000e-05, 2.7577485000e-08, -8.0570874000e-12, -1.2197857000e+05, 1.0359834400e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.8674544000e+00, 1.2933319000e-03, -5.7468796000e-07, 1.1278419000e-10, -8.1398154000e-15, -1.2309250000e+05, -1.5600784600e+01 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCL2 = Substance {
    name = "ALCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9336741000e+00, 1.2928918000e-02, -2.2767992000e-05, 1.8605515000e-08, -5.7900279000e-12, -3.5296619000e+04, 9.4018667600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.6414133000e+00, 4.3391907000e-04, -2.0342456000e-07, 4.0900135000e-11, -2.7209375000e-15, -3.5794689000e+04, -3.3484390400e+00 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCL2_plus = Substance {
    name = "ALCL2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3561128000e+00, 1.2640612000e-02, -2.1554060000e-05, 1.7222753000e-08, -5.2744473000e-12, 5.6169736000e+04, 4.4930473800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.0954577000e+00, 4.6525470000e-04, -2.0766479000e-07, 4.0879906000e-11, -2.9568914000e-15, 5.5643775000e+04, -8.5180986200e+00 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCL2_minus = Substance {
    name = "ALCL2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.2510946000e+00, 1.1968562000e-02, -2.1538229000e-05, 1.7869230000e-08, -5.6220753000e-12, -5.9513061000e+04, 7.3932618500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.7125618000e+00, 3.4656836000e-04, -1.5884354000e-07, 2.9950063000e-11, -1.6544815000e-15, -5.9954257000e+04, -4.1363291500e+00 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCL2F = Substance {
    name = "ALCL2F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.2551664000e+00, 2.2016789000e-02, -3.6276986000e-05, 2.8274842000e-08, -8.5011095000e-12, -9.7088887000e+04, 8.0248876500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.1476067000e+00, 9.7669159000e-04, -4.3488676000e-07, 8.5464075000e-11, -6.1739474000e-15, -9.8060287000e+04, -1.5379119700e+01 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 2, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALCL3 = Substance {
    name = "ALCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.9132665000e+00, 2.1031864000e-02, -3.6546931000e-05, 2.9586812000e-08, -9.1451005000e-12, -7.2441056000e+04, 4.9429960400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.4041083000e+00, 6.8641872000e-04, -3.0663850000e-07, 6.0391509000e-11, -4.3693574000e-15, -7.3285813000e+04, -1.6296383100e+01 })
    },
    elements = { ["Al"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF = Substance {
    name = "ALF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6472925000e+00, 6.0822686000e-03, -8.5963429000e-06, 5.8979837000e-09, -1.5886765000e-12, -3.2949260000e+04, 9.3139124300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1261395000e+00, 4.6268054000e-04, -1.7477733000e-07, 3.0015484000e-11, -1.5328841000e-15, -3.3275938000e+04, 2.0664074300e+00 })
    },
    elements = { ["Al"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF_plus = Substance {
    name = "ALF+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7253053000e+00, 4.8120313000e-03, -5.4411719000e-06, 2.7439084000e-09, -3.5875192000e-13, 8.2250468000e+04, 9.7233610900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.3522186000e+00, 1.3103867000e-03, -1.4318383000e-07, -4.5442330000e-11, 7.3420749000e-15, 8.2232500000e+04, 7.0837083900e+00 })
    },
    elements = { ["Al"] = 1, ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF2 = Substance {
    name = "ALF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7408465000e+00, 1.4466745000e-02, -2.1520619000e-05, 1.5411989000e-08, -4.3229797000e-12, -8.4834594000e+04, 1.2676681800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.1579300000e+00, 9.8132287000e-04, -4.4535028000e-07, 8.8205960000e-11, -6.1262255000e-15, -8.5566479000e+04, -3.9511923300e+00 })
    },
    elements = { ["Al"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF2_plus = Substance {
    name = "ALF2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1239176000e+00, 1.4523056000e-02, -2.1315443000e-05, 1.5156133000e-08, -4.2374096000e-12, 9.6545072000e+03, 7.4741764500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.5925394000e+00, 1.0319489000e-03, -4.5739440000e-07, 8.9620599000e-11, -6.4609825000e-15, 8.8991943000e+03, -9.4596976500e+00 })
    },
    elements = { ["Al"] = 1, ["F"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF2_minus = Substance {
    name = "ALF2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6715350000e+00, 1.5601944000e-02, -2.4419322000e-05, 1.8253169000e-08, -5.3064775000e-12, -1.1050860000e+05, 1.2338233700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.2666745000e+00, 8.3711172000e-04, -3.6840021000e-07, 7.0150477000e-11, -4.6876298000e-15, -1.1125290000e+05, -5.0211796600e+00 })
    },
    elements = { ["Al"] = 1, ["F"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF2O = Substance {
    name = "ALF2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.0874090000e+00, 2.3833239000e-02, -3.6062983000e-05, 2.6268919000e-08, -7.4856760000e-12, -1.3506540000e+05, 1.1893671800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.8205622000e+00, 1.2548694000e-03, -5.4524465000e-07, 1.2036860000e-10, -9.6483599000e-15, -1.3630668000e+05, -1.6042872200e+01 })
    },
    elements = { ["Al"] = 1, ["F"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF2O_minus = Substance {
    name = "ALF2O-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9197597000e+00, 2.4094013000e-02, -3.6080944000e-05, 2.6067848000e-08, -7.3808379000e-12, -1.5918152000e+05, 1.1831082200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.6142786000e+00, 1.5784596000e-03, -7.0029115000e-07, 1.3729212000e-10, -9.9013985000e-15, -1.6040336000e+05, -1.5879250800e+01 })
    },
    elements = { ["Al"] = 1, ["F"] = 2, ["O"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF3 = Substance {
    name = "ALF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.1028541200e+00, 2.2345576500e-02, -3.1458869000e-05, 2.1158207300e-08, -5.5389607300e-12, -1.4712679700e+05, 1.0159706900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 8.7289722900e+00, 1.3142855900e-03, -5.1759958100e-07, 8.8678278900e-11, -5.5283736300e-15, -1.4839033000e+05, -1.7503666100e+01 })
    },
    elements = { ["Al"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALF4_minus = Substance {
    name = "ALF4-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5878593000e+00, 3.9930441000e-02, -6.5736914000e-05, 5.1163055000e-08, -1.5358695000e-11, -2.4159649000e+05, 1.1301577000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.1471451000e+01, 1.7525786000e-03, -7.8064227000e-07, 1.5344474000e-10, -1.1086374000e-14, -2.4336036000e+05, -3.1198075000e+01 })
    },
    elements = { ["Al"] = 1, ["F"] = 4, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALH = Substance {
    name = "ALH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6576857000e+00, -1.9744698000e-03, 6.8663398000e-06, -6.2041404000e-09, 1.8663103000e-12, 3.0146458000e+04, 2.0885110300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.3366898000e+00, 1.2877864000e-03, -4.9869941000e-07, 9.2294633000e-11, -6.3451694000e-15, 3.0091761000e+04, 3.0954882300e+00 })
    },
    elements = { ["Al"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALI = Substance {
    name = "ALI",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.3761938600e+00, 6.2035800000e-03, -1.3343798800e-05, 1.2897804000e-08, -4.5926250800e-12, 6.9846894400e+03, 9.2098027700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.3006783500e+00, 3.9452679800e-04, -1.9471787700e-07, 4.3176659400e-11, -2.5099594200e-15, 6.8773383900e+03, 5.1955499000e+00 })
    },
    elements = { ["Al"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALI3 = Substance {
    name = "ALI3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.9761298000e+00, 1.3212778000e-02, -2.3829073000e-05, 1.9796393000e-08, -6.2336276000e-12, -2.5741585000e+04, 2.1476671600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.7092496000e+00, 3.3664692000e-04, -1.5094854000e-07, 2.9813158000e-11, -2.1617994000e-15, -2.6233996000e+04, -1.0663994300e+01 })
    },
    elements = { ["Al"] = 1, ["I"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALN = Substance {
    name = "ALN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6448650000e+00, 6.5416876000e-03, -9.8625339000e-06, 7.1882323000e-09, -2.0444845000e-12, 6.1897382000e+04, 1.0847864400e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.1450468000e+00, 4.8560962000e-04, -2.0126409000e-07, 4.1259488000e-11, -2.8854308000e-15, 6.1583240000e+04, 3.5823429800e+00 })
    },
    elements = { ["Al"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALO = Substance {
    name = "ALO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8116103000e+00, 3.9584261000e-03, -3.3695304000e-06, 6.7330497000e-10, 4.0089455000e-13, 7.0655037000e+03, 9.2089575300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.3139064000e+00, 1.0452421000e-03, 2.7485533000e-07, -1.7928606000e-10, 1.9987813000e-14, 7.0943336000e+03, 7.2096342300e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALO_plus = Substance {
    name = "ALO+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9414434000e+00, 5.2592168000e-03, -7.3439073000e-06, 5.3316783000e-09, -1.5783336000e-12, 1.1837469000e+05, 9.7353825200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1908467000e+00, 6.9358198000e-04, -3.4459999000e-07, 7.6172327000e-11, -5.9032400000e-15, 1.1807439000e+05, 3.5295198200e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALO_minus = Substance {
    name = "ALO-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7226754000e+00, 4.9475518000e-03, -5.7571754000e-06, 3.1424400000e-09, -6.4152832000e-13, -3.3391296000e+04, 8.8363137200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.0380555000e+00, 5.5837110000e-04, -2.1888665000e-07, 3.8533024000e-11, -2.1095550000e-15, -3.3710089000e+04, 2.2448065200e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALOCL = Substance {
    name = "ALOCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2444409000e+00, 1.4117005000e-02, -1.9322038000e-05, 1.1962798000e-08, -2.7069180000e-12, -4.3312343000e+04, 8.0053721100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.7805200000e+00, 7.9662822000e-04, -3.4233355000e-07, 6.5022648000e-11, -4.5519197000e-15, -4.4080832000e+04, -9.3001403900e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALOF = Substance {
    name = "ALOF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.0391461000e+00, 1.8948762000e-02, -2.8978770000e-05, 2.1360941000e-08, -6.1579873000e-12, -7.1182333000e+04, 1.2386598200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.4521622000e+00, 1.1926595000e-03, -5.2893137000e-07, 1.0367811000e-10, -7.4765367000e-15, -7.2116363000e+04, -9.0181278100e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALOH = Substance {
    name = "ALOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6132211000e+00, 2.7716894000e-03, 7.4157830000e-06, -1.1354602000e-08, 4.5569559000e-12, -2.2586797000e+04, 1.0075330300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.6860674000e+00, 3.3636822000e-03, -1.2466244000e-06, 2.1382205000e-10, -1.3898319000e-14, -2.3046105000e+04, 3.6901555900e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALOH_plus = Substance {
    name = "ALOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.9603439000e+00, 7.9191140000e-03, -2.2857959000e-06, -4.0103789000e-09, 2.5707596000e-12, 6.4510185000e+04, 1.4106177600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.1501987000e+00, 2.8925212000e-03, -1.0565414000e-06, 1.7945167000e-10, -1.1587014000e-14, 6.3892888000e+04, 2.6401381200e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALOH_minus = Substance {
    name = "ALOH-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9130204000e+00, 5.9530715000e-03, -3.0558054000e-06, -1.2598709000e-09, 1.2886094000e-12, -2.8781827000e+04, 1.0622466900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.3010718000e+00, 2.1668503000e-03, -7.3988645000e-07, 1.1821055000e-10, -7.2208841000e-15, -2.9134095000e+04, 3.5270075500e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALO2 = Substance {
    name = "ALO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2545148000e+00, 1.4275844000e-02, -2.1103248000e-05, 1.5056259000e-08, -4.2142614000e-12, -1.1812582000e+04, 8.3025549300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.6064641000e+00, 1.0802252000e-03, -5.2229344000e-07, 1.1324220000e-10, -8.5290968000e-15, -1.2532432000e+04, -8.0171758700e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALO2_minus = Substance {
    name = "ALO2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.0812038000e+00, 1.3039654000e-02, -1.7119922000e-05, 1.0978700000e-08, -2.7942120000e-12, -6.0206203000e+04, 7.5015668600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.3687482000e+00, 1.2792030000e-03, -5.6503991000e-07, 1.1046379000e-10, -7.9512442000e-15, -6.0972009000e+04, -8.7987950400e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALO2H = Substance {
    name = "ALO2H",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4800456000e+00, 1.6149264000e-02, -1.6033524000e-05, 6.4466166000e-09, -4.0994769000e-13, -5.6682759000e+04, 1.2307071000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.4264346000e+00, 3.2230362000e-03, -1.2139348000e-06, 2.1074500000e-10, -1.3828000000e-14, -5.7626154000e+04, -7.4575925600e+00 })
    },
    elements = { ["Al"] = 1, ["O"] = 2, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ALS = Substance {
    name = "ALS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.7145518300e+00, 7.3118072500e-03, -1.2652892500e-05, 1.0179616500e-08, -2.8761338700e-12, 2.7643491400e+04, 1.0566959900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.9817111800e+00, 3.9752643700e-03, -1.4942885800e-06, 2.2636587000e-10, -1.2103638400e-14, 2.8240575400e+04, 1.5988227300e+01 })
    },
    elements = { ["Al"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2 = Substance {
    name = "AL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.8094481000e+00, 1.5936502000e-02, -2.7250258000e-05, 1.9871120000e-08, -5.3684046000e-12, 5.7531134000e+04, 1.4072080800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.8158062000e+00, -1.3250537000e-03, 6.0751886000e-07, -1.0692419000e-10, 7.0611409000e-15, 5.6789047000e+04, -4.9547106300e+00 })
    },
    elements = { ["Al"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2Br6 = Substance {
    name = "AL2Br6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.4185979000e+01, 3.4452506000e-02, -6.2522437000e-05, 5.2173238000e-08, -1.6482709000e-11, -1.1802525000e+05, -2.2929106000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 2.1274331000e+01, 8.3939635000e-04, -3.7594778000e-07, 7.4170110000e-11, -5.3728551000e-15, -1.1929325000e+05, -5.6106820000e+01 })
    },
    elements = { ["Al"] = 2, ["Br"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2CL6 = Substance {
    name = "AL2CL6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0509198000e+01, 4.9077436000e-02, -8.7208726000e-05, 7.1723432000e-08, -2.2424328000e-11, -1.6051784000e+05, -1.4084067100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 2.0794003000e+01, 1.3914247000e-03, -6.2213671000e-07, 1.2259377000e-10, -8.8727585000e-15, -1.6240472000e+05, -6.2473188100e+01 })
    },
    elements = { ["Al"] = 2, ["Cl"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2F6 = Substance {
    name = "AL2F6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1618118000e+00, 6.8898890000e-02, -1.0965860000e-04, 8.3293342000e-08, -2.4561049000e-11, -3.1994248000e+05, 1.2212564000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.8829846000e+01, 3.6202230000e-03, -1.6085552000e-06, 3.1566252000e-10, -2.2780287000e-14, -3.2315110000e+05, -6.3240079000e+01 })
    },
    elements = { ["Al"] = 2, ["F"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2I6 = Substance {
    name = "AL2I6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.6225498000e+01, 2.5938439000e-02, -4.7642352000e-05, 4.0083685000e-08, -1.2737184000e-11, -6.4519497000e+04, -2.6540414300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 2.1503191000e+01, 5.7594193000e-04, -2.5839028000e-07, 5.1045977000e-11, -3.7017738000e-15, -6.5449131000e+04, -5.1166066300e+01 })
    },
    elements = { ["Al"] = 2, ["I"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2O = Substance {
    name = "AL2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0732656000e+00, 1.1307613000e-02, -1.6565162000e-05, 1.1784284000e-08, -3.3005503000e-12, -1.9054230000e+04, 4.4083483100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.7720627000e+00, 8.2550092000e-04, -3.6291001000e-07, 6.9531300000e-11, -4.7345211000e-15, -1.9643197000e+04, -8.7723312900e+00 })
    },
    elements = { ["Al"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2O_plus = Substance {
    name = "AL2O+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.1045736000e+00, 1.1978351000e-02, -1.8522589000e-05, 1.3756691000e-08, -3.9867423000e-12, 7.6852703000e+04, 5.1025724800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8797855000e+00, 7.0749877000e-04, -3.1419244000e-07, 6.1640983000e-11, -4.4478698000e-15, 7.6270756000e+04, -8.3318144200e+00 })
    },
    elements = { ["Al"] = 2, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2O2 = Substance {
    name = "AL2O2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7596411000e+00, 2.9997599000e-02, -5.2190497000e-05, 4.2282686000e-08, -1.3075360000e-11, -4.9226032000e+04, 1.1100772000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 9.1590976000e+00, 9.6853927000e-04, -4.3258513000e-07, 8.5178840000e-11, -6.1615370000e-15, -5.0428059000e+04, -1.9156468000e+01 })
    },
    elements = { ["Al"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_AL2O2_plus = Substance {
    name = "AL2O2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3421904000e+00, 2.8111249000e-02, -4.9547178000e-05, 4.0509752000e-08, -1.2610310000e-11, 6.6362506000e+04, 9.2902416700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.2751693000e+00, 8.3587223000e-04, -3.7361608000e-07, 7.3605168000e-11, -5.3262794000e-15, 6.5264068000e+04, -1.8677258600e+01 })
    },
    elements = { ["Al"] = 2, ["O"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ar = Substance {
    name = "Ar",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.4537500000e+02, 4.3796749100e+00 })
    },
    elements = { ["Ar"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ar_plus = Substance {
    name = "Ar+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5931609700e+00, -1.3289294400e-03, 5.2650394400e-06, -5.9795669100e-09, 2.1896786200e-12, 1.8287836800e+05, 5.4498057500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.8699954700e+00, -1.4254724200e-04, 9.3668877600e-09, 2.9258085900e-12, -3.5824794100e-16, 1.8270261700e+05, 3.5322998000e+00 })
    },
    elements = { ["Ar"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B = Substance {
    name = "B",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5105409900e+00, -6.2380132800e-05, 1.4217809900e-07, -1.4169779600e-10, 5.1501874900e-14, 6.6605389400e+04, 4.1636720900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.4986027300e+00, 1.4026732200e-06, 1.0945827800e-09, -1.2000641400e-12, 2.4312199400e-16, 6.6607591400e+04, 4.2188797900e+00 })
    },
    elements = { ["B"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B_plus = Substance {
    name = "B+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.6363196000e+05, 2.4190770800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5120711800e+00, -2.6000849100e-05, 1.9041175500e-08, -5.7184007100e-12, 6.0689303700e-16, 1.6362785100e+05, 2.3539269900e+00 })
    },
    elements = { ["B"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B_minus = Substance {
    name = "B-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5012027100e+00, -5.7342720800e-06, 1.0967043500e-08, -9.5030353300e-12, 3.0893577400e-15, 6.2641580600e+04, 4.6107813800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5000759200e+00, -8.1729425600e-08, 3.2996578300e-11, -5.7464965200e-15, 3.6236605600e-19, 6.2641769300e+04, 4.6159859300e+00 })
    },
    elements = { ["B"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BCL = Substance {
    name = "BCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8364463000e+00, 4.4368812000e-03, -4.3887522000e-06, 1.5161078000e-09, 3.2646195000e-14, 1.6001361000e+04, 8.3453320900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1020571000e+00, 4.8659193000e-04, -1.8864326000e-07, 3.5833342000e-11, -2.5099069000e-15, 1.5687958000e+04, 1.9552511900e+00 })
    },
    elements = { ["B"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BCL_plus = Substance {
    name = "BCL+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8124197000e+00, 4.6006392000e-03, -4.8119962000e-06, 1.9672216000e-09, -1.3837802000e-13, 1.4744849000e+05, 9.1566824500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1060888000e+00, 4.7274170000e-04, -1.7928584000e-07, 3.2416137000e-11, -2.0545758000e-15, 1.4713097000e+05, 2.6427294500e+00 })
    },
    elements = { ["B"] = 1, ["Cl"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BCLF = Substance {
    name = "BCLF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3120234000e+00, 7.4198763000e-03, -4.3485949000e-06, -1.1374057000e-09, 1.3763890000e-12, -3.9017548000e+04, 1.0948356300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.7076757000e+00, 1.4100203000e-03, -6.0114137000e-07, 1.1367044000e-10, -7.9368063000e-15, -3.9693327000e+04, -1.5350383800e+00 })
    },
    elements = { ["B"] = 1, ["Cl"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BCL2 = Substance {
    name = "BCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2974786000e+00, 1.2082576000e-02, -1.6123755000e-05, 9.6265856000e-09, -2.0599199000e-12, -1.0956537000e+04, 1.1042533300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.4459838000e+00, 5.7927948000e-04, -2.6049705000e-07, 6.3596358000e-11, -5.3982215000e-15, -1.1661304000e+04, -4.4608697700e+00 })
    },
    elements = { ["B"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BCL2_plus = Substance {
    name = "BCL2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.2704931000e+00, 1.0603791000e-02, -1.4229838000e-05, 8.5372831000e-09, -1.8349671000e-12, 7.9436016000e+04, 4.0764506900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.9266627000e+00, 6.7777633000e-04, -3.2101496000e-07, 6.8344422000e-11, -5.0073592000e-15, 7.8857822000e+04, -8.9346266100e+00 })
    },
    elements = { ["B"] = 1, ["Cl"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BCL2_minus = Substance {
    name = "BCL2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2358791000e+00, 1.1690219000e-02, -1.4778259000e-05, 8.2181546000e-09, -1.5657913000e-12, -1.8981815000e+04, 1.0690010400e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.3518218000e+00, 7.7028848000e-04, -4.4699863000e-07, 1.3831178000e-10, -1.3221995000e-14, -1.9705432000e+04, -4.7747207300e+00 })
    },
    elements = { ["B"] = 1, ["Cl"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BCL3 = Substance {
    name = "BCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7395265000e+00, 1.8105813000e-02, -2.1340461000e-05, 1.0828335000e-08, -1.7325967000e-12, -5.0214609000e+04, 9.0531274700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 8.5985380000e+00, 1.5531923000e-03, -6.7000602000e-07, 1.2789112000e-10, -9.0000059000e-15, -5.1357071000e+04, -1.5158429700e+01 })
    },
    elements = { ["B"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BF = Substance {
    name = "BF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4613609000e+00, -9.5685468000e-04, 6.0135744000e-06, -6.4978057000e-09, 2.2355349000e-12, -1.4969820000e+04, 4.4607796300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.5771888000e+00, 1.0192908000e-03, -4.1251564000e-07, 7.7196438000e-11, -5.3498741000e-15, -1.5127264000e+04, 3.2661224300e+00 })
    },
    elements = { ["B"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BF2 = Substance {
    name = "BF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.0309303000e+00, 7.2411021000e-03, -2.8250919000e-06, -2.8920413000e-09, 2.0046102000e-12, -7.2151102000e+04, 1.0445703500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.4447457000e+00, 1.7533211000e-03, -7.8444474000e-07, 1.5719859000e-10, -1.1311071000e-14, -7.2860367000e+04, -2.2733192000e+00 })
    },
    elements = { ["B"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BF2_plus = Substance {
    name = "BF2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3146474000e+00, 8.6443654000e-03, -6.7525396000e-06, 1.3383665000e-09, 4.5114910000e-13, 3.7483649000e+04, 5.9046897800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.8127638000e+00, 1.8193424000e-03, -7.7103457000e-07, 1.4489782000e-10, -9.9809156000e-15, 3.6794801000e+04, -7.0043119200e+00 })
    },
    elements = { ["B"] = 1, ["F"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BF2_minus = Substance {
    name = "BF2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1424581000e+00, 6.4104579000e-03, -1.2386461000e-06, -4.1220100000e-09, 2.3472367000e-12, -9.7672964000e+04, 9.2252323200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.3100348000e+00, 2.0020439000e-03, -9.7235510000e-07, 2.1641443000e-10, -1.6640881000e-14, -9.8336928000e+04, -2.3277607800e+00 })
    },
    elements = { ["B"] = 1, ["F"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BF3 = Substance {
    name = "BF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4468244000e+00, 1.5276312000e-02, -1.0784617000e-05, 6.8907502000e-10, 1.4893187000e-12, -1.3790135000e+05, 1.2567821100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.0241985000e+00, 3.2221559000e-03, -1.3705154000e-06, 2.5919671000e-10, -1.8122310000e-14, -1.3918072000e+05, -1.1184300900e+01 })
    },
    elements = { ["B"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BH = Substance {
    name = "BH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6862206000e+00, -1.3055435000e-03, 2.6742105000e-06, -9.1073738000e-10, -1.5591136000e-13, 5.2176330000e+04, -5.5245401200e-02 }),
        Range(1000.0, 5000.0, NASA7 { 2.8919079000e+00, 1.5832946000e-03, -5.8261729000e-07, 1.0242068000e-10, -6.7669569000e-15, 5.2328714000e+04, 3.7962432900e+00 })
    },
    elements = { ["B"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BHF2 = Substance {
    name = "BHF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4053602000e+00, 9.2755844000e-03, 1.3386461000e-06, -8.6807895000e-09, 4.1211015000e-12, -8.9388409000e+04, 1.2888044100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.3184527000e+00, 4.7444466000e-03, -1.9337858000e-06, 3.5508382000e-10, -2.4293667000e-14, -9.0375012000e+04, -3.0431403100e+00 })
    },
    elements = { ["B"] = 1, ["H"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BH2 = Substance {
    name = "BH2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.3958282000e+00, 7.4776260000e-03, -7.2019514000e-06, 4.5826398000e-09, -1.2510680000e-12, 2.3162650000e+04, 6.0764703900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.3625285000e+00, 3.9012854000e-03, -1.5097551000e-06, 2.6672805000e-10, -1.7713053000e-14, 2.2919028000e+04, 1.2592825900e+00 })
    },
    elements = { ["B"] = 1, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BH3 = Substance {
    name = "BH3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9487033000e+00, -5.2170543000e-04, 7.6481164000e-06, -4.6148694000e-09, 5.6318616000e-13, 1.1618809000e+04, -4.5517457900e-02 }),
        Range(1000.0, 5000.0, NASA7 { 2.0621726000e+00, 7.2655895000e-03, -2.7510337000e-06, 4.7803709000e-10, -3.1334285000e-14, 1.1923753000e+04, 8.8494508300e+00 })
    },
    elements = { ["B"] = 1, ["H"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BN = Substance {
    name = "BN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5375065000e+00, -1.3556586000e-03, 6.2214189000e-06, -6.1683269000e-09, 1.9872461000e-12, 5.6329743000e+04, 5.5631767500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.5981832000e+00, 8.7176805000e-04, -2.9972644000e-07, 5.6036944000e-11, -4.0750421000e-15, 5.6171241000e+04, 4.6002252500e+00 })
    },
    elements = { ["B"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BO = Substance {
    name = "BO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7297250000e+00, -2.0878324000e-03, 5.7362849000e-06, -4.3894828000e-09, 1.0916632000e-12, -1.0618859000e+03, 3.6255410400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.1564956000e+00, 1.3816589000e-03, -5.5049630000e-07, 9.9116678000e-11, -6.4164546000e-15, -1.0303422000e+03, 6.0374895400e+00 })
    },
    elements = { ["B"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BOCL = Substance {
    name = "BOCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2705321000e+00, 1.0227750000e-02, -1.2070163000e-05, 7.2025562000e-09, -1.6914738000e-12, -3.9378208000e+04, 7.3493022500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.7135566000e+00, 1.8664689000e-03, -7.7487898000e-07, 1.4398572000e-10, -9.9317745000e-15, -3.9977353000e+04, -4.8804035500e+00 })
    },
    elements = { ["B"] = 1, ["O"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BOF = Substance {
    name = "BOF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.2370373800e+00, 1.3349549600e-02, -1.8153061400e-05, 1.3609367600e-08, -4.2438239700e-12, -7.3528373500e+04, 1.1006941100e+01 }),
        Range(1000.0, 6000.0, NASA7 { 5.3929660300e+00, 2.0744450000e-03, -7.9360058600e-07, 1.3347657100e-10, -8.2177933100e-15, -7.4311385200e+04, -4.7650053500e+00 })
    },
    elements = { ["B"] = 1, ["O"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BOF2 = Substance {
    name = "BOF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.7445977000e+00, 1.8693277000e-02, -1.5246164000e-05, 2.6559470000e-09, 1.3798606000e-12, -1.0186758000e+05, 1.7353139000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.3077233000e+00, 2.9903620000e-03, -1.3059617000e-06, 2.5308242000e-10, -1.7687333000e-14, -1.0334576000e+05, -1.1192416000e+01 })
    },
    elements = { ["B"] = 1, ["O"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BO2 = Substance {
    name = "BO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1212048000e+00, 8.4680883000e-03, -4.5972278000e-06, -1.6420021000e-09, 1.6658233000e-12, -3.5483307000e+04, 7.5478916300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.8198434000e+00, 1.8626574000e-03, -8.1302797000e-07, 1.5735821000e-10, -1.0944238000e-14, -3.6255117000e+04, -6.5609079700e+00 })
    },
    elements = { ["B"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BO2_minus = Substance {
    name = "BO2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4916337000e+00, 9.7470644000e-03, -8.7640864000e-06, 3.5802544000e-09, -4.0611221000e-13, -8.4641218000e+04, 9.2268957000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.8805169000e+00, 2.6743651000e-03, -1.0932194000e-06, 2.0080873000e-10, -1.3717769000e-14, -8.5284324000e+04, -3.0092764000e+00 })
    },
    elements = { ["B"] = 1, ["O"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BS = Substance {
    name = "BS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1742046000e+00, 9.8544972000e-04, 2.7711319000e-06, -4.3751801000e-09, 1.7616179000e-12, 2.8230624000e+04, 7.5338624000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.7068542000e+00, 9.8682895000e-04, -4.7495266000e-07, 1.0654601000e-10, -8.0519643000e-15, 2.8012816000e+04, 4.4246209000e+00 })
    },
    elements = { ["B"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B2 = Substance {
    name = "B2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7909974400e+00, -5.8753635900e-03, 3.0051416200e-05, -3.9143917300e-08, 1.6041942800e-11, 9.8722999800e+04, 3.4346320300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.2386915500e+00, -5.2360750700e-04, 1.6970497800e-07, -2.0654904200e-11, 9.4143592500e-16, 9.7987382800e+04, -6.0074221700e+00 })
    },
    elements = { ["B"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B2O = Substance {
    name = "B2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5294730000e+00, 3.1993826000e-03, 3.0329257000e-06, -5.7491255000e-09, 2.2847349000e-12, 1.0363201000e+04, 6.2396314300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.7300538000e+00, 2.3941486000e-03, -1.0008324000e-06, 1.8697510000e-10, -1.2953672000e-14, 9.8853354000e+03, -6.3585128900e-01 })
    },
    elements = { ["B"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B2O2 = Substance {
    name = "B2O2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6807078000e+00, 1.5361132000e-02, -1.8606097000e-05, 1.2171451000e-08, -3.2411018000e-12, -5.6486647000e+04, 4.3561273400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.9938574000e+00, 3.5940393000e-03, -1.4753611000e-06, 2.7225124000e-10, -1.8695996000e-14, -5.7296178000e+04, -1.2167777100e+01 })
    },
    elements = { ["B"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B2O3 = Substance {
    name = "B2O3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6608837000e+00, 2.0262076000e-02, -2.1947338000e-05, 1.2253004000e-08, -2.7038402000e-12, -1.0236524000e+05, 8.1062206800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 8.3994106000e+00, 4.7436338000e-03, -1.9552304000e-06, 3.6187749000e-10, -2.4907232000e-14, -1.0357158000e+05, -1.5810000900e+01 })
    },
    elements = { ["B"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B3O3CL3 = Substance {
    name = "B3O3CL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0444983000e+00, 5.4260597000e-02, -5.5750761000e-05, 2.2223128000e-08, -1.4181295000e-12, -1.9941632000e+05, 9.0567225500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.9282564000e+01, 6.3172581000e-03, -2.7242926000e-06, 5.2047910000e-10, -3.6677790000e-14, -2.0320883000e+05, -6.7885152100e+01 })
    },
    elements = { ["B"] = 3, ["O"] = 3, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B3O3F3 = Substance {
    name = "B3O3F3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.0798861000e+00, 4.5636592000e-02, -3.3098826000e-05, 2.5538839000e-09, 4.4358761000e-12, -2.8712213000e+05, 1.1475391700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.6858616000e+01, 8.8685754000e-03, -3.7881058000e-06, 7.1870401000e-10, -5.0376917000e-14, -2.9093104000e+05, -5.9858752300e+01 })
    },
    elements = { ["B"] = 3, ["O"] = 3, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_B3O3H3 = Substance {
    name = "B3O3H3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.7698907800e+00, 2.5342590000e-02, 1.2248670100e-05, -3.7305761100e-08, 1.7455689700e-11, -1.4843102600e+05, 1.1521801900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.2120121200e+01, 1.2281120900e-02, -4.6092248700e-06, 7.6582454200e-10, -4.6762379300e-14, -1.5164862900e+05, -3.9891800700e+01 })
    },
    elements = { ["B"] = 3, ["O"] = 3, ["H"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ba = Substance {
    name = "Ba",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5038777000e+00, -3.7803914000e-05, 1.2914966000e-07, -1.8400409000e-10, 9.2934829000e-14, 2.0792544000e+04, 6.2167422200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.9730545000e+00, -1.1161215000e-02, 7.1172147000e-06, -1.5336673000e-09, 1.0876700000e-13, 1.8889966000e+04, -2.3487684800e+01 })
    },
    elements = { ["Ba"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaBr = Substance {
    name = "BaBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.1714553000e+00, 1.5960813000e-03, -2.8886542000e-06, 2.4767147000e-09, -7.9830700000e-13, -1.4594495000e+04, 8.3862067700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3689774000e+00, 3.9075887000e-04, -2.9901749000e-07, 1.0641301000e-10, -9.8416049000e-15, -1.4617685000e+04, 7.5252608700e+00 })
    },
    elements = { ["Ba"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaBr2 = Substance {
    name = "BaBr2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.3405275000e+00, 3.0561952000e-03, -5.7285864000e-06, 4.8875968000e-09, -1.5688081000e-12, -5.3062316000e+04, 4.3194371500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.9502338000e+00, 5.8066023000e-05, -2.6195428000e-08, 5.1992828000e-12, -3.7852770000e-16, -5.3166842000e+04, 1.4900275500e+00 })
    },
    elements = { ["Ba"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaCL = Substance {
    name = "BaCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9781148000e+00, 2.1803218000e-03, -3.4342565000e-06, 2.5182212000e-09, -6.9058027000e-13, -1.8366937000e+04, 7.9242610400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.6675238000e+00, -2.2187251000e-04, 8.1270680000e-08, 3.0216962000e-11, -5.3183301000e-15, -1.8542142000e+04, 4.4644420400e+00 })
    },
    elements = { ["Ba"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaCL2 = Substance {
    name = "BaCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.0571238000e+00, 3.8426149000e-03, -6.2683205000e-06, 4.6196665000e-09, -1.2744768000e-12, -6.1914536000e+04, 3.7617916600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.9138637000e+00, 9.8213963000e-05, -4.3268348000e-08, 8.3969006000e-12, -5.9892085000e-16, -6.2076051000e+04, -3.0586307500e-01 })
    },
    elements = { ["Ba"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaF = Substance {
    name = "BaF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3537506000e+00, 4.3819580000e-03, -6.6405929000e-06, 4.6143229000e-09, -1.1971518000e-12, -3.9892956000e+04, 9.4575892600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3587125000e+00, 3.0110738000e-04, -2.2863315000e-07, 8.9865554000e-11, -8.7657595000e-15, -4.0101376000e+04, 4.6014854600e+00 })
    },
    elements = { ["Ba"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaF_plus = Substance {
    name = "BaF+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1617464000e+00, 4.8876079000e-03, -7.1219882000e-06, 4.7144971000e-09, -1.1458983000e-12, 1.6960464000e+04, 9.5462329100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.4945565000e+00, -4.1130056000e-03, 2.5882808000e-06, -5.0458698000e-10, 3.0719560000e-14, 1.5960651000e+04, -7.8849844900e+00 })
    },
    elements = { ["Ba"] = 1, ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaF2 = Substance {
    name = "BaF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.0968239000e+00, 7.4226250000e-03, -1.1682833000e-05, 8.3296218000e-09, -2.2216856000e-12, -9.8431595000e+04, 5.4369208600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.7977159000e+00, 2.2932196000e-04, -1.0053521000e-07, 1.9428566000e-11, -1.3807507000e-15, -9.8763114000e+04, -2.6952832400e+00 })
    },
    elements = { ["Ba"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaOH = Substance {
    name = "BaOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6681831000e+00, 1.6883976000e-02, -3.1031777000e-05, 2.6421048000e-08, -8.3953588000e-12, -2.8554668000e+04, 1.1343409200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.5178468000e+00, 1.4780903000e-03, -5.7823307000e-07, 1.4040222000e-10, -1.2035765000e-14, -2.8959074000e+04, -1.4978728800e+00 })
    },
    elements = { ["Ba"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaOH_plus = Substance {
    name = "BaOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7090490000e+00, 1.6726525000e-02, -3.0767927000e-05, 2.6210448000e-08, -8.3303839000e-12, 3.1255079000e+04, 1.0470790900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.5126019000e+00, 1.4013840000e-03, -4.2350216000e-07, 6.0578363000e-11, -3.3519653000e-15, 3.0871349000e+04, -2.1076730000e+00 })
    },
    elements = { ["Ba"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaO2H2 = Substance {
    name = "BaO2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7909356000e+00, 3.2075449000e-02, -5.9350806000e-05, 5.0776385000e-08, -1.6181131000e-11, -7.7483558000e+04, 8.9486932300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.0824735000e+00, 2.7368311000e-03, -8.1753678000e-07, 1.1534884000e-10, -6.2833756000e-15, -7.8186586000e+04, -1.4688671600e+01 })
    },
    elements = { ["Ba"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BaS = Substance {
    name = "BaS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4816171000e+00, 4.5658135000e-03, -8.2726410000e-06, 6.9372594000e-09, -2.2000243000e-12, 3.3636488000e+03, 9.0442250600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4402587000e+00, 7.4269398000e-04, -1.1795681000e-06, 5.7618638000e-10, -6.7546324000e-14, 3.1159820000e+03, 4.2859843600e+00 })
    },
    elements = { ["Ba"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Be = Substance {
    name = "Be",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 3.8222646000e+04, 2.1461731600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.2943856600e+00, 4.1166984100e-04, -2.6473083200e-07, 6.2568138800e-11, -3.8928100700e-15, 3.8295805500e+04, 3.2673194200e+00 })
    },
    elements = { ["Be"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Be_plus = Substance {
    name = "Be+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.4589369300e+05, 2.8392292700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5016897600e+00, -5.1037364700e-06, 5.2748109000e-09, -2.1615504900e-12, 3.0071302600e-16, 1.4589327700e+05, 2.8306684700e+00 })
    },
    elements = { ["Be"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeBO2 = Substance {
    name = "BeBO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.0069120000e+00, 1.8044824000e-02, -1.6917581000e-05, 6.0865373000e-09, -1.7276285000e-13, -5.9234197000e+04, 1.5805557100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.9108376000e+00, 3.2668684000e-03, -1.3678120000e-06, 2.5576211000e-10, -1.7727741000e-14, -6.0505715000e+04, -9.1616580500e+00 })
    },
    elements = { ["Be"] = 1, ["B"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeBr = Substance {
    name = "BeBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6591457000e+00, 6.7027278000e-03, -1.0403711000e-05, 7.7655194000e-09, -2.2530918000e-12, 1.3433096000e+04, 1.0735652000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.1943887000e+00, 3.9939023000e-04, -1.4838873000e-07, 2.6762272000e-11, -1.5626127000e-15, 1.3115464000e+04, 3.3229484500e+00 })
    },
    elements = { ["Be"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeBr2 = Substance {
    name = "BeBr2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.6422283000e+00, 9.0084451000e-03, -1.2698556000e-05, 8.7558985000e-09, -2.3923194000e-12, -2.9265435000e+04, 4.3001193300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8344872000e+00, 7.5429287000e-04, -3.3368206000e-07, 6.5302349000e-11, -4.7041096000e-15, -2.9757117000e+04, -6.4717918700e+00 })
    },
    elements = { ["Be"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeCL = Substance {
    name = "BeCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8321987000e+00, 4.4566764000e-03, -4.4482161000e-06, 1.5852587000e-09, 4.5206894000e-15, 6.2906248000e+03, 8.8915605100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1052878000e+00, 4.7461701000e-04, -1.7996528000e-07, 3.2563903000e-11, -2.0652840000e-15, 5.9753060000e+03, 2.4645174100e+00 })
    },
    elements = { ["Be"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeCL_plus = Substance {
    name = "BeCL+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8965984000e+00, 5.1267492000e-03, -6.4427911000e-06, 3.5632640000e-09, -6.5925088000e-13, 1.1671466000e+05, 7.8372704500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.3827500000e+00, -1.8471198000e-03, 1.1123683000e-06, -1.6952994000e-10, 6.1007091000e-15, 1.1599717000e+05, -5.0622413500e+00 })
    },
    elements = { ["Be"] = 1, ["Cl"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeCLF = Substance {
    name = "BeCLF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.1024381000e+00, 8.5017490000e-03, -8.9093963000e-06, 4.0076232000e-09, -5.1627539000e-13, -7.0468736000e+04, 4.0991628100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.4402791000e+00, 1.1463693000e-03, -4.8545360000e-07, 9.1287865000e-11, -6.3443549000e-15, -7.1059771000e+04, -7.7286996900e+00 })
    },
    elements = { ["Be"] = 1, ["Cl"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeCL2 = Substance {
    name = "BeCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.4927125000e+00, 8.0535545000e-03, -8.8319239000e-06, 4.0897049000e-09, -5.3498092000e-13, -4.4952881000e+04, 2.6958214100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.7043191000e+00, 8.7166468000e-04, -3.7255053000e-07, 7.0567006000e-11, -4.9335360000e-15, -4.5494558000e+04, -8.4220122900e+00 })
    },
    elements = { ["Be"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeF = Substance {
    name = "BeF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2761862000e+00, 2.5233759000e-04, 4.0939944000e-06, -5.3128150000e-09, 1.9954900000e-12, -2.1445924000e+04, 5.8649965100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.7095295000e+00, 8.9383600000e-04, -3.6113068000e-07, 6.7601092000e-11, -4.6420833000e-15, -2.1660052000e+04, 3.1641924100e+00 })
    },
    elements = { ["Be"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeF2 = Substance {
    name = "BeF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5234274000e+00, 9.3890284000e-03, -9.5636208000e-06, 4.2920989000e-09, -5.7751113000e-13, -9.7130461000e+04, 4.8839753900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.0457631000e+00, 1.5629374000e-03, -6.6108197000e-07, 1.2447551000e-10, -8.6716063000e-15, -9.7779127000e+04, -7.9178826100e+00 })
    },
    elements = { ["Be"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeH = Substance {
    name = "BeH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7312305000e+00, -1.9143548000e-03, 4.8910325000e-06, -3.2925883000e-09, 6.6638562000e-13, 3.7565560000e+04, 3.8860852300e-01 }),
        Range(1000.0, 5000.0, NASA7 { 3.0570218000e+00, 1.4977223000e-03, -5.6872963000e-07, 1.0260817000e-10, -6.9166979000e-15, 3.7639513000e+04, 3.4002747800e+00 })
    },
    elements = { ["Be"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeH_plus = Substance {
    name = "BeH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7095712000e+00, -1.5852031000e-03, 3.6228769000e-06, -1.8933221000e-09, 1.7173264000e-13, 1.3802866000e+05, -2.8289640800e-01 }),
        Range(1000.0, 5000.0, NASA7 { 2.9015992000e+00, 1.6751761000e-03, -6.6805503000e-07, 1.2510951000e-10, -8.1741466000e-15, 1.3816812000e+05, 3.5556291600e+00 })
    },
    elements = { ["Be"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeI = Substance {
    name = "BeI",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7826122000e+00, 6.8410348000e-03, -1.1389896000e-05, 8.9924128000e-09, -2.7277686000e-12, 1.9396183000e+04, 1.1078936700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.2600493000e+00, 3.4320819000e-04, -1.2759477000e-07, 2.4189709000e-11, -1.4570142000e-15, 1.9110352000e+04, 4.0476677000e+00 })
    },
    elements = { ["Be"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeI2 = Substance {
    name = "BeI2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.9373786000e+00, 8.7404737000e-03, -1.3114724000e-05, 9.4928494000e-09, -2.6926336000e-12, -9.4616005000e+03, 4.8295113700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.0011262000e+00, 5.6878872000e-04, -2.5253755000e-07, 4.9541054000e-11, -3.5747204000e-15, -9.9038859000e+03, -5.2102552300e+00 })
    },
    elements = { ["Be"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeN = Substance {
    name = "BeN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1684286000e+00, 1.0282483000e-03, 2.7376017000e-06, -4.3481099000e-09, 1.7534453000e-12, 5.0310451000e+04, 6.6625249600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.7855937000e+00, 8.2386575000e-04, -3.2711602000e-07, 6.1551888000e-11, -4.2809041000e-15, 5.0066180000e+04, 3.1055852600e+00 })
    },
    elements = { ["Be"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeO = Substance {
    name = "BeO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7897424800e+00, -3.2489622600e-03, 1.1298853300e-05, -1.1805631500e-08, 4.2067576100e-12, 1.5341069600e+04, 2.7390530600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.6677847300e+00, -4.0784761400e-03, 3.4111260800e-06, -8.2105237100e-10, 6.1377327900e-14, 1.4589958000e+04, -8.0858070000e+00 })
    },
    elements = { ["Be"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeOH = Substance {
    name = "BeOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.9139148000e+00, 1.3507159000e-02, -1.8531687000e-05, 1.2942471000e-08, -3.5438961000e-12, -1.4819683000e+04, 1.0992830500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.6116720000e+00, 2.3972013000e-03, -8.5489162000e-07, 1.4309062000e-10, -9.1112399000e-15, -1.5361838000e+04, -1.9882920700e+00 })
    },
    elements = { ["Be"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeOH_plus = Substance {
    name = "BeOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.9280982000e+00, 1.3534240000e-02, -1.8654026000e-05, 1.3073921000e-08, -3.5900576000e-12, 9.0368305000e+04, 1.0225727000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.6223527000e+00, 2.3902571000e-03, -8.5549473000e-07, 1.4441671000e-10, -9.3560294000e-15, 8.9829436000e+04, -2.7261466100e+00 })
    },
    elements = { ["Be"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeO2H2 = Substance {
    name = "BeO2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4184393000e-01, 3.9913568000e-02, -6.4588281000e-05, 5.1023476000e-08, -1.5479205000e-11, -8.2741045000e+04, 1.7313626000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.8550478000e+00, 4.6477580000e-03, -1.6502834000e-06, 2.7670623000e-10, -1.7826298000e-14, -8.4106259000e+04, -1.8429466000e+01 })
    },
    elements = { ["Be"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_BeS = Substance {
    name = "BeS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9022538000e+00, 3.1897413000e-03, -1.3651825000e-06, -1.5092710000e-09, 1.2275929000e-12, 3.0710760000e+04, 7.8758506400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.2040734000e+00, -3.8742022000e-03, 4.2578891000e-06, -1.2560599000e-09, 1.1343403000e-13, 3.0226084000e+04, -3.5780119600e+00 })
    },
    elements = { ["Be"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Be2O = Substance {
    name = "Be2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7527897000e+00, 8.9648699000e-03, -5.5859247000e-06, -3.4769188000e-10, 1.1015472000e-12, -8.7174709000e+03, 8.4519189500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.4549734000e+00, 2.1970385000e-03, -9.2919578000e-07, 1.7496410000e-10, -1.2189982000e-14, -9.4958985000e+03, -5.6704226500e+00 })
    },
    elements = { ["Be"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Be2OF2 = Substance {
    name = "Be2OF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.8600026000e+00, 1.9438982000e-02, -1.8818760000e-05, 7.1009503000e-09, -3.7225258000e-13, -1.4703959000e+05, 3.2417334100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.0311343000e+01, 2.9258151000e-03, -1.2481987000e-06, 2.3652169000e-10, -1.6559160000e-14, -1.4844623000e+05, -2.4487683000e+01 })
    },
    elements = { ["Be"] = 2, ["O"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Be2O2 = Substance {
    name = "Be2O2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.7102739000e+00, 1.8244939000e-02, -1.4377253000e-05, 2.1268816000e-09, 1.4691993000e-12, -5.0512366000e+04, 1.5214510200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.1783652000e+00, 3.0796926000e-03, -1.3162273000e-06, 2.4970614000e-10, -1.7496339000e-14, -5.1984876000e+04, -1.2925594800e+01 })
    },
    elements = { ["Be"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Be3O3 = Substance {
    name = "Be3O3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.0002692000e+00, 2.0005172000e-02, 5.7517847000e-07, -1.7092805000e-08, 8.4862785000e-12, -1.2826867000e+05, 1.5620953000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 9.1907322000e+00, 7.3623701000e-03, -3.1292729000e-06, 5.9162589000e-10, -4.1360194000e-14, -1.3061849000e+05, -2.3316880000e+01 })
    },
    elements = { ["Be"] = 3, ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Be4O4 = Substance {
    name = "Be4O4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.3818438000e+00, 5.2384828000e-02, -4.0893018000e-05, 4.7379707000e-09, 4.9954164000e-12, -1.9278356000e+05, 3.0413066100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.4547030000e+01, 8.1903730000e-03, -3.5162789000e-06, 6.6923457000e-10, -4.7005963000e-14, -1.9704845000e+05, -5.1496765900e+01 })
    },
    elements = { ["Be"] = 4, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Br = Substance {
    name = "Br",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.4857171100e+00, 1.5064752500e-04, -5.3726733300e-07, 7.2092106500e-10, -2.5020555800e-13, 1.2709216800e+04, 6.8603080400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.0885105300e+00, 7.1211861100e-04, -2.7000307300e-07, 4.1498629900e-11, -2.3118829400e-15, 1.2856876700e+04, 9.0735114400e+00 })
    },
    elements = { ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Br2 = Substance {
    name = "Br2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.3433100400e+00, 6.3523076900e-03, -1.3641881500e-05, 1.3172630000e-08, -4.6837347600e-12, 2.5351540800e+03, 9.0794035300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.1872818700e+00, -1.3865110400e-03, 9.3474515300e-07, -2.0706539100e-10, 1.4180851700e-14, 2.1070567800e+03, 7.7622339400e-02 })
    },
    elements = { ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C = Substance {
    name = "C",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5542395500e+00, -3.2153772400e-04, 7.3379224500e-07, -7.3223488900e-10, 2.6652144600e-13, 8.5443883200e+04, 4.5313084800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.6055829800e+00, -1.9593433500e-04, 1.0673721900e-07, -1.6423939000e-11, 8.1870575200e-16, 8.5412944300e+04, 4.1923868100e+00 })
    },
    elements = { ["C"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C_plus = Substance {
    name = "C+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.6152396600e+00, -5.5378387300e-04, 1.0634863600e-06, -9.2375634500e-10, 3.0077456800e-13, 2.1686205300e+05, 3.8265294400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5085351900e+00, -1.0859927000e-05, 5.3706921000e-09, -1.1827059600e-12, 9.7126756400e-17, 2.1687949300e+05, 4.3173965500e+00 })
    },
    elements = { ["C"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C_minus = Substance {
    name = "C-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 6.9931565400e+04, 3.9634040300e+00 })
    },
    elements = { ["C"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CCL = Substance {
    name = "CCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1953557000e+00, 2.8076318000e-03, -1.6043845000e-06, -5.7744065000e-10, 6.1409732000e-13, 5.9325077000e+04, 8.0351732100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.0984727000e+00, 5.0077845000e-04, -2.0012833000e-07, 3.8680992000e-11, -2.5441113000e-15, 5.9076599000e+04, 3.3501736100e+00 })
    },
    elements = { ["C"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CCLF3 = Substance {
    name = "CCLF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.9011936000e+00, 2.0563658000e-02, -8.5508636000e-06, -1.0395645000e-08, 7.5721825000e-12, -8.6829563000e+04, 1.2115066700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0165096000e+01, 2.8460042000e-03, -1.0926024000e-06, 1.8314374000e-10, -1.1194059000e-14, -8.8848750000e+04, -2.5704111300e+01 })
    },
    elements = { ["C"] = 1, ["Cl"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CCL2 = Substance {
    name = "CCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8588505000e+00, 1.3957938000e-02, -2.0038898000e-05, 1.3500726000e-08, -3.1669715000e-12, 2.7363926000e+04, 1.2243313100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.7184999000e+00, 5.3449745000e-03, -2.3431284000e-06, 4.1806177000e-10, -2.6765295000e-14, 2.7554793000e+04, 9.6459795400e+00 })
    },
    elements = { ["C"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CCL2F2 = Substance {
    name = "CCL2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.8134966000e+00, 2.0036835000e-02, -9.8986693000e-06, -8.7995353000e-09, 7.1218552000e-12, -6.1253551000e+04, 8.9909711000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.0708248000e+01, 2.3232186000e-03, -9.0073223000e-07, 1.5261702000e-10, -9.4434958000e-15, -6.3102602000e+04, -2.6622876500e+01 })
    },
    elements = { ["C"] = 1, ["Cl"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CCL3 = Substance {
    name = "CCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7153357000e+00, 1.9443796000e-02, -2.4627841000e-05, 1.3786464000e-08, -2.6638934000e-12, 7.7820020000e+03, 9.7160425900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 8.7815473000e+00, 1.3516130000e-03, -5.8249453000e-07, 1.1098697000e-10, -7.7937264000e-15, 6.6344151000e+03, -1.5316132400e+01 })
    },
    elements = { ["C"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CCL3F = Substance {
    name = "CCL3F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.8287687000e+00, 1.8981740000e-02, -1.0360662000e-05, -7.8472127000e-09, 6.8452752000e-12, -3.6446184000e+04, 4.6341373000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.1246530000e+01, 1.7837698000e-03, -6.9260443000e-07, 1.1740724000e-10, -7.2640292000e-15, -3.8108309000e+04, -2.8275985800e+01 })
    },
    elements = { ["C"] = 1, ["Cl"] = 3, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CCL4 = Substance {
    name = "CCL4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 5.7966299000e+00, 1.7977439000e-02, -1.0956546000e-05, -6.6681807000e-09, 6.4554898000e-12, -1.3940965000e+04, -5.5695963500e-01 }),
        Range(1000.0, 5000.0, NASA7 { 1.1739096000e+01, 1.2837553000e-03, -4.9650259000e-07, 8.3525020000e-11, -5.1107224000e-15, -1.5419090000e+04, -3.0777818700e+01 })
    },
    elements = { ["C"] = 1, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CF = Substance {
    name = "CF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4655143000e+00, -6.8779805000e-04, 5.6784766000e-06, -6.4582982000e-09, 2.2988248000e-12, 2.9655598000e+04, 5.8813548900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.6869679000e+00, 9.1143491000e-04, -3.6463855000e-07, 6.7482854000e-11, -4.5269596000e-15, 2.9478125000e+04, 4.1745100900e+00 })
    },
    elements = { ["C"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CF_plus = Substance {
    name = "CF+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.5828509500e+00, -1.8639093000e-03, 8.5343534100e-06, -9.3237806200e-09, 3.3394171300e-12, 1.3719824800e+05, 4.0743900000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.6759608400e+00, 8.5282307300e-04, -3.0675566100e-07, 4.9743005700e-11, -2.8396903800e-15, 1.3701887800e+05, 2.8460881300e+00 })
    },
    elements = { ["C"] = 1, ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CF2 = Substance {
    name = "CF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7688821000e+00, 7.2372962000e-03, -1.6028152000e-06, -4.5512379000e-09, 2.6648011000e-12, -2.3015786000e+04, 1.1137695800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.2267142000e+00, 2.0837680000e-03, -9.9037278000e-07, 2.1264848000e-10, -1.5831114000e-14, -2.3755847000e+04, -1.9109042300e+00 })
    },
    elements = { ["C"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CF2_plus = Substance {
    name = "CF2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9783522000e+00, 6.0336602000e-03, 6.5858785000e-10, -5.2129449000e-09, 2.6663021000e-12, 1.1212675000e+05, 1.0951556300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.1554230000e+00, 2.0528310000e-03, -9.1173911000e-07, 1.8272761000e-10, -1.3213640000e-14, 1.1143122000e+05, -7.7876684100e-01 })
    },
    elements = { ["C"] = 1, ["F"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CF3 = Substance {
    name = "CF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.0650168000e+00, 1.6424158000e-02, -1.0838146000e-05, -8.5317997000e-10, 2.3878070000e-12, -5.7811976000e+04, 1.5704693000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.2012622000e+00, 3.0663935000e-03, -1.3144181000e-06, 2.4996925000e-10, -1.7550928000e-14, -5.9238631000e+04, -1.0945710000e+01 })
    },
    elements = { ["C"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CF3_plus = Substance {
    name = "CF3+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.2605576000e+00, 1.5422323000e-02, -9.8956674000e-06, -7.8345046000e-10, 2.1211892000e-12, 4.9365338000e+04, 1.3578455100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.0225406000e+00, 3.2441271000e-03, -1.3864875000e-06, 2.6323637000e-10, -1.8464402000e-14, 4.8022318000e+04, -1.1206533900e+01 })
    },
    elements = { ["C"] = 1, ["F"] = 3, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CF4 = Substance {
    name = "CF4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.0514399200e+00, 2.7824646800e-02, -2.4652526000e-05, 6.7454830400e-09, 9.1890931600e-13, -1.1357406700e+05, 1.8190089900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 9.4721535900e+00, 3.5952521600e-03, -1.4037850200e-06, 2.3918818800e-10, -1.4855890600e-14, -1.1581633700e+05, -2.4970909100e+01 })
    },
    elements = { ["C"] = 1, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH = Substance {
    name = "CH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.4898166500e+00, 3.2383554100e-04, -1.6889906500e-06, 3.1621732700e-09, -1.4060906700e-12, 7.0797293400e+04, 2.0840110800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5209062700e+00, 1.7653723500e-03, -4.6147570500e-07, 5.9288547200e-11, -3.3473196200e-15, 7.1131436300e+04, 7.4053216300e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH_plus = Substance {
    name = "CH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.5379655200e+00, -7.5926019400e-05, -6.0956670800e-07, 2.0081952200e-09, -1.0080682100e-12, 1.9505722900e+05, 5.2323783800e-01 }),
        Range(1000.0, 6000.0, NASA7 { 4.5372669300e+00, -2.0516540300e-03, 1.6958717000e-06, -3.5109770900e-10, 2.2212919700e-14, 1.9466107900e+05, -5.0278222400e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CHCL = Substance {
    name = "CHCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.9613611000e+00, 6.1151916000e-03, -4.5203180000e-06, 1.3093389000e-09, 7.1578086000e-14, 3.5959983000e+04, 9.7434958400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.1566036000e+00, 4.5888325000e-04, 4.4749023000e-07, -1.3606787000e-10, 1.0242445000e-14, 3.5310577000e+04, -1.7511614600e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CHCLF2 = Substance {
    name = "CHCLF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.4681120000e+00, 1.5883945000e-02, -2.8209015000e-06, -1.0478132000e-08, 6.0704896000e-12, -5.9570879000e+04, 1.5193423400e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.9029827000e+00, 4.6251900000e-03, -1.6489867000e-06, 2.5910429000e-10, -1.4836212000e-14, -6.1234266000e+04, -1.3734297600e+01 })
    },
    elements = { ["C"] = 1, ["H"] = 1, ["Cl"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CHCL2F = Substance {
    name = "CHCL2F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.1107159000e+00, 1.6295891000e-02, -4.7331187000e-06, -9.4798160000e-09, 6.1323750000e-12, -3.5862211000e+04, 1.2963849900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.5083923000e+00, 4.0345713000e-03, -1.4268226000e-06, 2.2247303000e-10, -1.2630173000e-14, -3.7427910000e+04, -1.5411662100e+01 })
    },
    elements = { ["C"] = 1, ["H"] = 1, ["Cl"] = 2, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CHCL3 = Substance {
    name = "CHCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.6819801000e+00, 1.6611021000e-02, -6.6180801000e-06, -8.1291560000e-09, 5.9433135000e-12, -1.4141844000e+04, 9.9834995800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 8.9938030000e+00, 3.5652192000e-03, -1.2537648000e-06, 1.9479131000e-10, -1.1032021000e-14, -1.5609000000e+04, -1.7631699800e+01 })
    },
    elements = { ["C"] = 1, ["H"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CHF3 = Substance {
    name = "CHF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.7857094000e+00, 1.5961129000e-02, -1.5575015000e-06, -1.1366911000e-08, 6.1275290000e-12, -8.4591125000e+04, 1.6457590800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.3870249000e+00, 5.1266924000e-03, -1.8371775000e-06, 2.9004643000e-10, -1.6692089000e-14, -8.6367438000e+04, -1.3610261200e+01 })
    },
    elements = { ["C"] = 1, ["H"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH2 = Substance {
    name = "CH2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7448487900e+00, 1.1796082300e-03, 1.9450226400e-06, -2.5293250600e-09, 1.1244763100e-12, 4.5579952300e+04, 1.6285012500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.7772316600e+00, 3.8366347600e-03, -1.3485322000e-06, 2.1164125500e-10, -1.2344566200e-14, 4.5859030400e+04, 6.6728642900e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH2CLF = Substance {
    name = "CH2CLF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.0975533000e+00, 1.2551896000e-02, 2.7147036000e-07, -9.1319841000e-09, 4.4713573000e-12, -3.2973617000e+04, 1.6168172300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.9572783000e+00, 6.0879700000e-03, -2.0813759000e-06, 3.1346215000e-10, -1.7084878000e-14, -3.4280781000e+04, -4.8798862600e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 2, ["Cl"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH2CL2 = Substance {
    name = "CH2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.3626127000e+00, 1.3885532000e-02, -2.0872167000e-06, -8.6656158000e-09, 4.9494315000e-12, -1.2761230000e+04, 1.5084905800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.4991283000e+00, 5.5672340000e-03, -1.8887449000e-06, 2.8233393000e-10, -1.5256869000e-14, -1.4048813000e+04, -7.0115615900e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH2F2 = Substance {
    name = "CH2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.9264078000e+00, 1.0529097000e-02, 3.4659915000e-06, -9.6855999000e-09, 3.8165322000e-12, -5.5505395000e+04, 1.5476939200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.2983112000e+00, 6.7568012000e-03, -2.3401553000e-06, 3.5722381000e-10, -1.9789986000e-14, -5.6799215000e+04, -3.5285113100e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3 = Substance {
    name = "CH3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.6735904000e+00, 2.0109517500e-03, 5.7302185600e-06, -6.8711742500e-09, 2.5438573400e-12, 1.6444998800e+04, 1.6045643300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.9686603300e+00, 5.8071754600e-03, -1.9777853400e-06, 3.0727875200e-10, -1.7885389700e-14, 1.6538886900e+04, 4.7794450300e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3CL = Substance {
    name = "CH3CL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.0672445000e+00, 9.2091523000e-03, 3.0426054000e-06, -8.0342062000e-09, 3.2127443000e-12, -1.0896883000e+04, 1.3583951700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.2952986000e+00, 7.2846822000e-03, -2.4161191000e-06, 3.5205838000e-10, -1.8406185000e-14, -1.1793465000e+04, 8.5929652900e-01 })
    },
    elements = { ["C"] = 1, ["H"] = 3, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3F = Substance {
    name = "CH3F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.2651024000e+00, 6.0733855000e-03, 6.9825410000e-06, -8.1380911000e-09, 2.1036341000e-12, -2.9577664000e+04, 1.1843959400e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.6256523000e+00, 7.9683699000e-03, -2.6845319000e-06, 3.9841108000e-10, -2.1348639000e-14, -3.0372480000e+04, 3.0699034200e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 3, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH2OH = Substance {
    name = "CH2OH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.8638891800e+00, 5.5967230400e-03, 5.9327179100e-06, -1.0453201200e-08, 4.3696727800e-12, -2.5050136700e+03, 5.4730224300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.6762563900e+00, 6.5640601400e-03, -2.2652547100e-06, 3.5560248100e-10, -2.0862619000e-14, -2.8924857400e+03, 4.8773700500e-01 })
    },
    elements = { ["C"] = 1, ["H"] = 3, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3O = Substance {
    name = "CH3O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2652489400e+00, 3.3030011700e-03, 1.7049396400e-05, -2.2710447600e-08, 8.8075652000e-12, 3.3328148800e+02, 7.4256804000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.2667653800e+00, 7.8538011000e-03, -2.8373994300e-06, 4.5903965900e-10, -2.7442608400e-14, -3.4007322700e+02, 3.8563744700e-01 })
    },
    elements = { ["C"] = 1, ["H"] = 3, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH4 = Substance {
    name = "CH4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.1498761300e+00, -1.3670978800e-02, 4.9180059900e-05, -4.8474302600e-08, 1.6669395600e-11, -1.0246647600e+04, -4.6413037600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.6355264300e+00, 1.0084279500e-02, -3.3691625400e-06, 5.3495866700e-10, -3.1551883300e-14, -1.0005645500e+04, 9.9931332600e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3OH = Substance {
    name = "CH3OH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.7153958200e+00, -1.5230912900e-02, 6.5244115500e-05, -7.1080688900e-08, 2.6135269800e-11, -2.5642765600e+04, -1.5040982300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.6013448600e+00, 1.0243095400e-02, -3.5998551700e-06, 5.7250598600e-10, -3.3911764000e-14, -2.5997191000e+04, 4.7051225300e+00 })
    },
    elements = { ["C"] = 1, ["H"] = 4, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CN = Substance {
    name = "CN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.6129350200e+00, -9.5551327500e-04, 2.1442976500e-06, -3.1516327000e-10, -4.6430354600e-13, 5.1900795800e+04, 3.9804994700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.7481833300e+00, 3.9175327100e-05, 2.9970299600e-07, -6.9270453200e-11, 4.4613769100e-15, 5.1727841900e+04, 2.7746904400e+00 })
    },
    elements = { ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CN_plus = Substance {
    name = "CN+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 6.9280850500e+00, -2.8149217800e-02, 7.5851137600e-05, -7.2417433600e-08, 2.3389150300e-11, 2.1519550700e+05, -1.0173050000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 7.2900671300e+00, -2.4633113900e-03, 9.0359930800e-07, -1.3597058600e-10, 7.3370985900e-15, 2.1357908100e+05, -1.9134038600e+01 })
    },
    elements = { ["C"] = 1, ["N"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CN_minus = Substance {
    name = "CN-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.8196284600e+00, -2.4824731600e-03, 6.0456783800e-06, -4.5273319400e-09, 1.1567916700e-12, 6.8025633600e+03, 2.3890440300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.0905192800e+00, 1.3318175900e-03, -4.8490226600e-07, 7.9686522800e-11, -4.8277091600e-15, 6.8819566500e+03, 5.6312834300e+00 })
    },
    elements = { ["C"] = 1, ["N"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CNN = Substance {
    name = "CNN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.7824084900e+00, 1.2553311000e-02, -2.1308202600e-05, 1.9094163700e-08, -6.5924418700e-12, 7.4955165100e+04, 9.1063473600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.8665808400e+00, 2.3849961200e-03, -8.5257783200e-07, 1.3842385300e-10, -8.1842311600e-15, 7.4558692000e+04, -6.7758714600e-01 })
    },
    elements = { ["C"] = 1, ["N"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CO = Substance {
    name = "CO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.5795334700e+00, -6.1035368000e-04, 1.0168143300e-06, 9.0700588400e-10, -9.0442449900e-13, -1.4344086000e+04, 3.5084092800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.0484858300e+00, 1.3517281800e-03, -4.8579407500e-07, 7.8853648600e-11, -4.6980748900e-15, -1.4266117100e+04, 6.0170979000e+00 })
    },
    elements = { ["C"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CO_plus = Substance {
    name = "CO+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.7705710700e+00, -2.0177082000e-03, 4.6107619400e-06, -2.9917186600e-09, 6.0605776000e-13, 1.4900426700e+05, 3.3812572400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.9305940700e+00, 1.5603139100e-03, -6.1623896900e-07, 1.0995601900e-10, -6.6611130700e-15, 1.4914469200e+05, 7.3383792800e+00 })
    },
    elements = { ["C"] = 1, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_COCL = Substance {
    name = "COCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.2863792000e+00, 5.0868980000e-03, -5.0729411000e-06, 2.9647983000e-09, -7.7093453000e-13, -9.0125212000e+03, 6.2511867000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.4291236000e+00, 1.6121535000e-03, -6.6006280000e-07, 1.2127114000e-10, -8.2858601000e-15, -9.3305007000e+03, 3.8287405600e-01 })
    },
    elements = { ["C"] = 1, ["O"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_COCLF = Substance {
    name = "COCLF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.7066661000e+00, 2.2722565000e-02, -3.0115639000e-05, 2.0483566000e-08, -5.6572228000e-12, -5.2619902000e+04, 1.7987625700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.0881081000e+00, 3.1816479000e-03, -1.3763316000e-06, 2.6544005000e-10, -1.8928969000e-14, -5.3883781000e+04, -8.6849935500e+00 })
    },
    elements = { ["C"] = 1, ["O"] = 1, ["Cl"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_COCL2 = Substance {
    name = "COCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.7078791000e+00, 2.8936946400e-02, -4.9328911600e-05, 4.1691013900e-08, -1.3705739100e-11, -2.7835093200e+04, 1.7620211400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 7.8601837800e+00, 2.1327150000e-03, -8.2207715800e-07, 1.3895113300e-10, -8.5840665300e-15, -2.9105642300e+04, -1.1901190700e+01 })
    },
    elements = { ["C"] = 1, ["O"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_COF = Substance {
    name = "COF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2019727000e+00, 5.5837770000e-03, -1.4905481000e-06, -2.3126069000e-09, 1.3614353000e-12, -2.1817043000e+04, 1.0060739200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.8908214000e+00, 2.2179703000e-03, -9.2550725000e-07, 1.7270120000e-10, -1.1955343000e-14, -2.2357984000e+04, 9.9278406100e-01 })
    },
    elements = { ["C"] = 1, ["O"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_COF2 = Substance {
    name = "COF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.1297948900e+00, 1.4101972300e-02, -5.9438135900e-06, -5.3054479000e-09, 3.9736746900e-12, -7.8174533900e+04, 1.5110909200e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.8163173000e+00, 3.1647328200e-03, -1.2177626900e-06, 2.0558226100e-10, -1.2689312500e-14, -7.9548271600e+04, -9.5286457400e+00 })
    },
    elements = { ["C"] = 1, ["O"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_COS = Substance {
    name = "COS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4625321000e+00, 1.1947992000e-02, -1.3794370000e-05, 8.0707736000e-09, -1.8327653000e-12, -1.7803987000e+04, 1.0805868800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.2392000000e+00, 2.4100584000e-03, -9.6064522000e-07, 1.7778347000e-10, -1.2235704000e-14, -1.8480455000e+04, -3.0777388900e+00 })
    },
    elements = { ["C"] = 1, ["O"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CO2 = Substance {
    name = "CO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.3567735200e+00, 8.9845967700e-03, -7.1235626900e-06, 2.4591902200e-09, -1.4369954800e-13, -4.8371969700e+04, 9.9010522200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.6365949300e+00, 2.7413199100e-03, -9.9582853100e-07, 1.6037301100e-10, -9.1610346800e-15, -4.9024934100e+04, -1.9353485500e+00 })
    },
    elements = { ["C"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CO2_plus = Substance {
    name = "CO2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.3930565300e+00, 5.8230041500e-03, 4.3801207500e-08, -4.6823627100e-09, 2.3155282500e-12, 1.1235615100e+05, 6.3903855300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.6129251300e+00, 1.8982999400e-03, -7.3459638300e-07, 1.2397566500e-10, -7.5769228800e-15, 1.1162113600e+05, -5.6513569800e+00 })
    },
    elements = { ["C"] = 1, ["O"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_COOH = Substance {
    name = "COOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.9220791500e+00, 7.6245382000e-03, 3.2988468300e-06, -1.0713524900e-08, 5.1158730900e-12, -2.6838358800e+04, 1.1292598900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 5.3920624700e+00, 4.1122130500e-03, -1.4819481700e-06, 2.3987527800e-10, -1.4390296500e-14, -2.7670878600e+04, -2.2352863100e+00 })
    },
    elements = { ["C"] = 1, ["O"] = 2, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CP = Substance {
    name = "CP",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7029140000e+00, -2.9402633000e-03, 1.2526378300e-05, -1.4594828700e-08, 5.6195532000e-12, 6.1502933200e+04, 5.3497146700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.1698606100e+00, -3.3389315400e-04, 6.3051009500e-07, -1.6524891600e-10, 1.2524854200e-14, 6.1212101600e+04, 2.0576228800e+00 })
    },
    elements = { ["C"] = 1, ["P"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CS = Substance {
    name = "CS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4039344000e+00, -6.5773308000e-04, 6.1712157000e-06, -7.3689604000e-09, 2.7346738000e-12, 3.2689393000e+04, 5.9110672900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.6826012000e+00, 9.0473203000e-04, -3.6436374000e-07, 6.3854294000e-11, -3.6933982000e-15, 3.2497490000e+04, 3.8984167900e+00 })
    },
    elements = { ["C"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CS2 = Substance {
    name = "CS2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8326013000e+00, 1.3290791000e-02, -1.8144694000e-05, 1.2831681000e-08, -3.6800609000e-12, 1.2766782000e+04, 9.2221941100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.9252610000e+00, 1.8252996000e-03, -7.5585380000e-07, 1.4605073000e-10, -1.0438595000e-14, 1.2048071000e+04, -6.0589322900e+00 })
    },
    elements = { ["C"] = 1, ["S"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2 = Substance {
    name = "C2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -1.9625864100e+00, 5.7681531000e-02, -1.5803773500e-04, 1.7246063600e-07, -6.5790528600e-11, 9.8988331700e+04, 2.3319841800e+01 }),
        Range(1000.0, 6000.0, NASA7 { 4.1248731400e+00, 1.0834661800e-04, 1.5725089000e-07, -4.2404210200e-11, 3.2505571400e-15, 9.8922806600e+04, 7.9742101500e-01 })
    },
    elements = { ["C"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2_plus = Substance {
    name = "C2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.7443846600e+00, -2.7506080400e-03, 9.4169798600e-06, -9.5447204900e-09, 3.4874345800e-12, 2.4005757300e+05, 3.7016886400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.4743623500e+00, 3.9085841500e-03, -1.1536271200e-06, 1.2852279000e-10, -4.3716093900e-15, 2.4080158500e+05, 1.5657095600e+01 })
    },
    elements = { ["C"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2_minus = Substance {
    name = "C2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.8203823000e+00, -2.8816240800e-03, 8.2192304400e-06, -7.3225486300e-09, 2.4140592900e-12, 5.6752396800e+04, 2.4318123800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.9414776600e+00, 3.3455432800e-03, -1.2140131700e-06, 1.8683632600e-10, -1.0344769900e-14, 5.7269666900e+04, 1.2003253000e+01 })
    },
    elements = { ["C"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2CL2 = Substance {
    name = "C2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.0229482000e+00, 1.4082667000e-02, -1.8095669000e-05, 1.1610348000e-08, -2.8817478000e-12, 2.3227482000e+04, 6.0999520600e-01 }),
        Range(1000.0, 5000.0, NASA7 { 8.1728547000e+00, 2.3659892000e-03, -9.6552505000e-07, 1.7736148000e-10, -1.2135203000e-14, 2.2510190000e+04, -1.4903590500e+01 })
    },
    elements = { ["C"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2CL4 = Substance {
    name = "C2CL4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.1434792000e+00, 3.7422372000e-02, -5.4369793000e-05, 3.9112863000e-08, -1.1176384000e-11, -3.9492629000e+03, 8.3445593400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.2935937000e+01, 3.4309200000e-03, -1.5067194000e-06, 2.9346993000e-10, -2.1070896000e-14, -5.8932337000e+03, -3.4680702900e+01 })
    },
    elements = { ["C"] = 2, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2CL6 = Substance {
    name = "C2CL6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.6383531000e+00, 6.3365561000e-02, -1.0080030000e-04, 7.6636922000e-08, -2.2646550000e-11, -2.0156513000e+04, 6.4747955900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.9034286000e+01, 3.3956821000e-03, -1.5115289000e-06, 2.9700315000e-10, -2.1453827000e-14, -2.3103803000e+04, -6.2852928400e+01 })
    },
    elements = { ["C"] = 2, ["Cl"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2F2 = Substance {
    name = "C2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5345837000e+00, 1.4445845000e-02, -1.2189692000e-05, 3.6042985000e-09, 1.9118951000e-13, 9.2133562000e+02, 5.4194651100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.5164581000e+00, 3.1686462000e-03, -1.3311385000e-06, 2.4960049000e-10, -1.7342072000e-14, -1.6107655000e+02, -1.5068062200e+01 })
    },
    elements = { ["C"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2F4 = Substance {
    name = "C2F4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6166183000e+00, 2.6488618000e-02, -2.2433266000e-05, 6.2286445000e-09, 6.2149244000e-13, -8.1277242000e+04, 8.5237640700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.1086468000e+01, 5.2788429000e-03, -2.2354400000e-06, 4.2166846000e-10, -2.9433914000e-14, -8.3292884000e+04, -2.9866881000e+01 })
    },
    elements = { ["C"] = 2, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H = Substance {
    name = "C2H",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.8896573300e+00, 1.3409961100e-02, -2.8476950100e-05, 2.9479104500e-08, -1.0933151100e-11, 6.6839393200e+04, 6.2229643800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.3611839500e+00, 4.3898972400e-03, -1.6277221800e-06, 2.6055666300e-10, -1.5293930500e-14, 6.7049221400e+04, 5.5712754200e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2HCL = Substance {
    name = "C2HCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.8047158000e+00, 2.5837871000e-02, -4.3149954000e-05, 3.5883579000e-08, -1.1447992000e-11, 2.4230207000e+04, 1.2737754600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.3210457000e+00, 3.8459737000e-03, -1.4864606000e-06, 2.6561379000e-10, -1.7952466000e-14, 2.3440478000e+04, -8.2846508600e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2HF = Substance {
    name = "C2HF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6901770000e+00, 1.7680853000e-02, -2.2749855000e-05, 1.4920568000e-08, -3.7381925000e-12, 1.3683223000e+04, 8.1469718700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.0949501000e+00, 3.9432428000e-03, -1.4711438000e-06, 2.5294641000e-10, -1.6446663000e-14, 1.2976907000e+04, -8.3153429300e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CHCO_ketyl = Substance {
    name = "CHCO,ketyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.7659397100e+00, 1.4174120200e-02, -2.3260098600e-05, 2.1572808900e-08, -7.5850930800e-12, 1.8085632400e+04, 1.0540859100e+01 }),
        Range(1000.0, 6000.0, NASA7 { 4.2603811000e+00, 4.8274050000e-03, -1.6661884400e-06, 2.6140520400e-10, -1.5325796300e-14, 1.7880476000e+04, 3.9787432000e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H2_acetylene = Substance {
    name = "C2H2,acetylene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 8.0868109400e-01, 2.3361562900e-02, -3.5517181500e-05, 2.8015243700e-08, -8.5007297400e-12, 2.6428980700e+04, 1.3939705100e+01 }),
        Range(1000.0, 6000.0, NASA7 { 4.6587850400e+00, 4.8839654700e-03, -1.6082877500e-06, 2.4697422600e-10, -1.3860568000e-14, 2.5759404400e+04, -3.9983477200e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H2_vinylidene = Substance {
    name = "C2H2,vinylidene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2815493300e+00, 6.9764274000e-03, -2.3852828300e-06, -1.2107704500e-09, 9.8203857900e-13, 4.8621794300e+04, 5.9203916900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.2780713900e+00, 4.7562288300e-03, -1.6300751300e-06, 2.5462298100e-10, -1.4886032600e-14, 4.8316672200e+04, 6.4002260000e-01 })
    },
    elements = { ["C"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH2CO_ketene = Substance {
    name = "CH2CO,ketene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.1358363000e+00, 1.8118872100e-02, -1.7394747400e-05, 9.3439756800e-09, -2.0145761500e-12, -7.0429180400e+03, 1.2215648000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 5.7579330700e+00, 6.3491141300e-03, -2.2581483500e-06, 3.6202673300e-10, -2.1565120400e-14, -7.9787838400e+03, -6.1077215000e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H3_vinyl = Substance {
    name = "C2H3,vinyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2124664500e+00, 1.5147916200e-03, 2.5920941200e-05, -3.5765784700e-08, 1.4715087300e-11, 3.4859846800e+04, 8.5105402500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.3510505500e+00, 7.4933009100e-03, -2.6431458600e-06, 4.2128590600e-10, -2.4989611900e-14, 3.4154618100e+04, 5.7167652900e-01 })
    },
    elements = { ["C"] = 2, ["H"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3CN = Substance {
    name = "CH3CN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.8248422100e+00, 4.1010035900e-03, 2.1454567900e-05, -2.8723454300e-08, 1.1180414600e-11, 6.2883852200e+03, 5.5402421100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.0857697400e+00, 9.7079704000e-03, -3.4848494600e-06, 5.6210676000e-10, -3.3623467000e-14, 5.4585307400e+03, -3.2655390300e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 3, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3CO_acetyl = Substance {
    name = "CH3CO,acetyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1252785000e+00, 9.7782202000e-03, 4.5214483000e-06, -9.0094616000e-09, 3.1937179000e-12, -4.1085078000e+03, 1.1242021200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.6122789000e+00, 8.4498860000e-03, -2.8541472000e-06, 4.2383763000e-10, -2.2684037000e-14, -5.1878633000e+03, -3.2617819300e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 3, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H4 = Substance {
    name = "C2H4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.9592014800e+00, -7.5705224700e-03, 5.7099029200e-05, -6.9158875300e-08, 2.6988437300e-11, 5.0897759300e+03, 4.0973309600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.9918276100e+00, 1.0483391000e-02, -3.7172138500e-06, 5.9462851400e-10, -3.5363052600e-14, 4.2686581900e+03, -2.6905215100e-01 })
    },
    elements = { ["C"] = 2, ["H"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H4O_ethylen = Substance {
    name = "C2H4O,ethylen",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7590493100e+00, -9.4411929200e-03, 8.0309677000e-05, -1.0080775600e-07, 4.0039835700e-11, -7.5608140200e+03, 7.8497703000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.4888842900e+00, 1.2046023100e-02, -4.3336154500e-06, 7.0026900000e-10, -4.1948187000e-14, -9.1804757600e+03, -7.0806386800e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 4, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3CHO_ethanal = Substance {
    name = "CH3CHO,ethanal",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.7294762700e+00, -3.1934316100e-03, 4.7535350500e-05, -5.7459047400e-08, 2.1931261900e-11, -2.1572879900e+04, 4.1029545500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.4041789900e+00, 1.1722967500e-02, -4.2262683000e-06, 6.8371573300e-10, -4.0984267600e-14, -2.2593150800e+04, -3.4811759300e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 4, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3COOH = Substance {
    name = "CH3COOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.7893684400e+00, 1.0000101600e-02, 3.4255797800e-05, -5.0901791900e-08, 2.0621750400e-11, -5.3475229200e+04, 1.4105950400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 7.6708367800e+00, 1.3515269500e-02, -5.2587468800e-06, 8.9318506200e-10, -5.5318089100e-14, -5.5756097100e+04, -1.5467659000e+01 })
    },
    elements = { ["C"] = 2, ["H"] = 4, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s__HCOOH_2 = Substance {
    name = "(HCOOH)2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7692385000e+00, 2.7224716000e-02, 1.7238053000e-06, -2.0776724000e-08, 9.9379949000e-12, -1.0104988000e+05, 1.0505496600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2207371000e+01, 1.3688851000e-02, -4.6840369000e-06, 7.0511663000e-10, -3.8369285000e-14, -1.0395938000e+05, -3.5709805400e+01 })
    },
    elements = { ["C"] = 2, ["H"] = 4, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H5 = Substance {
    name = "C2H5",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.3064656800e+00, -4.1865889200e-03, 4.9714280700e-05, -5.9912660600e-08, 2.3050900400e-11, 1.2841626500e+04, 4.7072092400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.2880053500e+00, 1.2433737400e-02, -4.4138382900e-06, 7.0652694300e-10, -4.2034185600e-14, 1.2056420000e+04, 8.4529962300e-01 })
    },
    elements = { ["C"] = 2, ["H"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H6 = Substance {
    name = "C2H6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.2914249200e+00, -5.5015427000e-03, 5.9943828800e-05, -7.0846628500e-08, 2.6868577100e-11, -1.1522205500e+04, 2.6668231600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.0466667400e+00, 1.5353876600e-02, -5.4703932100e-06, 8.7782622800e-10, -5.2316730500e-14, -1.2447351200e+04, -9.6868360700e-01 })
    },
    elements = { ["C"] = 2, ["H"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3N2CH3 = Substance {
    name = "CH3N2CH3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 6.2961363200e+00, -2.2581542700e-03, 6.2123280300e-05, -7.4629299700e-08, 2.8037194700e-11, 1.5692885000e+04, -2.4992591500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 7.4495485100e+00, 1.7440615300e-02, -6.2738245300e-06, 1.0135117800e-09, -6.0693749400e-14, 1.4197997800e+04, -1.4156763800e+01 })
    },
    elements = { ["C"] = 2, ["H"] = 6, ["N"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3OCH3 = Substance {
    name = "CH3OCH3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.3056227900e+00, -2.1425427200e-03, 5.3087324400e-05, -6.2314713600e-08, 2.3073103600e-11, -2.3986629500e+04, 7.1326420900e-01 }),
        Range(1000.0, 6000.0, NASA7 { 5.6484418300e+00, 1.6338189900e-02, -5.8680236700e-06, 9.4683686900e-10, -5.6650473800e-14, -2.5107469000e+04, -5.9626493900e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 6, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2H5OH = Substance {
    name = "C2H5OH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.8586817800e+00, -3.7400674000e-03, 6.9555026700e-05, -8.8654114700e-08, 3.5168443000e-11, -2.9996130900e+04, 4.8019229400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.5628977000e+00, 1.5203426400e-02, -5.3892224700e-06, 8.6215022400e-10, -5.1282468300e-14, -3.1525798400e+04, -9.4755764400e+00 })
    },
    elements = { ["C"] = 2, ["H"] = 6, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CCN = Substance {
    name = "CCN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.6760072400e+00, 7.8884234800e-03, -9.5532663900e-06, 7.3134408800e-09, -2.4803520200e-12, 9.5419553500e+04, 5.8165195000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.5359494000e+00, 1.9333618100e-03, -7.4300799300e-07, 1.2565416700e-10, -7.7042003500e-15, 9.4902806500e+04, -3.7038063700e+00 })
    },
    elements = { ["C"] = 2, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CNC = Substance {
    name = "CNC",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.9895887100e+00, 5.2197783200e-03, -5.8108370600e-07, -3.3941652000e-09, 1.7627308400e-12, 8.0965635700e+04, 3.8872192600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.9325969600e+00, 1.5791475400e-03, -6.1233353200e-07, 1.0386961000e-10, -6.4316189700e-15, 8.0332683300e+04, -6.6020715700e+00 })
    },
    elements = { ["C"] = 2, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2N2 = Substance {
    name = "C2N2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.3292532500e+00, 2.6153784700e-02, -4.9000399400e-05, 4.6191747800e-08, -1.6432385500e-11, 3.5668442400e+04, 9.8633622700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.7054476900e+00, 3.6426033900e-03, -1.3093425000e-06, 2.1641106100e-10, -1.3118741000e-14, 3.4860800500e+04, -1.0480369500e+01 })
    },
    elements = { ["C"] = 2, ["N"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C2O = Substance {
    name = "C2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.8634542200e+00, 1.1973296900e-02, -1.8123250100e-05, 1.5381363400e-08, -5.2890652400e-12, 3.3750094500e+04, 8.8940588100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.5157644400e+00, 1.8774570400e-03, -7.0115975700e-07, 1.2150529100e-10, -7.7677885500e-15, 3.3097045800e+04, -4.2763613800e+00 })
    },
    elements = { ["C"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3 = Substance {
    name = "C3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.4328396300e+00, -4.4675438300e-03, 1.4932148200e-05, -1.4795313800e-08, 5.0142111200e-12, 9.9495722200e+04, -1.5872071500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.8035776800e+00, 2.1451123300e-03, -1.0729207400e-06, 2.6073525900e-10, -2.0163196000e-14, 9.9396541600e+04, 3.8936930800e-01 })
    },
    elements = { ["C"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H3_propargyl = Substance {
    name = "C3H3,propargyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.8284076600e+00, 2.3783903600e-02, -2.1922817600e-05, 1.0006744400e-08, -1.3898464400e-12, 4.0186305800e+04, 1.3844795700e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.6417582100e+00, 8.0858742800e-03, -2.8478788700e-06, 4.5352597700e-10, -2.6887981500e-14, 3.8979369900e+04, -1.0400425500e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H4_allene = Substance {
    name = "C3H4,allene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.6130748700e+00, 1.2122337100e-02, 1.8540540000e-05, -3.4525847500e-08, 1.5335338900e-11, 2.1541564200e+04, 1.0250331900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.3169486900e+00, 1.1133626200e-02, -3.9628901800e-06, 6.3563377500e-10, -3.7874988500e-14, 2.0117461700e+04, -1.0971886200e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H4_propyne = Substance {
    name = "C3H4,propyne",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.6804076000e+00, 1.5799442900e-02, 2.5077573700e-06, -1.3658458400e-08, 6.6157660700e-12, 2.0691639200e+04, 9.8925104700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.0253109200e+00, 1.1336442700e-02, -4.0222904800e-06, 6.4375136500e-10, -3.8299008200e-14, 1.9510179200e+04, -8.5891259200e+00 })
    },
    elements = { ["C"] = 3, ["H"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H4_cyclo_minus = Substance {
    name = "C3H4,cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.2466655300e+00, 5.7623808400e-03, 4.4208030500e-05, -6.6290678600e-08, 2.8182473000e-11, 3.2128438900e+04, 1.3345183700e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.2807873000e+00, 1.1239381900e-02, -4.0195752600e-06, 6.4692064800e-10, -3.8643324800e-14, 3.0341508600e+04, -1.1141994500e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H5_allyl = Substance {
    name = "C3H5,allyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7879469300e+00, 9.4841433500e-03, 2.4234336800e-05, -3.6560401000e-08, 1.4859235600e-11, 1.8626121800e+04, 7.8282249900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.5476113200e+00, 1.3315224600e-02, -4.7833310000e-06, 7.7194981400e-10, -4.6193080800e-14, 1.7271470700e+04, -9.2748684100e+00 })
    },
    elements = { ["C"] = 3, ["H"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H6_propylene = Substance {
    name = "C3H6,propylene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.8346452400e+00, 3.2907840500e-03, 5.0522818400e-05, -6.6625141800e-08, 2.6370758500e-11, 7.5383829500e+02, 7.5341099500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.0387049900e+00, 1.6296389500e-02, -5.8213062400e-06, 9.3593648300e-10, -5.5860290300e-14, -7.7659509200e+02, -8.4382432200e+00 })
    },
    elements = { ["C"] = 3, ["H"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H6_cyclo_minus = Substance {
    name = "C3H6,cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.8327855500e+00, -5.2102746200e-03, 9.2958283700e-05, -1.2275314600e-07, 4.9919115400e-11, 5.1952005700e+03, 1.0830670000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.2166329300e+00, 1.6539361400e-02, -5.9007596100e-06, 9.4809547300e-10, -5.6566173700e-14, 2.9593755500e+03, -1.3604060700e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H6O = Substance {
    name = "C3H6O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.5685105100e+00, 5.0271729200e-03, 6.4231560700e-05, -8.9022954800e-08, 3.6242376600e-11, -1.2967920500e+04, 9.8883822900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 7.9455571000e+00, 1.7406167800e-02, -6.2543646300e-06, 1.0097545700e-09, -6.0448895300e-14, -1.5286768300e+04, -1.8418413300e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 6, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H7_n_minuspropyl = Substance {
    name = "C3H7,n-propyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.0323999600e+00, 3.4272831200e-03, 6.1434442000e-05, -8.3764633800e-08, 3.4085777600e-11, 1.0339383900e+04, 8.7742807900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.9646846200e+00, 1.7545194600e-02, -6.2337005500e-06, 9.9852973500e-10, -5.9439479300e-14, 8.5424435800e+03, -1.1483147800e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 7 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H7_i_minuspropyl = Substance {
    name = "C3H7,i-propyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.4087287200e+00, -8.5522182500e-03, 8.4217849100e-05, -1.0094268300e-07, 3.8691447900e-11, 9.4260095600e+03, 3.6232250400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.7512588200e+00, 1.8760576200e-02, -6.7019197600e-06, 1.0775187100e-09, -6.4309088500e-14, 7.9797729300e+03, -4.9135935500e+00 })
    },
    elements = { ["C"] = 3, ["H"] = 7 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H8 = Substance {
    name = "C3H8",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.2110262000e+00, 1.7159980300e-03, 7.0618347200e-05, -9.1959411600e-08, 3.6442137200e-11, -1.4381210600e+04, 5.6093049100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.6678936300e+00, 2.0612021400e-02, -7.3655302700e-06, 1.1844076100e-09, -7.0695321000e-14, -1.6274852100e+04, -1.3185950300e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H8O_1propanol = Substance {
    name = "C3H8O,1propanol",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.2779942000e+00, 8.0866054600e-04, 8.2154817900e-05, -1.0848818500e-07, 4.3488689700e-11, -3.2834877400e+04, 5.7052683500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 8.7101092900e+00, 2.0805147300e-02, -7.3848089800e-06, 1.1818897700e-09, -7.0359778300e-14, -3.5124402400e+04, -1.8896545300e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 8, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3H8O_2propanol = Substance {
    name = "C3H8O,2propanol",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.3080302700e+00, 1.0249801000e-02, 6.1985780500e-05, -9.0331108800e-08, 3.7406537200e-11, -3.4924884300e+04, 7.5582625400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 9.6427111300e+00, 2.0022441300e-02, -7.1194836400e-06, 1.1413635500e-09, -6.7992166700e-14, -3.7484009500e+04, -2.5634607400e+01 })
    },
    elements = { ["C"] = 3, ["H"] = 8, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C3O2 = Substance {
    name = "C3O2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.1966821100e+00, 3.1455313800e-02, -5.0745862300e-05, 4.3579439800e-08, -1.4735178700e-11, -1.2946098000e+04, 1.3298526400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 8.4617592000e+00, 4.8155282500e-03, -1.8093075900e-06, 3.0078708000e-10, -1.8372216200e-14, -1.4327165400e+04, -1.7060568800e+01 })
    },
    elements = { ["C"] = 3, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4 = Substance {
    name = "C4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.3227348200e+00, 2.0259645300e-02, -3.7346607100e-05, 3.5687825500e-08, -1.2772738200e-11, 1.2272363800e+05, 6.8099482900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.6309149400e+00, 4.8311639700e-03, -1.5040564200e-06, 2.0287235700e-10, -1.0034568700e-14, 1.2250087900e+05, -2.9895473100e+00 })
    },
    elements = { ["C"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H2 = Substance {
    name = "C4H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -4.0713239300e-01, 5.2077514300e-02, -9.2113834000e-05, 8.0865740300e-08, -2.7042208000e-11, 5.2595736700e+04, 2.0324022300e+01 }),
        Range(1000.0, 6000.0, NASA7 { 8.6670489500e+00, 6.7150519100e-03, -2.3535506000e-06, 3.7363536600e-10, -2.2105404300e-14, 5.1001697800e+04, -2.1800205000e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H4_1_3_minuscyclo_minus = Substance {
    name = "C4H4,1,3-cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.2789531800e+00, 1.3420335000e-02, 4.1199206300e-05, -6.9895672700e-08, 3.0725212000e-11, 4.5086409700e+04, 1.7678778800e+01 }),
        Range(1000.0, 6000.0, NASA7 { 8.0420775100e+00, 1.2520217400e-02, -4.5233704700e-06, 7.3312044300e-10, -4.4011086400e-14, 4.2510849400e+04, -2.1128448300e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H6_butadiene = Substance {
    name = "C4H6,butadiene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.6853042400e+00, 1.9612001200e-02, 4.4652357100e-05, -8.3152311400e-08, 3.8065122600e-11, 1.1607570900e+04, 1.6754596700e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.6001013900e+01, 3.9182511500e-03, 1.1435573300e-06, -2.0792574800e-10, 7.5771355100e-15, 6.5170822100e+03, -6.2820414500e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H6_2_minusbutyne = Substance {
    name = "C4H6,2-butyne",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.4248169900e+00, 2.6538000400e-03, 5.3044328100e-05, -6.7139209500e-08, 2.5819008100e-11, 1.5464121600e+04, 5.4096740900e-01 }),
        Range(1000.0, 6000.0, NASA7 { 6.9323209000e+00, 1.8642587300e-02, -6.8235910400e-06, 1.1191048500e-09, -6.7678311300e-14, 1.4030955800e+04, -1.2208428300e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H6_cyclo_minus = Substance {
    name = "C4H6,cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.9163343300e+00, -3.2058481000e-03, 1.0026357100e-04, -1.3424816700e-07, 5.4667010000e-11, 1.7473223600e+04, 1.2481718300e+01 }),
        Range(1000.0, 6000.0, NASA7 { 7.8485825300e+00, 1.8081289200e-02, -6.5318664400e-06, 1.0584212300e-09, -6.3525393900e-14, 1.4615346100e+04, -2.0898025700e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H8_1_minusbutene = Substance {
    name = "C4H8,1-butene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.4267407300e+00, 6.6394624900e-03, 6.8065281500e-05, -9.2875356200e-08, 3.7347394900e-11, -2.1153279600e+03, 7.5469486000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 8.0214799100e+00, 2.2601070700e-02, -8.3128403300e-06, 1.3780307200e-09, -8.4217545900e-14, -4.3085215300e+03, -1.7117069700e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H8_cis2_minusbuten = Substance {
    name = "C4H8,cis2-buten",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.4441781700e+00, -5.2045169400e-03, 9.6290657700e-05, -1.2006881400e-07, 4.6819482500e-11, -2.9174147200e+03, 3.4605073300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 7.0833502500e+00, 2.3498243000e-02, -8.6448307900e-06, 1.4316010700e-09, -8.7376264200e-14, -4.9232026600e+03, -1.2870931700e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H8_tr2_minusbutene = Substance {
    name = "C4H8,tr2-butene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.5727896700e+00, 3.7654101700e-03, 6.5222670800e-05, -8.3090952200e-08, 3.2031134200e-11, -3.5790330100e+03, 5.3779670800e-01 }),
        Range(1000.0, 6000.0, NASA7 { 7.6251467000e+00, 2.3045104200e-02, -8.4942486400e-06, 1.4115255400e-09, -8.6475175700e-14, -5.4010281500e+03, -1.6198708000e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H8_isobutene = Substance {
    name = "C4H8,isobutene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.6804972700e+00, 1.6941444500e-02, 3.5196355500e-05, -5.4316685600e-08, 2.2020163600e-11, -4.1209930800e+03, 8.1145714900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 7.8355533000e+00, 2.2745967900e-02, -8.3651754900e-06, 1.3907625000e-09, -8.5332996900e-14, -6.1635632200e+03, -1.7654071900e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H8_cyclo_minus = Substance {
    name = "C4H8,cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.8114472000e+00, -9.6804999800e-03, 1.2791769400e-04, -1.6305712500e-07, 6.4831479000e-11, 1.8710793000e+03, 8.6099819600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 7.7633105400e+00, 2.3065335000e-02, -8.2598375800e-06, 1.3341238900e-09, -7.9936330200e-14, -1.1767200800e+03, -2.1914821100e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s__CH3COOH_2 = Substance {
    name = "(CH3COOH)2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 7.7548174300e+00, 1.3891889700e-02, 8.3295560900e-05, -1.2002185500e-07, 4.9067964500e-11, -1.1518566900e+05, -1.2244681400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.5824520800e+01, 2.6183511700e-02, -9.4609835800e-06, 1.5333761600e-09, -9.2047654500e-14, -1.1903914100e+05, -5.1109761700e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 8, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H9_n_minusbutyl = Substance {
    name = "C4H9,n-butyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.8243054000e+00, 5.5030908000e-03, 7.4930033000e-05, -1.0208594300e-07, 4.1348471400e-11, 5.5407804900e+03, 2.1760950900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 9.1897561500e+00, 2.3632226700e-02, -8.6427098500e-06, 1.4277051500e-09, -8.7020371600e-14, 3.3770290900e+03, -2.1560056000e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 9 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H9_i_minusbutyl = Substance {
    name = "C4H9,i-butyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.5488523500e+00, 1.7874763800e-02, 5.0078282500e-05, -7.9447507100e-08, 3.3580235400e-11, 4.7401158800e+03, 1.1184938200e+01 }),
        Range(1000.0, 6000.0, NASA7 { 9.4304060700e+00, 2.3427134900e-02, -8.5359918200e-06, 1.3974835500e-09, -8.4405745600e-14, 2.1421486200e+03, -2.4220799400e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 9 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H9_s_minusbutyl = Substance {
    name = "C4H9,s-butyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.0393060700e+00, 4.0938710000e-04, 9.1557411200e-05, -1.1941171300e-07, 4.7504398700e-11, 6.4232723600e+03, 8.2436044400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 8.4261193900e+00, 2.3937926500e-02, -8.5603578300e-06, 1.3773516000e-09, -8.2249600500e-14, 3.9648425300e+03, -1.6987687500e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 9 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H9_t_minusbutyl = Substance {
    name = "C4H9,t-butyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 6.8732713300e+00, -1.8514630600e-02, 1.3056011600e-04, -1.5083275500e-07, 5.6535828200e-11, 4.1095893800e+03, 2.3001660400e-01 }),
        Range(1000.0, 6000.0, NASA7 { 6.6307465600e+00, 2.5935374500e-02, -9.3716311100e-06, 1.5184589000e-09, -9.1119086300e-14, 2.0086132300e+03, -9.2058144000e+00 })
    },
    elements = { ["C"] = 4, ["H"] = 9 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H10_isobutane = Substance {
    name = "C4H10,isobutane",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.4547927600e+00, 8.2605798500e-03, 8.2988666400e-05, -1.1464764200e-07, 4.6457010100e-11, -1.8459393100e+04, 4.9274317500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 9.7699124500e+00, 2.5499721000e-02, -9.1414293200e-06, 1.4732827100e-09, -8.8080018800e-14, -2.1405264700e+04, -3.0032910100e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4H10_n_minusbutane = Substance {
    name = "C4H10,n-butane",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 6.1474680600e+00, 1.5594738900e-04, 9.6791351700e-05, -1.2548391000e-07, 4.9781655500e-11, -1.7599440200e+04, -1.0940987900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 9.4453583400e+00, 2.5785807300e-02, -9.2361912200e-06, 1.4863275500e-09, -8.8789715800e-14, -2.0138216500e+04, -2.6347007600e+01 })
    },
    elements = { ["C"] = 4, ["H"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C4N2 = Substance {
    name = "C4N2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.2811684500e+00, 4.6127351300e-02, -8.5329324300e-05, 7.9340777900e-08, -2.8035639900e-11, 6.2040101300e+04, 1.1289817400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.0485480000e+01, 5.6954488900e-03, -2.1274554700e-06, 3.5232319600e-10, -2.1463172900e-14, 6.0462063000e+04, -2.7226650200e+01 })
    },
    elements = { ["C"] = 4, ["N"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5 = Substance {
    name = "C5",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.3587302300e+00, 3.2435087500e-02, -5.9305847000e-05, 5.6011486400e-08, -2.0307517600e-11, 1.2437624200e+05, 6.0491584800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 9.5745688800e+00, 3.8601679800e-03, -1.4755801400e-06, 2.4804883300e-10, -1.5266025300e-14, 1.2305351700e+05, -2.3713798000e+01 })
    },
    elements = { ["C"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5H6_1_3cyclo_minus = Substance {
    name = "C5H6,1,3cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 8.6104403200e-01, 1.4804587000e-02, 7.2107208400e-05, -1.1337839800e-07, 4.8689048200e-11, 1.4801754800e+04, 2.1353625900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 9.9758274500e+00, 1.8905523300e-02, -6.8411030000e-06, 1.1099211700e-09, -6.6679142700e-14, 1.1081672700e+04, -3.2209689200e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5H8_cyclo_minus = Substance {
    name = "C5H8,cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.6898051400e+00, 2.0963553300e-03, 1.1303445900e-04, -1.5407758100e-07, 6.2762356400e-11, 2.4582706700e+03, 1.5307504000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 9.6428242300e+00, 2.4256283400e-02, -8.7208950300e-06, 1.4119086800e-09, -8.4726784800e-14, -1.2925503200e+03, -3.0122560600e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5H10_1_minuspentene = Substance {
    name = "C5H10,1-pentene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.8835645600e+00, 5.1040126700e-03, 9.7828215600e-05, -1.3238922700e-07, 5.3223150700e-11, -5.1682306800e+03, 3.4198703100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.1739705500e+01, 2.5746707100e-02, -9.2598870100e-06, 1.5149788500e-09, -9.1788393900e-14, -8.4627483900e+03, -3.5437561900e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5H10_cyclo_minus = Substance {
    name = "C5H10,cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7032795500e+00, -1.1556535400e-02, 1.6411143900e-04, -2.0936813400e-07, 8.3105450700e-11, -1.1095178600e+04, 1.1977776100e+01 }),
        Range(1000.0, 6000.0, NASA7 { 9.1329579000e+00, 3.0113043000e-02, -1.0916913700e-05, 1.7729876700e-09, -1.0657524800e-13, -1.5159737200e+04, -2.9261882800e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5H11_pentyl = Substance {
    name = "C5H11,pentyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 7.1740143200e+00, 3.8092158800e-03, 1.0437906500e-04, -1.3963405000e-07, 5.6039511700e-11, 2.5287090200e+03, -1.1886863000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.1298513500e+01, 2.9731421500e-02, -1.0977271400e-05, 1.8270889500e-09, -1.1199602600e-13, -2.3976416700e+02, -3.1039591000e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 11 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5H11_t_minuspentyl = Substance {
    name = "C5H11,t-pentyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 6.4462253300e+00, -9.5417776300e-03, 1.3789136200e-04, -1.6924163100e-07, 6.5309712700e-11, 1.5083750600e+03, 5.4309174200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 9.2312100100e+00, 3.1168838300e-02, -1.1247858600e-05, 1.8209065800e-09, -1.0920539500e-13, -1.6006949800e+03, -2.0614197400e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 11 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5H12_n_minuspentane = Substance {
    name = "C5H12,n-pentane",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.8983679000e+00, 4.1203037000e-02, 1.2312175000e-05, -3.6589501000e-08, 1.5042509000e-11, -2.0091500000e+04, 1.8679082000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.3546998000e+01, 2.8421786000e-02, -9.4174648000e-06, 1.3893589000e-09, -7.4212609000e-14, -2.4577680000e+04, -4.7021175000e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 12 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C5H12_i_minuspentane = Substance {
    name = "C5H12,i-pentane",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.0832882000e+00, 4.4571076000e-02, 8.2389934000e-06, -3.5258047000e-08, 1.5785762000e-11, -2.0807535000e+04, 2.1795155000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2327787000e+01, 3.0613087000e-02, -9.8415785000e-06, 1.3919776000e-09, -7.0337345000e-14, -2.5037492000e+04, -4.1133494000e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 12 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CH3C_CH3_2CH3 = Substance {
    name = "CH3C(CH3)2CH3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 7.2638994000e-01, 4.8125476000e-02, 1.5917458000e-06, -2.6692458000e-08, 1.2078282000e-11, -2.2407980000e+04, 1.8327214000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0110416000e+01, 3.5349566000e-02, -1.1039967000e-05, 1.4777721000e-09, -6.8467042000e-14, -2.5806711000e+04, -3.3756984000e+01 })
    },
    elements = { ["C"] = 5, ["H"] = 12 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H2 = Substance {
    name = "C6H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -5.9440502600e-01, 7.4661332900e-02, -1.3584798000e-04, 1.2219810000e-07, -4.1769675100e-11, 7.8419220400e+04, 2.2117878000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.2523806000e+01, 8.7859628200e-03, -3.1366317300e-06, 5.0434590800e-10, -3.0110970000e-14, 7.6077103700e+04, -3.8850124500e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H5_phenyl = Substance {
    name = "C6H5,phenyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 7.0972503200e-01, 1.9329948400e-02, 5.9407900700e-05, -9.8508414700e-08, 4.2542475500e-11, 3.9134567700e+04, 2.3029929400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.0770220000e+01, 1.8384859700e-02, -6.6998595100e-06, 1.0922562000e-09, -6.5841443900e-14, 3.5204032800e+04, -3.5014683700e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6D5 = Substance {
    name = "C6D5",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.2549782000e+00, 4.7328766000e-02, -8.0759883000e-06, -2.9901972000e-08, 1.7149060000e-11, 3.5314063000e+04, 2.9780146000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.4729492000e+01, 1.5210535000e-02, -5.5241635000e-06, 8.7984575000e-10, -5.0979217000e-14, 3.0282629000e+04, -5.5754964000e+01 })
    },
    elements = { ["C"] = 6, ["D"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H5O_phenoxy = Substance {
    name = "C6H5O,phenoxy",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 7.7629644600e-02, 3.3057491500e-02, 3.6035625600e-05, -7.9316542600e-08, 3.6432862300e-11, 4.0653938300e+03, 2.5759892000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.3151513400e+01, 1.9016550700e-02, -6.9469559200e-06, 1.1344217200e-09, -6.8463420300e-14, -4.7296826600e+02, -4.6710722500e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 5, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H6 = Substance {
    name = "C6H6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.0346966400e-01, 1.8514236300e-02, 7.3786440900e-05, -1.1810612700e-07, 5.0718252700e-11, 8.5526629300e+03, 2.1648179600e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.1077170800e+01, 2.0706789500e-02, -7.5162510000e-06, 1.2220941600e-09, -7.3531251300e-14, 4.3098839500e+03, -4.0011695000e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6D6 = Substance {
    name = "C6D6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -2.0701218000e+00, 5.2938197000e-02, -9.6074828000e-06, -3.2802372000e-08, 1.9012528000e-11, 5.4068984000e+03, 3.0693873000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.5619864000e+01, 1.7123934000e-02, -6.2012759000e-06, 9.8493058000e-10, -5.6891557000e-14, -1.4433052000e+02, -6.3888189000e+01 })
    },
    elements = { ["C"] = 6, ["D"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H5OH_phenol = Substance {
    name = "C6H5OH,phenol",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -2.9104922900e-01, 4.0856784200e-02, 2.4282354500e-05, -7.1447675700e-08, 3.4600304400e-11, -1.3412923100e+04, 2.6874888600e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.4155367400e+01, 1.9934949800e-02, -7.1821713200e-06, 1.1622868000e-09, -6.9714584000e-14, -1.8128734200e+04, -5.1799141200e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 6, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H10_cyclo_minus = Substance {
    name = "C6H10,cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.3662780400e+00, 1.0681415800e-02, 1.1822224300e-04, -1.6567991300e-07, 6.7613378600e-11, -2.4825035800e+03, 1.6769203300e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.1773388900e+01, 3.0948274300e-02, -1.1234726200e-05, 1.8263204500e-09, -1.0985568300e-13, -7.2026323300e+03, -4.2655793300e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H12_1_minushexene = Substance {
    name = "C6H12,1-hexene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 7.3153983000e+00, 3.7090375800e-03, 1.2725572300e-04, -1.7156223300e-07, 6.8982452100e-11, -8.2091623900e+03, -5.9578243600e-01 }),
        Range(1000.0, 6000.0, NASA7 { 1.5126882000e+01, 2.9497519200e-02, -1.0541118900e-05, 1.7213139400e-09, -1.0421885300e-13, -1.2486159000e+04, -5.1935175800e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 12 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H12_cyclo_minus = Substance {
    name = "C6H12,cyclo-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.0434876400e+00, -6.1952742400e-03, 1.7662108600e-04, -2.2296780900e-07, 8.6366739000e-11, -1.6920287200e+04, 8.5256676600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.3214756200e+01, 3.5824241000e-02, -1.3211059500e-05, 2.1720225400e-09, -1.3173054000e-13, -2.2809195400e+04, -5.5352646400e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 12 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C6H13_n_minushexyl = Substance {
    name = "C6H13,n-hexyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 8.7634495400e+00, 2.1624385000e-03, 1.3167408400e-04, -1.7382745200e-07, 6.9251500900e-11, -5.4262811500e+02, -5.9172697800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.4030197700e+01, 3.4711402900e-02, -1.2683610300e-05, 2.0936590200e-09, -1.2762798500e-13, -4.0690789000e+03, -4.3964382400e+01 })
    },
    elements = { ["C"] = 6, ["H"] = 13 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C7H7_benzyl = Substance {
    name = "C7H7,benzyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.8114571100e-01, 3.8512694300e-02, 3.2861834100e-05, -7.6972860300e-08, 3.5423026700e-11, 2.3307021000e+04, 2.3548700000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.4043562700e+01, 2.3494620900e-02, -8.5378699900e-06, 1.3891452300e-09, -8.3618365900e-14, 1.8564369700e+04, -5.1663239400e+01 })
    },
    elements = { ["C"] = 7, ["H"] = 7 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C7H8 = Substance {
    name = "C7H8",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.6119140000e+00, 2.1118890200e-02, 8.5322145300e-05, -1.3256687600e-07, 5.5940610900e-11, 4.0965197600e+03, 2.0297361400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.2939475000e+01, 2.6692155800e-02, -9.6842010800e-06, 1.5739214000e-09, -9.4667048200e-14, -6.7703576900e+02, -4.6725530200e+01 })
    },
    elements = { ["C"] = 7, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C7H8O_cresol = Substance {
    name = "C7H8O,cresol",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 7.9802602900e-01, 4.6728493400e-02, 2.7361736200e-05, -7.7582327800e-08, 3.6894835000e-11, -1.8332408700e+04, 2.4230317900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.6517949900e+01, 2.5472160400e-02, -9.1878124900e-06, 1.4877267500e-09, -8.9261718000e-14, -2.3611677500e+04, -6.1938622400e+01 })
    },
    elements = { ["C"] = 7, ["H"] = 8, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C7H14_1_minusheptene = Substance {
    name = "C7H14,1-heptene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 8.7057562300e+00, 2.7978804800e-03, 1.5521226000e-04, -2.0902011400e-07, 8.4052722400e-11, -1.1266138500e+04, -4.4534187300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.8497248400e+01, 3.3257599000e-02, -1.1815033000e-05, 1.9251327800e-09, -1.1644188600e-13, -1.6514204400e+04, -6.8309513800e+01 })
    },
    elements = { ["C"] = 7, ["H"] = 14 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C7H15_n_minusheptyl = Substance {
    name = "C7H15,n-heptyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.0280413600e+01, 7.0155356600e-04, 1.5955134700e-04, -2.0959317900e-07, 8.3344531800e-11, -3.6030731100e+03, -1.0302094000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.6411710700e+01, 4.0360290100e-02, -1.4782318800e-05, 2.4441456000e-09, -1.4916037400e-13, -7.7631092000e+03, -5.4953182800e+01 })
    },
    elements = { ["C"] = 7, ["H"] = 15 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C7H16_n_minusheptane = Substance {
    name = "C7H16,n-heptane",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.1153248400e+01, -9.4941543300e-03, 1.9557118100e-04, -2.4975252000e-07, 9.8487321300e-11, -2.6771173500e+04, -1.5909611000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.8535470400e+01, 3.9142046800e-02, -1.3803026800e-05, 2.2240387400e-09, -1.3345258000e-13, -3.1950078300e+04, -7.0190284000e+01 })
    },
    elements = { ["C"] = 7, ["H"] = 16 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C8H8_styrene = Substance {
    name = "C8H8,styrene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.1817576900e+00, 3.3487602500e-02, 6.9236625300e-05, -1.2449041900e-07, 5.4938473500e-11, 1.5603906200e+04, 2.2662498000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.5881333400e+01, 2.6837405500e-02, -9.9024456100e-06, 1.6375914100e-09, -9.9844897200e-14, 1.0084780400e+04, -6.0941931900e+01 })
    },
    elements = { ["C"] = 8, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C8H10_ethylbenz = Substance {
    name = "C8H10,ethylbenz",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.5153496300e+00, 1.7814568100e-02, 1.1893401200e-04, -1.7563976400e-07, 7.3206109900e-11, 1.0203859500e+03, 1.4153962900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.5576075900e+01, 3.2306457900e-02, -1.1900272300e-05, 1.9679254200e-09, -1.1991116400e-13, -4.4115751600e+03, -5.9104387700e+01 })
    },
    elements = { ["C"] = 8, ["H"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C8H16_1_minusoctene = Substance {
    name = "C8H16,1-octene",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.0148786000e+01, 1.2510753800e-03, 1.8525273600e-04, -2.4909416200e-07, 1.0025039500e-10, -1.4326745300e+04, -8.5077441800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.2013408600e+01, 3.6797217400e-02, -1.2983048200e-05, 2.1085463700e-09, -1.2729415800e-13, -2.0610983500e+04, -8.5533717000e+01 })
    },
    elements = { ["C"] = 8, ["H"] = 16 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C8H17_n_minusoctyl = Substance {
    name = "C8H17,n-octyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.1808251800e+01, -8.5034813600e-04, 1.8769770000e-04, -2.4569070200e-07, 9.7581302700e-11, -6.6645044200e+03, -1.4729848700e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.8796804300e+01, 4.6004852300e-02, -1.6879012600e-05, 2.7942247700e-09, -1.7066388600e-13, -1.1459257800e+04, -6.5962220600e+01 })
    },
    elements = { ["C"] = 8, ["H"] = 17 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C8H18_isooctane = Substance {
    name = "C8H18,isooctane",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 8.1573733800e-01, 7.3264395900e-02, 1.7830068800e-05, -6.9358962000e-08, 3.2162938200e-11, -3.0477286200e+04, 2.4150999400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.5989927300e+01, 5.5318479000e-02, -1.9526707200e-05, 3.1177917200e-09, -1.8531257700e-13, -3.5875797300e+04, -6.0116141400e+01 })
    },
    elements = { ["C"] = 8, ["H"] = 18 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C8H18_n_minusoctane = Substance {
    name = "C8H18,n-octane",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.2524490800e+01, -1.0101836500e-02, 2.2199159500e-04, -2.8486242000e-07, 1.1240962400e-10, -2.9843303400e+04, -1.9710855400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 2.2175540700e+01, 4.2442616100e-02, -1.4916110300e-05, 2.4037667300e-09, -1.4435903700e-13, -3.6103094400e+04, -8.8085445700e+01 })
    },
    elements = { ["C"] = 8, ["H"] = 18 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C9H19_n_minusnonyl = Substance {
    name = "C9H19,n-nonyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.8756485000e+00, 7.5792789000e-02, 1.3462431000e-05, -6.4088397000e-08, 2.8694172000e-11, -8.6834531000e+03, 2.4262241000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.9195267000e+01, 5.5439249000e-02, -2.1436601000e-05, 3.7885144000e-09, -2.5002987000e-13, -1.4373711000e+04, -6.6056286000e+01 })
    },
    elements = { ["C"] = 9, ["H"] = 19 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C10H8_naphthale = Substance {
    name = "C10H8,naphthale",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -1.0491932600e+00, 4.6297061100e-02, 7.0759220300e-05, -1.3840818600e-07, 6.2047574800e-11, 1.5984638800e+04, 3.0212157100e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.8612989900e+01, 3.0449414100e-02, -1.1122479900e-05, 1.8161540600e-09, -1.0960122400e-13, 8.9155294400e+03, -8.0023047900e+01 })
    },
    elements = { ["C"] = 10, ["H"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C10H21_n_minusdecyl = Substance {
    name = "C10H21,n-decyl",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.0897007000e+00, 8.4117949000e-02, 1.5901838000e-05, -7.2387934000e-08, 3.2266925000e-11, -1.1614941000e+04, 2.5281192900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 2.1322128000e+01, 6.1573524000e-02, -2.3849483000e-05, 4.2209116000e-09, -2.7889307000e-13, -1.7967809000e+04, -7.5643780100e+01 })
    },
    elements = { ["C"] = 10, ["H"] = 21 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C12H9_o_minusbipheny = Substance {
    name = "C12H9,o-bipheny",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.0764915600e-01, 5.4279784100e-02, 7.1251470100e-05, -1.4440449000e-07, 6.4850057500e-11, 4.8534983700e+04, 2.8198251500e+01 }),
        Range(1000.0, 6000.0, NASA7 { 2.2569342100e+01, 3.4561938600e-02, -1.2702078800e-05, 2.0811182700e-09, -1.2584948000e-13, 4.0590509100e+04, -9.5779239000e+01 })
    },
    elements = { ["C"] = 12, ["H"] = 9 },
    reference = "",
    aggregation_type = "Gas",
}

local s_O_minusC12D9 = Substance {
    name = "O-C12D9",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -7.3299396000e-01, 8.9836895000e-02, -1.3731275000e-05, -5.9427020000e-08, 3.3702430000e-11, 4.2943094000e+04, 3.0041956000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.0123199000e+01, 2.8328255000e-02, -1.0366540000e-05, 1.6593338000e-09, -9.6527116000e-14, 3.3207789000e+04, -1.3519130700e+02 })
    },
    elements = { ["C"] = 12, ["D"] = 9 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C12H10_bipheny = Substance {
    name = "C12H10,bipheny",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.9456618600e-01, 5.3526436800e-02, 8.5499670100e-05, -1.6390360600e-07, 7.2997721700e-11, 1.9002043100e+04, 2.7215127100e+01 }),
        Range(1000.0, 6000.0, NASA7 { 2.2896489200e+01, 3.6845257000e-02, -1.3501627000e-05, 2.2080280800e-09, -1.3335822300e-13, 1.0739449900e+04, -1.0051014800e+02 })
    },
    elements = { ["C"] = 12, ["H"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_C12D10 = Substance {
    name = "C12D10",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.5793486000e+00, 9.5059574000e-02, -1.4532071000e-05, -6.2645597000e-08, 3.5530079000e-11, 1.3137422000e+04, 3.1529841000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.0905060000e+01, 3.0349988000e-02, -1.1095048000e-05, 1.7755810000e-09, -1.0332327000e-13, 2.8834453000e+03, -1.4243893700e+02 })
    },
    elements = { ["C"] = 12, ["D"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Jet_minusA_g_ = Substance {
    name = "Jet-A(g)",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(273.15, 1000.0, NASA7 { 2.0869217000e+00, 1.3314965000e-01, -8.1157452000e-05, 2.9409286000e-08, -6.5195213000e-12, -3.5912814000e+04, 2.7355297200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 2.4880201000e+01, 7.8250048000e-02, -3.1550973000e-05, 5.7878900000e-09, -3.9827968000e-13, -4.3110684000e+04, -9.3655246800e+01 })
    },
    elements = { ["C"] = 12, ["H"] = 23 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ca = Substance {
    name = "Ca",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 2.0638927900e+04, 4.3845483300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.9270762300e+00, 1.3490916700e-03, -1.0751586200e-06, 3.2545786500e-10, -2.6467153800e-14, 2.0819621000e+04, 7.4287839800e+00 })
    },
    elements = { ["Ca"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ca_plus = Substance {
    name = "Ca+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 9.2324210600e+04, 5.0776750300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.6422143800e+00, -1.6051735900e-04, -2.7084396600e-08, 5.1352249600e-11, -5.9648704800e-15, 9.2259637900e+04, 4.2537262800e+00 })
    },
    elements = { ["Ca"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaBr = Substance {
    name = "CaBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8511877000e+00, 3.0271481000e-03, -5.5097807000e-06, 4.6764571000e-09, -1.4959960000e-12, -7.1837239000e+03, 7.7780328900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3217363000e+00, 4.0903674000e-04, -2.4541531000e-07, 6.9026874000e-11, -5.3684196000e-15, -7.2462732000e+03, 5.6766805900e+00 })
    },
    elements = { ["Ca"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaBr2 = Substance {
    name = "CaBr2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.6057157000e+00, 3.6058892000e-03, -5.8314650000e-06, 4.2634801000e-09, -1.1667278000e-12, -4.8382963000e+04, -6.3105228100e-01 }),
        Range(1000.0, 5000.0, NASA7 { 7.4151639000e+00, 9.6549013000e-05, -4.2463816000e-08, 8.2286865000e-12, -5.8617057000e-16, -4.8536824000e+04, -4.4808016200e+00 })
    },
    elements = { ["Ca"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaCL = Substance {
    name = "CaCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6730515000e+00, 3.3144164000e-03, -5.1682435000e-06, 3.7111267000e-09, -9.9687031000e-13, -1.3784144000e+04, 7.3367964100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3067116000e+00, 4.0084963000e-04, -2.3313661000e-07, 6.3921797000e-11, -4.8662383000e-15, -1.3892656000e+04, 4.3733742100e+00 })
    },
    elements = { ["Ca"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaCL2 = Substance {
    name = "CaCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.1613363000e+00, 5.3060429000e-03, -8.4649463000e-06, 6.1128897000e-09, -1.6522362000e-12, -5.8722935000e+04, -1.4482973500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.3650014000e+00, 1.5327108000e-04, -6.7275285000e-08, 1.3014131000e-11, -9.2567968000e-16, -5.8954731000e+04, -7.1885208500e+00 })
    },
    elements = { ["Ca"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaF = Substance {
    name = "CaF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.0508990000e+00, 5.1549439000e-03, -7.3508296000e-06, 4.7876458000e-09, -1.1523155000e-12, -3.3792345000e+04, 8.9880088700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1988621000e+00, 4.9244093000e-04, -2.6102123000e-07, 6.4791635000e-11, -4.7303951000e-15, -3.4021129000e+04, 3.4631475700e+00 })
    },
    elements = { ["Ca"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaF2 = Substance {
    name = "CaF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.2308152000e+00, 1.0255805000e-02, -1.5444345000e-05, 1.0546791000e-08, -2.6843916000e-12, -9.5955261000e+04, 6.3678065300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.6543431000e+00, 3.9052692000e-04, -1.7081070000e-07, 3.2952840000e-11, -2.3387741000e-15, -9.6445279000e+04, -5.3107211700e+00 })
    },
    elements = { ["Ca"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaI = Substance {
    name = "CaI",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0239101000e+00, 2.2559978000e-03, -4.0939833000e-06, 3.4840051000e-09, -1.1162996000e-12, -1.8770511000e+03, 7.9903106500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3198471000e+00, 4.3466691000e-04, -2.7441920000e-07, 8.0080441000e-11, -6.5451608000e-15, -1.9064804000e+03, 6.7148023500e+00 })
    },
    elements = { ["Ca"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaI2 = Substance {
    name = "CaI2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.5641727000e+00, 4.2684650000e-03, -7.9247583000e-06, 6.7205600000e-09, -2.1485461000e-12, -3.3138282000e+04, 1.0220922800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.4238665000e+00, 8.8555358000e-05, -3.9846893000e-08, 7.8918357000e-12, -5.7352658000e-16, -3.3287752000e+04, -2.9784454200e+00 })
    },
    elements = { ["Ca"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaO = Substance {
    name = "CaO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6718602000e+00, 6.4324025000e-03, -9.5727030000e-06, 6.7620424000e-09, -1.8173049000e-12, 4.2734531000e+03, 9.6542267900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.1745865000e+00, -1.0643234000e-02, 7.6968968000e-06, -1.9070443000e-09, 1.5509231000e-13, 2.3248041000e+03, -2.4427582500e+01 })
    },
    elements = { ["Ca"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaOH = Substance {
    name = "CaOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.1004852000e+00, 1.8695159000e-02, -3.3506644000e-05, 2.8025638000e-08, -8.7992689000e-12, -2.4530915000e+04, 1.2038763500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.2754759000e+00, 1.8025620000e-03, -6.8435648000e-07, 1.3060196000e-10, -8.9131580000e-15, -2.4984681000e+04, -2.3110854100e+00 })
    },
    elements = { ["Ca"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaOH_plus = Substance {
    name = "CaOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.1566460000e+00, 1.8518676000e-02, -3.3268222000e-05, 2.7872220000e-08, -8.7608010000e-12, 4.3168395000e+04, 1.1092766100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.4051087000e+00, 1.5245003000e-03, -4.7830808000e-07, 7.1347216000e-11, -4.1298349000e-15, 4.2685933000e+04, -3.6698112900e+00 })
    },
    elements = { ["Ca"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaO2H2 = Substance {
    name = "CaO2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.3222166000e+00, 3.7515682000e-02, -6.7996513000e-05, 5.7290263000e-08, -1.8081475000e-11, -7.5322863000e+04, 1.2487961100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.8582036000e+00, 2.9941909000e-03, -9.3219299000e-07, 1.3788386000e-10, -7.9111985000e-15, -7.6279496000e+04, -1.7139303900e+01 })
    },
    elements = { ["Ca"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CaS = Substance {
    name = "CaS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.2258600800e+00, 5.3064041800e-03, -8.7652763900e-06, 6.4260105400e-09, -1.6152903500e-12, 1.3733486600e+04, 8.3489208000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.3570775200e+00, -4.1839251300e-03, 4.6829137500e-06, -1.4072507500e-09, 1.2889266800e-13, 1.3474182500e+04, -1.4317321000e+00 })
    },
    elements = { ["Ca"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ca2 = Substance {
    name = "Ca2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.9459011000e+00, 4.3062133700e-03, -3.2338422700e-05, 4.5164081100e-08, -1.9350107100e-11, 3.9617549200e+04, 2.5451131500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.1670019900e+00, -6.1681444400e-04, 2.0354096000e-07, -2.7712818000e-11, 1.6500304600e-15, 4.0438238000e+04, 1.3711350900e+01 })
    },
    elements = { ["Ca"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CL = Substance {
    name = "CL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.2606248000e+00, 1.5415439900e-03, -6.8028362200e-07, -1.5997297500e-09, 1.1541663600e-12, 1.3855298600e+04, 6.5702079900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.9465835800e+00, -3.8598540800e-04, 1.3613938800e-07, -2.1703292300e-11, 1.2875102500e-15, 1.3697032700e+04, 3.1133013600e+00 })
    },
    elements = { ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CL_plus = Substance {
    name = "CL+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.7143539600e+00, 6.6248924800e-03, -1.3552308600e-05, 1.1499976000e-08, -3.5876056600e-12, 1.6512380900e+05, 8.9173955200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.1228607200e+00, -6.3662403700e-04, 2.4833792000e-07, -3.7250784900e-11, 1.9843368600e-15, 1.6491223400e+05, 2.4973134900e+00 })
    },
    elements = { ["Cl"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CL_minus = Substance {
    name = "CL-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -2.8883413200e+04, 4.2006292700e+00 })
    },
    elements = { ["Cl"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CLCN = Substance {
    name = "CLCN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3390854000e+00, 1.0397468000e-02, -1.3704650000e-05, 9.5061962000e-09, -2.5925260000e-12, 1.5237539000e+04, 6.8310325500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.4920021000e+00, 2.0987248000e-03, -7.7415914000e-07, 1.3823882000e-10, -9.2334864000e-15, 1.4749161000e+04, -3.7304624500e+00 })
    },
    elements = { ["Cl"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CLF = Substance {
    name = "CLF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6445569000e+00, 6.2481256000e-03, -9.0354351000e-06, 6.3400575000e-09, -1.7435372000e-12, -7.0469106000e+03, 9.6304280000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.8486233000e+00, 3.1733279000e-03, -2.0523387000e-06, 5.2162733000e-10, -3.7472262000e-14, -6.9278824000e+03, 9.3169966000e+00 })
    },
    elements = { ["Cl"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CLF3 = Substance {
    name = "CLF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8949119000e+00, 2.4718550000e-02, -3.5139323000e-05, 2.2559591000e-08, -5.3261978000e-12, -2.0798640000e+04, 1.1381692100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.9535967000e+00, 1.1722163000e-03, -5.0896188000e-07, 9.7563489000e-11, -6.8858731000e-15, -2.2075968000e+04, -1.8081554900e+01 })
    },
    elements = { ["Cl"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CLO = Substance {
    name = "CLO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8179364000e+00, 4.4531333000e-03, -4.4124893000e-06, 1.5920942000e-09, -1.4486242000e-14, 1.1171397000e+04, 1.0057982300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.0912619000e+00, 5.0003126000e-04, -1.8778206000e-07, 3.5097671000e-11, -2.4205038000e-15, 1.0853223000e+04, 3.6188924400e+00 })
    },
    elements = { ["Cl"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CLO2 = Substance {
    name = "CLO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2933861400e+00, 6.1931133700e-03, 1.0568537200e-06, -8.1619125400e-09, 4.3469460000e-12, 1.1376077600e+04, 1.0301702400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 5.7664768100e+00, 1.4113250600e-03, -5.4371403100e-07, 1.0073429500e-10, -6.4354376200e-15, 1.0632418200e+04, -2.8656008200e+00 })
    },
    elements = { ["Cl"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CL2 = Substance {
    name = "CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.7363811400e+00, 7.8352570000e-03, -1.4510496300e-05, 1.2573083400e-08, -4.1324714500e-12, -1.0588011400e+03, 9.4455587900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.7472750800e+00, -4.8858171000e-04, 2.6844487100e-07, -2.4347608300e-11, -1.0368314800e-15, -1.5110186200e+03, -3.4455130500e-01 })
    },
    elements = { ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CL2O = Substance {
    name = "CL2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2545238000e+00, 1.2799449000e-02, -1.7882460000e-05, 1.1264383000e-08, -2.5964252000e-12, 9.1657423000e+03, 1.0571210600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.4340062000e+00, 6.2728809000e-04, -2.6933252000e-07, 5.1076394000e-11, -3.5691545000e-15, 8.4860530000e+03, -4.9367240700e+00 })
    },
    elements = { ["Cl"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cr = Substance {
    name = "Cr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5025937100e+00, -2.7656017000e-05, 1.0397409500e-07, -1.6199640600e-10, 8.8939198500e-14, 4.7060023700e+04, 6.7110721000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.0849775200e+00, -1.4470368300e-03, 1.0849219400e-06, -2.3564363500e-10, 1.8635581600e-14, 4.6892820200e+04, 3.6591391400e+00 })
    },
    elements = { ["Cr"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CrN = Substance {
    name = "CrN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9304636000e+00, 3.0377042000e-03, -1.2713964000e-06, -1.1781249000e-09, 8.5551349000e-13, 5.9744203000e+04, 1.0191881200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.8649602000e+00, 8.5160456000e-04, -4.4070758000e-07, 1.0667601000e-10, -8.3731422000e-15, 5.9477437000e+04, 5.2950675700e+00 })
    },
    elements = { ["Cr"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CrO = Substance {
    name = "CrO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8414996000e+00, 4.0953358000e-03, -3.5776463000e-06, 8.1710439000e-10, 2.4072009000e-13, 2.1646067000e+04, 1.1517992200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.0139818000e+00, 6.2700245000e-04, -2.7956794000e-07, 6.0003100000e-11, -4.4057916000e-15, 2.1346693000e+04, 5.5517151000e+00 })
    },
    elements = { ["Cr"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CrO2 = Substance {
    name = "CrO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3012645000e+00, 8.1625857000e-03, -5.8907680000e-06, 1.6170856000e-11, 1.0816267000e-12, -1.0353569000e+04, 1.1399113800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.8499998000e+00, 1.2725101000e-03, -5.4920548000e-07, 1.0497491000e-10, -7.3995486000e-15, -1.1042183000e+04, -1.7449763200e+00 })
    },
    elements = { ["Cr"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CrO3 = Substance {
    name = "CrO3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.9072858000e+00, 2.3049608000e-02, -2.6501294000e-05, 1.2862413000e-08, -1.8381991000e-12, -3.6608680000e+04, 1.5345141500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.1628946000e+00, 2.0450839000e-03, -8.8594131000e-07, 1.6976282000e-10, -1.1987765000e-14, -3.8092557000e+04, -1.5895894500e+01 })
    },
    elements = { ["Cr"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cs = Substance {
    name = "Cs",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000455400e+00, -4.6683335600e-07, 1.6800506100e-09, -2.4821802900e-12, 1.2771219000e-15, 8.4554043600e+03, 6.8757353900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.8202331500e+00, -3.3484032700e-04, -9.8291570900e-08, 1.2756436900e-10, -1.4611927100e-14, 8.3063935400e+03, 5.0089404200e+00 })
    },
    elements = { ["Cs"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cs_plus = Substance {
    name = "Cs+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 5.4387398900e+04, 6.1827575600e+00 })
    },
    elements = { ["Cs"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CsCL = Substance {
    name = "CsCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.1823030000e+00, 1.3759553000e-03, -2.0586933000e-06, 1.4836474000e-09, -3.9764546000e-13, -3.0177927000e+04, 6.6384878800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4798455000e+00, 1.0949164000e-04, -3.9989914000e-09, 2.0641995000e-13, 2.2184640000e-17, -3.0235809000e+04, 5.2173170800e+00 })
    },
    elements = { ["Cs"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CsF = Substance {
    name = "CsF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7449879000e+00, 3.0100516000e-03, -4.5883816000e-06, 3.2179694000e-09, -8.3786017000e-13, -4.4090696000e+04, 7.1948731500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4373309000e+00, 1.2715000000e-04, -2.0547650000e-08, 2.9813357000e-12, -1.4774245000e-16, -4.4227995000e+04, 3.8735558500e+00 })
    },
    elements = { ["Cs"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CsO = Substance {
    name = "CsO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9857419000e+00, 2.1279251000e-03, -3.2170255000e-06, 2.2764295000e-09, -5.9721976000e-13, 6.2898940000e+03, 7.5160225900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4660282000e+00, 1.1563232000e-04, -5.9989187000e-09, 1.3176699000e-13, 5.7639745000e-17, 6.1950309000e+03, 5.2145486900e+00 })
    },
    elements = { ["Cs"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CsOH = Substance {
    name = "CsOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.5486003000e+00, 7.9612333000e-03, -1.3326497000e-05, 1.0314234000e-08, -2.8973777000e-12, -3.2810890000e+04, 2.8618796900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.7005649000e+00, 1.1820384000e-03, -3.1939094000e-07, 3.8642917000e-11, -1.6635636000e-15, -3.2919205000e+04, -2.1187002100e+00 })
    },
    elements = { ["Cs"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CsOH_plus = Substance {
    name = "CsOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.8487158000e+00, 6.8908346000e-03, -1.1839328000e-05, 9.4335372000e-09, -2.7222685000e-12, 5.1678167000e+04, 3.0848485100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.7292563000e+00, 1.1571324000e-03, -3.1044431000e-07, 3.7096291000e-11, -1.5509463000e-15, 5.1626483000e+04, -5.7648221800e-01 })
    },
    elements = { ["Cs"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cs2 = Substance {
    name = "Cs2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.7458822500e+00, -2.6386281900e-03, 1.1413930500e-05, -1.6043050000e-08, 6.5611229400e-12, 1.1544485600e+04, 7.6067927200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.8664517800e+00, -3.9901432600e-03, 1.3194808400e-06, -1.6341318600e-10, 6.8812590800e-15, 1.0805429300e+04, -4.2974946500e+00 })
    },
    elements = { ["Cs"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cs2CL2 = Substance {
    name = "Cs2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 9.2952642000e+00, 2.8505600000e-03, -4.5576019000e-06, 3.2557731000e-09, -8.6067362000e-13, -8.2222862000e+04, -7.5183533200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.9424375000e+00, 6.2659303000e-05, -2.6331097000e-08, 4.8912142000e-12, -3.3554152000e-16, -8.2345855000e+04, -1.0598060400e+01 })
    },
    elements = { ["Cs"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cs2F2 = Substance {
    name = "Cs2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 8.4425561000e+00, 6.4921001000e-03, -1.0832757000e-05, 8.1791054000e-09, -2.3173978000e-12, -1.0978165000e+05, -7.2482448500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.8793725000e+00, 1.2674829000e-04, -5.0905253000e-08, 8.9711762000e-12, -5.8090960000e-16, -1.1005057000e+05, -1.4054821700e+01 })
    },
    elements = { ["Cs"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cs2O = Substance {
    name = "Cs2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.7553639000e+00, 4.9116073000e-03, -7.7072518000e-06, 5.4156957000e-09, -1.4080898000e-12, -1.2946829000e+04, 4.3001546100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8979467000e+00, 1.0165098000e-04, -3.8062062000e-08, 6.1466393000e-12, -3.5758216000e-16, -1.3169989000e+04, -1.1659168900e+00 })
    },
    elements = { ["Cs"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cs2O2H2 = Substance {
    name = "Cs2O2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.5228191000e+00, 7.9078372000e-03, 3.5430299000e-06, -1.0456328000e-08, 4.8014032000e-12, -8.5338412000e+04, -1.9066331100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.5809362000e+00, 5.3260509000e-03, -1.8780545000e-06, 3.0925925000e-10, -1.9429533000e-14, -8.6025839000e+04, -1.3214594300e+01 })
    },
    elements = { ["Cs"] = 2, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cs2SO4 = Substance {
    name = "Cs2SO4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.2965385000e+00, 4.4854300000e-02, -6.0987923000e-05, 4.0516388000e-08, -1.0673495000e-11, -1.3782559000e+05, 1.3409637100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.5419045000e+01, 4.0527650000e-03, -1.7910341000e-06, 3.5024653000e-10, -2.5215736000e-14, -1.4036775000e+05, -4.1492184900e+01 })
    },
    elements = { ["Cs"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cu = Substance {
    name = "Cu",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000659700e+00, -6.7730641200e-07, 2.4411681800e-09, -3.6131475800e-12, 1.8630322400e-15, 3.9858335800e+04, 5.7688460400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.1352259500e+00, -1.1333754700e-03, 5.7202304100e-07, -7.6632617700e-11, 2.8388146600e-15, 3.9617724000e+04, 2.2533194400e+00 })
    },
    elements = { ["Cu"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cu_plus = Substance {
    name = "Cu+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.3026378800e+05, 1.2494120900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 2.4998175400e+00, 3.5792214600e-07, -2.2176984800e-10, 4.8693791800e-14, -2.3901961000e-18, 1.3026385400e+05, 1.2495118600e+01 })
    },
    elements = { ["Cu"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CuCL = Substance {
    name = "CuCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3491600000e+00, 5.1028302000e-03, -9.1278002000e-06, 7.6014155000e-09, -2.3984489000e-12, 9.7967562000e+03, 8.2694730400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3902988000e+00, 1.8349484000e-04, -5.7110703000e-08, 1.1293321000e-11, -8.1975520000e-16, 9.6097266000e+03, 3.3921651400e+00 })
    },
    elements = { ["Cu"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CuF = Substance {
    name = "CuF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7654505000e+00, 6.8511805000e-03, -1.1338819000e-05, 8.9096578000e-09, -2.6927692000e-12, -2.5548565000e+03, 9.8727741100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1227399000e+00, 6.3163463000e-04, -3.3472820000e-07, 8.0837367000e-11, -5.7834817000e-15, -2.8005953000e+03, 3.4856457100e+00 })
    },
    elements = { ["Cu"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CuF2 = Substance {
    name = "CuF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1107696000e+00, 1.4325807000e-02, -2.2811743000e-05, 1.7278893000e-08, -5.0726977000e-12, -3.3500453000e+04, 1.0999569800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.8184236000e+00, -1.6497908000e-04, 2.0291774000e-07, -2.5453113000e-11, 1.2065732000e-16, -3.4322744000e+04, -7.1286292100e+00 })
    },
    elements = { ["Cu"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_CuO = Substance {
    name = "CuO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7093520000e+00, 3.1965059000e-03, -5.2970109000e-06, 4.2164238000e-09, -1.2891855000e-12, 3.5627470000e+04, 6.3314007900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.2723625000e+00, 4.4713276000e-04, -2.3956979000e-07, 6.0405316000e-11, -4.2456016000e-15, 3.5535349000e+04, 3.7270188900e+00 })
    },
    elements = { ["Cu"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cu2 = Substance {
    name = "Cu2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9244358000e+00, 2.7274949000e-03, -4.9194956000e-06, 4.1821965000e-09, -1.3393533000e-12, 5.7119187000e+04, 6.0838082900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4239734000e+00, 2.0248952000e-04, -6.4489793000e-08, 1.4065412000e-11, -7.6020494000e-16, 5.7038131000e+04, 3.7853557900e+00 })
    },
    elements = { ["Cu"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Cu3CL3 = Substance {
    name = "Cu3CL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.1442900000e+01, 2.0690806000e-02, -3.8264003000e-05, 3.2341053000e-08, -1.0309884000e-11, -3.5151610000e+04, -1.8268786500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.5626127000e+01, 4.3373833000e-04, -1.9467006000e-07, 3.8466938000e-11, -2.7899700000e-15, -3.5881853000e+04, -3.7752334500e+01 })
    },
    elements = { ["Cu"] = 3, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_D = Substance {
    name = "D",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 2.5921259600e+04, 5.9171582700e-01 })
    },
    elements = { ["D"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_D_plus = Substance {
    name = "D+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.8451196400e+05, -1.0183890400e-01 })
    },
    elements = { ["D"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_D_minus = Substance {
    name = "D-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.6423766700e+04, -1.0102391200e-01 })
    },
    elements = { ["D"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_DCL = Substance {
    name = "DCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8269213000e+00, -2.5013326000e-03, 6.0466124000e-06, -4.4837519000e-09, 1.1367641000e-12, -1.2301921000e+04, 1.8917778400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.9572034000e+00, 1.5918160000e-03, -6.3320272000e-07, 1.1755658000e-10, -8.1599911000e-15, -1.2173515000e+04, 5.8987967400e+00 })
    },
    elements = { ["D"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_DF = Substance {
    name = "DF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4981386000e+00, 2.2176793000e-04, -1.3320240000e-06, 2.5619493000e-09, -1.1512241000e-12, -3.4183232000e+04, 1.6550786100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.7264620000e+00, 1.5091293000e-03, -5.1704938000e-07, 8.5485371000e-11, -5.4196024000e-15, -3.3936940000e+04, 5.8298198100e+00 })
    },
    elements = { ["D"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_DOCL = Substance {
    name = "DOCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4790418000e+00, 1.0845896000e-02, -1.5228305000e-05, 1.1437314000e-08, -3.4204925000e-12, -1.0518092000e+04, 1.2126710700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.4350761000e+00, 2.5322387000e-03, -1.0312331000e-06, 1.9005454000e-10, -1.2682384000e-14, -1.0919402000e+04, 2.7271596900e+00 })
    },
    elements = { ["D"] = 1, ["O"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_D2 = Substance {
    name = "D2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.4954697400e+00, 2.5834815900e-04, -1.3176250200e-06, 2.4291201800e-09, -1.0598249800e-12, -1.0463158000e+03, -2.5190538500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.7306892900e+00, 1.4800478100e-03, -4.7931484800e-07, 7.8949627400e-11, -4.8838082300e-15, -7.9526750400e+02, 1.6426624300e+00 })
    },
    elements = { ["D"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_D2_plus = Substance {
    name = "D2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8075140000e+00, -3.1106260000e-03, 1.0162982000e-05, -9.8363271000e-09, 3.2659853000e-12, 1.7917096000e+05, -2.2866282500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.5891800000e+00, 8.9214651000e-04, -2.4264484000e-07, 5.7584409000e-11, -6.7380560000e-15, 1.7903752000e+05, -2.0581788500e+00 })
    },
    elements = { ["D"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_D2_minus = Substance {
    name = "D2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2144800000e+00, 7.8358165000e-04, 3.5892685000e-06, -5.2394190000e-09, 2.0871365000e-12, 2.7293009000e+04, 3.6815583700e-01 }),
        Range(1000.0, 5000.0, NASA7 { 3.7531042000e+00, 9.8018991000e-04, -3.6387960000e-07, 7.0700482000e-11, -5.0674272000e-15, 2.7064708000e+04, -2.8195517200e+00 })
    },
    elements = { ["D"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_D2O = Substance {
    name = "D2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8541131000e+00, 1.4712288000e-04, 3.0069006000e-06, -1.7747628000e-09, 2.3018862000e-13, -3.1151651000e+04, 1.7334198400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.7264595000e+00, 3.9845173000e-03, -1.4932626000e-06, 2.6349772000e-10, -1.7649557000e-14, -3.0902638000e+04, 7.3182013400e+00 })
    },
    elements = { ["D"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_D2S = Substance {
    name = "D2S",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8070824000e+00, 3.7596311000e-04, 5.7530799000e-06, -5.3485740000e-09, 1.4054083000e-12, -4.0661219000e+03, 3.8792874900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.6662901000e+00, 3.4992264000e-03, -1.4207284000e-06, 2.6685639000e-10, -1.8684739000e-14, -4.2147308000e+03, 3.7996996900e+00 })
    },
    elements = { ["D"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_F = Substance {
    name = "F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.4195142900e+00, 2.9413279300e-03, -8.9279924600e-06, 9.9206093500e-09, -3.7986004400e-12, 8.7573235100e+03, 4.7477104200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.6674954100e+00, -1.6669354800e-04, 6.4244845700e-08, -1.0858875800e-11, 6.7084575500e-16, 8.7889535000e+03, 4.0072919800e+00 })
    },
    elements = { ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_F_plus = Substance {
    name = "F+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.0842108400e+00, -9.0006213900e-04, -1.6459917400e-07, 1.1012133600e-09, -5.5627092000e-13, 2.1161910100e+05, 2.1459765300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.6883486100e+00, -1.7618296100e-04, 6.0694063900e-08, -8.9153006700e-12, 5.4755216700e-16, 2.1174409500e+05, 4.2748083800e+00 })
    },
    elements = { ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_F_minus = Substance {
    name = "F-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -3.1424152200e+04, 3.2648828500e+00 })
    },
    elements = { ["F"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FCN = Substance {
    name = "FCN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2516941000e+00, 8.3073144000e-03, -8.3666358000e-06, 4.4125644000e-09, -9.0882423000e-13, 3.0551198000e+03, 6.4421477400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.0898557000e+00, 2.4170684000e-03, -9.7682766000e-07, 1.7813442000e-10, -1.2118567000e-14, 2.5780781000e+03, -2.8727809600e+00 })
    },
    elements = { ["F"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FO = Substance {
    name = "FO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9680024000e+00, 2.6483393000e-03, -3.7368005000e-07, -1.9006225000e-09, 1.0614283000e-12, 1.2087844000e+04, 8.3934974700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.9192774000e+00, 7.0442345000e-04, -2.6648204000e-07, 4.9617599000e-11, -3.3688571000e-15, 1.1798193000e+04, 3.3287583700e+00 })
    },
    elements = { ["F"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FO2 = Substance {
    name = "FO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7805073000e+00, 6.8174595000e-03, -5.8133605000e-06, 1.7562504000e-09, 6.7757430000e-14, 1.2769468000e+02, 7.8356829700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.7040935000e+00, 1.3862889000e-03, -5.8355374000e-07, 1.0937214000e-10, -7.5869181000e-15, -3.9678678000e+02, -2.0679173300e+00 })
    },
    elements = { ["F"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_F2 = Substance {
    name = "F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2083241500e+00, 1.2591917900e-03, 3.8974797900e-06, -7.2218498400e-09, 3.3183786200e-12, -1.0342579400e+03, 5.6190358900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.8616621900e+00, 7.8836767900e-04, -1.8198294000e-07, -9.1743656000e-12, 2.6519347200e-15, -1.2323865500e+03, 2.0411985500e+00 })
    },
    elements = { ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_F2O = Substance {
    name = "F2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6109219000e+00, 1.2231280000e-02, -1.3441415000e-05, 5.8909412000e-09, -5.7487175000e-13, 1.7347196000e+03, 1.1787881800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.0051871000e+00, 1.1028402000e-03, -4.7547937000e-07, 9.0683145000e-11, -6.3757098000e-15, 9.1906065000e+02, -5.2221058100e+00 })
    },
    elements = { ["F"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FS2F_fluorodisu = Substance {
    name = "FS2F,fluorodisu",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.2266468200e+00, 3.2812520400e-02, -5.9279702100e-05, 5.0233128000e-08, -1.6259901900e-11, -4.2153801900e+04, 1.5123942800e+01 }),
        Range(1000.0, 6000.0, NASA7 { 9.1149140400e+00, 9.2554978800e-04, -3.6697285900e-07, 6.3148989900e-11, -3.9487776400e-15, -4.3444856100e+04, -1.7368577400e+01 })
    },
    elements = { ["F"] = 2, ["S"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Fe = Substance {
    name = "Fe",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.7074442800e+00, 1.0633922400e-02, -2.7611817100e-05, 2.8091785400e-08, -1.0121982400e-11, 4.9184372500e+04, 9.8081109900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.2619797000e+00, -1.0558253300e-03, 5.9290699800e-07, -1.0718945500e-10, 7.4806440200e-15, 4.9096987300e+04, 3.5244389400e+00 })
    },
    elements = { ["Fe"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Fe_plus = Substance {
    name = "Fe+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.7641810600e+00, 2.8694823800e-03, -7.6123565100e-06, 8.1818333400e-09, -3.1179219900e-12, 1.4115903900e+05, 5.5399798100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.3360239900e+00, -2.7254926200e-04, 8.0544034400e-09, 1.5122908900e-11, -1.4337659500e-15, 1.4103645500e+05, 2.8647696800e+00 })
    },
    elements = { ["Fe"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Fe_minus = Substance {
    name = "Fe-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.5217451000e+00, 9.7967319300e-03, -2.1107867000e-05, 1.8482090300e-08, -5.8953713400e-12, 4.6571021500e+04, 1.0868338500e+01 }),
        Range(1000.0, 6000.0, NASA7 { 3.3631058600e+00, -8.2937504200e-04, 3.1242624100e-07, -5.2006835500e-11, 3.1787524100e-15, 4.6356430700e+04, 2.7680242100e+00 })
    },
    elements = { ["Fe"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FeC5O5 = Substance {
    name = "FeC5O5",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.6065460000e+00, 7.5042129000e-02, -1.2201275000e-04, 1.0055378000e-07, -3.2260973000e-11, -9.1951438000e+04, -2.5760062100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.1164021000e+01, 1.0333103000e-02, -4.3310936000e-06, 8.2047497000e-10, -5.7773874000e-14, -9.4888934000e+04, -7.2073652000e+01 })
    },
    elements = { ["Fe"] = 1, ["C"] = 5, ["O"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FeCL = Substance {
    name = "FeCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7885826000e+00, 4.3678011000e-03, -6.6922328000e-06, 4.1707454000e-09, -8.4686773000e-13, 2.8920097000e+04, 8.3533675600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.6940669000e+00, 1.1604078000e-04, -2.0840175000e-08, -1.7626556000e-12, 5.2313814000e-16, 2.8790344000e+04, 4.1935550600e+00 })
    },
    elements = { ["Fe"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FeCL2 = Substance {
    name = "FeCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.4557505000e+00, 7.9632927000e-03, -1.2593964000e-05, 8.9976734000e-09, -2.3242363000e-12, -1.8844297000e+04, 3.0228421900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.9492601000e+00, 5.3371641000e-04, 7.0221207000e-08, -6.1475490000e-11, 6.7933143000e-15, -1.9045832000e+04, -3.7595144100e+00 })
    },
    elements = { ["Fe"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FeCL3 = Substance {
    name = "FeCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.5614873000e+00, 9.7338249000e-03, -1.5543305000e-05, 1.1186368000e-08, -3.0022998000e-12, -3.3013624000e+04, -3.9858320300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.7771106000e+00, 2.4421362000e-04, -1.0313994000e-07, 1.9207426000e-11, -1.3179299000e-15, -3.3439570000e+04, -1.4549146300e+01 })
    },
    elements = { ["Fe"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_FeO = Substance {
    name = "FeO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8245256000e+00, 4.3049207000e-03, -4.1084781000e-06, 1.3201189000e-09, 7.1316217000e-14, 2.9194035000e+04, 1.1891176000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.2049817000e+00, 2.6838452000e-04, -8.9426736000e-08, 3.1855911000e-11, -3.3922543000e-15, 2.8829170000e+04, 4.8304315900e+00 })
    },
    elements = { ["Fe"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Fe_OH_2 = Substance {
    name = "Fe(OH)2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { -1.6766773400e+00, 6.1693146400e-02, -1.2073899500e-04, 1.0981402600e-07, -3.7285683100e-11, -4.1128970800e+04, 2.9677171000e+01 }),
        Range(1000.0, 6000.0, NASA7 { 8.9626201200e+00, 4.2013734200e-03, -1.6101744300e-06, 2.6834707600e-10, -1.6349730500e-14, -4.2799435800e+04, -1.8691236700e+01 })
    },
    elements = { ["Fe"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Fe2CL4 = Substance {
    name = "Fe2CL4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.2738242000e+01, 1.3235558000e-02, -2.1641873000e-05, 1.5993667000e-08, -4.3507097000e-12, -5.6106579000e+04, -1.9824749100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.5357500000e+01, 6.4207861000e-04, 2.0817730000e-08, -5.1580559000e-11, 6.0673495000e-15, -5.6510037000e+04, -3.1896587100e+01 })
    },
    elements = { ["Fe"] = 2, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Fe2CL6 = Substance {
    name = "Fe2CL6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.4221180800e+01, 4.3548596800e-02, -9.6039018800e-05, 9.3746308100e-08, -3.3605162600e-11, -8.4199626500e+04, -2.5924469400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 2.1564503100e+01, 4.6234901500e-04, -1.8495207800e-07, 3.2014304300e-11, -2.0100273700e-15, -8.5243237500e+04, -5.8653818500e+01 })
    },
    elements = { ["Fe"] = 2, ["Cl"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H = Substance {
    name = "H",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 2.5473659900e+04, -4.4668285300e-01 }),
        Range(1000.0, 6000.0, NASA7 { 2.5000028600e+00, -5.6533421400e-09, 3.6325172300e-12, -9.1994972000e-16, 7.9526074600e-20, 2.5473658900e+04, -4.4669849400e-01 })
    },
    elements = { ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H_plus = Substance {
    name = "H+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.8402142800e+05, -1.1406445300e+00 })
    },
    elements = { ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H_minus = Substance {
    name = "H-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.5976167000e+04, -1.1390159800e+00 })
    },
    elements = { ["H"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HALO = Substance {
    name = "HALO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2922115900e+00, -2.6820039900e-03, 2.8684129200e-05, -3.7970886600e-08, 1.5402035000e-11, 2.9777105000e+03, 6.9616097000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.0907533900e+00, 2.4251411700e-03, -9.3993294600e-07, 1.5939100400e-10, -9.8674731700e-15, 2.0500945900e+03, -4.6145079100e+00 })
    },
    elements = { ["H"] = 1, ["Al"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HBO = Substance {
    name = "HBO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.2143106000e+00, 9.3718513000e-03, -1.0711074000e-05, 7.6769774000e-09, -2.3586371000e-12, -2.4849246000e+04, 9.3720167700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.7485181000e+00, 3.6610859000e-03, -1.4635409000e-06, 2.6519903000e-10, -1.7834275000e-14, -2.5225798000e+04, 1.7464775700e+00 })
    },
    elements = { ["H"] = 1, ["B"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HBO_plus = Substance {
    name = "HBO+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.2544283000e+00, 8.0301872000e-03, -5.9749072000e-06, 2.4281950000e-09, -4.3051124000e-13, 1.4185069000e+05, 1.0812207600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.9475080000e+00, 3.4315436000e-03, -1.2787084000e-06, 2.2180604000e-10, -1.4757192000e-14, 1.4135998000e+05, 1.9988959700e+00 })
    },
    elements = { ["H"] = 1, ["B"] = 1, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HBO_minus = Substance {
    name = "HBO-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9707955000e+00, -2.2100107000e-03, 1.4535413000e-05, -1.5638925000e-08, 5.3978966000e-12, -3.0589499000e+04, 4.8249696700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.0869265000e+00, 2.9784756000e-03, -1.2387107000e-06, 2.4693335000e-10, -1.8455048000e-14, -3.0930026000e+04, 2.7801424700e+00 })
    },
    elements = { ["H"] = 1, ["B"] = 1, ["O"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HBO2 = Substance {
    name = "HBO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8707866000e+00, 7.8862644000e-03, -4.0736842000e-07, -4.7059022000e-09, 2.3548893000e-12, -6.8624111000e+04, 1.0180518600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.7389519000e+00, 4.7718771000e-03, -1.8063494000e-06, 3.1492889000e-10, -2.0738312000e-14, -6.9248838000e+04, 9.8639176700e-03 })
    },
    elements = { ["H"] = 1, ["B"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HBS = Substance {
    name = "HBS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.5595903000e+00, 1.3966838000e-02, -1.7988595000e-05, 1.2315141000e-08, -3.4090957000e-12, 5.0890936000e+03, 1.3501898600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.4412265000e+00, 2.9979825000e-03, -1.1938230000e-06, 2.1195832000e-10, -1.3466097000e-14, 4.4402975000e+03, -6.4678317400e-01 })
    },
    elements = { ["H"] = 1, ["B"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HBS_plus = Substance {
    name = "HBS+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.2511561000e+00, 1.2077168000e-02, -1.5322156000e-05, 1.0494090000e-08, -2.9325292000e-12, 1.3475476000e+05, 1.1270769900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.7097542000e+00, 2.8187036000e-03, -1.1633088000e-06, 2.1768839000e-10, -1.5108686000e-14, 1.3419139000e+05, -8.3747214600e-01 })
    },
    elements = { ["H"] = 1, ["B"] = 1, ["S"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HBr = Substance {
    name = "HBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6056690000e+00, -5.9529431000e-04, 6.5029568000e-07, 9.3781219000e-10, -7.1141852000e-13, -5.4389455000e+03, 3.4963411300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.7935804000e+00, 1.5655925000e-03, -5.6171064000e-07, 9.5783142000e-11, -6.1813990000e-15, -5.2338384000e+03, 7.6555340300e+00 })
    },
    elements = { ["H"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HCN = Substance {
    name = "HCN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.2590112300e+00, 1.0051059100e-02, -1.3351491100e-05, 1.0092088200e-08, -3.0088204800e-12, 1.5215849500e+04, 8.9163459000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.8023173300e+00, 3.1463000900e-03, -1.0631569800e-06, 1.6618539500e-10, -9.7989178900e-15, 1.4910482900e+04, 1.5750358400e+00 })
    },
    elements = { ["H"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HCO = Substance {
    name = "HCO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.2211858400e+00, -3.2439253200e-03, 1.3779944600e-05, -1.3314409300e-08, 4.3376886500e-12, 3.8395649600e+03, 3.3943724300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.6489620900e+00, 3.0809081900e-03, -1.1242987600e-06, 1.8630808500e-10, -1.1395182800e-14, 3.7120904800e+03, 5.0614740600e+00 })
    },
    elements = { ["H"] = 1, ["C"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HCO_plus = Substance {
    name = "HCO+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4739736000e+00, 8.6715590000e-03, -1.0031500000e-05, 6.7170527000e-09, -1.7872674000e-12, 9.9146608000e+04, 8.1757118700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.7411880000e+00, 3.3441517000e-03, -1.2397121000e-06, 2.1189388000e-10, -1.3704150000e-14, 9.8884078000e+04, 2.0786135700e+00 })
    },
    elements = { ["H"] = 1, ["C"] = 1, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HCCN = Substance {
    name = "HCCN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.8718430700e+00, 2.6061131400e-02, -4.6272396500e-05, 4.1860973100e-08, -1.4535270500e-11, 7.2034036000e+04, 1.2217322800e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.5631416900e+00, 3.4804096700e-03, -1.2460308000e-06, 2.0076448600e-10, -1.2004454700e-14, 7.1134708600e+04, -9.8655614100e+00 })
    },
    elements = { ["H"] = 1, ["C"] = 2, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HCL = Substance {
    name = "HCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5248171000e+00, 2.9984862000e-05, -8.6221891000e-07, 2.0979721000e-09, -9.8658191000e-13, -1.2150509000e+04, 2.4089235900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.7665884000e+00, 1.4381883000e-03, -4.6993000000e-07, 7.3499408000e-11, -4.3731106000e-15, -1.1917468000e+04, 6.4715062900e+00 })
    },
    elements = { ["H"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HD = Substance {
    name = "HD",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4325477000e+00, 6.5107028000e-04, -1.9332666000e-06, 2.4101736000e-09, -8.6732397000e-13, -1.0009272000e+03, -2.3890224700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.8464544000e+00, 1.0631961000e-03, -2.4433805000e-07, 2.9050834000e-11, -1.1621531000e-15, -7.6182465000e+02, 9.8014399700e-01 })
    },
    elements = { ["H"] = 1, ["D"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HD_plus = Substance {
    name = "HD+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8827136000e+00, -3.0779381000e-03, 8.1914473000e-06, -6.8119499000e-09, 1.9859898000e-12, 1.7894563000e+05, -2.8033597800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.2909764000e+00, 1.1551529000e-03, -3.4449463000e-07, 7.6722682000e-11, -8.0948133000e-15, 1.7894279000e+05, -4.7860721200e-01 })
    },
    elements = { ["H"] = 1, ["D"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HD_minus = Substance {
    name = "HD-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6428877000e+00, -2.1291289000e-03, 8.9284123000e-06, -9.3481204000e-09, 3.2564971000e-12, 2.7269271000e+04, -2.2556266100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.4939949000e+00, 1.2448667000e-03, -4.7288714000e-07, 9.1059637000e-11, -6.4862926000e-15, 2.7157734000e+04, -2.2311046100e+00 })
    },
    elements = { ["H"] = 1, ["D"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HDO = Substance {
    name = "HDO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0754422000e+00, -1.3820285000e-03, 5.7025534000e-06, -4.4163646000e-09, 1.2263062000e-12, -3.0707608000e+04, 9.7106812700e-01 }),
        Range(1000.0, 5000.0, NASA7 { 2.6672688000e+00, 3.5575209000e-03, -1.2026003000e-06, 1.9607209000e-10, -1.2352620000e-14, -3.0372869000e+04, 7.9835992600e+00 })
    },
    elements = { ["H"] = 1, ["D"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HF = Substance {
    name = "HF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4379986000e+00, 5.3571598000e-04, -1.5229655000e-06, 1.7564491000e-09, -5.7869940000e-13, -3.3818972000e+04, 1.2061817700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.9919110000e+00, 7.1489475000e-04, -6.8630973000e-08, -1.1617130000e-11, 1.9412375000e-15, -3.3621364000e+04, 3.8254952700e+00 })
    },
    elements = { ["H"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HI = Substance {
    name = "HI",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6963722000e+00, -1.4224755000e-03, 3.0131188000e-06, -1.2666403000e-09, -3.5098765000e-14, 2.1073581000e+03, 4.0881211100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.9104008000e+00, 1.5688188000e-03, -5.9227632000e-07, 1.0537094000e-10, -7.0375116000e-15, 2.2508659000e+03, 7.8644705100e+00 })
    },
    elements = { ["H"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HNC = Substance {
    name = "HNC",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.3018673500e+00, 1.5415752900e-02, -3.1326215600e-05, 3.0881655100e-08, -1.1191235300e-11, 2.2227718300e+04, 8.1475113500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.2224810300e+00, 2.5945827800e-03, -8.5848096900e-07, 1.3074500200e-10, -7.5033976500e-15, 2.2012759300e+04, -7.7944735800e-02 })
    },
    elements = { ["H"] = 1, ["N"] = 1, ["C"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HNCO = Substance {
    name = "HNCO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.2432245400e+00, 1.4498638000e-02, -1.5260905400e-05, 8.3636445300e-09, -1.7219196700e-12, -1.3425751200e+04, 1.2156546900e+01 }),
        Range(1000.0, 6000.0, NASA7 { 5.2940466400e+00, 4.0303965000e-03, -1.4129034800e-06, 2.2442823400e-10, -1.3285938000e-14, -1.4165375900e+04, -3.0876313000e+00 })
    },
    elements = { ["H"] = 1, ["N"] = 1, ["C"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HNO = Substance {
    name = "HNO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.5352588200e+00, -5.6854691000e-03, 1.8519997600e-05, -1.7188367400e-08, 5.5583309000e-12, 1.1039880500e+04, 1.7431473400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.1655476200e+00, 3.0000513200e-03, -3.9435028200e-07, -3.8578749100e-11, 7.0809193100e-15, 1.1194416900e+04, 7.6476469500e+00 })
    },
    elements = { ["H"] = 1, ["N"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HNO2 = Substance {
    name = "HNO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2141592500e+00, 8.1277792000e-03, 1.6599951600e-06, -9.5281556300e-09, 4.8713181600e-12, -1.0753236000e+04, 9.8220002100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.7918265800e+00, 3.6516266300e-03, -1.2929345100e-06, 2.0689293200e-10, -1.2315485500e-14, -1.1565552600e+04, -4.0553852500e+00 })
    },
    elements = { ["H"] = 1, ["N"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HNO3 = Substance {
    name = "HNO3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.7449294600e+00, 1.8804088800e-02, -8.1596359700e-06, -5.7858453200e-09, 4.4376808300e-12, -1.7380529600e+04, 1.6954552400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 8.0037923400e+00, 4.4983753300e-03, -1.7364875800e-06, 2.9368555500e-10, -1.8147867300e-14, -1.9256302200e+04, -1.6098554600e+01 })
    },
    elements = { ["H"] = 1, ["N"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HOCL = Substance {
    name = "HOCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9320537000e+00, 6.9377744000e-03, -6.7191845000e-06, 3.1568866000e-09, -4.6965880000e-13, -1.0086799000e+04, 9.9525657600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.2250105000e+00, 2.3182675000e-03, -8.3842380000e-07, 1.4176398000e-10, -8.7469994000e-15, -1.0368657000e+04, 3.5900755600e+00 })
    },
    elements = { ["H"] = 1, ["O"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HOF = Substance {
    name = "HOF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2310929000e+00, 3.7389857000e-03, 6.3009762000e-07, -3.6215002000e-09, 1.7867133000e-12, -1.2954779000e+04, 7.7509036200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.0464336000e+00, 2.4486283000e-03, -8.6283553000e-07, 1.4209904000e-10, -8.9356915000e-15, -1.3209067000e+04, 3.3499329200e+00 })
    },
    elements = { ["H"] = 1, ["O"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HO2 = Substance {
    name = "HO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.3017980100e+00, -4.7491205100e-03, 2.1158289100e-05, -2.4276389400e-08, 9.2922512400e-12, 2.9480804000e+02, 3.7166624500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.1722872800e+00, 1.8811764700e-03, -3.4627740800e-07, 1.9465785300e-11, 1.7625429400e-16, 6.1810296400e+01, 2.9576774600e+00 })
    },
    elements = { ["H"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HSO3F = Substance {
    name = "HSO3F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.1192445000e+00, 3.1545710000e-02, -3.1317888000e-05, 1.2461507000e-08, -8.2514630000e-13, -9.2361596000e+04, 1.5559695600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0364190000e+01, 5.3861164000e-03, -2.1231572000e-06, 3.8208343000e-10, -2.5807090000e-14, -9.4398334000e+04, -2.6005503400e+01 })
    },
    elements = { ["H"] = 1, ["S"] = 1, ["O"] = 3, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2 = Substance {
    name = "H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.3443311200e+00, 7.9805207500e-03, -1.9478151000e-05, 2.0157209400e-08, -7.3761176100e-12, -9.1793517300e+02, 6.8301023800e-01 }),
        Range(1000.0, 6000.0, NASA7 { 2.9328657900e+00, 8.2660796700e-04, -1.4640233500e-07, 1.5410035900e-11, -6.8880443200e-16, -8.1306559700e+02, -1.0243288700e+00 })
    },
    elements = { ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2_plus = Substance {
    name = "H2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.7725607200e+00, -1.9574658900e-03, 4.5481204700e-06, -2.8215214100e-09, 5.3396920900e-13, 1.7869410400e+05, -3.9660908600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.4420476500e+00, 5.9908323900e-04, 6.6913368500e-08, -3.4357437300e-11, 1.9762659900e-15, 1.7864968600e+05, -2.7949894900e+00 })
    },
    elements = { ["H"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2_minus = Substance {
    name = "H2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8380142000e+00, -3.1794768000e-03, 1.0043011000e-05, -9.5518116000e-09, 3.1281330000e-12, 2.7234856000e+04, -3.9986236000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.2921076000e+00, 1.4358626000e-03, -5.4705593000e-07, 1.0433883000e-10, -7.3827998000e-15, 2.7216181000e+04, -1.9827777000e+00 })
    },
    elements = { ["H"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HCHO_formaldehy = Substance {
    name = "HCHO,formaldehy",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.7937231500e+00, -9.9083336900e-03, 3.7322000800e-05, -3.7928526100e-08, 1.3177265200e-11, -1.4308956700e+04, 6.0281290000e-01 }),
        Range(1000.0, 6000.0, NASA7 { 3.1695265400e+00, 6.1932058300e-03, -2.2505637700e-06, 3.6597568000e-10, -2.2014947000e-14, -1.4478444400e+04, 6.0420944900e+00 })
    },
    elements = { ["H"] = 2, ["C"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HCOOH = Substance {
    name = "HCOOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2326245300e+00, 2.8112958200e-03, 2.4403497500e-05, -3.1750106600e-08, 1.2063166000e-11, -4.6778560600e+04, 9.8620564700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.6957940400e+00, 7.7223736100e-03, -3.1803780800e-06, 5.5794946600e-10, -3.5261822600e-14, -4.8159972300e+04, -6.0168008000e+00 })
    },
    elements = { ["H"] = 2, ["C"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2F2 = Substance {
    name = "H2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6763312000e+00, 1.2297991000e-02, -1.2455965000e-05, 6.3602523000e-09, -1.1270823000e-12, -7.0123715000e+04, 1.0310929800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.9160389000e+00, 3.9857654000e-03, -1.3558707000e-06, 2.1930921000e-10, -1.3716005000e-14, -7.0594777000e+04, -6.2960589400e-01 })
    },
    elements = { ["H"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2O = Substance {
    name = "H2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.1986405600e+00, -2.0364341000e-03, 6.5204021100e-06, -5.4879706200e-09, 1.7719781700e-12, -3.0293726700e+04, -8.4903220800e-01 }),
        Range(1000.0, 6000.0, NASA7 { 2.6770378700e+00, 2.9731832900e-03, -7.7376969000e-07, 9.4433668900e-11, -4.2690095900e-15, -2.9885893800e+04, 6.8825557100e+00 })
    },
    elements = { ["H"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2O_plus = Substance {
    name = "H2O+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.0246585300e+00, -1.0885096900e-03, 5.1357540000e-06, -4.4002659200e-09, 1.4072627400e-12, 1.1686975700e+05, 6.9997136300e-01 }),
        Range(1000.0, 6000.0, NASA7 { 3.3157046000e+00, 2.1064872800e-03, -3.7634144900e-07, 3.4752590000e-11, -1.7033565100e-15, 1.1699161700e+05, 4.0322044100e+00 })
    },
    elements = { ["H"] = 2, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2O2 = Substance {
    name = "H2O2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.2761126900e+00, -5.4282241700e-04, 1.6733570100e-05, -2.1577081300e-08, 8.6245436300e-12, -1.7754298900e+04, 3.4350507400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.5733353700e+00, 4.0498407000e-03, -1.2947947900e-06, 1.9728171000e-10, -1.1340284600e-14, -1.8054812100e+04, 7.0427848800e-01 })
    },
    elements = { ["H"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2S = Substance {
    name = "H2S",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9323476000e+00, -5.0260905000e-04, 4.5928473000e-06, -3.1807214000e-09, 6.6497561000e-13, -3.6505359000e+03, 2.3157905000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.7452199000e+00, 4.0434607000e-03, -1.5384510000e-06, 2.7520249000e-10, -1.8592095000e-14, -3.4199444000e+03, 8.0546745000e+00 })
    },
    elements = { ["H"] = 2, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H2SO4 = Substance {
    name = "H2SO4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0725680000e+00, 4.3769226000e-02, -5.5333243000e-05, 3.5518253000e-08, -9.0677358000e-12, -9.0259758000e+04, 1.8939582000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0889532000e+01, 7.5004178000e-03, -2.9210478000e-06, 5.2595513000e-10, -3.5789415000e-14, -9.2471364000e+04, -2.9404782000e+01 })
    },
    elements = { ["H"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H3B3O6 = Substance {
    name = "H3B3O6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -2.2705116000e+00, 8.7024894000e-02, -9.1587714000e-05, 3.9445392000e-08, -3.6666035000e-12, -2.7569523000e+05, 3.2529652600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 2.0153579000e+01, 1.3016286000e-02, -5.0669619000e-06, 9.0308253000e-10, -6.0532410000e-14, -2.8104092000e+05, -7.9676332400e+01 })
    },
    elements = { ["H"] = 3, ["B"] = 3, ["O"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H3F3 = Substance {
    name = "H3F3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.0717864000e+00, 3.7279382000e-02, -5.8150292000e-05, 4.5906198000e-08, -1.3987498000e-11, -1.0757859000e+05, 1.3981779000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.5307373000e+00, 6.7165939000e-03, -2.5456700000e-06, 4.4780929000e-10, -2.9894275000e-14, -1.0871794000e+05, -1.6211201000e+01 })
    },
    elements = { ["H"] = 3, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H3O_plus = Substance {
    name = "H3O+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.7929527000e+00, -9.1085400000e-04, 1.1636354900e-05, -1.2136488700e-08, 4.2615966300e-12, 7.0751240100e+04, 1.4715685600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.4964771600e+00, 5.7284492000e-03, -1.8395328100e-06, 2.7357743900e-10, -1.5409398500e-14, 7.0972911300e+04, 7.4585077900e+00 })
    },
    elements = { ["H"] = 3, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H4F4 = Substance {
    name = "H4F4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3821755000e+00, 4.9912451000e-02, -7.7899970000e-05, 6.1503621000e-08, -1.8739812000e-11, -1.4503507000e+05, 1.0805474200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2037385000e+01, 8.9595862000e-03, -3.3960569000e-06, 5.9743653000e-10, -3.9884693000e-14, -1.4656193000e+05, -2.9654603800e+01 })
    },
    elements = { ["H"] = 4, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H5F5 = Substance {
    name = "H5F5",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.6841750000e+00, 6.2605308000e-02, -9.7798989000e-05, 7.7257322000e-08, -2.3550461000e-11, -1.8263159000e+05, 7.4816749700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.5544135000e+01, 1.1202377000e-02, -4.2463163000e-06, 7.4703183000e-10, -4.9872360000e-14, -1.8454686000e+05, -4.3281390200e+01 })
    },
    elements = { ["H"] = 5, ["F"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H6F6 = Substance {
    name = "H6F6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.9963317000e+00, 7.5225773000e-02, -1.1751716000e-04, 9.2821760000e-08, -2.8290457000e-11, -2.2167847000e+05, 3.9643529700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.9050924000e+01, 1.3445093000e-02, -5.0965293000e-06, 8.9661581000e-10, -5.9859072000e-14, -2.2398110000e+05, -5.7059147000e+01 })
    },
    elements = { ["H"] = 6, ["F"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_H7F7 = Substance {
    name = "H7F7",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.3009791000e+00, 8.7899766000e-02, -1.3736908000e-04, 1.0852618000e-07, -3.3082715000e-11, -2.5795177000e+05, 3.6247607800e-01 }),
        Range(1000.0, 5000.0, NASA7 { 2.2557536000e+01, 1.5688152000e-02, -5.9469576000e-06, 1.0462532000e-09, -6.9850351000e-14, -2.6064248000e+05, -7.0952106000e+01 })
    },
    elements = { ["H"] = 7, ["F"] = 7 },
    reference = "",
    aggregation_type = "Gas",
}

local s_He = Substance {
    name = "He",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.4537500000e+02, 9.2872472400e-01 })
    },
    elements = { ["He"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_He_plus = Substance {
    name = "He+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 2.8531508600e+05, 1.6216668400e+00 })
    },
    elements = { ["He"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Hg = Substance {
    name = "Hg",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 6.6369000800e+03, 6.8002015400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5095361100e+00, -1.9882727900e-05, 1.3891084900e-08, -3.9354292000e-12, 3.9095921900e-16, 6.6335806400e+03, 6.7484796600e+00 })
    },
    elements = { ["Hg"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_HgBr2 = Substance {
    name = "HgBr2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.7188921000e+00, 2.5782743000e-03, -2.9180237000e-06, 9.5818442000e-10, 1.3872307000e-13, -1.2371434000e+04, -4.1367082300e-01 }),
        Range(1000.0, 5000.0, NASA7 { 7.4226990000e+00, 7.8687663000e-05, -2.9910307000e-08, 4.8498228000e-12, -2.7930933000e-16, -1.2522020000e+04, -3.8673397100e+00 })
    },
    elements = { ["Hg"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_I = Substance {
    name = "I",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5004168300e+00, -4.4804683100e-06, 1.6996253600e-08, -2.6770803000e-11, 1.4892745200e-14, 1.2094799000e+04, 7.4981658100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.6166771200e+00, -2.6601032000e-04, 1.8606015000e-07, -3.8192747200e-11, 2.5203605300e-15, 1.2058279000e+04, 6.8789665300e+00 })
    },
    elements = { ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_I2 = Substance {
    name = "I2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.8723463400e+00, 3.6426541400e-03, -7.9534919100e-06, 7.8214977300e-09, -2.8060807100e-12, 6.2470642400e+03, 8.4941026700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.5658810200e+00, -3.4222936100e-04, 4.8441097700e-07, -1.4263215700e-10, 1.1495109900e-14, 6.1608543200e+03, 5.4195828600e+00 })
    },
    elements = { ["I"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_K = Substance {
    name = "K",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000071200e+00, -7.2511316600e-08, 2.5906848100e-10, -3.7946091100e-13, 1.9321064100e-16, 9.9588030700e+03, 5.0405451700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.2602672100e+00, 5.6234117900e-04, -4.4855183800e-07, 1.3624349800e-10, -1.0292626800e-14, 1.0034881200e+04, 6.3156820100e+00 })
    },
    elements = { ["K"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_K_plus = Substance {
    name = "K+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 6.1075105100e+04, 4.3474044900e+00 })
    },
    elements = { ["K"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KBO2 = Substance {
    name = "KBO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3967801000e+00, 1.2169202000e-02, -1.1804218000e-05, 5.1316551000e-09, -6.5932720000e-13, -8.2827012000e+04, 7.5732431000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.5502508000e+00, 2.5661823000e-03, -1.0671566000e-06, 1.9851885000e-10, -1.3704168000e-14, -8.3653834000e+04, -8.4927000000e+00 })
    },
    elements = { ["K"] = 1, ["B"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KCN = Substance {
    name = "KCN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.0810711000e+00, 5.5265956000e-03, -9.1157121000e-06, 8.4488817000e-09, -3.0051548000e-12, 7.8662161000e+03, 1.8634686800e-01 }),
        Range(1000.0, 5000.0, NASA7 { 5.8007120000e+00, 1.7200786000e-03, -7.0791074000e-07, 1.3199247000e-10, -9.1908323000e-15, 7.7272628000e+03, -3.1588341900e+00 })
    },
    elements = { ["K"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KCL = Substance {
    name = "KCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9908569000e+00, 2.1089169000e-03, -3.1836530000e-06, 2.2525308000e-09, -5.9094179000e-13, -2.7080184000e+04, 5.5120044500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4636733000e+00, 1.2229207000e-04, -9.1719210000e-09, 9.2648242000e-13, -1.0407917000e-17, -2.7173133000e+04, 3.2480899500e+00 })
    },
    elements = { ["K"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KF = Substance {
    name = "KF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5156066000e+00, 3.7868422000e-03, -5.5864995000e-06, 3.7751438000e-09, -9.3924218000e-13, -4.0476079000e+04, 6.3133854500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4040700000e+00, 1.7833725000e-04, -3.6093797000e-08, 5.8839587000e-12, -3.4694046000e-16, -4.0655889000e+04, 2.0310958500e+00 })
    },
    elements = { ["K"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KF2_minus = Substance {
    name = "KF2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.2507573000e+00, 8.6383718000e-03, -1.3403673000e-05, 9.4140832000e-09, -2.4682602000e-12, -8.5383971000e+04, -4.7722471300e-01 }),
        Range(1000.0, 5000.0, NASA7 { 7.2581638000e+00, 2.6703557000e-04, -1.1384630000e-07, 2.1407685000e-11, -1.4827070000e-15, -8.5780839000e+04, -1.0103278300e+01 })
    },
    elements = { ["K"] = 1, ["F"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KH = Substance {
    name = "KH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8157756000e+00, 3.9871060000e-03, -3.3410548000e-06, 8.8602942000e-10, 1.1402847000e-13, 1.3805838000e+04, 6.7251789900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.9603386000e+00, 7.2190323000e-04, -2.6918715000e-07, 5.2617300000e-11, -3.7872683000e-15, 1.3501837000e+04, 8.5534508300e-01 })
    },
    elements = { ["K"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KO = Substance {
    name = "KO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7410778000e+00, 3.1242017000e-03, -4.8020039000e-06, 3.4660605000e-09, -9.3599791000e-13, 7.3368714000e+03, 6.5669238900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4244778000e+00, 1.9936155000e-04, -3.7128837000e-08, 7.1308300000e-12, -5.0369687000e-16, 7.2052331000e+03, 3.3076684900e+00 })
    },
    elements = { ["K"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KO_minus = Substance {
    name = "KO-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7083660000e+00, 3.2376480000e-03, -4.9690500000e-06, 3.5728846000e-09, -9.6080268000e-13, -1.7818607000e+04, 5.3166258800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4201084000e+00, 2.0124266000e-04, -3.9330996000e-08, 7.5598511000e-12, -5.3442275000e-16, -1.7956109000e+04, 1.9200040800e+00 })
    },
    elements = { ["K"] = 1, ["O"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KOH = Substance {
    name = "KOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0733441000e+00, 9.7217945000e-03, -1.5988804000e-05, 1.2148353000e-08, -3.3709342000e-12, -2.9506558000e+04, 2.9354013600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.6400949000e+00, 1.2510226000e-03, -3.4984547000e-07, 4.4566993000e-11, -2.0870279000e-15, -2.9698732000e+04, -4.0436546400e+00 })
    },
    elements = { ["K"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_KOH_plus = Substance {
    name = "KOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.4325167000e+00, 8.4631625000e-03, -1.4247855000e-05, 1.1106625000e-08, -3.1563612000e-12, 5.8292632000e+04, 2.8733457300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.6806140000e+00, 1.2120951000e-03, -3.3447117000e-07, 4.1727932000e-11, -1.8793913000e-15, 5.8167602000e+04, -2.5541513700e+00 })
    },
    elements = { ["K"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_K2 = Substance {
    name = "K2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.5066512700e+00, -4.3567622100e-04, 3.2661874100e-06, -4.1783510200e-09, 1.1961836700e-12, 1.3528795300e+04, 4.3731891700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 6.9486637100e+00, -3.6046831900e-03, 1.1755319300e-06, -1.7422036700e-10, 9.7030287400e-15, 1.2604434900e+04, -9.3193905100e+00 })
    },
    elements = { ["K"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_K2C2N2 = Substance {
    name = "K2C2N2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.1133058000e+01, 1.1516362000e-02, -1.9476533000e-05, 1.8169859000e-08, -6.4647252000e-12, -4.6980693000e+03, -2.1267959100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2625754000e+01, 3.4123996000e-03, -1.4034888000e-06, 2.6156396000e-10, -1.8206865000e-14, -4.9753614000e+03, -2.8153891100e+01 })
    },
    elements = { ["K"] = 2, ["C"] = 2, ["N"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_K2CL2 = Substance {
    name = "K2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 8.7067974000e+00, 6.0154047000e-03, -1.1303939000e-05, 9.6620814000e-09, -3.1055657000e-12, -7.7067696000e+04, -8.5375472500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.9041069000e+00, 1.1179707000e-04, -5.0391197000e-08, 9.9934614000e-12, -7.2703009000e-16, -7.7272330000e+04, -1.4090282000e+01 })
    },
    elements = { ["K"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_K2F2 = Substance {
    name = "K2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.8329504000e+00, 8.9240831000e-03, -1.4719852000e-05, 1.0982469000e-08, -3.0721720000e-12, -1.0638752000e+05, -8.2423828100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.8148096000e+00, 2.0453081000e-04, -8.7071665000e-08, 1.6337227000e-11, -1.1287256000e-15, -1.0675987000e+05, -1.7641803000e+01 })
    },
    elements = { ["K"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_K2O2H2 = Substance {
    name = "K2O2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.9190596000e+00, 1.0300703000e-02, -2.5173296000e-07, -7.7450014000e-09, 4.0796041000e-12, -8.1260548000e+04, -2.9728564400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.5097722000e+00, 5.4167066000e-03, -1.9223532000e-06, 3.1866066000e-10, -2.0152508000e-14, -8.2048352000e+04, -1.6812505900e+01 })
    },
    elements = { ["K"] = 2, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_K2SO4 = Substance {
    name = "K2SO4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4758520000e+00, 4.8773237000e-02, -6.8420080000e-05, 4.6886316000e-08, -1.2721082000e-11, -1.3428085000e+05, 1.2344828600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.5374108000e+01, 4.1056139000e-03, -1.8148935000e-06, 3.5497243000e-10, -2.5558754000e-14, -1.3695329000e+05, -4.6143815400e+01 })
    },
    elements = { ["K"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Kr = Substance {
    name = "Kr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.4537500000e+02, 5.4909565100e+00 })
    },
    elements = { ["Kr"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Kr_plus = Substance {
    name = "Kr+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.4815354600e+00, 1.4986467600e-04, -4.1557659000e-07, 4.4023754700e-10, -1.1937474600e-13, 1.6246059200e+05, 6.9525799800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.1896872500e+00, 4.6377568900e-04, -1.2950748200e-07, 1.3115868800e-11, -3.8497798700e-16, 1.6258311000e+05, 8.6242768800e+00 })
    },
    elements = { ["Kr"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li = Substance {
    name = "Li",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.8413902000e+04, 2.4476229700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5041310700e+00, 3.4560470400e-05, -6.4479001800e-08, 2.7575296600e-11, -1.7878393500e-15, 1.8407447400e+04, 2.4080207400e+00 })
    },
    elements = { ["Li"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li_plus = Substance {
    name = "Li+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 8.1727194000e+04, 1.7543575400e+00 })
    },
    elements = { ["Li"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiALF4 = Substance {
    name = "LiALF4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5403421000e+00, 5.1985881000e-02, -8.6188031000e-05, 6.7496816000e-08, -2.0367509000e-11, -2.2535767000e+05, 1.2571932000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.4037742000e+01, 2.2482642000e-03, -1.0010002000e-06, 1.9670249000e-10, -1.4208886000e-14, -2.2762757000e+05, -4.2360148000e+01 })
    },
    elements = { ["Li"] = 1, ["Al"] = 1, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiBO2 = Substance {
    name = "LiBO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7435474000e+00, 1.4475257000e-02, -1.5209688000e-05, 7.4136541000e-09, -1.2242191000e-12, -7.9437756000e+04, 8.0120256400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.4266096000e+00, 2.7043757000e-03, -1.1284741000e-06, 2.1062398000e-10, -1.4584909000e-14, -8.0370285000e+04, -1.0600791800e+01 })
    },
    elements = { ["Li"] = 1, ["B"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiCL = Substance {
    name = "LiCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9906906000e+00, 5.0338642000e-03, -6.5671979000e-06, 3.8050160000e-09, -7.6117455000e-13, -2.4603182000e+04, 7.3281844800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.2712143000e+00, 3.1400291000e-04, -1.0123130000e-07, 1.8451853000e-11, -1.2398731000e-15, -2.4884442000e+04, 1.0417215800e+00 })
    },
    elements = { ["Li"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiF = Substance {
    name = "LiF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8528869000e+00, 3.9532781000e-03, -3.1724985000e-06, 4.3244397000e-10, 3.7055667000e-13, -4.1987265000e+04, 6.7910288700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.0430248000e+00, 5.7041054000e-04, -2.1454144000e-07, 4.0609013000e-11, -2.8357920000e-15, -4.2299318000e+04, 6.9769546700e-01 })
    },
    elements = { ["Li"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiFO = Substance {
    name = "LiFO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5001790000e+00, 1.2661717000e-02, -1.4157589000e-05, 6.4506374000e-09, -7.4261431000e-13, -1.2265534000e+04, 1.2144018200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.9926109000e+00, 1.1139200000e-03, -4.7888493000e-07, 9.1068332000e-11, -6.3849123000e-15, -1.3100989000e+04, -5.3366032900e+00 })
    },
    elements = { ["Li"] = 1, ["F"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiF2_minus = Substance {
    name = "LiF2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4718136000e+00, 1.0636713000e-02, -1.1777646000e-05, 5.6765487000e-09, -8.4659840000e-13, -8.6963111000e+04, 5.1409279500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.3448590000e+00, 1.2571272000e-03, -5.3522830000e-07, 1.0113025000e-10, -7.0581744000e-15, -8.7667890000e+04, -9.2984028500e+00 })
    },
    elements = { ["Li"] = 1, ["F"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiH = Substance {
    name = "LiH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4209486000e+00, -6.8067366000e-04, 5.6527381000e-06, -6.2180348000e-09, 2.1531755000e-12, 1.5884945000e+04, 1.0657419400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.5884297000e+00, 1.0727691000e-03, -4.0194588000e-07, 7.3828557000e-11, -4.9269644000e-15, 1.5717625000e+04, -3.7503896500e-01 })
    },
    elements = { ["Li"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiN = Substance {
    name = "LiN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8894300000e+00, 5.2212534000e-03, -6.5969021000e-06, 3.7288997000e-09, -7.2355143000e-13, 3.9216323000e+04, 7.2888714500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.2258077000e+00, 3.9667187000e-04, -1.2493993000e-07, 2.3174759000e-11, -1.5851917000e-15, 3.8916952000e+04, 7.0085148100e-01 })
    },
    elements = { ["Li"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiO = Substance {
    name = "LiO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8389007000e+00, 5.1538626000e-03, -6.3082382000e-06, 3.4114385000e-09, -6.1631343000e-13, 9.0884314000e+03, 7.9131178900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1876205000e+00, 4.1186574000e-04, -1.4520296000e-07, 2.7253070000e-11, -1.8864775000e-15, 8.7795259000e+03, 1.2314259900e+00 })
    },
    elements = { ["Li"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiO_minus = Substance {
    name = "LiO-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8515866000e+00, 5.0169880000e-03, -5.9547475000e-06, 3.0399451000e-09, -4.7872969000e-13, -9.0778076000e+03, 6.4594706700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1810217000e+00, 4.1785000000e-04, -1.5024845000e-07, 2.8397732000e-11, -1.9789181000e-15, -9.3849702000e+03, -1.4239233700e-01 })
    },
    elements = { ["Li"] = 1, ["O"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiOH = Substance {
    name = "LiOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3462300000e+00, 1.1787253000e-02, -1.8252657000e-05, 1.3085614000e-08, -3.4328742000e-12, -2.9564636000e+04, 3.4612333000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.5096957000e+00, 1.3685464000e-03, -3.9441469000e-07, 5.2332195000e-11, -2.5958676000e-15, -2.9899231000e+04, -6.5070160000e+00 })
    },
    elements = { ["Li"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiOH_plus = Substance {
    name = "LiOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6379739000e+00, 1.0897154000e-02, -1.7229670000e-05, 1.2667927000e-08, -3.4165259000e-12, 9.2161193000e+04, 3.6377609200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.5329269000e+00, 1.3777931000e-03, -4.0659309000e-07, 5.5590910000e-11, -2.8604624000e-15, 9.1888579000e+04, -4.9935926800e+00 })
    },
    elements = { ["Li"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_LiON = Substance {
    name = "LiON",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6701164000e+00, 7.2568177000e-03, -5.8681146000e-06, 1.1628312000e-09, 4.2704122000e-13, 2.0271703000e+04, 6.6824951100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.8123496000e+00, 1.2870626000e-03, -5.4667710000e-07, 1.0314987000e-10, -7.1930447000e-15, 1.9692302000e+04, -4.3447055900e+00 })
    },
    elements = { ["Li"] = 1, ["O"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li2 = Substance {
    name = "Li2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2159049000e+00, 7.0938974800e-03, -1.5072337000e-05, 1.4868488200e-08, -5.4374025600e-12, 2.4798877200e+04, 3.8048900400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.5839393500e+00, -7.8769940200e-04, -3.8487812000e-07, 2.9113303900e-10, -3.3943847500e-14, 2.4039468600e+04, -8.5067912700e+00 })
    },
    elements = { ["Li"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li2CL2 = Substance {
    name = "Li2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.2801351000e+00, 1.8384100000e-02, -2.8769448000e-05, 2.0313359000e-08, -5.3433247000e-12, -7.4160003000e+04, 2.7927942200e-01 }),
        Range(1000.0, 5000.0, NASA7 { 9.5245614000e+00, 5.2458834000e-04, -2.2337949000e-07, 4.1951114000e-11, -2.9021306000e-15, -7.4990263000e+04, -2.0031671600e+01 })
    },
    elements = { ["Li"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li2F2 = Substance {
    name = "Li2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4007508000e+00, 2.7066237000e-02, -3.9256180000e-05, 2.5722599000e-08, -6.2237225000e-12, -1.1501091000e+05, 1.0891778800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.9566636000e+00, 1.1719269000e-03, -5.0990504000e-07, 9.7917534000e-11, -6.9215602000e-15, -1.1637228000e+05, -2.0886331200e+01 })
    },
    elements = { ["Li"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li2O = Substance {
    name = "Li2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9721708000e+00, 9.2460921000e-03, -9.3596149000e-06, 3.4639160000e-09, -7.5658880000e-14, -2.1596988000e+04, 2.5523040900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.6198748000e+00, 9.6879448000e-04, -4.1490506000e-07, 7.8637337000e-11, -5.4969292000e-15, -2.2255325000e+04, -1.0821559000e+01 })
    },
    elements = { ["Li"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li2O2 = Substance {
    name = "Li2O2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.5375232000e+00, 1.7344223000e-02, -2.7197971000e-05, 1.9305629000e-08, -5.1207957000e-12, -3.1402044000e+04, -2.7683129100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.5275260000e+00, 5.3021013000e-04, -2.3005862000e-07, 4.4030831000e-11, -3.1018702000e-15, -3.2182484000e+04, -2.1859112000e+01 })
    },
    elements = { ["Li"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li2O2H2 = Substance {
    name = "Li2O2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8646637000e+00, 2.5237309000e-02, -2.2632791000e-05, 7.4632713000e-09, 2.2925498000e-13, -8.7338811000e+04, 9.5431296000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 8.9936129000e+00, 6.0039633000e-03, -2.1810181000e-06, 3.6888726000e-10, -2.3738014000e-14, -8.8844150000e+04, -2.1358649500e+01 })
    },
    elements = { ["Li"] = 2, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li2SO4 = Substance {
    name = "Li2SO4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.1145725000e-01, 5.9451179000e-02, -8.6363490000e-05, 6.1171087000e-08, -1.7098923000e-11, -1.2750842000e+05, 2.0380327900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.4929595000e+01, 4.6097474000e-03, -2.0379556000e-06, 3.9862579000e-10, -2.8703030000e-14, -1.3063528000e+05, -4.9166491100e+01 })
    },
    elements = { ["Li"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li3CL3 = Substance {
    name = "Li3CL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.5745959000e+00, 3.9749239000e-02, -5.6508213000e-05, 3.6294145000e-08, -8.5784700000e-12, -1.2353351000e+05, 4.6805965800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.4319440000e+01, 1.8854007000e-03, -8.1978330000e-07, 1.5735494000e-10, -1.1119472000e-14, -1.2558851000e+05, -4.2711022600e+01 })
    },
    elements = { ["Li"] = 3, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Li3F3 = Substance {
    name = "Li3F3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.6413975000e+00, 3.9878696000e-02, -5.7248991000e-05, 3.7193544000e-08, -8.9230125000e-12, -1.8519852000e+05, 2.1623596700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.4364422000e+01, 1.8285498000e-03, -7.9221159000e-07, 1.5154529000e-10, -1.0675673000e-14, -1.8723736000e+05, -4.5060913000e+01 })
    },
    elements = { ["Li"] = 3, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Mg = Substance {
    name = "Mg",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.6946587600e+04, 3.6343301400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.3166448400e+00, 3.6586633900e-04, -2.3322780300e-07, 5.3711757000e-11, -2.9951306500e-15, 1.7011923300e+04, 4.6344951600e+00 })
    },
    elements = { ["Mg"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Mg_plus = Substance {
    name = "Mg+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.0642233500e+05, 4.3274435500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5041657400e+00, -9.1934096600e-06, 6.9617147800e-09, -2.1749493800e-12, 2.4090334600e-16, 1.0642094100e+05, 4.3050449400e+00 })
    },
    elements = { ["Mg"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgBr = Substance {
    name = "MgBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5107285000e+00, 4.4528510000e-03, -8.0124075000e-06, 6.7066900000e-09, -2.1232718000e-12, -5.4368257000e+03, 8.4314899900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4099854000e+00, 1.6021736000e-04, -4.1501223000e-08, 5.9370342000e-12, -4.8231573000e-17, -5.5961909000e+03, 4.2296030900e+00 })
    },
    elements = { ["Mg"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgBr2 = Substance {
    name = "MgBr2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.7139102000e+00, 7.7321617000e-03, -1.3865793000e-05, 1.1477900000e-08, -3.6057884000e-12, -3.8379483000e+04, 1.8686022900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.3215100000e+00, 2.0643725000e-04, -9.2489208000e-08, 1.8255838000e-11, -1.3231170000e-15, -3.8671304000e+04, -5.6784659100e+00 })
    },
    elements = { ["Mg"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgCL = Substance {
    name = "MgCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3800534000e+00, 4.2813389000e-03, -6.4457333000e-06, 4.4472291000e-09, -1.1421727000e-12, -6.3826560000e+03, 7.7889881600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3775833000e+00, 1.8834178000e-04, -5.4488592000e-08, 9.9481031000e-12, -6.6949611000e-16, -6.5830826000e+03, 2.9893886600e+00 })
    },
    elements = { ["Mg"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgCL_plus = Substance {
    name = "MgCL+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6012230000e+00, 3.4791859000e-03, -5.1353143000e-06, 3.4446337000e-09, -8.3848206000e-13, 7.7314688000e+04, 6.1338593300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.3512344000e+00, -3.7967190000e-03, 2.4712945000e-06, -5.0823653000e-10, 3.3672625000e-14, 7.6480879000e+04, -8.2903622700e+00 })
    },
    elements = { ["Mg"] = 1, ["Cl"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgCLF = Substance {
    name = "MgCLF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.1570429300e+00, 1.6453479000e-02, -3.0112686900e-05, 2.5797460600e-08, -8.4248754700e-12, -6.9891004000e+04, 1.0225540200e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.5708225200e+00, 4.4887620800e-04, -1.7799481900e-07, 3.0631820500e-11, -1.9155454400e-15, -7.0523597700e+04, -5.8355541400e+00 })
    },
    elements = { ["Mg"] = 1, ["Cl"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgCL2 = Substance {
    name = "MgCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.4095529000e+00, 7.7206281000e-03, -1.1620094000e-05, 7.9417889000e-09, -2.0252502000e-12, -4.9070537000e+04, 6.4715808400e-01 }),
        Range(1000.0, 5000.0, NASA7 { 7.2401913000e+00, 2.8856239000e-04, -1.2401187000e-07, 2.3527101000e-11, -1.6443205000e-15, -4.9442326000e+04, -8.1809014600e+00 })
    },
    elements = { ["Mg"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgF = Substance {
    name = "MgF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6570752000e+00, 6.6826135000e-03, -1.0331156000e-05, 7.6871766000e-09, -2.2245057000e-12, -2.9494890000e+04, 9.8550804100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1922119000e+00, 4.0362644000e-04, -1.5097631000e-07, 2.8169221000e-11, -1.8275892000e-15, -2.9813710000e+04, 2.4369621100e+00 })
    },
    elements = { ["Mg"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgF_plus = Substance {
    name = "MgF+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4387654000e+00, 2.2252654000e-03, -5.4621202000e-06, 1.4084276000e-08, -8.0726906000e-12, 6.0515666000e+04, 5.7783545600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3681057000e+00, 4.1175966000e-03, -2.9394797000e-06, 7.2711843000e-10, -5.9844802000e-14, 5.9536000000e+04, -1.3457779400e+00 })
    },
    elements = { ["Mg"] = 1, ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgF2 = Substance {
    name = "MgF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3479058000e+00, 1.3115297000e-02, -2.0541607000e-05, 1.5395784000e-08, -4.4909041000e-12, -8.8838874000e+04, 8.6519021100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.3642073000e+00, 7.2627827000e-04, -3.2280046000e-07, 6.3363666000e-11, -4.5738437000e-15, -8.9464429000e+04, -5.9151307900e+00 })
    },
    elements = { ["Mg"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgF2_plus = Substance {
    name = "MgF2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5212884000e+00, 1.5269556000e-02, -2.5180089000e-05, 1.9635499000e-08, -5.9054919000e-12, 6.9658388000e+04, 7.3902094500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8910673000e+00, 7.1781283000e-04, -3.2941172000e-07, 6.5881128000e-11, -4.5873228000e-15, 6.8993145000e+04, -8.7130139500e+00 })
    },
    elements = { ["Mg"] = 1, ["F"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgH = Substance {
    name = "MgH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5102397000e+00, -1.2368352000e-03, 6.4246998000e-06, -6.6054846000e-09, 2.2003625000e-12, 1.9293893000e+04, 3.3736541600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.4638591000e+00, 1.2404055000e-03, -5.0278210000e-07, 9.8118834000e-11, -6.6183068000e-15, 1.9176310000e+04, 2.9977518600e+00 })
    },
    elements = { ["Mg"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgI = Substance {
    name = "MgI",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.3959660600e+00, 6.1149486600e-03, -1.3154414600e-05, 1.2725931100e-08, -4.5341429700e-12, 1.7693362800e+03, 9.6958650800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.4124559900e+00, 1.7891091400e-04, -5.2298667900e-08, 9.6871348600e-12, -4.6711378600e-16, 1.6258190700e+03, 5.1645101800e+00 })
    },
    elements = { ["Mg"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgI2 = Substance {
    name = "MgI2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.1081426000e+00, 6.1462118000e-03, -1.1166527000e-05, 9.3266525000e-09, -2.9487166000e-12, -2.1286323000e+04, 1.9712668700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.3711162000e+00, 1.4941954000e-04, -6.7067738000e-08, 1.3257559000e-11, -9.6200502000e-16, -2.1511923000e+04, -3.9384566300e+00 })
    },
    elements = { ["Mg"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgN = Substance {
    name = "MgN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8894549000e+00, 5.1757175000e-03, -6.5849016000e-06, 3.7218933000e-09, -7.2305964000e-13, 3.3681058000e+04, 9.2975894600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.2214417000e+00, 3.6489240000e-04, -1.2995730000e-07, 2.4418940000e-11, -1.6917759000e-15, 3.3382931000e+04, 2.7320519600e+00 })
    },
    elements = { ["Mg"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgO = Substance {
    name = "MgO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.3353497000e+00, -1.3339134000e-02, 3.5667526000e-05, -2.6057471000e-08, 4.9841196000e-12, 5.7315573000e+03, -2.1327768100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.9494428000e+00, -1.2640755000e-03, -2.4009730000e-07, 1.6273277000e-10, -1.7611909000e-14, 3.4944384000e+03, -2.1801173000e+01 })
    },
    elements = { ["Mg"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgOH = Substance {
    name = "MgOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.7624357000e+00, 1.9167005000e-02, -3.3219318000e-05, 2.7158978000e-08, -8.3889275000e-12, -2.0949182000e+04, 1.2734452500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.2671424000e+00, 1.6782720000e-03, -5.4309173000e-07, 8.2563349000e-11, -4.7133513000e-15, -2.1509336000e+04, -3.3951655600e+00 })
    },
    elements = { ["Mg"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgOH_plus = Substance {
    name = "MgOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.7831421000e+00, 1.9228527000e-02, -3.3503143000e-05, 2.7491364000e-08, -8.5151007000e-12, 6.9150584000e+04, 1.1930523600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.2824479000e+00, 1.6640437000e-03, -5.4016651000e-07, 8.3467824000e-11, -5.0036168000e-15, 6.8595816000e+04, -4.1503886300e+00 })
    },
    elements = { ["Mg"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgO2H2 = Substance {
    name = "MgO2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.5494750000e+00, 3.8270480000e-02, -6.6509328000e-05, 5.4536294000e-08, -1.6891338000e-11, -7.0516754000e+04, 1.4417036100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.5178384000e+00, 3.3791380000e-03, -1.1022033000e-06, 1.7111179000e-10, -1.0302286000e-14, -7.1626731000e+04, -1.7629464900e+01 })
    },
    elements = { ["Mg"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MgS = Substance {
    name = "MgS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.8089215000e+00, -3.2493595000e-02, 9.2517257000e-05, -9.0965203000e-08, 2.9725631000e-11, 1.5932290000e+04, -1.1047905300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0358565000e+01, -5.5307085000e-03, 2.0951199000e-06, -3.5224838000e-10, 2.2282736000e-14, 1.3329346000e+04, -3.3190522300e+01 })
    },
    elements = { ["Mg"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Mg2 = Substance {
    name = "Mg2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.6654891700e+00, -1.8120798300e-02, 4.0570623300e-05, -4.0072009100e-08, 1.4504046300e-11, 3.3428075300e+04, 5.3309571100e-01 }),
        Range(1000.0, 6000.0, NASA7 { 1.5549930800e+00, 3.1377193200e-03, -3.1549740100e-06, 1.1181519900e-09, -1.0853900100e-13, 3.4109488500e+04, 1.9454770400e+01 })
    },
    elements = { ["Mg"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Mg2F4 = Substance {
    name = "Mg2F4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.2299053000e+00, 4.9290849000e-02, -8.6449672000e-05, 7.0459371000e-08, -2.1887110000e-11, -2.0949299000e+05, 5.0032361500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.4672016000e+01, 1.5299318000e-03, -6.8347117000e-07, 1.3460469000e-10, -9.7383398000e-15, -2.1143766000e+05, -4.4278244000e+01 })
    },
    elements = { ["Mg"] = 2, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_MoO3 = Substance {
    name = "MoO3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.6543121000e+00, 1.4490992000e-02, -7.6681390000e-06, -6.0984640000e-09, 5.1825809000e-12, -4.5483094000e+04, 8.5052188900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 8.5599079000e+00, 1.5136907000e-03, -6.1373260000e-07, 1.0758890000e-10, -6.2277555000e-15, -4.6765270000e+04, -1.6702825000e+01 })
    },
    elements = { ["Mo"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Mo2O6 = Substance {
    name = "Mo2O6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 7.7546721000e+00, 3.2625064000e-02, -1.6659906000e-05, -1.5039600000e-08, 1.2360358000e-11, -1.4183338000e+05, -6.4509273100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.3923332000e+01, 1.2908749000e-02, -7.3929386000e-06, 1.7454109000e-09, -1.4410668000e-13, -1.4292831000e+05, -3.6448614000e+01 })
    },
    elements = { ["Mo"] = 2, ["O"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Mo3O9 = Substance {
    name = "Mo3O9",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.3577424000e+01, 4.5389310000e-02, -2.1305954000e-05, -2.2867766000e-08, 1.7752327000e-11, -2.3459688000e+05, -2.8577139000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 2.2262299000e+01, 1.8584967000e-02, -1.0589357000e-05, 2.4926752000e-09, -2.0542536000e-13, -2.3620038000e+05, -7.1088186000e+01 })
    },
    elements = { ["Mo"] = 3, ["O"] = 9 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Mo4O12 = Substance {
    name = "Mo4O12",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.8727478000e+01, 6.1159499000e-02, -2.9141913000e-05, -3.0658050000e-08, 2.4011820000e-11, -3.2376594000e+05, -5.0088384000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.0431747000e+01, 2.4732646000e-02, -1.4118549000e-05, 3.3271292000e-09, -2.7439016000e-13, -3.2590363000e+05, -1.0728033700e+02 })
    },
    elements = { ["Mo"] = 4, ["O"] = 12 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Mo5O15 = Substance {
    name = "Mo5O15",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.3887054000e+01, 7.6141000000e-02, -3.5174729000e-05, -3.9864865000e-08, 3.0631123000e-11, -4.1052106000e+05, -7.1604177000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.8622543000e+01, 3.0742742000e-02, -1.7536047000e-05, 4.1306230000e-09, -3.4055771000e-13, -4.1324156000e+05, -1.4373675700e+02 })
    },
    elements = { ["Mo"] = 5, ["O"] = 15 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N = Substance {
    name = "N",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 5.6104637800e+04, 4.1939093200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.4159429300e+00, 1.7489060000e-04, -1.1902366700e-07, 3.0226238700e-11, -2.0360979000e-15, 5.6133774800e+04, 4.6496098600e+00 })
    },
    elements = { ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N_plus = Substance {
    name = "N+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.8026944500e+00, -1.4475891100e-03, 2.7711838000e-06, -2.4018735200e-09, 7.8083993100e-13, 2.2557524400e+05, 3.5787783500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5111296700e+00, 3.4644175100e-06, -1.5942693800e-08, 7.2486566300e-12, -6.4450142600e-16, 2.2562434000e+05, 4.9276766100e+00 })
    },
    elements = { ["N"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N_minus = Substance {
    name = "N-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.6272340300e+00, -5.9344501800e-04, 1.1202891600e-06, -9.6258560300e-10, 3.1111955700e-13, 5.6188087100e+04, 4.4011117600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5089709900e+00, -9.5841275100e-06, 3.8521006200e-09, -6.6893599800e-13, 4.2099117200e-17, 5.6208301700e+04, 4.9495320200e+00 })
    },
    elements = { ["N"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NCO = Substance {
    name = "NCO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.7545239200e+00, 9.2300803700e-03, -9.2800662900e-06, 5.6252138100e-09, -1.6120014400e-12, 2.0184295400e+04, 9.8536877300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.1525571700e+00, 2.3094559400e-03, -8.8369951900e-07, 1.4852534600e-10, -9.0885790500e-15, 1.9496375000e+04, -2.5640635000e+00 })
    },
    elements = { ["N"] = 1, ["C"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ND = Substance {
    name = "ND",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.7206488000e+00, -1.5341848000e-03, 3.1877426000e-06, -1.5091401000e-09, 9.7126114000e-14, 4.4072756000e+04, 1.6495567200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.8297034000e+00, 1.6584175000e-03, -6.3287333000e-07, 1.1477685000e-10, -7.8318584000e-15, 4.4255951000e+04, 6.0066288200e+00 })
    },
    elements = { ["N"] = 1, ["D"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ND2 = Substance {
    name = "ND2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.0269780000e+00, -1.4085128000e-03, 7.7765815000e-06, -6.4967575000e-09, 1.7554170000e-12, 2.1098028000e+04, 1.7548429500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.3515391000e+00, 3.3763162000e-03, -1.3213457000e-06, 2.6800679000e-10, -2.0810174000e-14, 2.1077749000e+04, 4.3738797500e+00 })
    },
    elements = { ["N"] = 1, ["D"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ND3 = Substance {
    name = "ND3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.9427839000e+00, 5.1035291000e-03, 2.7392821000e-06, -4.6847662000e-09, 1.6276674000e-12, -8.1651563000e+03, 6.1552203800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.1961566000e+00, 6.7311758000e-03, -2.6423400000e-06, 4.7630868000e-10, -3.2804828000e-14, -8.3966527000e+03, 4.1629071800e+00 })
    },
    elements = { ["N"] = 1, ["D"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NF = Substance {
    name = "NF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.5992799900e+00, -2.1819078800e-03, 1.1410685300e-05, -1.4006849400e-08, 5.5333263800e-12, 2.6970252500e+04, 5.3557360300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.0604229200e+00, 3.5065485000e-04, -6.9572181500e-08, 1.4592545400e-11, -1.5637240100e-15, 2.6671198200e+04, 2.0877480500e+00 })
    },
    elements = { ["N"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NF2 = Substance {
    name = "NF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.1823381000e+00, 1.3070008000e-02, -1.5147887000e-05, 8.2336460000e-09, -1.6858864000e-12, 3.0263247000e+03, 1.4296736000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.6710998000e+00, 1.5249064000e-03, -6.6432050000e-07, 1.2988209000e-10, -9.3489162000e-15, 2.1728918000e+03, -3.2173372600e+00 })
    },
    elements = { ["N"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NF3 = Substance {
    name = "NF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.4741287000e-01, 3.0750479000e-02, -4.2586086000e-05, 2.8843209000e-08, -7.7034655000e-12, -1.6987504000e+04, 2.1873493800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.8419964000e+00, 2.6927592000e-03, -1.0801306000e-06, 2.1221256000e-10, -1.5288124000e-14, -1.8668432000e+04, -1.4970892200e+01 })
    },
    elements = { ["N"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NH = Substance {
    name = "NH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.4929503700e+00, 3.1179572200e-04, -1.4890662800e-06, 2.4816740300e-09, -1.0357091600e-12, 4.1894294000e+04, 1.8483497400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.7837264500e+00, 1.3298588600e-03, -4.2478556500e-07, 7.8349442500e-11, -5.5045129800e-15, 4.2134516300e+04, 5.7408485700e+00 })
    },
    elements = { ["N"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NH_plus = Substance {
    name = "NH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.6161113600e+00, -3.1343567700e-03, 2.9170513000e-06, 2.5738484800e-10, -7.3143134700e-13, 1.9908504300e+05, -2.9275846000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.9591898000e+00, 1.3499171900e-03, -4.6148778200e-07, 8.2697766600e-11, -5.5575891300e-15, 1.9952450500e+05, 5.5997802100e+00 })
    },
    elements = { ["N"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NHF = Substance {
    name = "NHF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.5079049000e+00, 1.4688570000e-03, 5.1389319000e-06, -7.0764293000e-09, 2.7315652000e-12, 1.2326621000e+04, 7.1628005600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.7055156000e+00, 3.0592838000e-03, -1.1948189000e-06, 2.1532041000e-10, -1.4471285000e-14, 1.2171317000e+04, 5.6301284600e+00 })
    },
    elements = { ["N"] = 1, ["H"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NHF2 = Substance {
    name = "NHF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.2067481000e+00, 1.1877401000e-02, -5.5012693000e-06, -2.1911219000e-09, 1.9746181000e-12, -1.3522141000e+04, 1.4551031200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.2875615000e+00, 4.6332330000e-03, -1.8773749000e-06, 3.4699303000e-10, -2.4036750000e-14, -1.4423633000e+04, -1.6446281500e+00 })
    },
    elements = { ["N"] = 1, ["H"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NH2 = Substance {
    name = "NH2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.2055685700e+00, -2.1356136300e-03, 7.2685130100e-06, -5.9306987600e-09, 1.8069097800e-12, 2.1535223100e+04, -1.4666277000e-01 }),
        Range(1000.0, 6000.0, NASA7 { 2.8476899200e+00, 3.1428003500e-03, -8.9864145800e-07, 1.3031828400e-10, -7.4881292600e-15, 2.1823904900e+04, 6.4716543300e+00 })
    },
    elements = { ["N"] = 1, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NH2F = Substance {
    name = "NH2F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.6463427000e+00, -1.1229914000e-03, 1.7156086000e-05, -1.9033368000e-08, 6.7384595000e-12, -1.0175002000e+04, 6.5572710700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.0316886000e+00, 6.4223937000e-03, -2.4832754000e-06, 4.4370331000e-10, -2.9981100000e-14, -1.0302167000e+04, 8.2771998700e+00 })
    },
    elements = { ["N"] = 1, ["H"] = 2, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NH3 = Substance {
    name = "NH3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.3017780800e+00, -4.7712733000e-03, 2.1934161900e-05, -2.2985648900e-08, 8.2899226800e-12, -6.7480639400e+03, -6.9064439300e-01 }),
        Range(1000.0, 6000.0, NASA7 { 2.7170969200e+00, 5.5685633800e-03, -1.7688639600e-06, 2.6741726000e-10, -1.5273141900e-14, -6.5845198900e+03, 6.0928983700e+00 })
    },
    elements = { ["N"] = 1, ["H"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NH2OH = Substance {
    name = "NH2OH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2101607600e+00, 6.1967178000e-03, 1.1059491300e-05, -1.9666820700e-08, 8.8251631100e-12, -7.3091283900e+03, 7.9329364000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.8811236200e+00, 8.1570871900e-03, -2.8261574200e-06, 4.3793133000e-10, -2.5272492100e-14, -7.5878272700e+03, 3.7915690100e+00 })
    },
    elements = { ["N"] = 1, ["H"] = 3, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NH4_plus = Substance {
    name = "NH4+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 5.0220927800e+00, -1.1709896000e-02, 3.9760011200e-05, -3.6941987100e-08, 1.2026448300e-11, 7.6302975400e+04, -4.2052228600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.3157031100e+00, 9.6492665300e-03, -3.2904959500e-06, 5.1204539600e-10, -2.9849906000e-14, 7.6727704400e+04, 1.2093098100e+01 })
    },
    elements = { ["N"] = 1, ["H"] = 4, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_False = Substance {
    name = "False",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.2185989600e+00, -4.6398812400e-03, 1.1044304900e-05, -9.3405550700e-09, 2.8055487400e-12, 9.8450996400e+03, 2.2806100100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.2607123400e+00, 1.1910113500e-03, -4.2912264600e-07, 6.9448146300e-11, -4.0329568100e-15, 9.9214313200e+03, 6.3690051800e+00 })
    },
    elements = { ["N"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NO_plus = Substance {
    name = "NO+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.6930123100e+00, -1.3422915800e-03, 2.6734339500e-06, -1.0260930800e-09, -6.9561049200e-14, 1.1810305500e+05, 3.0912669800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.9458770200e+00, 1.4032526000e-03, -4.9550319600e-07, 7.9594897300e-11, -4.7207666800e-15, 1.1824434000e+05, 6.7064464100e+00 })
    },
    elements = { ["N"] = 1, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NOCL = Substance {
    name = "NOCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.8429363000e+00, 7.3075720000e-03, -9.1400726000e-06, 6.6611758000e-09, -2.0502905000e-12, 4.9364872000e+03, 7.7407940300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.8695676000e+00, 9.3218476000e-04, -2.5235542000e-07, 8.0944493000e-11, -9.0203727000e-15, 4.3717810000e+03, -2.6440575700e+00 })
    },
    elements = { ["N"] = 1, ["O"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NOF = Substance {
    name = "NOF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.0167890000e+00, 9.4074590000e-03, -1.1410368000e-05, 7.7515700000e-09, -2.2232888000e-12, -9.0487593000e+03, 1.0304342300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.9878162000e+00, 2.4382250000e-03, -1.1104045000e-06, 2.4541367000e-10, -1.8888813000e-14, -9.5328315000e+03, 4.5917334900e-01 })
    },
    elements = { ["N"] = 1, ["O"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NOF3 = Substance {
    name = "NOF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.5785883000e-01, 4.1884825000e-02, -6.2731005000e-05, 4.6190483000e-08, -1.3412026000e-11, -2.3930423000e+04, 2.2423423700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 9.8160298000e+00, 3.5462215000e-03, -1.5521269000e-06, 3.0163503000e-10, -2.1622909000e-14, -2.6018120000e+04, -2.4595011300e+01 })
    },
    elements = { ["N"] = 1, ["O"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NO2 = Substance {
    name = "NO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.9440390700e+00, -1.5854744400e-03, 1.6657898400e-05, -2.0475447800e-08, 7.8350326500e-12, 2.8965986500e+03, 6.3119622500e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.8847442900e+00, 2.1724163900e-03, -8.2807902000e-07, 1.5747729300e-10, -1.0511054900e-14, 2.3164846200e+03, -1.1735707500e-01 })
    },
    elements = { ["N"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NO2_minus = Substance {
    name = "NO2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.0978364800e+00, 3.7048631200e-03, 5.9293897500e-06, -1.0949730700e-08, 4.6272172100e-12, -2.5179833900e+04, 9.4823714300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.0532928000e+00, 2.0755567200e-03, -8.7000307700e-07, 1.6107425000e-10, -1.0344806200e-14, -2.5904361600e+04, -1.5406506300e+00 })
    },
    elements = { ["N"] = 1, ["O"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NO2CL = Substance {
    name = "NO2CL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5598039000e+00, 1.7969319000e-02, -2.0265255000e-05, 1.1699183000e-08, -2.7863372000e-12, 9.8790680000e+01, 1.3589958200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.1202601000e+00, 3.1869557000e-03, -1.3779897000e-06, 2.6653163000e-10, -1.9043796000e-14, -1.0615347000e+03, -9.4547656000e+00 })
    },
    elements = { ["N"] = 1, ["O"] = 2, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NO2F = Substance {
    name = "NO2F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.4466808000e+00, 2.0884058000e-02, -2.3885528000e-05, 1.3943894000e-08, -3.3402501000e-12, -1.4284297000e+04, 1.7660670000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.7103820000e+00, 3.6240166000e-03, -1.5666023000e-06, 3.0266641000e-10, -2.1608866000e-14, -1.5611041000e+04, -8.8816960100e+00 })
    },
    elements = { ["N"] = 1, ["O"] = 2, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NO3 = Substance {
    name = "NO3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.1735931000e+00, 1.0490269700e-02, 1.1047265000e-05, -2.8156185400e-08, 1.3658395800e-11, 7.3921987700e+03, 1.4602209800e+01 }),
        Range(1000.0, 6000.0, NASA7 { 7.4834773400e+00, 2.5777204100e-03, -1.0094583100e-06, 1.7231407200e-10, -1.0715401500e-14, 5.7091942800e+03, -1.4161815500e+01 })
    },
    elements = { ["N"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NO3_minus = Substance {
    name = "NO3-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.2125852100e+00, 1.7154519300e-02, -1.0527045700e-05, -1.1607409700e-09, 2.3311499800e-12, -3.8407771300e+04, 1.7993386500e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.8840473900e+00, 3.1606298200e-03, -1.2304878200e-06, 2.0925798900e-10, -1.2979547100e-14, -4.0054815200e+04, -1.1708709700e+01 })
    },
    elements = { ["N"] = 1, ["O"] = 3, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NO3F = Substance {
    name = "NO3F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.0363571000e+00, 2.8784098000e-02, -3.4840341000e-05, 2.1760173000e-08, -5.6496436000e-12, 1.8506817000e+02, 1.6443542800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 9.2894790000e+00, 4.6018137000e-03, -2.2187067000e-06, 4.5129758000e-10, -3.3240654000e-14, -1.6468516000e+03, -2.0088924200e+01 })
    },
    elements = { ["N"] = 1, ["O"] = 3, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2 = Substance {
    name = "N2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.5310052800e+00, -1.2366098700e-04, -5.0299943700e-07, 2.4353061200e-09, -1.4088123500e-12, -1.0469762800e+03, 2.9674746800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.9525762600e+00, 1.3969005700e-03, -4.9263169100e-07, 7.8601036700e-11, -4.6075532100e-15, -9.2394864500e+02, 5.8718925200e+00 })
    },
    elements = { ["N"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2_plus = Substance {
    name = "N2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.7754071100e+00, -2.0645915700e-03, 4.7575230100e-06, -3.1566422800e-09, 6.7050997300e-13, 1.8048111500e+05, 2.6932218600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.5866136300e+00, 2.5307194900e-04, 1.8477821400e-07, -4.5525722300e-11, 3.2681802900e-15, 1.8039099400e+05, 3.0958415000e+00 })
    },
    elements = { ["N"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2_minus = Substance {
    name = "N2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.8826848000e+00, -3.1924446000e-03, 8.5227838000e-06, -7.3403746000e-09, 2.2056815000e-12, 1.6796935000e+04, 3.1118052000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.1156753000e+00, 1.4588688000e-03, -6.0173148000e-07, 1.1348423000e-10, -7.9658518000e-15, 1.6859058000e+04, 6.3898560000e+00 })
    },
    elements = { ["N"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NCN = Substance {
    name = "NCN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.2413403300e+00, 8.5009134600e-03, -7.6160814000e-06, 3.6498658500e-09, -8.4255187200e-13, 5.8947737000e+04, 6.7095645000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.7381551400e+00, 1.7724460600e-03, -6.8575113100e-07, 1.1571198000e-10, -7.0756790700e-15, 5.8221489000e+04, -6.3053366500e+00 })
    },
    elements = { ["N"] = 2, ["C"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_cis_minusN2D2 = Substance {
    name = "cis-N2D2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.8733589900e+00, -2.6232879100e-03, 2.6307581900e-05, -3.1300874400e-08, 1.1810999900e-11, 2.3694834400e+04, 4.7494916000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.5145530800e+00, 5.1890131800e-03, -1.9368428800e-06, 3.2057596700e-10, -1.9520862400e-14, 2.3023039600e+04, -9.5266225400e-01 })
    },
    elements = { ["N"] = 2, ["D"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2F2 = Substance {
    name = "N2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.8058926000e+00, 1.9251967000e-02, -2.3697744000e-05, 1.4616861000e-08, -3.6451603000e-12, 5.9944419000e+03, 1.1484150700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.6671923000e+00, 2.5946627000e-03, -1.1346023000e-06, 2.2035268000e-10, -1.5788658000e-14, 4.8139999000e+03, -1.2829291300e+01 })
    },
    elements = { ["N"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2F4 = Substance {
    name = "N2F4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 9.8781294000e-01, 5.0029524000e-02, -7.3676708000e-05, 5.2523455000e-08, -1.4712961000e-11, -4.6101086000e+03, 2.0485719200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2915066000e+01, 3.5081362000e-03, -1.5546890000e-06, 3.0456218000e-10, -2.1952354000e-14, -7.2008189000e+03, -3.7710899800e+01 })
    },
    elements = { ["N"] = 2, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2H2 = Substance {
    name = "N2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.9106601600e+00, -1.0779186600e-02, 3.8651644100e-05, -3.8650162800e-08, 1.3485210000e-11, 2.4224272700e+04, 9.1027970300e-02 }),
        Range(1000.0, 6000.0, NASA7 { 1.3111508600e+00, 9.0018727200e-03, -3.1491186600e-06, 4.8144969000e-10, -2.7189798300e-14, 2.4786416700e+04, 1.6409108500e+01 })
    },
    elements = { ["N"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NH2NO2 = Substance {
    name = "NH2NO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.1731010500e+00, 1.4316229900e-02, 1.0903161900e-05, -2.7671467700e-08, 1.2986868700e-11, -4.4590612100e+03, 1.5383116600e+01 }),
        Range(1000.0, 6000.0, NASA7 { 7.3889099800e+00, 7.6518802600e-03, -2.7508703900e-06, 4.4462288600e-10, -2.6648812200e-14, -6.2176703400e+03, -1.3273700000e+01 })
    },
    elements = { ["N"] = 2, ["H"] = 2, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2H4 = Substance {
    name = "N2H4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.8347214900e+00, -6.4912955500e-04, 3.7684846300e-05, -5.0070918200e-08, 2.0336206400e-11, 1.0089392500e+04, 5.7527203000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.9395735700e+00, 8.7501718700e-03, -2.9939905800e-06, 4.6727841800e-10, -2.7306859900e-14, 9.2826554800e+03, -2.6943977200e+00 })
    },
    elements = { ["N"] = 2, ["H"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2O = Substance {
    name = "N2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.2571686000e+00, 1.1304633800e-02, -1.3671035000e-05, 9.6816209800e-09, -2.9305558300e-12, 8.7417714600e+03, 1.0757915400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 4.8231887300e+00, 2.6268527900e-03, -9.5842605800e-07, 1.5999129600e-10, -9.7741693900e-15, 8.0733566200e+03, -2.2023660000e+00 })
    },
    elements = { ["N"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2O_plus = Substance {
    name = "N2O+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.2868897800e+00, 7.4023456300e-03, -4.8668855200e-06, 7.3314103800e-10, 2.9816168300e-13, 1.5905454700e+05, 7.4014650400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.5285973000e+00, 1.9595697000e-03, -7.5375822800e-07, 1.2704591100e-10, -7.8020762500e-15, 1.5837590200e+05, -4.4189670000e+00 })
    },
    elements = { ["N"] = 2, ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2O3 = Substance {
    name = "N2O3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 5.8108396400e+00, 1.4333096200e-02, -1.9620859700e-05, 1.7306073500e-08, -6.4655395400e-12, 8.1918445300e+03, 1.2046132100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 9.0858384500e+00, 3.3775633000e-03, -1.3158389000e-06, 2.3076232900e-10, -1.4715126700e-14, 7.2716014600e+03, -1.5536190400e+01 })
    },
    elements = { ["N"] = 2, ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2O4 = Substance {
    name = "N2O4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.0200230800e+00, 2.9590432100e-02, -3.0134245800e-05, 1.4236040700e-08, -2.4410004900e-12, -6.4004016200e+02, 1.1805960600e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.1575289900e+01, 4.0161608600e-03, -1.5717832300e-06, 2.6827430900e-10, -1.6692201900e-14, -2.9219122600e+03, -3.1948843900e+01 })
    },
    elements = { ["N"] = 2, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N2O5 = Substance {
    name = "N2O5",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.6876744400e+00, 3.9212079800e-02, -5.5377002900e-05, 4.2009783300e-08, -1.3126071000e-11, -8.3029118400e+02, 1.2196786600e+01 }),
        Range(1000.0, 6000.0, NASA7 { 1.3110808200e+01, 4.8743579100e-03, -1.8754838900e-06, 3.1637412100e-10, -1.9592684500e-14, -3.1163470000e+03, -3.4687769200e+01 })
    },
    elements = { ["N"] = 2, ["O"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N3 = Substance {
    name = "N3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.8606303800e+00, 4.2488354900e-03, 5.1457213600e-06, -1.0147840600e-08, 4.4187839800e-12, 5.1369209300e+04, 9.1159613100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.6411069600e+00, 2.7696070000e-03, -1.0491758200e-06, 1.7534072000e-10, -1.0748270400e-14, 5.0698423800e+04, -9.4013545600e-01 })
    },
    elements = { ["N"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_N3H = Substance {
    name = "N3H",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.8851088100e+00, 9.4434345100e-03, -3.8791933600e-06, -1.8940401100e-09, 1.6018413200e-12, 3.4117203800e+04, 9.7168781800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.1470029100e+00, 4.3056126500e-03, -1.5270457500e-06, 2.4629577400e-10, -1.4714416400e-14, 3.3428398600e+04, -2.2552910300e+00 })
    },
    elements = { ["N"] = 3, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na = Substance {
    name = "Na",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000500e+00, -4.9849232300e-10, 1.7603408600e-12, -2.5446160200e-15, 1.2760387200e-18, 1.2159775200e+04, 4.2440277300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.3985887900e+00, 2.1546699700e-04, -1.4907756800e-07, 3.6682179500e-11, -1.6603603700e-15, 1.2194306900e+04, 4.7918112000e+00 })
    },
    elements = { ["Na"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na_plus = Substance {
    name = "Na+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 7.2541325000e+04, 3.5508450400e+00 })
    },
    elements = { ["Na"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaALF4 = Substance {
    name = "NaALF4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3052145000e+00, 4.4968034000e-02, -7.4323787000e-05, 5.8080861000e-08, -1.7499556000e-11, -2.2414988000e+05, 6.3718459900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.4271553000e+01, 1.9800191000e-03, -8.8151484000e-07, 1.7322148000e-10, -1.2512915000e-14, -2.2612347000e+05, -4.1275518000e+01 })
    },
    elements = { ["Na"] = 1, ["Al"] = 1, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaBO2 = Substance {
    name = "NaBO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0654749000e+00, 1.3454926000e-02, -1.3866693000e-05, 6.6395042000e-09, -1.0728671000e-12, -7.9700157000e+04, 7.9348162900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.4965250000e+00, 2.6309862000e-03, -1.0979136000e-06, 2.0493998000e-10, -1.4193146000e-14, -8.0578591000e+04, -9.4463018100e+00 })
    },
    elements = { ["Na"] = 1, ["B"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaBr = Substance {
    name = "NaBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9010890000e+00, 2.5025401000e-03, -3.8851088000e-06, 2.8318497000e-09, -7.7220528000e-13, -1.8556161000e+04, 6.1887932300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4433135000e+00, 1.5783657000e-04, -2.7989619000e-08, 5.3849038000e-12, -3.8094054000e-16, -1.8659489000e+04, 3.6085821300e+00 })
    },
    elements = { ["Na"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaCN = Substance {
    name = "NaCN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.9772558000e+00, 5.3225937000e-03, -7.5552441000e-06, 6.1839794000e-09, -2.0071427000e-12, 9.6731490000e+03, -3.8820728100e-01 }),
        Range(1000.0, 5000.0, NASA7 { 5.7989775000e+00, 1.6827946000e-03, -6.7437924000e-07, 1.2234502000e-10, -8.2966091000e-15, 9.4933444000e+03, -4.3442604100e+00 })
    },
    elements = { ["Na"] = 1, ["C"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaCL = Substance {
    name = "NaCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7032286000e+00, 3.1997608000e-03, -4.8924502000e-06, 3.4639218000e-09, -9.1357521000e-13, -2.3028276000e+04, 5.7734794900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4282931000e+00, 1.5627241000e-04, -2.8108383000e-08, 4.7163571000e-12, -2.8832557000e-16, -2.3170900000e+04, 2.3009745900e+00 })
    },
    elements = { ["Na"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaF = Substance {
    name = "NaF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.7487183300e+00, 8.0324328900e-03, -1.5156352300e-05, 1.3359224600e-08, -4.4516524400e-12, -3.6000207400e+04, 8.6810781200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.3337679600e+00, 2.5680777700e-04, -6.9423262100e-08, 1.1967961700e-11, -7.4930839300e-16, -3.6279787200e+04, 1.3004635400e+00 })
    },
    elements = { ["Na"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaF2_minus = Substance {
    name = "NaF2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.5826889000e+00, 1.0605211000e-02, -1.5720501000e-05, 1.0567297000e-08, -2.6415920000e-12, -8.2234497000e+04, 1.4892076100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.1223193000e+00, 4.1884055000e-04, -1.7972299000e-07, 3.4041229000e-11, -2.3751935000e-15, -8.2755730000e+04, -1.0786674500e+01 })
    },
    elements = { ["Na"] = 1, ["F"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaH = Substance {
    name = "NaH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1203950000e+00, 1.3996217000e-03, 2.2141234000e-06, -3.9950795000e-09, 1.6726178000e-12, 1.3940065000e+04, 4.3945611400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.8130579000e+00, 8.5643800000e-04, -3.1226816000e-07, 5.8502471000e-11, -4.0513924000e-15, 1.3683062000e+04, 4.8416808700e-01 })
    },
    elements = { ["Na"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaI = Substance {
    name = "NaI",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0406275000e+00, 1.9687111000e-03, -3.0545424000e-06, 2.2556323000e-09, -6.2286832000e-13, -1.1988041000e+04, 6.4598010500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4584570000e+00, 1.4241278000e-04, -1.6926275000e-08, 3.8960087000e-12, -2.7966311000e-16, -1.2066843000e+04, 4.4759587500e+00 })
    },
    elements = { ["Na"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaO = Substance {
    name = "NaO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4421007000e+00, 4.1617241000e-03, -6.3118368000e-06, 4.4479199000e-09, -1.1720486000e-12, 8.9011477000e+03, 6.9503253300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3924158000e+00, 2.1320574000e-04, -4.5220598000e-08, 7.9751821000e-12, -5.1735989000e-16, 8.7118995000e+03, 2.3880896300e+00 })
    },
    elements = { ["Na"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaO_minus = Substance {
    name = "NaO-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4186855000e+00, 4.2117382000e-03, -6.3104646000e-06, 4.3873515000e-09, -1.1372639000e-12, -1.5752234000e+04, 5.6685563900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3868008000e+00, 2.2344672000e-04, -4.8212472000e-08, 8.5720862000e-12, -5.6094334000e-16, -1.5946268000e+04, 1.0136347900e+00 })
    },
    elements = { ["Na"] = 1, ["O"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaOH = Substance {
    name = "NaOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0050388000e+00, 9.9922043000e-03, -1.6434213000e-05, 1.2476585000e-08, -3.4637610000e-12, -2.5300471000e+04, 2.3064360400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.6469377000e+00, 1.2227385000e-03, -3.3271036000e-07, 4.0666298000e-11, -1.7790688000e-15, -2.5508222000e+04, -5.0368746600e+00 })
    },
    elements = { ["Na"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NaOH_plus = Substance {
    name = "NaOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3505204000e+00, 8.7465015000e-03, -1.4642673000e-05, 1.1351501000e-08, -3.2110026000e-12, 7.9946399000e+04, 2.3448407200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.6688547000e+00, 1.2253930000e-03, -3.4029563000e-07, 4.2853268000e-11, -1.9593760000e-15, 7.9806514000e+04, -3.4246826800e+00 })
    },
    elements = { ["Na"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na2 = Substance {
    name = "Na2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.1156826100e+00, 2.5290404000e-03, -5.6216864500e-06, 6.4617166500e-09, -2.7512831000e-12, 1.5782461600e+04, 3.6867243300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 5.9620190000e+00, -1.0604950600e-03, -4.3927976900e-07, 3.0517481000e-10, -3.3948881600e-14, 1.4999092700e+04, -6.6961364700e+00 })
    },
    elements = { ["Na"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na2C2N2 = Substance {
    name = "Na2C2N2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0368029000e+01, 1.3348547000e-02, -1.9910334000e-05, 1.6156475000e-08, -5.1264550000e-12, -4.5937527000e+03, -2.0549442900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2572786000e+01, 3.3947318000e-03, -1.3616934000e-06, 2.4720959000e-10, -1.6773254000e-14, -5.0491021000e+03, -3.1074197900e+01 })
    },
    elements = { ["Na"] = 2, ["C"] = 2, ["N"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na2CL2 = Substance {
    name = "Na2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.9583953000e+00, 8.3962360000e-03, -1.3817116000e-05, 1.0277666000e-08, -2.8644994000e-12, -7.0725939000e+04, -8.1753247100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.8262001000e+00, 1.9184763000e-04, -8.1608743000e-08, 1.5298181000e-11, -1.0558994000e-15, -7.1077149000e+04, -1.7036100900e+01 })
    },
    elements = { ["Na"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na2F2 = Substance {
    name = "Na2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.8212191000e+00, 1.9836396000e-02, -3.0617614000e-05, 2.1337040000e-08, -5.5344314000e-12, -1.0389005000e+05, 2.3662545900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.4335530000e+00, 6.3611588000e-04, -2.7624720000e-07, 5.2917190000e-11, -3.7310353000e-15, -1.0480114000e+05, -1.9752992100e+01 })
    },
    elements = { ["Na"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na2O = Substance {
    name = "Na2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.7787177000e+00, 9.9487716000e-03, -1.4814456000e-05, 1.0003239000e-08, -2.5137874000e-12, -6.7360206000e+03, 1.7994761900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.1470582000e+00, 3.9833099000e-04, -1.7408911000e-07, 3.3565162000e-11, -2.3810801000e-15, -7.2191261000e+03, -9.6348106100e+00 })
    },
    elements = { ["Na"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na2O2H2 = Substance {
    name = "Na2O2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.9712930000e+00, 1.4049275000e-02, -6.2445142000e-06, -3.3935746000e-09, 2.8933769000e-12, -7.5412938000e+04, -9.3738645300e-01 }),
        Range(1000.0, 5000.0, NASA7 { 9.4160743000e+00, 5.5196522000e-03, -1.9659611000e-06, 3.2680344000e-10, -2.0712485000e-14, -7.6366369000e+04, -1.8854349700e+01 })
    },
    elements = { ["Na"] = 2, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Na2SO4 = Substance {
    name = "Na2SO4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.0727498000e+00, 5.4582047000e-02, -7.8543533000e-05, 5.5104221000e-08, -1.5266676000e-11, -1.2676955000e+05, 1.6668826300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.5206128000e+01, 4.2984264000e-03, -1.9008409000e-06, 3.7187530000e-10, -2.6780457000e-14, -1.2967357000e+05, -4.7656921700e+01 })
    },
    elements = { ["Na"] = 2, ["S"] = 1, ["O"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Nb = Substance {
    name = "Nb",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4755074000e+00, 2.0538564000e-03, -6.9670263000e-06, 6.8020559000e-09, -2.2517718000e-12, 8.7087749000e+04, 2.2424369700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.2205905000e+00, -1.8187439000e-03, 8.2373943000e-07, -1.1832899000e-10, 5.3637053000e-15, 8.6960713000e+04, -1.1846864300e+00 })
    },
    elements = { ["Nb"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NbO = Substance {
    name = "NbO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9214485000e+00, 3.1324082000e-03, -1.4900369000e-06, -9.9345260000e-10, 7.9984020000e-13, 2.2907886000e+04, 1.1236293700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.8811729000e+00, 8.1978122000e-04, -4.2535390000e-07, 1.0264936000e-10, -8.0419801000e-15, 2.2637132000e+04, 6.2236415100e+00 })
    },
    elements = { ["Nb"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NbO2 = Substance {
    name = "NbO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.5767268100e+00, 6.3589562800e-03, -5.9644220900e-07, -6.3422895600e-09, 3.7083282100e-12, -2.5387318500e+04, 1.0625700800e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.0514794800e+00, 9.7515370700e-04, -3.8269710800e-07, 6.5415042000e-11, -4.0715907900e-15, -2.6100864500e+04, -2.4001566300e+00 })
    },
    elements = { ["Nb"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ne = Substance {
    name = "Ne",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, -7.4537500000e+02, 3.3553227200e+00 })
    },
    elements = { ["Ne"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ne_plus = Substance {
    name = "Ne+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 1.9410691700e+00, 4.4001655200e-03, -8.5704741700e-06, 6.9969168900e-09, -2.1157362500e-12, 2.5029427500e+05, 6.9917869400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.9039955700e+00, -3.6379463500e-04, 1.3187335900e-07, -2.1420921000e-11, 1.2877849900e-15, 2.5014372600e+05, 2.5631033200e+00 })
    },
    elements = { ["Ne"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ni = Substance {
    name = "Ni",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7766654000e+00, -7.5220638000e-04, 4.3256113000e-06, -5.4731287000e-09, 2.1107565000e-12, 5.0909083000e+04, 6.1682325300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.2061490000e+00, -2.0969923000e-04, -2.2836448000e-08, 1.5085211000e-11, -1.0004445000e-15, 5.0708126000e+04, 3.5317162300e+00 })
    },
    elements = { ["Ni"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NiCL = Substance {
    name = "NiCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4897757000e+00, 3.1837930000e-03, -1.9148912000e-06, -3.5736317000e-10, 4.6074768000e-13, 2.0725935000e+04, 9.5497443600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.5836514000e+00, -1.4329578000e-03, 8.5207723000e-07, -1.4886393000e-10, 8.1551624000e-15, 2.0056505000e+04, -1.6373214400e+00 })
    },
    elements = { ["Ni"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NiCL2 = Substance {
    name = "NiCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.5606177000e+00, 1.3613713000e-02, -2.3660133000e-05, 1.9616264000e-08, -6.2417291000e-12, -1.0683571000e+04, 6.2361941600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.3874530000e+00, 8.4637595000e-04, -4.3149542000e-07, 9.3590846000e-11, -7.1915139000e-15, -1.1235857000e+04, -7.1889510400e+00 })
    },
    elements = { ["Ni"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NiO = Substance {
    name = "NiO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9919682000e+00, 3.3309208000e-03, -1.5352471000e-06, -1.5640833000e-09, 1.2128501000e-12, 3.6742094000e+04, 9.8214073600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1046114000e+00, 4.8659160000e-04, -1.8786784000e-07, 3.5531855000e-11, -2.4715166000e-15, 3.6445645000e+04, 4.0767965600e+00 })
    },
    elements = { ["Ni"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_NiS = Substance {
    name = "NiS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1168107000e+00, 4.0173528000e-03, -1.5583911000e-06, -1.5063536000e-09, 9.3683881000e-13, 4.1896857000e+04, 1.1467735100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.9160472000e+00, 3.1377451000e-04, -2.9701813000e-07, 8.0179724000e-11, -6.7257418000e-15, 4.1321032000e+04, 1.8189879700e+00 })
    },
    elements = { ["Ni"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_O = Substance {
    name = "O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.1682671000e+00, -3.2793188400e-03, 6.6430639600e-06, -6.1280662400e-09, 2.1126597100e-12, 2.9122259200e+04, 2.0519334600e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5436369700e+00, -2.7316248600e-05, -4.1902952000e-09, 4.9548184500e-12, -4.7955369400e-16, 2.9226012000e+04, 4.9222945700e+00 })
    },
    elements = { ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_O_plus = Substance {
    name = "O+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.8793529100e+05, 4.3933768900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.4877331700e+00, 2.1766001600e-05, -1.0895580600e-08, 1.2590921200e-12, 1.3731672000e-16, 1.8793996500e+05, 4.4613409100e+00 })
    },
    elements = { ["O"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_O_minus = Substance {
    name = "O-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.9080592100e+00, -1.6980490700e-03, 2.9806995600e-06, -2.4383512700e-09, 7.6122931300e-13, 1.1413834100e+04, 2.8033908400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5447486800e+00, -4.6669541900e-05, 1.8491231000e-08, -3.1815913100e-12, 1.9896289400e-16, 1.1482271300e+04, 4.5213100500e+00 })
    },
    elements = { ["O"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_OD = Substance {
    name = "OD",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0346751000e+00, -2.4561313000e-03, 3.9610201000e-06, -1.8534996000e-09, 1.9295341000e-13, 3.2770507000e+03, 3.9418614100e-01 }),
        Range(1000.0, 5000.0, NASA7 { 2.7829107000e+00, 1.5739567000e-03, -5.7020787000e-07, 9.8864409000e-11, -6.5062014000e-15, 3.5759813000e+03, 6.6756713300e+00 })
    },
    elements = { ["O"] = 1, ["D"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_OH = Substance {
    name = "OH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.9920154300e+00, -2.4013175200e-03, 4.6179384100e-06, -3.8811333300e-09, 1.3641147000e-12, 3.6150805600e+03, -1.0392545800e-01 }),
        Range(1000.0, 6000.0, NASA7 { 2.8386460700e+00, 1.1072558600e-03, -2.9391497800e-07, 4.2052424700e-11, -2.4216909200e-15, 3.9439585200e+03, 5.8445266200e+00 })
    },
    elements = { ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_OH_plus = Substance {
    name = "OH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.5050257200e+00, 2.4131374900e-04, -1.4220094900e-06, 2.6478023200e-09, -1.1703871100e-12, 1.5412712400e+05, 1.9790764000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.6835899700e+00, 1.5700643200e-03, -5.3997280500e-07, 9.3764385900e-11, -5.7006805500e-15, 1.5439574400e+05, 6.4437590100e+00 })
    },
    elements = { ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_OH_minus = Substance {
    name = "OH-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.4327995600e+00, 6.1965631000e-04, -1.8993099200e-06, 2.3736594600e-09, -8.5510375500e-13, -1.8261308600e+04, 1.0605365700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.8340570100e+00, 1.0705802300e-03, -2.6245939800e-07, 3.0837643500e-11, -1.3138386200e-15, -1.8018697400e+04, 4.4946474900e+00 })
    },
    elements = { ["O"] = 1, ["H"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_O2 = Substance {
    name = "O2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7824563600e+00, -2.9967341500e-03, 9.8473020000e-06, -9.6812950800e-09, 3.2437283600e-12, -1.0639435600e+03, 3.6576757300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.6609608300e+00, 6.5636552300e-04, -1.4114948500e-07, 2.0579765800e-11, -1.2991324800e-15, -1.2159772500e+03, 3.4153618400e+00 })
    },
    elements = { ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_O2_plus = Substance {
    name = "O2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.6101716700e+00, -6.3595195200e-03, 1.4242562400e-05, -1.2099792300e-08, 3.7095687800e-12, 1.3974222900e+05, -2.0132687400e-01 }),
        Range(1000.0, 6000.0, NASA7 { 3.3167592200e+00, 1.1152224400e-03, -3.8349255600e-07, 5.7278468700e-11, -2.7764838100e-15, 1.3987682300e+05, 5.4472647600e+00 })
    },
    elements = { ["O"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_O2_minus = Substance {
    name = "O2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.6644252200e+00, -9.2874113800e-04, 6.4547708200e-06, -7.7470338000e-09, 2.9333266200e-12, -6.8707698300e+03, 4.3514067400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.9566629400e+00, 5.9814182300e-04, -2.1213390500e-07, 3.6326758100e-11, -2.2498922800e-15, -7.0628722900e+03, 2.2787101000e+00 })
    },
    elements = { ["O"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_O3 = Substance {
    name = "O3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.4073822100e+00, 2.0537906300e-03, 1.3848605200e-05, -2.2331154200e-08, 9.7607322600e-12, 1.5864497900e+04, 8.2824758000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 1.2330291400e+01, -1.1932478300e-02, 7.9874127800e-06, -1.7719455200e-09, 1.2607582400e-13, 1.2675583100e+04, -4.0882337400e+01 })
    },
    elements = { ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_P = Substance {
    name = "P",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000427800e+00, -4.3896863700e-07, 1.5813174100e-09, -2.3390045700e-12, 1.2051094000e-15, 3.7307375400e+04, 5.3841472900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.8072155500e+00, -5.3084198800e-04, 2.4454304600e-07, -2.0570825200e-11, -2.9454661900e-16, 3.7189274800e+04, 3.6776473300e+00 })
    },
    elements = { ["P"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_P_plus = Substance {
    name = "P+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3790417000e+00, -6.4666723000e-03, 8.9340962000e-06, -5.4858021000e-09, 1.2098857000e-12, 1.5964780700e+05, -3.2937402100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.9021547000e+00, -5.8878899000e-04, 3.1298119000e-07, -5.9727539000e-11, 3.9304925000e-15, 1.5994412700e+05, 3.8337064900e+00 })
    },
    elements = { ["P"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PCL3 = Substance {
    name = "PCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.2590537000e+00, 1.7880566000e-02, -2.7317585000e-05, 1.8898240000e-08, -4.8738496000e-12, -3.6864430400e+04, 3.2523297000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.4566116000e+00, 6.0278401000e-04, -2.5846878000e-07, 4.8904280000e-11, -3.4083285000e-15, -3.7704557400e+04, -1.6929649800e+01 })
    },
    elements = { ["P"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PF = Substance {
    name = "PF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6760863000e+00, 5.5722162000e-03, -7.2837796000e-06, 4.5819439000e-09, -1.1188106000e-12, -7.2891613500e+03, 1.0434183100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.2844403000e+00, 4.6513192000e-05, 1.2923155000e-07, -3.5459686000e-11, 2.9308642000e-15, -7.6756649500e+03, 2.4019638100e+00 })
    },
    elements = { ["P"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PF_plus = Substance {
    name = "PF+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9402122000e+00, -5.3784582000e-04, 3.9356106000e-06, -4.6726194000e-09, 1.7445838000e-12, 1.0725259700e+05, 4.5185032800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.0816184000e+00, 4.9506910000e-04, -2.0319808000e-07, 3.9234847000e-11, -2.7830337000e-15, 1.0714584700e+05, 3.4444166800e+00 })
    },
    elements = { ["P"] = 1, ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PF_minus = Substance {
    name = "PF-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5951376000e+00, 3.0312909000e-03, -4.4062914000e-06, 3.1583475000e-09, -8.9206267000e-13, -2.0904094400e+04, 5.8699065200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3037691000e+00, 2.6392630000e-04, -9.8774303000e-08, 1.8711821000e-11, -1.2110252000e-15, -2.1058144400e+04, 2.4122915200e+00 })
    },
    elements = { ["P"] = 1, ["F"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PF2 = Substance {
    name = "PF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4428526000e+00, 1.5186331000e-02, -2.2196924000e-05, 1.5648932000e-08, -4.3298372000e-12, -5.9960980400e+04, 1.4037117000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.0926588000e+00, 1.0313324000e-03, -4.5371020000e-07, 8.7045583000e-11, -5.9714052000e-15, -6.0755325400e+04, -3.7851300700e+00 })
    },
    elements = { ["P"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PF2_plus = Substance {
    name = "PF2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4702136000e+00, 1.4922676000e-02, -2.1573139000e-05, 1.5054386000e-08, -4.1267109000e-12, 5.5565540600e+04, 1.3263674000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.0726154000e+00, 1.0588249000e-03, -4.6758166000e-07, 8.9612298000e-11, -6.0454217000e-15, 5.4776939600e+04, -4.3516715800e+00 })
    },
    elements = { ["P"] = 1, ["F"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PF3 = Substance {
    name = "PF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.3621878000e+00, 2.2820045000e-02, -2.7656642000e-05, 1.4490962000e-08, -2.4602360000e-12, -1.1677690300e+05, 1.3686432000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.4347733000e+00, 1.7393920000e-03, -7.5119808000e-07, 1.4344247000e-10, -1.0093979000e-14, -1.1818078300e+05, -1.6463602000e+01 })
    },
    elements = { ["P"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PF5 = Substance {
    name = "PF5",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0523249000e+00, 4.4454004000e-02, -5.3901429000e-05, 2.8416686000e-08, -4.9143268000e-12, -1.9363231300e+05, 1.9089010000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2846184000e+01, 3.5104485000e-03, -1.5198604000e-06, 2.9101904000e-10, -2.0534708000e-14, -1.9636226300e+05, -3.9475542000e+01 })
    },
    elements = { ["P"] = 1, ["F"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PH = Substance {
    name = "PH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6803433000e+00, -1.2756018000e-03, 2.5932442000e-06, -8.4354107000e-10, -1.7208609000e-13, 2.7333965600e+04, 2.9186412500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.0745442000e+00, 1.1698947000e-03, -3.0381654000e-07, 4.4436314000e-11, -2.7000975000e-15, 2.7426831600e+04, 5.7680485500e+00 })
    },
    elements = { ["P"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PH3 = Substance {
    name = "PH3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1581935000e+00, 2.4941492000e-03, 9.0255253000e-06, -1.0227904000e-08, 3.2834250000e-12, -4.6123725200e+02, 6.2372248600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.3448794000e+00, 6.5770941000e-03, -2.6336755000e-06, 4.7744660000e-10, -3.2354390000e-14, -8.1617675200e+02, 3.9547962600e+00 })
    },
    elements = { ["P"] = 1, ["H"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PO = Substance {
    name = "PO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9613080000e+00, -2.1235399000e-03, 7.5201219000e-06, -7.5950912000e-09, 2.5637591000e-12, -4.6989689500e+03, 4.5836922100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.8427922000e+00, 7.2364456000e-04, -2.8934199000e-07, 5.3013554000e-11, -3.5495373000e-15, -4.7994549500e+03, 4.5523774100e+00 })
    },
    elements = { ["P"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PO2 = Substance {
    name = "PO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.3345273000e+00, 1.2502100000e-02, -1.4336195000e-05, 7.6762166000e-09, -1.5401694000e-12, -3.8968865400e+04, 1.4054435000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.6913278000e+00, 1.4806866000e-03, -6.5425692000e-07, 1.2793231000e-10, -9.2099277000e-15, -3.9794725400e+04, -2.8197220100e+00 })
    },
    elements = { ["P"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_P2 = Substance {
    name = "P2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8391107000e+00, 4.8266193000e-03, -5.4947488000e-06, 2.5800507000e-09, -3.2236453000e-13, 1.6259707300e+04, 8.8424101900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1611733000e+00, 3.9620800000e-04, -1.5580339000e-07, 2.9093474000e-11, -2.0042458000e-15, 1.5946869300e+04, 2.2410924900e+00 })
    },
    elements = { ["P"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_P4 = Substance {
    name = "P4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5353300000e+00, 2.4125292000e-02, -3.6462759000e-05, 2.4916906000e-08, -6.3298563000e-12, 5.2355335900e+03, 7.7558956700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.2262789000e+00, 8.6894128000e-04, -3.7758338000e-07, 7.2379666000e-11, -5.1066109000e-15, 4.0905495900e+03, -1.9641704900e+01 })
    },
    elements = { ["P"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_P4O10 = Substance {
    name = "P4O10",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -4.4142883000e+00, 1.3759081000e-01, -1.9268598000e-04, 1.3272068000e-07, -3.6311378000e-11, -3.5262952300e+05, 4.0178226000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 2.8939659000e+01, 1.2452096000e-02, -5.4854320000e-06, 1.0704743000e-09, -7.6956857000e-14, -3.6014863300e+05, -1.2385944700e+02 })
    },
    elements = { ["P"] = 4, ["O"] = 10 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Pb = Substance {
    name = "Pb",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5022900500e+00, -2.4405364300e-05, 9.1708257800e-08, -1.4281777100e-10, 7.8376219600e-14, 2.2731491900e+04, 6.8400932200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.1634237900e+00, -3.4963772300e-03, 2.2826317000e-06, -4.7674924200e-10, 3.2222380000e-14, 2.2168749900e+04, -2.1352530500e+00 })
    },
    elements = { ["Pb"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbBr = Substance {
    name = "PbBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.1906840000e+00, 1.3411178000e-03, -2.0978994000e-06, 1.5510908000e-09, -4.2617912000e-13, 7.2369469000e+03, 8.5747781900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.7268766000e+00, -4.3918390000e-04, 3.3215582000e-07, -6.5307240000e-11, 4.2726112000e-15, 7.0988959000e+03, 5.8673515900e+00 })
    },
    elements = { ["Pb"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbBr2 = Substance {
    name = "PbBr2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.3902091000e+00, 2.5289050000e-03, -4.1903743000e-06, 3.1367523000e-09, -8.7976745000e-13, -1.4541792000e+04, 3.8175292900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.9472906000e+00, 6.0199001000e-05, -2.6556685000e-08, 5.1596012000e-12, -3.6837050000e-16, -1.4645441000e+04, 1.1801579900e+00 })
    },
    elements = { ["Pb"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbBr4 = Substance {
    name = "PbBr4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.1379366000e+01, 6.6625872000e-03, -1.0940648000e-05, 8.1094739000e-09, -2.2495575000e-12, -5.8495431000e+04, -1.5140168000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2856973000e+01, 1.6323940000e-04, -7.1970390000e-08, 1.3975749000e-11, -9.9736187000e-16, -5.8772095000e+04, -2.2145750000e+01 })
    },
    elements = { ["Pb"] = 1, ["Br"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbCL = Substance {
    name = "PbCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8972912000e+00, 2.4867464000e-03, -3.9157144000e-06, 2.8494283000e-09, -7.7266580000e-13, 5.6862579000e+02, 8.4284736400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.7016535000e+00, -4.2255171000e-04, 3.2684779000e-07, -6.5162147000e-11, 4.2978602000e-15, 3.7797991000e+02, 4.4374417400e+00 })
    },
    elements = { ["Pb"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbCL_plus = Substance {
    name = "PbCL+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9604808000e+00, 2.2511384000e-03, -3.5559302000e-06, 2.6130965000e-09, -7.1901284000e-13, 8.8421370000e+04, 7.5877428500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.4591697000e+00, 9.7407307000e-05, -4.8821134000e-09, -2.5472246000e-12, 6.2470877000e-16, 8.8325847000e+04, 5.2131006500e+00 })
    },
    elements = { ["Pb"] = 1, ["Cl"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbCL2 = Substance {
    name = "PbCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.6399407000e+00, 5.4622134000e-03, -8.8056872000e-06, 6.4197230000e-09, -1.7518591000e-12, -2.2792336000e+04, 4.7279048500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8401678000e+00, 2.0601308000e-04, -1.0023434000e-07, 1.9262772000e-11, -8.7941419000e-16, -2.3016362000e+04, -9.6375510900e-01 })
    },
    elements = { ["Pb"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbCL2_plus = Substance {
    name = "PbCL2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.5653876000e+00, 5.7468417000e-03, -9.2445041000e-06, 6.7256888000e-09, -1.8313858000e-12, 9.6334985000e+04, 5.2490540000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8418837000e+00, 1.9792473000e-04, -9.6562822000e-08, 2.0106440000e-11, -1.3246579000e-15, 9.6094018000e+04, -8.1604348000e-01 })
    },
    elements = { ["Pb"] = 1, ["Cl"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbCL4 = Substance {
    name = "PbCL4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 9.6282979000e+00, 1.3456438000e-02, -2.1571731000e-05, 1.5638215000e-08, -4.2414922000e-12, -6.9746487000e+04, -1.2134848200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2669673000e+01, 3.7512256000e-04, -1.6465370000e-07, 3.1848855000e-11, -2.2650947000e-15, -7.0329151000e+04, -2.6623832200e+01 })
    },
    elements = { ["Pb"] = 1, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbF = Substance {
    name = "PbF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2454482000e+00, 4.6936166000e-03, -6.9780028000e-06, 4.7459304000e-09, -1.1983928000e-12, -1.0777073000e+04, 1.0443732000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.6052196000e+00, -3.2622217000e-04, 2.8298253000e-07, -5.7120594000e-11, 3.7397813000e-15, -1.1086917000e+04, 3.7405942300e+00 })
    },
    elements = { ["Pb"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbF2 = Substance {
    name = "PbF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.1295694000e+00, 1.0561626000e-02, -1.5808144000e-05, 1.0725748000e-08, -2.7093890000e-12, -5.3916121000e+04, 9.1404248500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.6354593000e+00, 4.1173109000e-04, -1.8004609000e-07, 3.4728984000e-11, -2.4645269000e-15, -5.4425059000e+04, -2.9468619500e+00 })
    },
    elements = { ["Pb"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbF4 = Substance {
    name = "PbF4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.2745387000e+00, 2.4576282000e-02, -3.6567537000e-05, 2.4663266000e-08, -6.1876008000e-12, -1.3900917000e+05, -1.5295854900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.2127774000e+01, 9.8421046000e-04, -4.3006159000e-07, 8.2902421000e-11, -5.8800202000e-15, -1.4020345000e+05, -2.9790944000e+01 })
    },
    elements = { ["Pb"] = 1, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbI = Substance {
    name = "PbI",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3073395000e+00, 8.5668232000e-04, -1.3164554000e-06, 9.7187239000e-10, -2.6526744000e-13, 1.1645744000e+04, 8.9413293600e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.7186112000e+00, -4.1882236000e-04, 3.0970847000e-07, -5.9203353000e-11, 3.8773970000e-15, 1.1534110000e+04, 6.8391940600e+00 })
    },
    elements = { ["Pb"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbI2 = Substance {
    name = "PbI2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.7169225000e+00, 1.1849879000e-03, -1.9791555000e-06, 1.4927378000e-09, -4.2189646000e-13, -2.4229505000e+03, 4.6967559900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.9761108000e+00, 2.7474571000e-05, -1.2204216000e-08, 2.3862489000e-12, -1.7133768000e-16, -2.4707898000e+03, 3.4717364900e+00 })
    },
    elements = { ["Pb"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbI4 = Substance {
    name = "PbI4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.2150266000e+01, 3.5387081000e-03, -5.8782434000e-06, 4.4072159000e-09, -1.2374050000e-12, -3.0733565000e+04, -1.3978132300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2927661000e+01, 8.2998286000e-05, -3.6781667000e-08, 7.1764294000e-12, -5.1430957000e-16, -3.0877629000e+04, -1.7655759300e+01 })
    },
    elements = { ["Pb"] = 1, ["I"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbO = Substance {
    name = "PbO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6539867000e+00, 6.6644115000e-03, -1.0312363000e-05, 7.6663259000e-09, -2.2173864000e-12, 7.4437513000e+03, 1.2156713000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.1136242000e+00, 5.3778857000e-04, -2.3763394000e-07, 4.2425688000e-11, -1.2294044000e-15, 7.1519260000e+03, 5.1504131900e+00 })
    },
    elements = { ["Pb"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_PbS = Substance {
    name = "PbS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4774532000e+00, 3.9700295000e-03, -6.1096689000e-06, 4.3008682000e-09, -1.1311549000e-12, 1.4684751000e+04, 9.4778094100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.0911522000e+00, 8.3885359000e-04, -5.7157207000e-07, 1.6160476000e-10, -1.2511897000e-14, 1.4601695000e+04, 6.7007480100e+00 })
    },
    elements = { ["Pb"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Pb2 = Substance {
    name = "Pb2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0501222000e+00, 2.0230001000e-03, -2.9701346000e-06, 2.1785957000e-09, -5.9755327000e-13, 3.8731640000e+04, 1.0271992000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.4598340000e+00, 2.4006381000e-04, -1.9259863000e-08, 3.6456937000e-12, -2.5380934000e-16, 3.8654049000e+04, 8.3249604900e+00 })
    },
    elements = { ["Pb"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S = Substance {
    name = "S",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.3172561600e+00, 4.7801834200e-03, -1.4208267400e-05, 1.5656953800e-08, -5.9658829900e-12, 3.2506897600e+04, 6.0624243400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.8793649800e+00, -5.1105038800e-04, 2.5380671900e-07, -4.4545545800e-11, 2.6671736200e-15, 3.2501379100e+04, 3.9814064700e+00 })
    },
    elements = { ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S_plus = Substance {
    name = "S+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.5347814500e+05, 5.4362701900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.4652435900e+00, 1.1425721200e-04, -1.1957269900e-07, 4.3877135900e-11, -3.8052363900e-15, 1.5348542200e+05, 5.6082137100e+00 })
    },
    elements = { ["S"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S_minus = Substance {
    name = "S-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5135307000e+00, 1.9351685700e-03, -5.3843835700e-06, 5.4031335600e-09, -1.8905368400e-12, 7.6430300600e+03, 5.1328200200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.7294806000e+00, -2.2489492800e-04, 8.5864885400e-08, -1.4425616900e-11, 8.8749119600e-16, 7.6598006900e+03, 4.3990272600e+00 })
    },
    elements = { ["S"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SCL = Substance {
    name = "SCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7055880000e+00, 5.2718623000e-03, -1.1371820000e-05, 1.0497827000e-08, -3.5318408000e-12, 1.7561159000e+04, 6.2794512300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.5947260000e+00, -5.9771786000e-05, 4.5226495000e-08, -9.3718435000e-12, 8.0735727000e-16, 1.7452426000e+04, 2.3798515300e+00 })
    },
    elements = { ["S"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SCL2 = Substance {
    name = "SCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5966371000e+00, 1.4327193000e-02, -2.5199197000e-05, 2.0572882000e-08, -6.3976908000e-12, -3.6375837000e+03, 1.0060555700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.6271462000e+00, 4.2747019000e-04, -1.8816881000e-07, 3.5761155000e-11, -2.3849400000e-15, -4.2000219000e+03, -4.2323702500e+00 })
    },
    elements = { ["S"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SCL2_plus = Substance {
    name = "SCL2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.5958727000e+00, 1.4291665000e-02, -2.5084998000e-05, 2.0446893000e-08, -6.3504669000e-12, 1.0690283000e+05, 1.0755833700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.5802570000e+00, 5.2176400000e-04, -2.5076979000e-07, 5.0988124000e-11, -3.2730292000e-15, 1.0635486000e+05, -3.2949383200e+00 })
    },
    elements = { ["S"] = 1, ["Cl"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SD = Substance {
    name = "SD",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.7285597000e+00, -5.0939881000e-03, 9.9134605000e-06, -7.3290813000e-09, 1.9461608000e-12, 1.5399579000e+04, -1.5684795200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.3471988000e+00, 1.2129646000e-03, -4.7730138000e-07, 8.8323669000e-11, -6.0740591000e-15, 1.5627147000e+04, 4.8776419800e+00 })
    },
    elements = { ["S"] = 1, ["D"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF = Substance {
    name = "SF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4208175000e+00, 4.5511198000e-03, -7.9372564000e-06, 6.5004711000e-09, -2.0289665000e-12, 3.9609503000e+02, 6.5470058300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3690885000e+00, 1.9204424000e-04, -6.6630365000e-08, 1.2448590000e-11, -7.6537494000e-16, 2.2018526000e+02, 2.0759686300e+00 })
    },
    elements = { ["S"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF_plus = Substance {
    name = "SF+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6666648000e+00, 5.6975491000e-03, -7.6057422000e-06, 4.9119455000e-09, -1.2414514000e-12, 1.1831033000e+05, 1.0515019300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.2807248000e+00, 1.0367433000e-04, 5.5441665000e-08, -1.1433295000e-11, 5.5846906000e-16, 1.1792192000e+05, 2.4593946700e+00 })
    },
    elements = { ["S"] = 1, ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF_minus = Substance {
    name = "SF-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7597936000e+00, 6.8658220000e-03, -1.1314519000e-05, 8.8746370000e-09, -2.6784270000e-12, -2.3486306000e+04, 8.9935068100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1270672000e+00, 6.2569340000e-04, -3.1246986000e-07, 7.1722476000e-11, -4.7061404000e-15, -2.3734881000e+04, 2.5536941100e+00 })
    },
    elements = { ["S"] = 1, ["F"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF2 = Substance {
    name = "SF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4103056000e+00, 1.5590121000e-02, -2.3178018000e-05, 1.6583497000e-08, -4.6465761000e-12, -3.6916373000e+04, 1.3506680300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.1194196000e+00, 1.0051424000e-03, -4.4653313000e-07, 8.7624010000e-11, -6.3236512000e-15, -3.7714241000e+04, -4.5571741100e+00 })
    },
    elements = { ["S"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF2_plus = Substance {
    name = "SF2+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4271490000e+00, 1.5517546000e-02, -2.3060259000e-05, 1.6499612000e-08, -4.6246418000e-12, 8.3239557000e+04, 1.4127886600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.1209000000e+00, 9.9984817000e-04, -4.3992932000e-07, 8.4368137000e-11, -5.7795378000e-15, 8.2444585000e+04, -3.8630754200e+00 })
    },
    elements = { ["S"] = 1, ["F"] = 2, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF2_minus = Substance {
    name = "SF2-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2900503000e+00, 1.5538612000e-02, -2.7236604000e-05, 2.2182799000e-08, -6.8862156000e-12, -4.9391925000e+04, 9.8174776300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.5847123000e+00, 4.7886090000e-04, -2.1405440000e-07, 4.2175703000e-11, -3.0523910000e-15, -5.0005705000e+04, -5.7333478700e+00 })
    },
    elements = { ["S"] = 1, ["F"] = 2, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF3 = Substance {
    name = "SF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.8777728000e+00, 3.1234035000e-02, -5.1571379000e-05, 4.0247322000e-08, -1.2110594000e-11, -6.2067939000e+04, 1.6369436100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.8076897000e+00, 1.3671676000e-03, -6.0808333000e-07, 1.1883022000e-10, -8.4470915000e-15, -6.3440494000e+04, -1.6764886900e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF3_plus = Substance {
    name = "SF3+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0018508000e+00, 2.9755155000e-02, -4.3356794000e-05, 3.0554964000e-08, -8.4633479000e-12, 4.6044184000e+04, 1.9444500800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.1385016000e+00, 2.1288914000e-03, -9.4836822000e-07, 1.8607436000e-10, -1.3271729000e-14, 4.4486730000e+04, -1.5421242200e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 3, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF3_minus = Substance {
    name = "SF3-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.8788761000e+00, 3.1226174000e-02, -5.1551749000e-05, 4.0226788000e-08, -1.2102932000e-11, -9.4947055000e+04, 1.5645984300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.8095826000e+00, 1.3643678000e-03, -6.0757321000e-07, 1.1940532000e-10, -8.6259332000e-15, -9.6320265000e+04, -1.7494370700e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 3, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF4 = Substance {
    name = "SF4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.2819645000e+00, 4.3569899000e-02, -7.0125168000e-05, 5.3677244000e-08, -1.5914356000e-11, -9.3586701000e+04, 1.8419870300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.1124383000e+01, 2.1457994000e-03, -9.5452444000e-07, 1.8746111000e-10, -1.3535953000e-14, -9.5581669000e+04, -2.8875647700e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF4_plus = Substance {
    name = "SF4+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.9615813000e+00, 4.2132094000e-02, -6.9155565000e-05, 5.3720666000e-08, -1.6105895000e-11, 4.8094740000e+04, 1.6379900800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.1351941000e+01, 1.8875662000e-03, -8.3904062000e-07, 1.6414938000e-10, -1.1735195000e-14, 4.6224767000e+04, -2.8571508200e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 4, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF4_minus = Substance {
    name = "SF4-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0793762000e+00, 3.7839503000e-02, -6.6904657000e-05, 5.4822434000e-08, -1.7092844000e-11, -1.0914642000e+05, 5.6417877500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.2003326000e+01, 1.2007713000e-03, -5.7398274000e-07, 1.2299385000e-10, -9.2952734000e-15, -1.1060308000e+05, -3.1659265100e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 4, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF5 = Substance {
    name = "SF5",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.7147662000e+00, 6.8716008000e-02, -1.1407933000e-04, 8.9336379000e-08, -2.6940429000e-11, -1.1096178000e+05, 3.0272467800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.3610563000e+01, 2.6523130000e-03, -1.1691463000e-06, 2.4245132000e-10, -1.8314718000e-14, -1.1400293000e+05, -4.3015101200e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 5 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF5_plus = Substance {
    name = "SF5+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -1.7164861000e+00, 6.8940046000e-02, -1.1471051000e-04, 8.9977865000e-08, -2.7166326000e-11, 1.9061149000e+04, 2.9444513300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.3684216000e+01, 2.5177023000e-03, -1.0854393000e-06, 2.2533745000e-10, -1.7223917000e-14, 1.6004908000e+04, -4.4199723700e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 5, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF5_minus = Substance {
    name = "SF5-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.8477649000e+00, 5.8376369000e-02, -1.0131314000e-04, 8.1956977000e-08, -2.5319505000e-11, -1.5499326000e+05, 1.3853884400e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.4321910000e+01, 1.9313033000e-03, -8.6219936000e-07, 1.6972395000e-10, -1.2274860000e-14, -1.5734315000e+05, -4.5159253600e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 5, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF6 = Substance {
    name = "SF6",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -3.8388088000e+00, 8.3221721000e-02, -1.3181689000e-04, 9.9636154000e-08, -2.9248767000e-11, -1.4836477000e+05, 3.7161142600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.5162950000e+01, 4.3842318000e-03, -1.9486337000e-06, 3.8247196000e-10, -2.7605050000e-14, -1.5226801000e+05, -5.4415719400e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 6 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SF6_minus = Substance {
    name = "SF6-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -3.2609272000e+00, 8.2695369000e-02, -1.3299812000e-04, 1.0173768000e-07, -3.0146383000e-11, -1.6310860000e+05, 3.5423344200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.5428646000e+01, 4.0845317000e-03, -1.8164903000e-06, 3.5667328000e-10, -2.5750000000e-14, -1.6689884000e+05, -5.4396121800e+01 })
    },
    elements = { ["S"] = 1, ["F"] = 6, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SH = Substance {
    name = "SH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.4420322000e+00, -2.4359197000e-03, 1.9064576000e-06, 9.9166630000e-10, -9.5740762000e-13, 1.5523258000e+04, -1.1444903500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.0014537000e+00, 1.3394957000e-03, -4.6789663000e-07, 7.8804015000e-11, -5.0280453000e-15, 1.5905320000e+04, 6.2846271500e+00 })
    },
    elements = { ["S"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SN = Substance {
    name = "SN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9422971000e+00, -2.0035515000e-03, 7.3534644000e-06, -7.5168560000e-09, 2.5591098000e-12, 3.0563949000e+04, 4.5803080500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.8493976000e+00, 7.2756788000e-04, -2.9370203000e-07, 5.5013628000e-11, -3.8123551000e-15, 3.0459962000e+04, 4.4312735500e+00 })
    },
    elements = { ["S"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SO = Substance {
    name = "SO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1490233000e+00, 1.1839347000e-03, 2.5740686000e-06, -4.4443419000e-09, 1.8735159000e-12, -4.0407571000e+02, 8.3198791500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.0142873000e+00, 2.7022817000e-04, 8.2896667000e-08, -3.4323741000e-11, 3.1121444000e-15, -7.1051956000e+02, 3.4997350500e+00 })
    },
    elements = { ["S"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SOF2 = Substance {
    name = "SOF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.4749066000e+00, 2.0952426000e-02, -2.4164277000e-05, 1.2120377000e-08, -1.9338731000e-12, -6.6897602000e+04, 1.4197340400e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.0874212000e+00, 2.1095716000e-03, -9.0866912000e-07, 1.7344834000e-10, -1.2214158000e-14, -6.8238159000e+04, -1.3855591600e+01 })
    },
    elements = { ["S"] = 1, ["O"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SO2 = Substance {
    name = "SO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2665338000e+00, 5.3237902000e-03, 6.8437552000e-07, -5.2810047000e-09, 2.5590454000e-12, -3.6908148000e+04, 9.6646510800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.2451364000e+00, 1.9704204000e-03, -8.0375769000e-07, 1.5149969000e-10, -1.0558004000e-14, -3.7558227000e+04, -1.0740489200e+00 })
    },
    elements = { ["S"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SO2CLF = Substance {
    name = "SO2CLF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9817528000e+00, 2.6449167000e-02, -2.9200182000e-05, 1.3957611000e-08, -2.0304487000e-12, -6.8761497000e+04, 1.2731681200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0118286000e+01, 3.1488994000e-03, -1.3471514000e-06, 2.5580310000e-10, -1.7938256000e-14, -7.0509291000e+04, -2.3127850800e+01 })
    },
    elements = { ["S"] = 1, ["O"] = 2, ["Cl"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SO2CL2 = Substance {
    name = "SO2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3851677000e+00, 2.3212157000e-02, -2.6532112000e-05, 1.3499923000e-08, -2.2819281000e-12, -4.4802974000e+04, 6.5786788000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.0550937000e+01, 2.6734301000e-03, -1.1428230000e-06, 2.1686200000e-10, -1.5199151000e-14, -4.6295056000e+04, -2.4307857000e+01 })
    },
    elements = { ["S"] = 1, ["O"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SO2F2 = Substance {
    name = "SO2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.7324680000e+00, 2.8501760000e-02, -2.9453798000e-05, 1.2401300000e-08, -1.1715533000e-12, -9.2781393000e+04, 1.6948410000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 9.6078885000e+00, 3.7111026000e-03, -1.5899114000e-06, 3.0232464000e-10, -2.1228577000e-14, -9.4754768000e+04, -2.2848942000e+01 })
    },
    elements = { ["S"] = 1, ["O"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SO3 = Substance {
    name = "SO3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5780385000e+00, 1.4556335000e-02, -9.1764173000e-06, -7.9203022000e-10, 1.9709473000e-12, -4.8931753000e+04, 1.2265138400e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.0757376000e+00, 3.1763387000e-03, -1.3535760000e-06, 2.5630912000e-10, -1.7936044000e-14, -5.0211376000e+04, -1.1187517600e+01 })
    },
    elements = { ["S"] = 1, ["O"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S2 = Substance {
    name = "S2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8585754000e+00, 5.1758355000e-03, -6.5493434000e-06, 3.3998643000e-09, -4.0156766000e-13, 1.4412402000e+04, 9.8912784900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.9886069000e+00, 5.5775051000e-04, -5.0189278000e-08, -1.5470319000e-11, 2.6661771000e-15, 1.4198015000e+04, 4.4911915900e+00 })
    },
    elements = { ["S"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S2CL = Substance {
    name = "S2CL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.9742693200e+00, 1.9078290400e-02, -3.7626541300e-05, 3.4037497900e-08, -1.1568466400e-11, 7.9892298000e+03, 1.3842435400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.6232041800e+00, 4.1828463400e-04, -1.7565912000e-07, 3.0971838400e-11, -1.7515592200e-15, 7.3749590000e+03, -2.9851189200e+00 })
    },
    elements = { ["S"] = 2, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S2CL2 = Substance {
    name = "S2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.4790570800e+00, 3.2537002800e-02, -6.6390462000e-05, 6.2112484500e-08, -2.1711232500e-11, -4.0222556700e+03, 1.2279182400e+01 }),
        Range(1000.0, 6000.0, NASA7 { 9.4684102000e+00, 1.1218635200e-03, -6.9278428000e-07, 1.3865446300e-10, -9.2939783900e-15, -5.0501952400e+03, -1.5295044100e+01 })
    },
    elements = { ["S"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S2F2_thiothiony = Substance {
    name = "S2F2,thiothiony",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.4937239300e+00, 3.4257563500e-02, -5.9465683100e-05, 4.8769034400e-08, -1.5376168400e-11, -4.9810349000e+04, 1.8737513800e+01 }),
        Range(1000.0, 6000.0, NASA7 { 8.9401867100e+00, 1.1045018700e-03, -4.3622765700e-07, 7.4629847800e-11, -4.6204395100e-15, -5.1257474600e+04, -1.6673913700e+01 })
    },
    elements = { ["S"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S2O = Substance {
    name = "S2O",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8414257000e+00, 1.2188410000e-02, -1.6000241000e-05, 1.0309289000e-08, -2.6449120000e-12, -8.0603015000e+03, 1.2918073600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.9037524000e+00, 1.2369975000e-03, -5.4570790000e-07, 1.0659842000e-10, -7.6688243000e-15, -8.7752090000e+03, -2.2699983600e+00 })
    },
    elements = { ["S"] = 2, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_S8 = Substance {
    name = "S8",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.1970049600e+00, 9.1550359700e-02, -1.9126361100e-04, 1.8017719600e-07, -6.3039369500e-11, 8.1207169100e+03, 7.5804391700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.0724952100e+01, 1.3468611100e-03, -5.3722594600e-07, 9.2812285300e-11, -5.8195134000e-15, 5.5334432400e+03, -6.7480528700e+01 })
    },
    elements = { ["S"] = 8 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Si = Substance {
    name = "Si",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.7647615000e+00, -7.1207098500e-03, 1.5731830100e-05, -1.5382496900e-08, 5.5319493300e-12, 5.3205078200e+04, 3.0216877200e-01 }),
        Range(1000.0, 6000.0, NASA7 { 2.5806115700e+00, -2.0604465400e-04, 1.9305167700e-07, -4.5648510700e-11, 3.3641171600e-15, 5.3382993300e+04, 5.6065742300e+00 })
    },
    elements = { ["Si"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Si_plus = Substance {
    name = "Si+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.2441907300e+00, -7.5116086300e-03, 1.3336833300e-05, -1.0940614900e-08, 3.4135722300e-12, 1.4840879200e+05, -2.7891733400e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.6479457900e+00, -1.6010900800e-04, 6.5402415500e-08, -1.1622465500e-11, 7.5596127200e-16, 1.4870341300e+05, 4.7317184800e+00 })
    },
    elements = { ["Si"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiBr = Substance {
    name = "SiBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9719788000e+00, 4.7745279000e-03, -1.1130684000e-05, 1.0681202000e-08, -3.6726383000e-12, 2.6986304000e+04, 6.1119571900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.6681692000e+00, -1.0169413000e-04, 7.0838992000e-08, -1.4334856000e-11, 1.4076739000e-15, 2.6933459000e+04, 3.2249725900e+00 })
    },
    elements = { ["Si"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiBr2 = Substance {
    name = "SiBr2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.6719729000e+00, 1.0292897000e-02, -1.8714019000e-05, 1.5637900000e-08, -4.9456521000e-12, -8.0039163000e+03, 7.7266551900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.7224770000e+00, 3.8057929000e-04, -2.0138589000e-07, 4.4351172000e-11, -2.9239651000e-15, -8.3592980000e+03, -1.8195571100e+00 })
    },
    elements = { ["Si"] = 1, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiBr3 = Substance {
    name = "SiBr3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.7729602000e+00, 1.8371787000e-02, -3.3019332000e-05, 2.7367864000e-08, -8.6038787000e-12, -2.6554554000e+04, 5.1862702900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.5854968000e+00, 4.7923846000e-04, -2.1460595000e-07, 4.2338269000e-11, -3.0670794000e-15, -2.7244506000e+04, -1.2701308000e+01 })
    },
    elements = { ["Si"] = 1, ["Br"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiBr4 = Substance {
    name = "SiBr4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.6108937000e+00, 2.3239384000e-02, -4.1545746000e-05, 3.4305241000e-08, -1.0755076000e-11, -5.2968209000e+04, -3.0990393100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.2456087000e+01, 6.2844384000e-04, -2.8128951000e-07, 5.5474414000e-11, -4.0175959000e-15, -5.3850521000e+04, -2.5860909000e+01 })
    },
    elements = { ["Si"] = 1, ["Br"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiC = Substance {
    name = "SiC",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { -2.1924696000e+00, 4.1342700000e-02, -7.8274113000e-05, 6.0694120000e-08, -1.6729207000e-11, 8.5953143000e+04, 2.8769243000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.5799033000e+00, -1.3409344000e-03, 7.5483047000e-07, -1.6543778000e-10, 1.2663345000e-14, 8.5046120000e+04, -5.6501963100e+00 })
    },
    elements = { ["Si"] = 1, ["C"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiC2 = Substance {
    name = "SiC2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8806333000e+00, 6.7947767000e-03, -5.0277962000e-06, 1.0573232000e-09, 2.5513142000e-13, 7.2558249000e+04, 4.5505671900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.7011523000e+00, 2.1220690000e-03, -1.1457769000e-06, 3.1038768000e-10, -2.7763897000e-14, 7.2023391000e+04, -4.9737321100e+00 })
    },
    elements = { ["Si"] = 1, ["C"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiC4H12 = Substance {
    name = "SiC4H12",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 4.9461862600e+00, 4.1142974300e-02, -2.9323374200e-07, -2.2900369400e-08, 1.0956677300e-11, -3.7731049200e+04, 3.1863109900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.1563701800e+01, 3.2811206400e-02, -1.2637089100e-05, 2.2686851100e-09, -1.5426947700e-13, -4.0138136600e+04, -3.3634119500e+01 })
    },
    elements = { ["Si"] = 1, ["C"] = 4, ["H"] = 12 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiCL = Substance {
    name = "SiCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7396533000e+00, 3.1164716000e-03, -5.2474383000e-06, 4.2012543000e-09, -1.2887222000e-12, 2.2638261000e+04, 6.5673495100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3982894000e+00, 1.6740787000e-04, -5.3606247000e-08, 9.5731549000e-12, -4.4530892000e-16, 2.2513145000e+04, 3.4449582100e+00 })
    },
    elements = { ["Si"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiCL2 = Substance {
    name = "SiCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7109961000e+00, 1.3966352000e-02, -2.4711054000e-05, 2.0259219000e-08, -6.3193703000e-12, -2.1825949000e+04, 9.4615818000e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.6307889000e+00, 4.3853279000e-04, -1.9811351000e-07, 3.7005873000e-11, -2.0714394000e-15, -2.2360719000e+04, -4.2748702000e+00 })
    },
    elements = { ["Si"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiCL3 = Substance {
    name = "SiCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.2627027000e+00, 2.4050869000e-02, -4.2184882000e-05, 3.4373930000e-08, -1.0674462000e-11, -4.8981205000e+04, 8.4052385500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.3594631000e+00, 7.3834838000e-04, -3.2994049000e-07, 6.4989973000e-11, -4.7023241000e-15, -4.9930068000e+04, -1.5648011000e+01 })
    },
    elements = { ["Si"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiCL4 = Substance {
    name = "SiCL4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.1040010000e+00, 2.4933114000e-02, -3.6703263000e-05, 2.4448748000e-08, -6.0370155000e-12, -8.2359273000e+04, -9.7640049800e-01 }),
        Range(1000.0, 5000.0, NASA7 { 1.2089655000e+01, 1.0190735000e-03, -4.4167865000e-07, 8.4481573000e-11, -5.9491580000e-15, -8.3590250000e+04, -2.9926933600e+01 })
    },
    elements = { ["Si"] = 1, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiF = Substance {
    name = "SiF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2453535000e+00, 2.9702331000e-03, -2.4857990000e-06, 5.6304836000e-10, 1.4416034000e-13, -3.4944272000e+03, 7.8844346900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1227835000e+00, 4.6804891000e-04, -1.8677675000e-07, 3.5242093000e-11, -2.3015046000e-15, -3.7258619000e+03, 3.3885866900e+00 })
    },
    elements = { ["Si"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiF2 = Substance {
    name = "SiF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5148240000e+00, 1.4504157000e-02, -2.0594779000e-05, 1.4130176000e-08, -3.8132326000e-12, -7.1942433000e+04, 1.3004634800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.0562104000e+00, 1.0721952000e-03, -4.7129758000e-07, 9.0174764000e-11, -6.1370905000e-15, -7.2727083000e+04, -4.3599475700e+00 })
    },
    elements = { ["Si"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiF3 = Substance {
    name = "SiF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.3480220000e+00, 2.4665033000e-02, -3.5109350000e-05, 2.4232690000e-08, -6.5909416000e-12, -1.3206872000e+05, 1.4590183000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.3488191000e+00, 1.8772369000e-03, -8.3177125000e-07, 1.6290718000e-10, -1.1738533000e-14, -1.3339987000e+05, -1.4834389000e+01 })
    },
    elements = { ["Si"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiF4 = Substance {
    name = "SiF4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.1893068000e+00, 3.3702007000e-02, -4.6723179000e-05, 3.1584638000e-08, -8.4506114000e-12, -1.9603289000e+05, 1.3300471000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0478473000e+01, 2.8586756000e-03, -1.2646314000e-06, 2.4746863000e-10, -1.7824296000e-14, -1.9790550000e+05, -2.7507478000e+01 })
    },
    elements = { ["Si"] = 1, ["F"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH = Substance {
    name = "SiH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3362954000e+00, -5.0512422000e-03, 1.1423096000e-05, -9.3890652000e-09, 2.7718149000e-12, 4.4150714000e+04, 1.8821467900e-01 }),
        Range(1000.0, 5000.0, NASA7 { 3.0453194000e+00, 1.5587526000e-03, -6.2072677000e-07, 1.1518270000e-10, -7.6289773000e-15, 4.4331126000e+04, 6.0446554500e+00 })
    },
    elements = { ["Si"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH_plus = Substance {
    name = "SiH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7292588000e+00, -1.7881611000e-03, 4.2469257000e-06, -2.5580130000e-09, 4.0633740000e-13, 1.3697071000e+05, 1.5838731400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.9828595000e+00, 1.5455222000e-03, -5.9038555000e-07, 1.0517400000e-10, -6.8220234000e-15, 1.3707954000e+05, 5.0403501400e+00 })
    },
    elements = { ["Si"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiHBr3 = Substance {
    name = "SiHBr3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.3370110000e+00, 2.8872990000e-02, -4.6954120000e-05, 3.7523038000e-08, -1.1634919000e-11, -3.8663834000e+04, 1.0321671200e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0274831000e+01, 2.8666104000e-03, -1.2112581000e-06, 2.3004916000e-10, -1.6233504000e-14, -3.9846576000e+04, -1.8034065800e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 1, ["Br"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiHCL3 = Substance {
    name = "SiHCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6742042000e+00, 3.4380385000e-02, -5.4953856000e-05, 4.3103332000e-08, -1.3157012000e-11, -6.1601723000e+04, 1.4333509500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 9.9335635000e+00, 3.2481220000e-03, -1.3787171000e-06, 2.6266073000e-10, -1.8574886000e-14, -6.3070849000e+04, -2.0472058500e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiHF3 = Substance {
    name = "SiHF3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 9.0654816000e-01, 3.3265267000e-02, -4.3928825000e-05, 2.9328367000e-08, -7.8649188000e-12, -1.4584196000e+05, 1.9973265700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.7548828000e+00, 4.5527756000e-03, -1.9477531000e-06, 3.7300794000e-10, -2.6473973000e-14, -1.4765658000e+05, -1.8826977300e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 1, ["F"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiHI3 = Substance {
    name = "SiHI3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.5211225000e+00, 2.4841054000e-02, -4.0833984000e-05, 3.3068393000e-08, -1.0373774000e-11, -1.1407189000e+04, 7.7846695100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.0533604000e+01, 2.5888000000e-03, -1.0921903000e-06, 2.0720687000e-10, -1.4609854000e-14, -1.2397345000e+04, -1.6095034200e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 1, ["I"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH2 = Substance {
    name = "SiH2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 5.3107853000e+00, -1.4469945000e-02, 5.1427146000e-05, -5.4733474000e-08, 1.9288286000e-11, 2.8213394000e+04, -2.8224186200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.8593855000e+00, 1.6382565000e-03, -8.4396252000e-07, 1.8323330000e-10, -1.4114365000e-14, 2.7165699000e+04, -1.0064631000e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH2Br2 = Substance {
    name = "SiH2Br2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.0007427000e+00, 3.0282631000e-02, -4.4687336000e-05, 3.4411431000e-08, -1.0548720000e-11, -2.4507507000e+04, 1.8566736600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.1692601000e+00, 5.0285601000e-03, -2.1097564000e-06, 3.9872155000e-10, -2.8035838000e-14, -2.5842475000e+04, -1.1371191400e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 2, ["Br"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH2CL2 = Substance {
    name = "SiH2CL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0264938000e+00, 3.3013589000e-02, -4.7961062000e-05, 3.6225676000e-08, -1.0920447000e-11, -3.9963387000e+04, 2.0628857300e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.9121404000e+00, 5.3127891000e-03, -2.2336729000e-06, 4.2274812000e-10, -2.9755684000e-14, -4.1468503000e+04, -1.2886762700e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 2, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH2F2 = Substance {
    name = "SiH2F2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.9375998000e-01, 3.0079880000e-02, -3.5874136000e-05, 2.2668558000e-08, -5.9185925000e-12, -9.6230327000e+04, 2.2860753600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 7.0981857000e+00, 6.2146490000e-03, -2.6272352000e-06, 4.9909085000e-10, -3.5221641000e-14, -9.7918745000e+04, -1.1672569400e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 2, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH2I2 = Substance {
    name = "SiH2I2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6562813000e+00, 2.8626176000e-02, -4.3003700000e-05, 3.3708031000e-08, -1.0475547000e-11, -6.3252612000e+03, 1.7270925100e+01 }),
        Range(1000.0, 5000.0, NASA7 { 8.3573099000e+00, 4.8163586000e-03, -2.0161445000e-06, 3.8043699000e-10, -2.6720584000e-14, -7.5417667000e+03, -1.0297354900e+01 })
    },
    elements = { ["Si"] = 1, ["H"] = 2, ["I"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH3 = Substance {
    name = "SiH3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.0506807000e+00, 3.3103283000e-03, 1.1093997000e-05, -1.4483490000e-08, 5.1880354000e-12, 2.4051424000e+04, 7.2948206800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1270376000e+00, 6.1838866000e-03, -2.6122096000e-06, 4.9579695000e-10, -3.4960520000e-14, 2.3406801000e+04, 1.5180842300e-01 })
    },
    elements = { ["Si"] = 1, ["H"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH3Br = Substance {
    name = "SiH3Br",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.0060335000e+00, 2.5307876000e-02, -3.0396433000e-05, 2.1082150000e-08, -6.2055398000e-12, -1.0605360000e+04, 1.9467544600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.1350363000e+00, 7.1112914000e-03, -2.9735075000e-06, 5.6061857000e-10, -3.9350847000e-14, -1.1879900000e+04, -6.1782656900e+00 })
    },
    elements = { ["Si"] = 1, ["H"] = 3, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH3CL = Substance {
    name = "SiH3CL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.8307985000e-01, 2.6161728000e-02, -3.0854073000e-05, 2.0878395000e-08, -6.0153678000e-12, -1.8161979000e+04, 2.0236537900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.9919718000e+00, 7.2718938000e-03, -3.0441590000e-06, 5.7439620000e-10, -4.0340929000e-14, -1.9514930000e+04, -6.8676436700e+00 })
    },
    elements = { ["Si"] = 1, ["H"] = 3, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH3F = Substance {
    name = "SiH3F",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.7369726000e-01, 2.3371036000e-02, -2.1925973000e-05, 1.1438668000e-08, -2.6217598000e-12, -4.6268676000e+04, 2.0454129800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.5736119000e+00, 7.7410075000e-03, -3.2502758000e-06, 6.1454792000e-10, -4.3223774000e-14, -4.7688486000e+04, -6.2100229200e+00 })
    },
    elements = { ["Si"] = 1, ["H"] = 3, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH3I = Substance {
    name = "SiH3I",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.3659320000e+00, 2.4592575000e-02, -2.9991795000e-05, 2.1215143000e-08, -6.3482971000e-12, -1.5258355000e+03, 1.8640397900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.2686663000e+00, 6.9652305000e-03, -2.9102740000e-06, 5.4841467000e-10, -3.8480088000e-14, -2.7373527000e+03, -5.8284515600e+00 })
    },
    elements = { ["Si"] = 1, ["H"] = 3, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiH4 = Substance {
    name = "SiH4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 1.5922639000e+00, 1.2841093000e-02, -1.9456278000e-06, -4.3106372000e-09, 1.9874880000e-12, 3.1055942000e+03, 1.1833602500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.2092038000e+00, 9.0822628000e-03, -3.7905396000e-06, 7.1369888000e-10, -5.0046286000e-14, 2.1344627000e+03, -2.7276870400e+00 })
    },
    elements = { ["Si"] = 1, ["H"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiI = Substance {
    name = "SiI",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8044712000e+00, 1.2205306000e-02, -2.5876997000e-05, 2.3170966000e-08, -7.5798472000e-12, 3.6529488000e+04, 1.1875307700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.9749532000e+00, -4.0801921000e-04, 1.9199674000e-07, -3.8886553000e-11, 3.8552422000e-15, 3.6261727000e+04, 2.3016692000e+00 })
    },
    elements = { ["Si"] = 1, ["I"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiI2 = Substance {
    name = "SiI2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.3215510500e+00, 1.4427338000e-02, -3.1051764700e-05, 2.9831928600e-08, -1.0578547300e-11, 9.4121820200e+03, 1.0817856700e+01 }),
        Range(1000.0, 6000.0, NASA7 { 6.7431185500e+00, 3.6198315600e-04, -1.9527864400e-07, 4.3582320100e-11, -2.8998679200e-15, 9.0697536400e+03, 1.2909721300e-02 })
    },
    elements = { ["Si"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiN = Substance {
    name = "SiN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1051955000e+00, 1.4852449000e-03, 1.8561060000e-06, -3.7734883000e-09, 1.6835331000e-12, 4.3785709000e+04, 7.8885605200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.9858621000e+00, -8.7927056000e-06, 5.4269539000e-07, -1.7951017000e-10, 1.6337069000e-14, 4.3524809000e+04, 3.1746800200e+00 })
    },
    elements = { ["Si"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiO = Substance {
    name = "SiO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2528276000e+00, 4.1823126000e-04, 3.7806202000e-06, -5.1024483000e-09, 1.9471317000e-12, -1.3090340000e+04, 6.6617432900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 3.7478835000e+00, 8.1991943000e-04, -3.2525396000e-07, 5.7324962000e-11, -3.5108944000e-15, -1.3317430000e+04, 3.6610033900e+00 })
    },
    elements = { ["Si"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiO2 = Substance {
    name = "SiO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2628058000e+00, 8.5016584000e-03, -5.7388144000e-06, 1.2896573000e-11, 9.7544976000e-13, -3.8035971000e+04, 6.6680752900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.8620395000e+00, 1.7719784000e-03, -7.5194194000e-07, 1.4180584000e-10, -9.8856417000e-15, -3.8767816000e+04, -6.8471871100e+00 })
    },
    elements = { ["Si"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SiS = Substance {
    name = "SiS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8430693000e+00, 5.1150281000e-03, -6.3316073000e-06, 3.4387326000e-09, -6.2623385000e-13, 1.1718931000e+04, 9.4461919200e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1735772000e+00, 3.9282595000e-04, -1.5005172000e-07, 2.3242557000e-11, -6.0568867000e-16, 1.1417753000e+04, 2.8688823200e+00 })
    },
    elements = { ["Si"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Si2 = Substance {
    name = "Si2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.8155393000e+00, -1.9096542000e-04, 5.9233416000e-06, -5.7649603000e-09, 1.4775004000e-12, 6.9784655000e+04, 5.7407185900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.0474139000e+00, 5.3990034000e-04, -4.3078376000e-07, 1.1355206000e-10, -9.6262871000e-15, 6.9133185000e+04, -1.9102948100e+00 })
    },
    elements = { ["Si"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Si2C = Substance {
    name = "Si2C",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0438938000e+00, 7.3456957000e-03, -6.6412549000e-06, 2.4885047000e-09, -1.8196555000e-13, 6.2935417000e+04, 4.1844120900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.2510988000e+00, 1.3224176000e-03, -7.2805214000e-07, 2.3269424000e-10, -2.3285148000e-14, 6.2300999000e+04, -7.2834785100e+00 })
    },
    elements = { ["Si"] = 2, ["C"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Si2N = Substance {
    name = "Si2N",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.6686735000e+00, 1.1301840000e-02, -1.3637119000e-05, 7.1688050000e-09, -1.2378310000e-12, 4.6318083000e+04, 7.1227096400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.6709912000e+00, 9.1917882000e-04, -3.9517130000e-07, 7.4397145000e-11, -5.0284691000e-15, 4.5620154000e+04, -7.7982776600e+00 })
    },
    elements = { ["Si"] = 2, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Si3 = Substance {
    name = "Si3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.5979129000e+00, 1.0715274000e-02, -1.6100422000e-05, 1.0969207000e-08, -2.7832875000e-12, 7.4766324000e+04, 3.4553300900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.4213360000e+00, -1.1709948000e-04, 8.9820775000e-08, 7.1935964000e-12, -2.5670837000e-15, 7.4146699000e+04, -1.0352111000e+01 })
    },
    elements = { ["Si"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Sr = Substance {
    name = "Sr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.8979178800e+04, 5.5578209200e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.0523998200e+00, 1.1951644900e-03, -1.0745339500e-06, 3.5753097600e-10, -3.0561328000e-14, 1.9104104300e+04, 7.8802992800e+00 })
    },
    elements = { ["Sr"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrBr = Substance {
    name = "SrBr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.0970071000e+00, 1.9321060000e-03, -3.5068892000e-06, 2.9966194000e-09, -9.6331696000e-13, -1.2000644000e+04, 7.9343849900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3436158000e+00, 3.9895943000e-04, -2.5976126000e-07, 7.9320747000e-11, -6.6083830000e-15, -1.2025073000e+04, 6.8737107900e+00 })
    },
    elements = { ["Sr"] = 1, ["Br"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrCL = Substance {
    name = "SrCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.9036185000e+00, 2.4634428000e-03, -3.8776965000e-06, 2.8303375000e-09, -7.7304120000e-13, -1.6139740000e+04, 7.5166468300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.3344418000e+00, 3.8952112000e-04, -2.4461312000e-07, 7.3284365000e-11, -5.9733325000e-15, -1.6208781000e+04, 5.5252559300e+00 })
    },
    elements = { ["Sr"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrCL2 = Substance {
    name = "SrCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.8907141000e+00, 4.4942789000e-03, -7.2989404000e-06, 5.3588135000e-09, -1.4730631000e-12, -5.8816404000e+04, 3.4252507100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8964362000e+00, 1.1788718000e-04, -5.1854080000e-08, 1.0048831000e-11, -7.1584348000e-16, -5.9006904000e+04, -1.3543483900e+00 })
    },
    elements = { ["Sr"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrF = Substance {
    name = "SrF",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2713947000e+00, 4.6213354000e-03, -6.9007750000e-06, 4.7233582000e-09, -1.2046807000e-12, -3.6555630000e+04, 9.1070206900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.2457164000e+00, 4.6633587000e-04, -2.6925896000e-07, 7.3560080000e-11, -5.7213760000e-15, -3.6740299000e+04, 4.4660786900e+00 })
    },
    elements = { ["Sr"] = 1, ["F"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrF_plus = Substance {
    name = "SrF+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1093791000e+00, 5.0270035000e-03, -7.2689338000e-06, 4.7948501000e-09, -1.1683847000e-12, 2.2607202000e+04, 9.0741103800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 5.6135518000e+00, -2.1810917000e-03, 1.2215248000e-06, -1.6332971000e-10, 3.2584509000e-15, 2.1882140000e+04, -3.9014203200e+00 })
    },
    elements = { ["Sr"] = 1, ["F"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrF2 = Substance {
    name = "SrF2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.8135516000e+00, 8.3821602000e-03, -1.2999531000e-05, 9.1354392000e-09, -2.3989877000e-12, -9.3850543000e+04, 5.6640802100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.7547891000e+00, 2.7761964000e-04, -1.2158878000e-07, 2.3478780000e-11, -1.6675192000e-15, -9.4233632000e+04, -3.6419538900e+00 })
    },
    elements = { ["Sr"] = 1, ["F"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrI2 = Substance {
    name = "SrI2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.0450407000e+00, 1.8841699000e-03, -3.1175149000e-06, 2.3299391000e-09, -6.5232133000e-13, -3.5223013000e+04, 2.5782178300e-01 }),
        Range(1000.0, 5000.0, NASA7 { 7.4603678000e+00, 4.5403476000e-05, -2.0093274000e-08, 3.9155506000e-12, -2.8030980000e-16, -3.5300333000e+04, -1.7087692700e+00 })
    },
    elements = { ["Sr"] = 1, ["I"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrO = Substance {
    name = "SrO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7329997000e+00, 6.7399418000e-03, -1.0800485000e-05, 8.1767937000e-09, -2.3619871000e-12, -2.6443574000e+03, 1.0501290000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 9.6403024000e+00, -1.1285150000e-02, 7.8842322000e-06, -1.9035877000e-09, 1.5146547000e-13, -4.7499487000e+03, -2.5798170000e+01 })
    },
    elements = { ["Sr"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrOH = Substance {
    name = "SrOH",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.5276494000e+00, 1.7364854000e-02, -3.1735723000e-05, 2.6909646000e-08, -8.5270099000e-12, -2.6012678000e+04, 1.1260326600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.3570840000e+00, 1.7350735000e-03, -6.8339647000e-07, 1.4107068000e-10, -1.0415039000e-14, -2.6389173000e+04, -1.3873875400e+00 })
    },
    elements = { ["Sr"] = 1, ["O"] = 1, ["H"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrOH_plus = Substance {
    name = "SrOH+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.6101807000e+00, 1.7067677000e-02, -3.1275556000e-05, 2.6570854000e-08, -8.4301395000e-12, 3.7275229000e+04, 1.0204086700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.4951981000e+00, 1.4214066000e-03, -4.3245019000e-07, 6.2342429000e-11, -3.4797484000e-15, 3.6874107000e+04, -2.7706835800e+00 })
    },
    elements = { ["Sr"] = 1, ["O"] = 1, ["H"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrO2H2 = Substance {
    name = "SrO2H2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.3658850000e+00, 3.3709940000e-02, -6.2028171000e-05, 5.2843269000e-08, -1.6796046000e-11, -7.3709368000e+04, 9.7855968800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.0232674000e+00, 2.8049102000e-03, -8.4791007000e-07, 1.2132493000e-10, -6.7154183000e-15, -7.4485035000e+04, -1.5602668000e+01 })
    },
    elements = { ["Sr"] = 1, ["O"] = 2, ["H"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_SrS = Substance {
    name = "SrS",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4863318000e+00, 4.3841311000e-03, -7.5067553000e-06, 5.8192818000e-09, -1.6353204000e-12, 1.1834854000e+04, 8.3526306900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 8.9834700000e+00, -1.0995691000e-02, 8.6588417000e-06, -2.2955482000e-09, 1.9659683000e-13, 1.0301419000e+04, -2.0076266800e+01 })
    },
    elements = { ["Sr"] = 1, ["S"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ta = Substance {
    name = "Ta",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8381631000e+00, -2.7878563000e-03, 6.8973334000e-06, -4.5571751000e-09, 9.4125268000e-13, 9.3278793000e+04, 6.6689367900e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.5109094000e+00, 2.7029501000e-03, -1.0705594000e-06, 2.0238853000e-10, -1.3970173000e-14, 9.3517762000e+04, 1.2982706000e+01 })
    },
    elements = { ["Ta"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TaO = Substance {
    name = "TaO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9340108000e+00, 3.0592038000e-03, -1.9396364000e-06, 1.6288830000e-10, 3.0152535000e-13, 2.2154472000e+04, 1.1454646000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.4996603000e+00, 1.5112535000e-03, -6.5384578000e-07, 1.7784314000e-10, -1.6919405000e-14, 2.1994151000e+04, 8.5269589900e+00 })
    },
    elements = { ["Ta"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TaO2 = Substance {
    name = "TaO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1803826000e+00, 9.4702805000e-03, -8.7346868000e-06, 2.4522689000e-09, 3.3653421000e-13, -2.5451762000e+04, 1.3130353000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.9701669000e+00, 1.1792128000e-03, -5.6517413000e-07, 1.3113787000e-10, -1.0564437000e-14, -2.6169481000e+04, -1.0739980100e+00 })
    },
    elements = { ["Ta"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ti = Substance {
    name = "Ti",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.1444811900e+00, -6.8046900900e-03, 1.1886776500e-05, -9.7522346200e-09, 3.0906442300e-12, 5.5943835200e+04, -3.4818782200e-01 }),
        Range(1000.0, 6000.0, NASA7 { 3.0377431400e+00, -1.1111714400e-03, 7.5857109000e-07, -1.2707377300e-10, 6.9081927900e-15, 5.6123672800e+04, 4.7300188800e+00 })
    },
    elements = { ["Ti"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ti_plus = Substance {
    name = "Ti+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.7951112800e+00, 2.5223117600e-03, -5.6312140100e-06, 4.1637116900e-09, -1.0144332200e-12, 1.3599599900e+05, 5.6195158000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 3.6737163900e+00, -1.4855952500e-03, 7.8226673500e-07, -1.4385322700e-10, 8.9528439400e-15, 1.3585573500e+05, 1.5315018000e+00 })
    },
    elements = { ["Ti"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Ti_minus = Substance {
    name = "Ti-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 3.5895863300e+00, -4.9144442000e-03, 9.0648322000e-06, -7.6622840300e-09, 2.4472415700e-12, 5.4386978700e+04, 2.7691564800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5852608600e+00, -9.0841947900e-05, 3.6432327500e-08, -6.3164009800e-12, 3.9703504100e-16, 5.4564346700e+04, 7.4571106600e+00 })
    },
    elements = { ["Ti"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TiCL = Substance {
    name = "TiCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8543089000e+00, 7.9593345000e-03, -9.8211162000e-06, 5.2419981000e-09, -9.7986177000e-13, 1.7441216000e+04, 1.1730224600e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.2969760000e+00, -1.6401692000e-04, 1.5719761000e-07, -3.8567089000e-11, 3.0739663000e-15, 1.6857674000e+04, -4.9447267100e-01 })
    },
    elements = { ["Ti"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TiCL2 = Substance {
    name = "TiCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.9723475000e+00, 1.1277335000e-02, -2.0581916000e-05, 1.7186650000e-08, -5.4049590000e-12, -3.0366285000e+04, 2.5590963800e+00 }),
        Range(1000.0, 5000.0, NASA7 { 7.7624852000e+00, -9.3872425000e-04, 8.0121518000e-07, -1.9048030000e-10, 1.4961545000e-14, -3.0915805000e+04, -1.0752601100e+01 })
    },
    elements = { ["Ti"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TiCL3 = Substance {
    name = "TiCL3",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.8801557000e+00, 3.3558933000e-02, -5.9957460000e-05, 4.8863664000e-08, -1.5090992000e-11, -6.6776023000e+04, 1.3958208800e+01 }),
        Range(1000.0, 5000.0, NASA7 { 1.0008103000e+01, 4.1936374000e-04, -2.1504873000e-07, 4.5337018000e-11, -3.4546838000e-15, -6.8061250000e+04, -1.9510653200e+01 })
    },
    elements = { ["Ti"] = 1, ["Cl"] = 3 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TiCL4 = Substance {
    name = "TiCL4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 6.9496757000e+00, 2.6049659000e-02, -4.6520302000e-05, 3.8384834000e-08, -1.2027915000e-11, -9.4677831000e+04, -2.9257509400e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.2386030000e+01, 7.0931316000e-04, -3.1746078000e-07, 6.2603958000e-11, -4.5337038000e-15, -9.5669078000e+04, -2.8471595600e+01 })
    },
    elements = { ["Ti"] = 1, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TiO = Substance {
    name = "TiO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1198881000e+00, 3.1202487000e-03, -1.3297073000e-06, -1.3338362000e-09, 9.6315828000e-13, 5.4868719000e+03, 9.4426120300e+00 }),
        Range(1000.0, 5000.0, NASA7 { 4.1360176000e+00, 7.3926458000e-04, -4.5444464000e-07, 1.3043658000e-10, -1.1522557000e-14, 5.1983483000e+03, 4.1223704300e+00 })
    },
    elements = { ["Ti"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TiOCL = Substance {
    name = "TiOCL",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.4093856000e+00, 1.5170554000e-02, -2.4428483000e-05, 1.8734521000e-08, -5.5680684000e-12, -3.0887846000e+04, 8.6944261700e+00 }),
        Range(1000.0, 5000.0, NASA7 { 6.8319924000e+00, 7.6359387000e-04, -3.3953089000e-07, 6.6667069000e-11, -4.8132946000e-15, -3.1582311000e+04, -7.7538161300e+00 })
    },
    elements = { ["Ti"] = 1, ["O"] = 1, ["Cl"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TiOCL2 = Substance {
    name = "TiOCL2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 5.4408140000e+00, 1.7705049000e-02, -2.9525241000e-05, 2.3247328000e-08, -7.0479777000e-12, -6.7806854000e+04, 3.4507732500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 9.3368655000e+00, 7.5969987000e-04, -3.3827378000e-07, 6.6483863000e-11, -4.8033793000e-15, -6.8572645000e+04, -1.5144177200e+01 })
    },
    elements = { ["Ti"] = 1, ["O"] = 1, ["Cl"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_TiO2 = Substance {
    name = "TiO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.0142717000e+00, 1.0942101000e-02, -1.2878588000e-05, 7.1189529000e-09, -1.4927510000e-12, -3.8020501000e+04, 1.1364397500e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.8455061000e+00, 1.3938213000e-03, -6.6403062000e-07, 1.3857380000e-10, -9.8842184000e-15, -3.8700593000e+04, -2.7959990300e+00 })
    },
    elements = { ["Ti"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_V = Substance {
    name = "V",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 4.5173693000e+00, -7.9290660000e-03, 1.3380839000e-05, -8.8282901000e-09, 1.8945307000e-12, 6.0901417000e+04, -1.9697179100e+00 }),
        Range(1000.0, 5000.0, NASA7 { 2.9177852000e+00, 4.6236890000e-04, -4.9732030000e-07, 1.6775233000e-10, -1.5202552000e-14, 6.1064273000e+04, 5.1062146900e+00 })
    },
    elements = { ["V"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_VCL4 = Substance {
    name = "VCL4",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 7.1166462000e+00, 2.5423217000e-02, -4.5499017000e-05, 3.7583886000e-08, -1.1780344000e-11, -6.6123893000e+04, -2.3309547500e+00 }),
        Range(1000.0, 5000.0, NASA7 { 1.2718647000e+01, 1.6600176000e-05, 1.4161498000e-07, -3.4761833000e-11, 2.2889763000e-15, -6.7187992000e+04, -2.8848010300e+01 })
    },
    elements = { ["V"] = 1, ["Cl"] = 4 },
    reference = "",
    aggregation_type = "Gas",
}

local s_VN = Substance {
    name = "VN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.7233590000e+00, 4.1642989000e-03, -2.1912812000e-06, -1.2351872000e-09, 1.0791833000e-12, 6.1927893000e+04, 1.1417357900e+01 }),
        Range(1000.0, 5000.0, NASA7 { 4.1852280000e+00, 6.1514720000e-04, -3.5776335000e-07, 1.0748862000e-10, -9.7275505000e-15, 6.1511540000e+04, 3.7761866100e+00 })
    },
    elements = { ["V"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_VO = Substance {
    name = "VO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 2.9438441000e+00, 2.9059234000e-03, -9.9516575000e-07, -1.4086592000e-09, 9.2438508000e-13, 1.4352746000e+04, 1.0186431000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 3.9114702000e+00, 7.7547792000e-04, -4.2263786000e-07, 1.1608838000e-10, -1.0070724000e-14, 1.4065204000e+04, 5.0718540900e+00 })
    },
    elements = { ["V"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_VO2 = Substance {
    name = "VO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.1937859000e+00, 9.2979457000e-03, -8.3422469000e-06, 2.1049170000e-09, 4.4582645000e-13, -2.9275491000e+04, 1.1287219000e+01 }),
        Range(1000.0, 5000.0, NASA7 { 5.9470147000e+00, 1.1686779000e-03, -5.0536379000e-07, 9.6723611000e-11, -6.8245883000e-15, -2.9983802000e+04, -2.7380251100e+00 })
    },
    elements = { ["V"] = 1, ["O"] = 2 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Xe = Substance {
    name = "Xe",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, -8.9914133000e-14, 2.5219686000e-16, -2.9218666200e-19, 1.1894921800e-22, -7.4537500000e+02, 6.1644199300e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5000532200e+00, -1.0513654400e-07, 6.7532689700e-11, -1.7094490900e-14, 1.4768104900e-18, -7.4539418600e+02, 6.1641289800e+00 })
    },
    elements = { ["Xe"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Xe_plus = Substance {
    name = "Xe+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 1000.0, NASA7 { 2.5000747700e+00, -6.2561418600e-07, 1.8643096300e-09, -2.3559945700e-12, 1.0721936800e-15, 1.4076109500e+05, 7.5504043800e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5835057900e+00, -1.5348875000e-04, 8.0959463900e-08, -1.1428923400e-11, 4.8208140600e-16, 1.4073011700e+05, 7.0905706900e+00 })
    },
    elements = { ["Xe"] = 1, ["E"] = -1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Zn = Substance {
    name = "Zn",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, -4.8938318700e-12, 1.3801210100e-14, -1.5867967800e-17, 6.3849877600e-21, 1.4938050700e+04, 5.1188610100e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.5123367400e+00, -2.9285943000e-05, 2.4313024100e-08, -8.3905875400e-12, 1.0267689200e-15, 1.4934144900e+04, 5.0533114500e+00 })
    },
    elements = { ["Zn"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Zn_plus = Substance {
    name = "Zn+",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.2394897600e+05, 5.8120081900e+00 }),
        Range(1000.0, 6000.0, NASA7 { 2.4806957700e+00, 3.3602102000e-05, -1.6028716900e-08, 1.4379503100e-12, 2.9289869000e-16, 1.2395640400e+05, 5.9192168300e+00 })
    },
    elements = { ["Zn"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Zn_minus = Substance {
    name = "Zn-",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(298.15, 6000.0, NASA7 { 2.5000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 0.0000000000e+00, 1.2468873300e+04, 5.8120207800e+00 })
    },
    elements = { ["Zn"] = 1, ["E"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_Zr = Substance {
    name = "Zr",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 1.2365592900e+00, 1.2828082000e-02, -2.7213843200e-05, 2.3323734100e-08, -7.0944349100e-12, 7.2624560300e+04, 1.1958144700e+01 }),
        Range(1000.0, 6000.0, NASA7 { 2.5429420600e+00, 6.2288970700e-04, -1.0743263600e-07, 2.3874451600e-11, -2.1763229600e-15, 7.2791816600e+04, 7.5795145100e+00 })
    },
    elements = { ["Zr"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ZrN = Substance {
    name = "ZrN",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 3.0718871700e+00, 2.6430047400e-03, 3.1849942800e-07, -3.6335058100e-09, 2.0267956400e-12, 8.4768494700e+04, 9.8058898700e+00 }),
        Range(1000.0, 6000.0, NASA7 { 4.1437892200e+00, 4.0430721300e-04, -1.4463310700e-07, 2.4760637400e-11, -1.5428020200e-15, 8.4461420000e+04, 4.1593790600e+00 })
    },
    elements = { ["Zr"] = 1, ["N"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ZrO = Substance {
    name = "ZrO",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(200.0, 1000.0, NASA7 { 4.1229157600e+00, -1.3188615300e-02, 6.9292242000e-05, -9.5871931300e-08, 4.1030608500e-11, 9.0074921200e+03, 5.5694593000e+00 }),
        Range(1000.0, 6000.0, NASA7 { 7.2969602900e+00, -2.9011932800e-03, 1.1595757400e-06, -1.8029902100e-10, 1.0175887600e-14, 7.6818037700e+03, -1.4219255100e+01 })
    },
    elements = { ["Zr"] = 1, ["O"] = 1 },
    reference = "",
    aggregation_type = "Gas",
}

local s_ZrO2 = Substance {
    name = "ZrO2",

    molar_volume = 0.0,


    s0 = 0.0,
    ranges = {
        Range(300.0, 1000.0, NASA7 { 3.2103779000e+00, 1.1628976000e-02, -1.5575360000e-05, 1.0044243000e-08, -2.5438890000e-12, -3.5775612000e+04, 1.1773867700e+01 }),
        Range(1000.0, 5000.0, NASA7 { 6.1418545000e+00, 9.7703695000e-04, -4.3337182000e-07, 8.4954589000e-11, -6.1266648000e-15, -3.6446178000e+04, -2.7097891200e+00 })
    },
    elements = { ["Zr"] = 1, ["O"] = 2 },
    reference = "",
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
