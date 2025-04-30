local wezterm = require "wezterm"

local M = {}

function M.apply_to_config(cfg)
	cfg.font = wezterm.font("Berkeley Mono", { weight = 400 })
	cfg.font_size = 16
	cfg.line_height = 1.0
	cfg.bold_brightens_ansi_colors = "BrightAndBold"
	cfg.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
	cfg.default_prog = { "/opt/homebrew/bin/fish" }
end

return M
