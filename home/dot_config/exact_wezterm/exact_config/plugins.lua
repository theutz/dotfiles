local wezterm = require "wezterm"

local M = {}

---@alias spec [string, { [string]: any }]
---@type spec[]
local plugins = {
	{
		"https://github.com/mrjones2014/smart-splits.nvim",
		{
			modifiers = {
				resize = "SHIFT|META",
			},
		},
	},
}

function M.apply_to_config(cfg)
	for _, spec in ipairs(plugins) do
		local url, opts = table.unpack(spec)
		wezterm.plugin.require(url).apply_to_config(cfg, opts)
	end
end

return M
