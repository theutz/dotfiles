local M = {}

local launch_menu = {
	{
		label = "Btop",
		args = { "btop" },
	},
	{
		label = "Spotify Player",
		args = { "spotify_player" },
		domain = { DomainName = "unix" },
	},
	{
		label = "Volgo",
		args = { "mise", "x", "volgo", "--", "volgo" },
		domain = { DomainName = "unix" },
	},
	{
		label = "Tickers",
		args = { "tickrs" },
	},
	{
		label = "Chezmoi",
		args = { "chezmoi", "cd" },
	},
	{
		label = "Weather",
		args = { "weather" },
	},
	{
		label = "Sunset",
		args = { "fish", "-lc", "sunset; sleep 1h" },
	},
	{
		label = "Ping Google",
		args = { "gping", "google.com" },
	},
}

for _, v in ipairs(launch_menu) do
	v["set_environment_variables"] = {
		PATH = os.getenv "HOME"
			.. "/.local/bin:"
			.. os.getenv "HOME"
			.. "/bin:/opt/homebrew/bin:/opt/homebrew/sbin:"
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
