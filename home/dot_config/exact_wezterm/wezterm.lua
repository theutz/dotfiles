local wezterm = require "wezterm"

-- Setup config builder
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end
config:set_strict_mode(true)

config.font = wezterm.font("Berkeley Mono", { weight = 500 })
config.font_size = 16
config.line_height = 1.0
config.bold_brightens_ansi_colors = "BrightAndBold"
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
config.default_prog = { "/opt/homebrew/bin/fish" }
config.quit_when_all_windows_are_closed = false
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	top = "16px",
	bottom = "4px",
	left = "8px",
	right = "0px",
}
config.color_scheme = "Dracula"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
config.inactive_pane_hsb = {
	saturation = 0.7,
	brightness = 0.2,
}
config.use_fancy_tab_bar = false
-- config.show_tab_index_in_tab_bar = true
config.tab_max_width = 120
config.hide_tab_bar_if_only_one_tab = false
config.enable_tab_bar = false
config.tab_bar_at_bottom = false
config.enable_kitty_keyboard = true

wezterm.on(
	"window-config-reloaded",
	function(window, _)
		window:toast_notification(
			"wezterm",
			"configuration reloaded!",
			nil,
			4000
		)
	end
)

return config
