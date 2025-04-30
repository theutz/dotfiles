local wf = hs.window.filter

local M = {}

---@private
M.__index = M

---@private
---@type { [string]: hs.window.filter }
M.filters = {}

M.logger = hs.logger.new("wf", "info")

---@return self
function M:init()
	return self
end

---@return self
function M:start()
	self:wezterm()
	self:snap_to_grid()

	return self
end

function M:wezterm()
	self.filters.wezterm = wf.new(function(win)
		return win:application() and win:application():name() == "wezterm-gui"
	end):subscribe({ wf.windowCreated }, function(win, app_name, event)
		self.logger.f("focusing %s from %s", win:title(), app_name, event)
		win:focus()
	end)
end

function M:snap_to_grid()
	self.filters.all_windows_created = wf.new():subscribe({ wf.windowCreated }, function(win, app_name, event)
		self.logger.f("snapping %s from %s to grid due to %s", win:title(), app_name, event)
		print "snap to grid callback"
		hs.grid.snap(win)
	end)
end

---@param name string
---@param filter hs.window.filter
function M:add_filter(name, filter)
	self.filters[name] = filter
end

return M
