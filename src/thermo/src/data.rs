use crate::core::AggregationType;
use crate::core::Parameterization;
use crate::core::Substance;
use crate::core::TemperatureRange;
use mlua::prelude::*;
use std::collections::HashMap;
use std::fs::read_to_string;


impl FromLua for AggregationType {
    fn from_lua(value: LuaValue, _lua: &Lua) -> LuaResult<Self> {
        let s = value
            .as_string()
            .ok_or_else(|| LuaError::FromLuaConversionError {
                from: "Value",
                to: "AggregationType".to_string(),
                message: Some("Expected string".to_string()),
            })?
            .to_str()?
            .to_string();

        match s.as_str() {
            "Solid" => Ok(AggregationType::Solid),
            "Liquid" => Ok(AggregationType::Liquid),
            "Gas" => Ok(AggregationType::Gas),
            _ => Err(LuaError::FromLuaConversionError {
                from: "String",
                to: "AggregationType".to_string(),
                message: Some(format!("Unknown aggregation type: {}", s)),
            }),
        }
    }
}


impl FromLua for Parameterization {
    fn from_lua(value: LuaValue, _lua: &Lua) -> LuaResult<Self> {
        let table = value
            .as_table()
            .ok_or_else(|| LuaError::FromLuaConversionError {
                from: "Value",
                to: "Parameterization".to_string(),
                message: Some("Expected table".to_string()),
            })?;

        let model_type: String = table.get("type")?;

        match model_type.as_str() {
            "MaierKelley" => Ok(Parameterization::MaierKelley {
                a: table.get("a")?,
                b: table.get("b")?,
                c: table.get("c")?,
            }),
            "NASA7" => Ok(Parameterization::NASA7 {
                a1: table.get("a1")?,
                a2: table.get("a2")?,
                a3: table.get("a3")?,
                a4: table.get("a4")?,
                a5: table.get("a5")?,
                a6: table.get("a6")?,
                a7: table.get("a7")?,
            }),
            "NASA9" => Ok(Parameterization::NASA9 {
                a1: table.get("a1")?,
                a2: table.get("a2")?,
                a3: table.get("a3")?,
                a4: table.get("a4")?,
                a5: table.get("a5")?,
                a6: table.get("a6")?,
                a7: table.get("a7")?,
                a8: table.get("a8")?,
                a9: table.get("a9")?,
            }),
            "Shomate" => Ok(Parameterization::Shomate {
                a: table.get("a")?,
                b: table.get("b")?,
                c: table.get("c")?,
                d: table.get("d")?,
                e: table.get("e")?,
                f: table.get("f")?,
                g: table.get("g")?,
                h: table.get("h")?,
            }),
            "GibbsPolynomial" => Ok(Parameterization::GibbsPolynomial {
                a: table.get("a")?,
                b: table.get("b")?,
                c: table.get("c")?,
                d: table.get("d")?,
                e: table.get("e")?,
                f: table.get("f")?,
                g: table.get("g")?,
            }),
            _ => Err(LuaError::FromLuaConversionError {
                from: "Table",
                to: "Parameterization".to_string(),
                message: Some(format!("Unknown parameterization type: {}", model_type)),
            }),
        }
    }
}


impl FromLua for TemperatureRange {
    fn from_lua(value: LuaValue, _lua: &Lua) -> LuaResult<Self> {
        let table = value
            .as_table()
            .ok_or_else(|| LuaError::FromLuaConversionError {
                from: "Value",
                to: "TemperatureRange".to_string(),
                message: Some("Expected table".to_string()),
            })?;

        Ok(TemperatureRange {
            t_min: table.get("t_min")?,
            t_max: table.get("t_max")?,
            model: table.get("model")?,
        })
    }
}


impl FromLua for Substance {
    fn from_lua(value: LuaValue, _lua: &Lua) -> LuaResult<Self> {
        let table = value
            .as_table()
            .ok_or_else(|| LuaError::FromLuaConversionError {
                from: "Value",
                to: "Substance".to_string(),
                message: Some("Expected table".to_string()),
            })?;

        Ok(Substance {
            name: table.get("name")?,
            molar_mass: table.get("molar_mass")?,
            molar_volume: table.get("molar_volume")?,
            delta_gf: table.get("delta_gf")?,
            delta_hf: table.get("delta_hf")?,
            s0: table.get("s0")?,
            ranges: table.get("ranges")?,
            elements: table.get("elements")?,
            reference: table.get("reference")?,
            aggregation_type: table.get("aggregation_type")?,
        })
    }
}


pub fn load_substances_from_lua(path: &str) -> LuaResult<HashMap<String, Substance>> {
    let lua = Lua::new();
    let globals = lua.globals();

    // Register MaierKelley constructor
    let mk_fn = lua.create_function(|lua, (a, b, c): (f64, f64, f64)| {
        let table = lua.create_table()?;
        table.set("type", "MaierKelley")?;
        table.set("a", a)?;
        table.set("b", b)?;
        table.set("c", c)?;
        Ok(table)
    })?;
    globals.set("MaierKelley", mk_fn)?;

    // Register NASA7 constructor (takes a table/list of 7 coefficients)
    let nasa7_fn = lua.create_function(|lua, coeffs: Vec<f64>| {
        let table = lua.create_table()?;
        table.set("type", "NASA7")?;
        if coeffs.len() < 7 {
            let err = "NASA7 requires 7 coefficients".to_string();
            return Err(LuaError::RuntimeError(err));
        }
        for (i, &val) in coeffs.iter().enumerate().take(7) {
            table.set(format!("a{}", i + 1), val)?;
        }
        Ok(table)
    })?;
    globals.set("NASA7", nasa7_fn)?;

    // Register Range constructor
    let range_fn = lua.create_function(|lua, (t_min, t_max, model): (f64, f64, LuaValue)| {
        let table = lua.create_table()?;
        table.set("t_min", t_min)?;
        table.set("t_max", t_max)?;
        table.set("model", model)?;
        Ok(table)
    })?;
    globals.set("Range", range_fn)?;

    // Register Substance helper (adds defaults)
    let substance_fn = lua.create_function(|_, table: LuaTable| {
        if !table.contains_key("reference")? {
            table.set("reference", "")?;
        }
        if !table.contains_key("aggregation_type")? {
            table.set("aggregation_type", "Solid")?;
        }
        Ok(table)
    })?;
    globals.set("Substance", substance_fn)?;

    let content =
        read_to_string(path).map_err(|e| LuaError::ExternalError(std::sync::Arc::new(e)))?;

    let map: HashMap<String, Substance> = lua.load(&content).eval()?;
    Ok(map)
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_load_from_lua() {
        let result = load_substances_from_lua("data.lua");
        assert!(
            result.is_ok(),
            "Failed to load from lua: {:?}",
            result.err()
        );
        let map = result.unwrap();
        assert!(map.len() >= 6);
        assert!(map.contains_key("Calcite"));
        assert!(map.contains_key("CO2"));
        assert_eq!(map.get("Calcite").unwrap().aggregation_type, AggregationType::Solid);
        assert_eq!(map.get("CO2").unwrap().aggregation_type, AggregationType::Gas);
    }
}
