use std::sync::Arc;

use eframe::{
    App,
    egui::{self, Color32, FontData, FontFamily, Style, Visuals},
};

#[derive(Default)]
pub struct MicoApp {}

impl MicoApp {
    pub fn new(cc: &eframe::CreationContext<'_>) -> Self {
        // Customize egui here with cc.egui_ctx.set_fonts and cc.egui_ctx.set_global_style.
        // Restore app state using cc.storage (requires the "persistence" feature).
        // Use the cc.gl (a glow::Context) to create graphics shaders and buffers that you can use
        // for e.g. egui::PaintCallback.

        let mut fonts = egui::FontDefinitions::default();
        fonts.font_data.insert(
            "JetBrains Mono".to_owned(),
            Arc::new(FontData::from_static(include_bytes!(
                "../assets/JetBrainsMono.ttf"
            ))),
        );
        fonts
            .families
            .get_mut(&FontFamily::Proportional)
            .unwrap()
            .insert(0, "JetBrains Mono".to_owned());

        let color_fg = Color32::from_rgb(238, 238, 238);
        let color_bg = Color32::from_rgb(13, 13, 13);
        let visuals = Visuals {
            override_text_color: Some(color_fg),
            window_fill: color_bg,
            panel_fill: color_bg,
            window_stroke: egui::Stroke {
                width: 4.0,
                color: color_fg,
            },
            window_corner_radius: 64.into(),
            ..Default::default()
        };
        let style = Style {
            visuals: visuals,
            ..Default::default()
        };
        cc.egui_ctx.set_global_style(style);

        cc.egui_ctx.set_fonts(fonts);

        Self::default()
    }
}

impl App for MicoApp {
    fn ui(&mut self, ui: &mut egui::Ui, _frame: &mut eframe::Frame) {
        egui::CentralPanel::default().show(ui, |ui| {
            ui.heading("Hello World!");
        });
    }
}
