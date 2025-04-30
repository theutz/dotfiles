local M = {}

---@private
---@param dict { [string]: any }
---@return string[] list
function M.keys(dict)
	local t = {}
	for k, _ in pairs(dict) do
		table.insert(t, k)
	end
	return t
end

---@private
---@generic T
---@param list `T`[]
---@return T[]
---@nodiscard
function M.copy(list)
	local t = {}
	for _, v in ipairs(list) do
		table.insert(t, v)
	end
	return t
end

return M
