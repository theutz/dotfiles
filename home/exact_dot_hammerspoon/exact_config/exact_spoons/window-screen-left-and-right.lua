local s = require "config.spoons.spoon-install"
local mash = require("config.modifiers").mash

s:andUse("WindowScreenLeftAndRight", {
	hotkeys = {
		screen_left = { mash, "[" },
		screen_right = { mash, "]" },
	},
})
