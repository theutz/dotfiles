return {
	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		cmd = "Nerdy",
		opts = {
			max_recents = 30, -- Configure recent icons limit
			add_default_keybindings = false, -- Add default keybindings
			copy_to_clipboard = false, -- Copy glyph to clipboard instead of inserting
		},
		keys = {
			{ "<leader>sf", "<cmd>Nerdy list<cr>", desc = "Browse nerd icons" },
			{ "<leader>sF", "<cmd>Nerdy recents<cr>", desc = "Browse recent nerd icons" },
		},
	},
}
