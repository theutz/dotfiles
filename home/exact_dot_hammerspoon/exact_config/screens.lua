local partial = hs.fnutils.partial
local modifiers = require "config.modifiers"

---@class Config.Screens
local M = {}

---@private
M.__index = M

---@private
M.logger = hs.logger.new "config.screens"

---@private
M.watcher = nil

---@return self
function M:init()
	self.watcher = hs.screen.watcher.new(hs.fnutils.partial(self.onChange, self))
	self.watcher:start()
	self:bindHotkeys()
	return self
end

---@return self
function M:bindHotkeys()
	hs.hotkey.bind(modifiers.mash, "n", "next screen", partial(self.next_screen, self))
	hs.hotkey.bind(modifiers.mash, "p", "prev screen", partial(self.prev_screen, self))
	hs.hotkey.bind(modifiers.mash, "]", "next screen", partial(self.next_screen, self))
	hs.hotkey.bind(modifiers.mash, "[", "prev screen", partial(self.prev_screen, self))

	return self
end

function M:next_screen()
	self:without_animations(function()
		local w = hs.window.focusedWindow()
		if not w:moveOneScreenEast() then
			w:moveOneScreenWest()
		end
	end)
end

function M:prev_screen()
	self:without_animations(function()
		local w = hs.window.focusedWindow()
		if not w:moveOneScreenWest() then
			w:moveOneScreenEast()
		end
	end)
end

---@private
function M:onChange()
	self.logger.w "Reloading config due to screen change"
	hs.reload()
end

function M:without_animations(fn)
	local dur = hs.window.animationDuration
	hs.window.animationDuration = 0
	fn()
	hs.window.animationDuration = dur
end

return M
