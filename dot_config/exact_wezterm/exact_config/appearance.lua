local wezterm = require "wezterm"

local M = {}

local spec = require "appearances"

M.appearance = {}

function M.setup(config)
	M.appearance = M.getActiveSpec()
	M.applySpecToConfig(M.appearance, config)
end

function M.isDark()
	local appearance = M.getAppearance()
	return appearance:find "Dark"
end

function M.getActiveSpec()
	local name = string.lower(M.getAppearance())
	return spec[name]
end

function M.getAppearance() return wezterm.gui and wezterm.gui.get_appearance() or "Dark" end

function M.applySpecToConfig(s, c)
	c.color_scheme = s.scheme
	c.macos_window_background_blur = s.blur
	c.background = s.background
	c.colors = { tab_bar = s.tab_bar }
	if s.font ~= nil then c.font = s.font end
	return c
end

return M
