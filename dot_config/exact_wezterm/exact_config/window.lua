local M = {}

function M.setup(config)
	config.quit_when_all_windows_are_closed = true
	config.window_close_confirmation = "NeverPrompt"
	config.window_decorations = "RESIZE"
	config.adjust_window_size_when_changing_font_size = false
	config.initial_cols = 80
	config.initial_rows = 20
	config.window_close_confirmation = "NeverPrompt"
	config.window_padding = {
		top = "16px",
		bottom = "0",
		left = "16px",
		right = "16px",
	}
end

return M
