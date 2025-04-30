local M = {}
M.__index = {}

---@private
M.rows = nil

---@private
M.columns = nil

---@private
M.tiles = require "config.keys.tiles"

---@private
M.window_actions = require "config.keys.window"

local modifiers = require "config.modifiers"

---@return self
function M:init()
	self.rows, self.columns = require("config.grid"):dimensions()

	self:bind_to_mash()
	self:bind_to_wm_modal()

	return self
end

---@private
function M:bind_to_mash()
	hs.hotkey.bind(modifiers.mash, "o", "show window hints", hs.hints.windowHints)
	hs.hotkey.bind(modifiers.mash, "m", "open mission control", hs.spaces.openMissionControl)
	hs.hotkey.bind(modifiers.mash, "n", "move to next screen", self.window_actions.move_to_next_screen)
	hs.hotkey.bind(modifiers.mash, "p", "move to next screen", self.window_actions.move_to_prev_screen)
	hs.hotkey.bind(modifiers.mash, "s", "snap to grid", self.window_actions.snap_visible_windows)

	---@type [string, string, function][]
	local with_geo = {
		{ "fullscreen", "return", self.tiles.full_screen },
		{ "left 2/3", "h", self.tiles.left_two_thirds },
		{ "left 1/2", "j", self.tiles.left_half },
		{ "right 1/2", "k", self.tiles.right_half },
		{ "left 1/3", "l", self.tiles.left_one_third },
		{ "center 2/3", "space", self.tiles.center_two_thirds },
	}

	for _, v in ipairs(with_geo) do
		local message, key, fn = table.unpack(v)
		local f = hs.fnutils.partial(self.with_geo, self, fn)
		hs.hotkey.bind(modifiers.mash, key, message, f, nil, f)
	end
end

---@private
function M:bind_to_wm_modal()
	local msg = "Window Manager"

	local modal = hs.hotkey.modal.new(nil, "f13", msg)
	modal:bind(nil, "escape", function()
		modal:exit()
	end)

	function modal:entered()
		require("modules.sketchybar"):hud(msg)
	end

	function modal:exited()
		require("modules.sketchybar"):hud ""
	end

	modal:bind(nil, "m", "open mission control", hs.spaces.openMissionControl)
	modal:bind(nil, "n", "move to next screen", self.window_actions.move_to_next_screen)
	modal:bind(nil, "o", "open window hints", hs.hints.windowHints)
	modal:bind(nil, "p", "move to previous screen", self.window_actions.move_to_prev_screen)
	modal:bind(nil, "s", "snap visible windows", self.window_actions.snap_visible_windows)

	---@type [string, string, function][]
	local no_mods = {
		{ "fullscreen", "return", self.tiles.full_screen },
		{ "center 2/3", "space", self.tiles.center_two_thirds },
		{ "left 2/3", "h", self.tiles.left_two_thirds },
		{ "left 1/2", "j", self.tiles.left_half },
		{ "right 1/2", "k", self.tiles.right_half },
		{ "right 1/3", "l", self.tiles.left_one_third },
	}

	for _, v in ipairs(no_mods) do
		local message, key, fn = table.unpack(v)
		local f = hs.fnutils.partial(self.with_geo, self, fn)
		modal:bind(nil, key, message, f, nil, f)
	end
end

---@private
---@param fn fun(g: hs.geometry)
---@param screen hs.screen?
function M:with_geo(fn, screen)
	local win = hs.window.focusedWindow()
	screen = screen or hs.screen.mainScreen()
	local geo = hs.geometry { 0, 0, self.rows, self.columns }
	fn(geo)
	hs.grid.set(win, geo, screen)
end

return M
