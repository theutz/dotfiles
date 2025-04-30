local M = {}
M.__index = M

---@return self
function M:init()
	hs.autoLaunch(true)
	hs.consoleOnTop(false)
	hs.openConsoleOnDockClick(true)
	hs.window.animationDuration = 0

	local dark_mode = hs.host.interfaceStyle() == "Dark"
	hs.preferencesDarkMode(dark_mode)
	hs.console.darkMode(dark_mode)

	return self
end

return M
