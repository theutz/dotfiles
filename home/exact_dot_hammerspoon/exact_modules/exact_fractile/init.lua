local hk, geo, grid, wf, partial = hs.hotkey.bindSpec, hs.geometry, hs.grid, hs.window.filter, hs.fnutils.partial

---@class Fractile
local M = {}
M.__index = M

---Space between grid cells
M.margins = 12

---Default log level for logger
M.loglevel = "warning"

---Grid row count
---@private
M.rows = 12

---Grid column count
M.cols = 12

---@private
M.logger = nil

---@private
M.tiles = require "modules.fractile.tiles"

---@private
M.modals = {}

---@return self
function M:init()
	self.logger = hs.logger.new("fractile", self.loglevel)
	self:setup_grid()
	return self
end

---Start watchers
---@return self
function M:start()
	return self
end

---@alias hs.hotkey.Mods string[] | string | nil
---@alias hs.hotkey.Keyspec [hs.hotkey.Mods, string]
---@alias hs.hotkey.KeyspecMap { [string]: hs.hotkey.Keyspec }
---@param mapping hs.hotkey.KeyspecMap
---@return self
function M:bindHotkeys(mapping)
	for phrase, keys in pairs(mapping) do
		local size, direction, modal = self:parse(phrase)

		if size and direction then
			local action = self:make_action(size, direction)
			if modal then
				local m = self:get_modal(modal)
				m:bind(keys[1], keys[2], action, nil, action)
			else
				hk(keys, action)
			end
		elseif modal then
			local m = self:get_modal(modal)
			if not m.k then
				-- this case only occurs if we have created a modal without a trigger
				-- in the self:get_modal method. we're using some internals here
				-- to bind a trigger late
				---@diagnostic disable-next-line: inject-field
				m.k = hs.hotkey.bindSpec(keys, partial(m.enter, m))
			end
		else
			assert(modal, "no modal name found")
		end
	end
	return self
end

---@param size string the size
---@param direction string the direction
---@return function action
function M:make_action(size, direction)
	local tile = self.tiles[size][direction]
	assert(tile, "tile was not found")

	---@param win? hs.window
	---@param screen? hs.screen
	local action = function(win, screen)
		local w = win or hs.window.focusedWindow()
		local s = screen or hs.screen.mainScreen()
		hs.grid.set(w, tile, s)
	end

	return action
end

---@private
---@param phrase string the phrase to parse
---@return string? size, string? direction, string? modal
function M:parse(phrase)
	local parser = require("modules.fractile.parser").new(self.logger)
	return parser:parse(phrase)
end

---@param name string
---@param keyspec? hs.hotkey.Keyspec if modal doesn't exist, create it with this spec
---@return hs.hotkey.modal
function M:get_modal(name, keyspec)
	local modal = self.modals[name]
	if modal then
		return modal
	end
	modal = self:make_modal(name, keyspec)
	self.modals[name] = modal
	return modal
end

---@private
---@param name string
---@param keyspec? hs.hotkey.Keyspec
---@return hs.hotkey.modal
function M:make_modal(name, keyspec)
	local modal

	if keyspec then
		local mods, key = table.unpack(keyspec)
		modal = hs.hotkey.modal.new(mods, key)
		modal:bind(mods, key, partial(modal.exit, modal))
	else
		modal = setmetatable({ keys = {} }, hs.hotkey.modal)
	end

	modal:bind(nil, "escape", partial(modal.exit, modal))

	modal.entered = function()
		require("modules.sketchybar"):hud(name)
	end

	modal.exited = function()
		require("modules.sketchybar"):hud ""
	end

	return modal
end

---@private
function M:setup_grid()
	for _, screen in ipairs(hs.screen.allScreens() or {}) do
		local name, frame = screen:name() or "", screen:frame()
		local bar = 40

		if not name:match "^Built%-in" then
			frame.y, frame.h = frame.y + bar, frame.h - bar
		end

		grid.setGrid(
			geo {
				h = self.cols,
				w = self.rows,
			},
			screen,
			frame
		).setMargins(geo {
			w = self.margins,
			h = self.margins,
		})
	end
end

return M
