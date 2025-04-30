local wezterm = require "wezterm"

-- Setup config builder
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end
config:set_strict_mode(true)

require("config.shell").apply_to_config(config)
require("config.gui").apply_to_config(config)
require("config.colors").apply_to_config(config)
require("config.keys").apply_to_config(config)
require("config.plugins").apply_to_config(config)

wezterm.on(
	"window-config-reloaded",
	function(window, _)
		window:toast_notification(
			"wezterm",
			"configuration reloaded!",
			nil,
			4000
		)
	end
)

return config
