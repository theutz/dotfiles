local wezterm = require "wezterm"

return function(config)
	local name = config.color_scheme

	return function(key, index)
		local scheme = wezterm.color.get_builtin_schemes()[name]
		local color
		if index then
			color = scheme[key][index + 1]
		else
			color = scheme[key]
		end
		return wezterm.color.parse(color)
	end
end
