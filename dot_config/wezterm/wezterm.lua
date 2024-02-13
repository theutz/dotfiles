local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Color Scheme
config.color_scheme = "Earthsong"

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Window
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.initial_cols = 80
config.initial_rows = 80
config.window_close_confirmation = "NeverPrompt"

-- Command Palette
config.command_palette_font_size = 18

-- Fonts
config.font = wezterm.font("Recursive")
config.font_size = 16
config.line_height = config.font_size * 0.1
config.cell_width = 1.0

-- Keybindings
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

-- Done!
return config
