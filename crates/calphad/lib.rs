use pyo3::prelude::*;

mod parameters;

pub mod core;
pub mod data;
pub mod equilibrium;

#[pymodule]
pub mod calphad {
    #[pymodule_export]
    use super::core::Substance;

    #[pymodule_export]
    use super::core::SystemComposition;

    #[pymodule_export]
    use super::data::DatabaseLoader;

    #[pymodule_export]
    use super::data::add_data_directory_py as add_data_directory;

    #[pymodule_export]
    use super::data::list_data_directories_py as list_data_directories;

    #[pymodule_export]
    use super::equilibrium::Equilibrium;

    #[pymodule_export]
    use super::equilibrium::equilibrate_stoichiometric_py as equilibrate_stoichiometric;
}

#[cfg(test)]
mod core_test {
    use super::core::SystemComposition;
    use super::data::load_substances_from_lua;
    use majordome_numerical::autodiff::{Dual, diff};

    const SIMPLE_CALCINATION: &str = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/majordome/data/calphad/sample/simple-calcination.lua"
    );

    #[test]
    fn test_thermo_derivatives() {
        let db = load_substances_from_lua(SIMPLE_CALCINATION).unwrap();
        let calcite = db.get("Calcite").unwrap();
        let g = |t: Dual<f64>| calcite.gibbs(t);

        let expected = -calcite.entropy(300.0);
        let actual = diff(g, 300.0);
        assert!(
            (expected - actual).abs() < 1e-9,
            "expected={}, actual={}",
            expected,
            actual
        );
    }

    #[test]
    fn test_h2o_nasa7() {
        let db = load_substances_from_lua(SIMPLE_CALCINATION).unwrap();
        let h2o = db.get("H2O").unwrap();
        let val = h2o.cp(300.0);
        assert!(val > 0.0);
    }

    #[test]
    fn test_system_composition() {
        let db = load_substances_from_lua(SIMPLE_CALCINATION).unwrap();

        let mut proportions = std::collections::HashMap::new();
        proportions.insert("Calcite".to_string(), 1.0);
        proportions.insert("Diaspore".to_string(), 1.0);

        let comp = SystemComposition::from_compound_moles(db, proportions).unwrap();
        let elements = comp.elements();
        assert_eq!(elements, vec!["Al", "C", "Ca", "H", "O"]);

        let b = comp.fractions();
        assert!((b[0] - 1.0 / 9.0).abs() < 1e-9);
        assert!((b[1] - 1.0 / 9.0).abs() < 1e-9);
        assert!((b[2] - 1.0 / 9.0).abs() < 1e-9);
        assert!((b[3] - 1.0 / 9.0).abs() < 1e-9);
        assert!((b[4] - 5.0 / 9.0).abs() < 1e-9);

        let rep = comp.report();
        assert!(rep.contains("Input Method: Compound Moles"));
    }
}
