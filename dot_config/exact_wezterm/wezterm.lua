local wezterm = require "wezterm"

-- Setup config builder
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end
config:set_strict_mode(true)

-- Load all modules defined in spec
local module_files = wezterm.glob("{config,handlers}/*.lua", wezterm.config_dir)
for _, file_path in ipairs(module_files) do
	local module_name = file_path:gsub("([%w]*)/([%w-]*)%.lua", "%1.%2")
	local ok, module = pcall(require, module_name)
	if ok and type(module) == "table" then
		module.setup(config)
	else
		wezterm.log_warn("No " .. module_name .. " module exists")
	end
end

return config
