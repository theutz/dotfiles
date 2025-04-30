local M = {}
M.__index = M

---@param g hs.geometry
function M.full_screen(g)
	g = g -- not required, but, you know... for consistency
end

---@param g hs.geometry
function M.left_two_thirds(g)
	g.w = g.w * (2 / 3)
end

---@param g hs.geometry
function M.left_half(g)
	g.w = g.w * (1 / 2)
end

---@param g hs.geometry
function M.right_half(g)
	g.w = g.w * (1 / 2)
	g.x = g.w
end

---@param g hs.geometry
function M.left_one_third(g)
	g.w = g.w * (1 / 3)
	g.x = g.w * 2
end

---@param g hs.geometry
function M.center_two_thirds(g)
	g.x = g.w * (1 / 6)
	g.w = g.w * (2 / 3)
end

return M
