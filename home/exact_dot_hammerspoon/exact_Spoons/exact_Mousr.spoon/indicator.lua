---@class Indicator
local M = {}

---@private
M.canvases = {} --[=[ @as hs.canvas[] ]=]

---@private
M.margin = 16

---@private
M.logger = hs.logger.new("mousr")

---@return self
---@nodiscard
function M:new(o)
	o = o or {}
	setmetatable(o, self)

	---@private
	self.__index = self

	return o
end

---@return nil
function M:show()
	---@diagnostic disable-next-line param-type-mismatch
	self.logger.df("margin: %d", self.margin)

	local screens = hs.screen.allScreens() --[=[@as hs.screen[]]=]

	for i, screen in ipairs(screens) do
		self.canvases[i] = hs
			.canvas
			.new(screen:fullFrame()) --[[@as hs.canvas]]
			:appendElements(self:makeElements(screen:frame())) --[[@as hs.canvas]]
			:behavior({ "canJoinAllSpaces", "stationary" })
	end

	for _, canvas in ipairs(self.canvases) do
		canvas:show()
	end
end

---@return nil
function M:hide()
	for _, canvas in ipairs(self.canvases) do
		canvas:hide()
	end
end

---@private
---@param frame hs.geometry
---@return hs.canvas[]
---@nodiscard
function M:makeElements(frame)
	return {
		{ type = "rectangle", action = "build" },
		{
			type = "rectangle",
			action = "clip",
			reversePath = true,
			frame = {
				x = 8,
				y = (self.margin / 2) + 22,
				h = frame.h,
				w = frame.w - self.margin,
			},
			roundedRectRadii = { xRadius = 8, yRadius = 8 },
		},
		{
			type = "rectangle",
			fillColor = { hex = "#f00", alpha = 0.5 },
			roundedRectRadii = { xRadius = 6, yRadius = 6 },
		},
		{
			type = "text",
			text = "Mouse Keys Active",
			textColor = { hex = "#fff", alpha = 1.0 },
			textAlignment = "center",
			textSize = 12,
			padding = 6,
		},
	}
end

return M
