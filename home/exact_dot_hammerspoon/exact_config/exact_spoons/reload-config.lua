local mash = require("config.modifiers").mash

spoon.SpoonInstall:andUse("ReloadConfiguration", {
	hotkeys = {
		reloadConfiguration = { mash, "r" },
	},
	start = true,
})
