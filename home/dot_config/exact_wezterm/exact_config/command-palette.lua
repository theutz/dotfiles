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
	wezterm.on("augment-command-palette", M.augment_command_palette)
end

return M
