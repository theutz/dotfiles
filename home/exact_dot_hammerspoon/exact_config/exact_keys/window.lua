local M = {}

---@param win hs.window?
function M.move_to_next_screen(win)
	win = win or hs.window.focusedWindow()
	if not win:moveOneScreenEast() then
		hs.window.focusedWindow():moveOneScreenWest()
	end
end

---@param win hs.window
function M.move_to_prev_screen(win)
	win = win or hs.window.focusedWindow()
	if not win:moveOneScreenWest() then
		win:moveOneScreenEast()
	end
end

function M.snap_visible_windows()
	for _, w in ipairs(hs.window.visibleWindows()) do
		hs.grid.snap(w)
	end
end

return M
