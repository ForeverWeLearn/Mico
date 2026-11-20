#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use mico::app::MicoApp;

fn main() -> eframe::Result {
    env_logger::init();

    let native_options = eframe::NativeOptions::default();

    eframe::run_native(
        "Mico",
        native_options,
        Box::new(|cc| Ok(Box::new(MicoApp::new(cc)))),
    )
}
