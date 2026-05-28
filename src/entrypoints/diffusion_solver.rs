use majordome_diffusion::interstitial::NonlinearDiffusionSolver;
use majordome_fvm::ImmersedNodeDomain1D;
use majordome_plotting::GnuplotInteractive;
use mlua::prelude::*;
use pyo3::prelude::*;
use std::cell::RefCell;
use std::collections::HashMap;

thread_local! {
    static LUA_STATE: RefCell<Option<Lua>> = RefCell::new(None);
    static LUA_KEYS: RefCell<HashMap<String, mlua::RegistryKey>> = RefCell::new(HashMap::new());
    static LUA_DIFF_KEYS: RefCell<Vec<mlua::RegistryKey>> = RefCell::new(Vec::new());
}

fn evaluate_generic_diffusivity(species_idx: usize, c: &[f64], temp: f64) -> f64 {
    LUA_STATE.with(|state| {
        let state_borrow = state.borrow();

        if let Some(ref lua) = *state_borrow {
            LUA_DIFF_KEYS.with(|keys| {
                let keys_borrow = keys.borrow();

                if species_idx < keys_borrow.len() {
                    let key = &keys_borrow[species_idx];
                    let func: mlua::Function = lua.registry_value(key).unwrap();
                    func.call::<f64>((c.to_vec(), temp)).unwrap_or(1e-11)
                } else {
                    1e-11
                }
            })
        } else {
            1e-11
        }
    })
}

