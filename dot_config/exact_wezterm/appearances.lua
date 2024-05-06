local rose_pine = {
	base = "#191724",
	surface = "#1f1d2e",
	overlay = "#26233a",
	muted = "#6e6a86",
	subtle = "#908caa",
	text = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	rose = "#ebbcba",
	pine = "#31748f",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	highlight = {
		low = "#21202e",
		med = "#403d52",
		high = "#524f67",
	},
}

local rose_pine_theme = {
	scheme = "rose-pine",
	blur = 15,
	background = {
		{ source = { Color = rose_pine.base }, opacity = 0.90, width = "100%", height = "100%" },
	},
	tab_bar = {
		background = rose_pine.base,
		active_tab = { bg_color = rose_pine.rose, fg_color = rose_pine.overlay, intensity = "Bold" },
		inactive_tab = { bg_color = rose_pine.overlay, fg_color = rose_pine.rose },
		inactive_tab_hover = { bg_color = rose_pine.love, fg_color = rose_pine.base },
		new_tab = { bg_color = rose_pine.surface, fg_color = rose_pine.iris, intensity = "Bold" },
		new_tab_hover = { bg_color = rose_pine.foam, fg_color = rose_pine.base },
	},
}

local rose_pine_moon = {
	base = "#232136",
	surface = "#2a273f",
	overlay = "#393552",
	muted = "#6e6a86",
	subtle = "#908caa",
	text = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	rose = "#ea9a97",
	pine = "#3e8fb0",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	highlight = { low = "#2a283e", med = "#44415a", high = "#56526e" },
}

local rose_pine_moon_theme = {
	scheme = "rose-pine-moon",
	blur = 10,
	background = {
		{ source = { Color = rose_pine_moon.base }, opacity = 0.95, width = "100%", height = "100%" },
		{
			source = {
				Gradient = {
					colors = { rose_pine_moon.pine, rose_pine_moon.foam },
					orientation = { Radial = { cx = 0.9, cy = 0.9, radius = 1.9 } },
				},
			},
			hsb = { saturation = 1.6, brightness = 0.4 },
			opacity = 0.15,
			width = "100%",
			height = "100%",
		},
	},
	tab_bar = {
		background = rose_pine_moon.base,
		active_tab = { bg_color = rose_pine_moon.rose, fg_color = rose_pine_moon.overlay, intensity = "Bold" },
		inactive_tab = { bg_color = rose_pine_moon.overlay, fg_color = rose_pine_moon.rose },
		inactive_tab_hover = { bg_color = rose_pine_moon.love, fg_color = rose_pine_moon.base },
		new_tab = { bg_color = rose_pine_moon.surface, fg_color = rose_pine_moon.iris, intensity = "Bold" },
		new_tab_hover = { bg_color = rose_pine_moon.foam, fg_color = rose_pine_moon.base },
	},
}

local rose_pine_dawn = {
	base = "#faf4ed",
	surface = "#fffaf3",
	overlay = "#f2e9e1",
	muted = "#9893a5",
	subtle = "##797593",
	text = "#575279",
	love = "#b4637a",
	gold = "#ea9d34",
	rose = "#d7827e",
	pine = "#286983",
	foam = "#56949f",
	iris = "#907aa9",
	highlight = {
		low = "#f4ede8",
		med = "#dfdad9",
		high = "#cecacd",
	},
}

local rose_pine_dawn_theme = {
	scheme = "rose-pine-dawn",
	blur = 20,
	background = {
		{ source = { Color = rose_pine_dawn.overlay }, opacity = 0.5, width = "100%", height = "100%" },
		{
			source = {
				Gradient = {
					colors = { rose_pine_dawn.base, rose_pine_dawn.surface, rose_pine_dawn.overlay },
					orientation = { Radial = { cx = 0.9, cy = 0.9, radius = 1.0 } },
				},
			},
			hsb = { brightness = 1.2, saturation = 1.4 },
			opacity = 0.8,
			width = "100%",
			height = "100%",
		},
	},
	tab_bar = {
		background = rose_pine_dawn.base,
		active_tab = { bg_color = rose_pine_dawn.rose, fg_color = rose_pine_dawn.overlay, intensity = "Bold" },
		inactive_tab = { bg_color = rose_pine_dawn.overlay, fg_color = rose_pine_dawn.rose },
		inactive_tab_hover = { bg_color = rose_pine_dawn.love, fg_color = rose_pine_dawn.base },
		new_tab = { bg_color = rose_pine_dawn.highlight.low, fg_color = rose_pine_dawn.text, intensity = "Bold" },
		new_tab_hover = { bg_color = rose_pine_dawn.foam, fg_color = rose_pine_dawn.base, intensity = "Bold" },
	},
}

return {
	light = rose_pine_theme,
	dark = rose_pine_moon_theme,
}
