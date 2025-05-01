local s = require "config.spoons.spoon-install"
local mash = require("config.modifiers").mash

s:andUse("MiroWindowsManager", {
	config = {
		fullScreenSizes = { 1, 10 / 8 },
		GRID = { w = 12, h = 12 },
	},
	hotkeys = {
		up = { mash, "k" },
		right = { mash, "l" },
		down = { mash, "j" },
		left = { mash, "h" },
		fullscreen = { mash, "return" },
	},
})
