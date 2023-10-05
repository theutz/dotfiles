local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Color scheme
config.color_scheme = "Tokyo Night Moon"

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true

config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"

config.font = wezterm.font("Lexsa")
config.font_size = 16
config.line_height = 1.2
config.cell_width = 1.0

return config
