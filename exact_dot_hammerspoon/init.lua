-- Setup hammerspoon's IPC module for CLI interactions
require "hs.ipc"

-- Load the local configuration files
-- package.path = package.path .. ";" .. hs.configdir .. "/?.spoon/init.lua"

---@type spoon.SpoonInstall
local s = assert(hs.loadSpoon "SpoonInstall", "Error while loading SpoonInstall")

local mash = { "ctrl", "cmd", "alt" }
local hyper = { "shift", table.unpack(mash) }

spoon.SpoonInstall:andUse("ReloadConfiguration", {
	hotkeys = {
		reloadConfiguration = { mash, "r" },
	},
	start = true,
})

hs.notify.show("Hammerspoon", "", "Config reloaded!")
