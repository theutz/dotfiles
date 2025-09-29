return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine",
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = true,
		opts = {
			transparent_background = true,
			term_colors = true,
			float = {
				transparent = true,
			},
		},
	},
}
