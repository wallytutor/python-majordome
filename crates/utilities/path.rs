pub fn remove_file_if_exists(file_path: &std::path::Path) -> () {
    if file_path.exists() {
        std::fs::remove_file(file_path).expect("Failed to remove file");
        print_success!("removed existing {}", file_path.display());
    } else {
        print_warning!("no existing {} file found", file_path.display());
    }
}
