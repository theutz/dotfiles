return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	lazy = false,
	opts = {
		variant = "auto",
		dark_variant = "main",
		styles = {
			transparency = not vim.g.neovide,
		},
	},
}
