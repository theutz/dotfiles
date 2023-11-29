local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Color Scheme
config.color_scheme = "Nancy (terminal.sexy)"

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

-- Window
config.quit_when_all_windows_are_closed = false
config.window_background_opacity = 0.92
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.initial_cols = 1000
config.initial_rows = 1000

-- Command Palette
config.command_palette_font_size = 16

-- Fonts
config.font = wezterm.font("Monaspace Radon")
config.font_size = 16
config.line_height = 1.2
config.cell_width = 0.9

return config
