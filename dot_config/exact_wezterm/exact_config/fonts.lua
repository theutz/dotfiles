local isDark = require("config.appearance").isDark
local wezterm = require "wezterm"

local M = {}

function M.setup(config)
	if isDark() then
		config.font = wezterm.font("BlexMono Nerd Font Mono", { weight = 500 })
	else
		config.font = wezterm.font("BlexMono Nerd Font Mono", { weight = 700 })
	end
	config.font_size = 16
	config.line_height = config.font_size / 10
	config.cell_width = 1.0
	config.bold_brightens_ansi_colors = "BrightAndBold"
end

return M
