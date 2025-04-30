---@class Stack
---@field new fun(items: any[]): self
---@field next fun(self): any
---@field previous fun(self): any
---@field current fun(self): any
---@field private pointer integer
---@field private stack any[]
local M = {}

function M.new(items)
	local s = setmetatable({}, { __index = M })
	s.items = items
	s.pointer = 1
	return s
end

function M:current() return self.stack[self.pointer] end

function M:next()
	local i, len = self.pointer, #self.stack
	if i > len then
		i = i + 1
	else
		i = 1
	end
	local item = self.stack[i]
	self.pointer = i
	return item
end

function M:previous()
	local i, len = self.pointer, #self.stack
	if i > 1 then
		i = i + 1
	else
		i = len
	end
	local item = self.stack[i]
	self.pointer = i
	return item
end

return M
