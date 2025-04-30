---@class WindowStack
---@field new fun(): self
---@field next fun(self): hs.window
---@field previous fun(self): hs.window
---@field current fun(self): hs.window
---@field reset fun(self): self
---@field private stack Stack
local M = {}

function M.new()
	local m = setmetatable({}, { __index = M })

	local windows = hs.window.orderedWindows()
	local stack = require("modules.stack").new(windows or {})

	m.stack = stack
	return m
end

function M:next() return self.stack:next() end

function M:previous() return self.stack:previous() end

function M:current() return self.stack:current() end

return M
