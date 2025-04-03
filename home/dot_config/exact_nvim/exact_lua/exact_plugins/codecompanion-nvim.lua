return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function(opts)
		require("which-key").add({ "<leader>a", group = "ai" })
		require("codecompanion").setup(opts)
	end,
	opts = {
		strategies = {
			chat = {
				adapter = "anthropic",
			},
			inline = {
				adapter = "anthropic",
			},
			cmd = {
				adapter = "anthropic",
			},
		},
	},
	keys = {
		{ "<leader>ac", "<Cmd>CodeCompanionChat<CR>", desc = "Chat (Code Companion)" },
		{ "<leader>aa", "<Cmd>CodeCompanionActions<CR>", desc = "Actions (Code Companion)" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
