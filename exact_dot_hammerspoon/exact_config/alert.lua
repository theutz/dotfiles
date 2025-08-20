local M = {}
M.__index = M

function M:init()
	hs.alert.defaultStyle.textFont = "Berkeley Mono"
end

return M
