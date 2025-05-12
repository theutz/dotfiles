local wezterm = require "wezterm"

local M = {}

local dark = "Dracula"
local light = "Dracula"

local function scheme_for_appearance(appearance)
	if appearance:find "Dark" then
		return dark
	else
		return light
	end
end

local function get_appearance()
	if wezterm.gui then return wezterm.gui.get_appearance() end
	return "Dark"
end

function M.apply_to_config(config)
	config.color_scheme = scheme_for_appearance(get_appearance())

	config.window_background_opacity = 0.8

	config.macos_window_background_blur = 20

	config.inactive_pane_hsb = {
		saturation = 1.2,
		brightness = 0.5,
	}

	wezterm.on("window-config-reloaded", M.window_config_reloaded)
end

function M.window_config_reloaded(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end

return M
