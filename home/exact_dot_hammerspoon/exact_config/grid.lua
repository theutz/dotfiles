local geo = hs.geometry

local M = {}
M.__index = M

---Grid row count
---@private
M.rows = 12

---Grid column count
---@private
M.cols = 12

---Grid margins
---@private
M.margins = 12

---Top bar gap
---@private
M.top_bar = 0

function M:init()
	self:setup_grid()
end

---@return number rows, number columms
function M:dimensions()
	return self.rows, self.cols
end

---@private
function M:setup_grid()
	for _, screen in ipairs(hs.screen.allScreens() or {}) do
		local name, frame = screen:name() or "", screen:frame()

		if not name:match "^Built%-in" then
			frame.y, frame.h = frame.y + self.top_bar, frame.h - self.top_bar
		end

		hs.grid
			.setGrid(
				geo {
					h = self.cols,
					w = self.rows,
				},
				screen,
				frame
			)
			.setMargins(geo {
				w = self.margins,
				h = self.margins,
			})
	end
end

return M
