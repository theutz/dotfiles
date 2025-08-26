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
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
