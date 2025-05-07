local M = {}

function M.apply_to_config(config)
	config.unix_domains = {
		{
			name = "unix",
		},
	}
end

return M
