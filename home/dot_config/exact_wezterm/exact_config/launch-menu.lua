local M = {}

local launch_menu = {
	{
		label = "Spotify Player",
		args = { "spotify_player" },
		domain = { DomainName = "unix" },
	},
	{
		label = "Neovide",
		args = { "neovide", "--fork" },
	},
}

function M.apply_to_config(config)
	local lm = config.launch_menu or {}

	for _, v in ipairs(launch_menu) do
		table.insert(lm, v)
	end

	config.launch_menu = lm
end

return M
