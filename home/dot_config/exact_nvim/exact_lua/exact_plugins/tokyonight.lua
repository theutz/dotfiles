return {
	"folke/tokyonight.nvim",
	name = "tokyonight",
	priority = 1000,
	lazy = false,
	opts = {
		transparent = true,
		style = "moon",
		light_style = "moon",
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
		on_colors = function(c)
			c.border = c.blue0
		end,
	},
}