#[pyfunction]
#[pyo3(name = "diffusion_solver", signature = (args=None))]
pub fn entrypoint(args: Option<Vec<String>>) -> PyResult<()> {
    println!("Majordome Diffusion Standalone Lua CLI Solver");

    let args_vec = args.unwrap_or_default();

    let script_path = if args_vec.is_empty() {
        println!("Usage: diffusion_solver <setup_script.lua>");
        return Ok(());
    } else {
        args_vec[0].clone()
    };

    let lua = Lua::new();

    let script_content = std::fs::read_to_string(&script_path)
        .map_err(|e| pyo3::exceptions::PyIOError::new_err(e.to_string()))?;

    let config_val: mlua::Value = lua
        .load(&script_content)
        .eval()
        .map_err(|e| pyo3::exceptions::PyRuntimeError::new_err(e.to_string()))?;

    let config_table = match config_val {
        mlua::Value::Table(t) => t,
        _ => {
            return Err(pyo3::exceptions::PyTypeError::new_err(
                "Configuration script must return a Lua table.",
            ));
        }
    };

    // Store in thread-local LUA_STATE so callback functions can access it
    LUA_STATE.with(|state| {
        *state.borrow_mut() = Some(lua.clone());
    });

    // Extract basic numeric properties
    let depth: f64 = config_table
        .get("depth")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    let n_cells: usize = config_table
        .get("n_cells")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    let total_time: f64 = config_table
        .get("total_time")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    let dt: f64 = config_table
        .get("dt")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    // Create Grid
    let grid: ImmersedNodeDomain1D = ImmersedNodeDomain1D::linear(depth, n_cells, None)
        .map_err(pyo3::exceptions::PyValueError::new_err)?;

    // Extract species names list
    let species_names: Vec<String> = match config_table.get::<mlua::Table>("species") {
        Ok(t) => {
            let mut v = Vec::new();
            let mut i = 1;
            while let Ok(name) = t.get::<String>(i) {
                v.push(name);
                i += 1;
            }
            v
        }
        _ => vec!["Carbon".to_string(), "Nitrogen".to_string()],
    };

    let num_species = species_names.len();

    // Extract molar masses list
    let molar_masses: Vec<f64> = match config_table.get::<mlua::Table>("molar_masses") {
        Ok(t) => {
            let mut v = Vec::new();
            let mut i = 1;
            while let Ok(m) = t.get::<f64>(i) {
                v.push(m);
                i += 1;
            }
            v
        }
        _ => vec![12.011, 14.007],
    };

    // Initial compositions (y0 list of vectors)
    let y0_val = config_table
        .get::<mlua::Value>("y0")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    let mut y0 = Vec::new();
    match y0_val {
        mlua::Value::Table(t) => {
            for s in 0..num_species {
                let val: mlua::Value = t.get(s + 1).unwrap_or(mlua::Value::Nil);
                match val {
                    mlua::Value::Number(num) => {
                        y0.push(vec![num; n_cells]);
                    }
                    mlua::Value::Table(inner_t) => {
                        let mut v = Vec::with_capacity(n_cells);
                        for i in 1..=n_cells {
                            v.push(inner_t.get::<f64>(i).unwrap_or(0.0));
                        }
                        y0.push(v);
                    }
                    _ => {
                        y0.push(vec![0.0; n_cells]);
                    }
                }
            }
        }
        _ => {
            for _ in 0..num_species {
                y0.push(vec![0.0; n_cells]);
            }
        }
    }

    // Discretization arrays
    let time_points = {
        let mut pts = Vec::new();
        let mut t = 0.0;

        while t <= total_time + 1e-9 {
            pts.push(t);
            t += dt;
        }

        pts
    };

    let time_steps = vec![dt; time_points.len().saturating_sub(1)];

    // Boundary potential, coefficients and temperature callables

    // 1. External Temperature
    let temp_val = config_table
        .get::<mlua::Value>("temperature")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    let external_temperature: Box<dyn Fn(f64) -> f64 + Send + Sync> = match temp_val {
        mlua::Value::Number(num) => Box::new(move |_t| num),
        mlua::Value::Function(func) => {
            let key = lua
                .create_registry_value(func)
                .map_err(|e| pyo3::exceptions::PyRuntimeError::new_err(e.to_string()))?;

            LUA_KEYS.with(|keys| {
                keys.borrow_mut().insert("temperature".to_string(), key);
            });

            Box::new(move |t| {
                LUA_STATE.with(|state| {
                    let state_borrow = state.borrow();
                    let lua_ref = state_borrow.as_ref().unwrap();

                    LUA_KEYS.with(|keys| {
                        let keys_borrow = keys.borrow();
                        let key_ref = keys_borrow.get("temperature").unwrap();
                        let f: mlua::Function = lua_ref.registry_value(key_ref).unwrap();
                        f.call::<f64>(t).unwrap()
                    })
                })
            })
        }
        _ => Box::new(|_t| 1173.15),
    };

    // 2. External Coefficients
    let coefs_val = config_table
        .get::<mlua::Value>("h_inf")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    let external_coefficients: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync> = match coefs_val {
        mlua::Value::Table(t) => {
            let mut val = Vec::with_capacity(num_species);
            for i in 1..=num_species {
                val.push(t.get::<f64>(i).unwrap_or(1e-5));
            }
            Box::new(move |_t| val.clone())
        }
        mlua::Value::Function(func) => {
            let key = lua
                .create_registry_value(func)
                .map_err(|e| pyo3::exceptions::PyRuntimeError::new_err(e.to_string()))?;

            LUA_KEYS.with(|keys| {
                keys.borrow_mut().insert("h_inf".to_string(), key);
            });

            Box::new(move |t| {
                LUA_STATE.with(|state| {
                    let state_borrow = state.borrow();
                    let lua_ref = state_borrow.as_ref().unwrap();

                    LUA_KEYS.with(|keys| {
                        let keys_borrow = keys.borrow();
                        let key_ref = keys_borrow.get("h_inf").unwrap();
                        let f: mlua::Function = lua_ref.registry_value(key_ref).unwrap();
                        f.call::<Vec<f64>>(t).unwrap()
                    })
                })
            })
        }
        _ => {
            let val = vec![1e-5; num_species];
            Box::new(move |_t| val.clone())
        }
    };

    // 3. External Potential
    let pot_val = config_table
        .get::<mlua::Value>("y_inf")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    let external_potential: Box<dyn Fn(f64) -> Vec<f64> + Send + Sync> = match pot_val {
        mlua::Value::Table(t) => {
            let mut val = Vec::with_capacity(num_species);
            for i in 1..=num_species {
                val.push(t.get::<f64>(i).unwrap_or(0.0));
            }
            Box::new(move |_t| val.clone())
        }
        mlua::Value::Function(func) => {
            let key = lua
                .create_registry_value(func)
                .map_err(|e| pyo3::exceptions::PyRuntimeError::new_err(e.to_string()))?;

            LUA_KEYS.with(|keys| {
                keys.borrow_mut().insert("y_inf".to_string(), key);
            });

            Box::new(move |t| {
                LUA_STATE.with(|state| {
                    let state_borrow = state.borrow();
                    let lua_ref = state_borrow.as_ref().unwrap();

                    LUA_KEYS.with(|keys| {
                        let keys_borrow = keys.borrow();
                        let key_ref = keys_borrow.get("y_inf").unwrap();
                        let f: mlua::Function = lua_ref.registry_value(key_ref).unwrap();
                        f.call::<Vec<f64>>(t).unwrap()
                    })
                })
            })
        }
        _ => {
            let val = vec![0.0; num_species];
            Box::new(move |_t| val.clone())
        }
    };

    // Diffusivity Models Setup (Dynamic table of callbacks)
    let diffs_val = config_table
        .get::<mlua::Value>("diffusivities")
        .map_err(|e| pyo3::exceptions::PyTypeError::new_err(e.to_string()))?;

    match diffs_val {
        mlua::Value::Table(t) => {
            let mut keys = Vec::new();
            for s in 0..num_species {
                if let Ok(func) = t.get::<mlua::Function>(s + 1) {
                    let key = lua
                        .create_registry_value(func)
                        .map_err(|e| pyo3::exceptions::PyRuntimeError::new_err(e.to_string()))?;
                    keys.push(key);
                }
            }
            LUA_DIFF_KEYS.with(|diff_keys| {
                *diff_keys.borrow_mut() = keys;
            });
        }
        _ => {}
    }

    let diffusivity_callback = Box::new(evaluate_generic_diffusivity);

    // Run Simulation using generalized solver
    let mut solver = NonlinearDiffusionSolver::new(
        grid,
        &y0,
        time_points,
        time_steps,
        species_names.clone(),
        molar_masses,
        diffusivity_callback,
        external_temperature,
        external_coefficients,
        external_potential,
    );

    // Run integration loop printing progress every 12 mins (72 steps if dt=10)
    let print_freq = std::cmp::max(1, (720.0 / dt) as usize);
    solver.integrate(print_freq);

    // Check for Gnuplot Plotting Request
    if let Ok(plot_path) = config_table.get::<String>("plot_output") {
        println!("Generating output plot at: {}", plot_path);
        let zc = solver.grid.interior.clone();

        let mut arrays: Vec<&[f64]> = Vec::new();
        let refs_x = zc.iter().map(|&x| x * 1.0e3).collect::<Vec<f64>>();
        arrays.push(&refs_x);

        let mut species_profiles = Vec::new();
        for s in 0..num_species {
            species_profiles.push(solver.fields[s].concentration.clone());
        }
        for s in 0..num_species {
            arrays.push(&species_profiles[s]);
        }

        let mut gp = GnuplotInteractive::new();
        gp.write("set terminal pngcairo size 800,600");
        gp.write(&format!("set output '{}'", plot_path));
        gp.write("set title 'Non-linear Diffusion Simulation Results'");
        gp.write("set xlabel 'Depth (mm)'");
        gp.write("set ylabel 'Concentration'");
        gp.write("set grid");
        gp.write("set xrange [0:*]");
        gp.write("set yrange [0:*]");

        let mut plot_cmd = "plot".to_string();
        for s in 0..num_species {
            if s > 0 {
                plot_cmd.push_str(", ");
            }
            plot_cmd.push_str(&format!(
                "$data using 1:{} with lines title '{}'",
                s + 2,
                species_names[s]
            ));
        }

        gp.data_block("$data", &arrays);
        gp.write(&plot_cmd);
        gp.write("unset output");
        gp.write("exit");
    }

    Ok(())
}
