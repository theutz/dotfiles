return {
	"folke/snacks.nvim",
	opts = {
		explorer = {
			enabled = false,
			replace_netrw = false,
		},
		picker = {
			sources = {
				files = {
					hidden = true,
				},
				explorer = {
					hidden = true,
					auto_close = true,
				},
			},
		},
	},
}
