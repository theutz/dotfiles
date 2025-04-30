---@class SketchyBar
local M = {}
setmetatable(M, { __index = M })

---@private
---@type string
M.exec_path = "/opt/homebrew/bin/sketchybar"

M.log_level = "warning"

---@private
---@type hs.logger
M.logger = hs.logger.new("sketchybar", M.log_level)

---@param message string
function M:hs(message)
	self:trigger("hammerspoon", { LABEL = message })
end

---@param message string
function M:hud(message)
	self:trigger("hs_hud", { LABEL = message })
end

---@private
---@param event "hammerspoon" | "hs_hud"
---@param vars { [string]: string }
function M:trigger(event, vars)
	local args = { "--trigger", event }

	for k, v in pairs(vars) do
		table.insert(args, table.concat({ k, v }, "="))
	end

	local t = hs.task.new(M.exec_path, hs.fnutils.partial(M.callback, self), args)

	t:start()
end

---@private
---@param code integer
---@param out string
---@param err string
function M:callback(code, out, err)
	if code == 0 then
		self.logger.vf("Task completed successfully.\n\nOutput:\n%s", out)
	else
		self.logger.ef("Could not complete task.\n\nCode: %d\nOutput: %s", code, err)
	end
end

return M
