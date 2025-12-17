return {
	"mikavilpas/yazi.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"folke/snacks.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Yazi<cr>", desc = "Open file explorer (current file)" },
		{ "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Open file explorer (cwd)" },
	},
	opts = {
		open_for_directories = true,
		open_multiple_tabs = false,
		keymaps = {
			open_file_in_horizontal_split = "<c-s>",
			grep_in_directory = "<c-r>",
		},
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
