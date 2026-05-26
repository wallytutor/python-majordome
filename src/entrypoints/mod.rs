mod containerize;
mod majordome;

pub use containerize::entrypoint as containerize_entrypoint;
pub use majordome::entrypoint as majordome_entrypoint;
