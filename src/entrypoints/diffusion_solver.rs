use majordome_diffusion::slycke::create_carbon_diffusivity;
use majordome_plotting::GnuplotInteractive;
use mlua::prelude::*;
use pyo3::prelude::*;
use std::path::PathBuf;

#[pyfunction]
#[pyo3(name = "diffusion_solver", signature = (script=None))]
pub fn entrypoint(script: Option<String>) -> PyResult<()> {
    println!("Majordome Diffusion Lua Entrypoint");

    if let Some(script_path) = script {
        let lua = Lua::new();

        // Let's create a plotting function in Lua that uses our Gnuplot wrapper
        let plot_func = lua
            .create_function(|_, (title, data): (String, Vec<Vec<f64>>)| {
                let mut gp = GnuplotInteractive::new();
                gp.write(&format!("set title '{}'", title));
                gp.write("plot '-' with lines title 'Carbon'");

                // Convert to slice format expected by data_block
                let refs: Vec<&[f64]> = data.iter().map(|v| v.as_slice()).collect();
                gp.data_block("data", &refs);
                Ok(())
            })
            .map_err(|e| pyo3::exceptions::PyRuntimeError::new_err(e.to_string()))?;

        let globals = lua.globals();
        globals
            .set("plot_results", plot_func)
            .map_err(|e| pyo3::exceptions::PyRuntimeError::new_err(e.to_string()))?;

        let script_content = std::fs::read_to_string(&script_path)
            .map_err(|e| pyo3::exceptions::PyIOError::new_err(e.to_string()))?;

        lua.load(&script_content)
            .exec()
            .map_err(|e| pyo3::exceptions::PyRuntimeError::new_err(e.to_string()))?;
    } else {
        println!("Please provide a lua script to run.");
    }

    Ok(())
}
