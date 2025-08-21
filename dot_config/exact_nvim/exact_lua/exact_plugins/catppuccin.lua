return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	opts = {
		flavor = "auto",
		transparent_background = true,
		background = {
			light = "latte",
			dark = "mocha",
		},
		float = {
			transparent = true,
			solid = true,
		},
		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.10,
		},
		integrations = {
			snacks = {
				enabled = true,
				indent_scope_color = "",
			},
			which_key = true,
			lsp_trouble = true,
			overseer = true,
			noice = true,
			mini = {
				enabled = true,
				identscope_color = "",
			},
			mason = true,
			markview = true,
			grug_far = true,
		},
	},
}
