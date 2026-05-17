use thermo::data::DatabaseLoader;

fn main() {
    loading_data();
}

fn loading_data() {
    println!("=== Thermodynamic Properties ===\n");

    let db = DatabaseLoader::new("data/data.lua".to_string(), None).unwrap();

    for (_name, phase) in db.data.iter() {
        println!("{}\n", phase.report(300.0));
    }
}
