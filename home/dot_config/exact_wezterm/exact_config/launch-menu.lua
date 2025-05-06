local M = {}

local launch_menu = {
	{
		label = "Btop",
		args = { "btop" },
	},
	{
		label = "Spotify Player",
		args = { "spotify_player" },
	},
	{
		label = "Volgo",
		args = { "mise", "x", "volgo", "--", "volgo" },
	},
}

for _, v in ipairs(launch_menu) do
	v["set_environment_variables"] = {
		PATH = os.getenv "HOME"
			.. "/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:"
			.. os.getenv "PATH",
	}
end

function M.apply_to_config(config)
	local lm = config.launch_menu or {}

	for _, v in ipairs(launch_menu) do
		table.insert(lm, v)
	end

	config.launch_menu = lm
end

return M
