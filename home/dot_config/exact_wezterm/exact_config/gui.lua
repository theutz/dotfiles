local wezterm = require "wezterm"

local M = {}

function M.apply_to_config(config)
	config.quit_when_all_windows_are_closed = false

	config.window_decorations = "RESIZE"

	config.adjust_window_size_when_changing_font_size = false

	config.window_close_confirmation = "AlwaysPrompt"

	config.window_padding = {
		top = "16px",
		bottom = "4px",
		left = "8px",
		right = "0px",
	}
end

return M
