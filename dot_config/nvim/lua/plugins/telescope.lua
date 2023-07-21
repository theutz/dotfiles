return {
	{
		"nvim-telescope/telescope.nvim",
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = "VeryLazy",
		keys = {
			{ "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in files" },
			{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in current buffer" },
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Search commands" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search help tags" },
			{ "<leader>sH", "<cmd>Telescope man_pages<cr>", desc = "Search man pages" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },
			{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Search vim options" },
			{ "<leader>sq", "<cmd>Telescope command_history<cr>", desc = "Search command history" },
			{ "<leader>ss", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
			{ "<leader>st", "<cmd>Telescope<cr>", desc = "Search Telescope builtins" },
      { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files (hidden)" },
		}
	}
}
