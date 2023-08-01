return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{ "<leader>fe", "<cmd>Oil<cr>", desc = "Open Files" }
		},
		cmd = "Oil"
	}
}
