-- Setup hammerspoon's IPC module for CLI interactions
require "hs.ipc"

-- Load the local configuration files
local config = require "config"
config:load()

hs.notify.show("Hammerspoon", "", "Config reloaded!")
