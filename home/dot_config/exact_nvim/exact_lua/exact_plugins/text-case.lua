return {
	{
		"johmsalas/text-case.nvim",
		enabled = false,
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			"<leader>c.",
			{
				"<leader>c.",
				"<cmd>TextCaseOpenTelescope<cr>",
				mode = { "n", "v" },
				desc = "Telescope",
			},
		},
	},
}
