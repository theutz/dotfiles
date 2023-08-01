return {
	{
		"rmagatti/auto-session",
		lazy = false,
		config = function()
			require("auto-session").setup()
		end,
		keys = {
			{ "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save current session" },
			{ "<leader>ql", "<cmd>SessionRestore<cr>", desc = "Load session for cwd" },
			{ "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Delete current session" }
		}
	}
}
