return {
	{
		"johmsalas/text-case.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function(_, opts)
			require("textcase").setup(opts)
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
