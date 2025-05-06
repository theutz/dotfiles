local wezterm = require "wezterm"
local a = wezterm.action

local M = {}

function M.augment_command_palette(window, pane)
	return {
		{
			brief = "Rename Workspace",
			doc = "Rename the current workspace",
			action = require "actions.rename-workspace",
		},
		{
			brief = "Break pane",
			doc = "Promote current pane to a new tab",
			action = require "actions.break-pane",
		},
	}
end

function M.apply_to_config(config)
	-- ISSUE: Waiting for this to come to main https://wezterm.org/config/lua/config/command_palette_font.html
	-- if config.font then config.command_palette_font = config.font end

	local name = config.color_scheme
	local scheme = wezterm.color.get_builtin_schemes()[name]
	local fg = wezterm.color.parse(scheme.ansi[5])
	local bg = wezterm.color.parse(scheme.background)

	config.ui_key_cap_rendering = "UnixLong"
	config.command_palette_fg_color = fg:lighten(0.1)
	config.command_palette_bg_color = bg:lighten(0.1)
	config.command_palette_font_size = 14
	config.command_palette_rows = 10

	wezterm.on("augment-command-palette", M.augment_command_palette)
end

return M
