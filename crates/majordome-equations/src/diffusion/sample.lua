-- General 3-Species Lua Configuration for Nonlinear Diffusion Solver CLI
local config = {
    depth = 0.001,        -- 1.0 mm
    n_cells = 20,         -- 20 cells
    total_time = 3600.0,  -- 1 hour
    dt = 60.0,            -- 1 minute time step

    -- 3 Species simulated simultaneously
    species = { "Carbon", "Nitrogen", "ElementX" },
    molar_masses = { 12.011, 14.007, 50.0 },

    -- Initial compositions for each species (mass fraction)
    y0 = { 0.002, 0.0, 0.005 },

    -- Constant temperature 950 °C (1223.15 K)
    temperature = 1223.15,

    -- Environment bulk potentials
    y_inf = { 0.008, 0.004, 0.0 },

    -- Sherwood transfer coefficients
    h_inf = { 1e-5, 1e-5, 5e-6 },

    -- Custom Lua diffusivity functions evaluating on current concentrations & temp
    diffusivities = {
        function(c, temp)
            -- Carbon diffusivity: constant 1e-11 m2/s
            return 1e-11
        end,
        function(c, temp)
            -- Nitrogen diffusivity: constant 1e-12 m2/s
            return 1e-12
        end,
        function(c, temp)
            -- Element X diffusivity: constant 5e-13 m2/s
            return 5e-13
        end
    },

    -- Output plot destination
    plot_output = "test_setup_general_plot.png"
}

return config
