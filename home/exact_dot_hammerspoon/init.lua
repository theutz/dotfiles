-- Setup hammerspoon's IPC module for CLI interactions
require "hs.ipc"

-- Load the local configuration files
local config = require "config"
config:load()

hs.task
	.new("/opt/homebrew/bin/sketchybar", function()
		local sb = require "modules.sketchybar"
		sb:hs "Hammerspoon reloaded!"
		config:deferred()
	end, { "--reload" })
	:start()
