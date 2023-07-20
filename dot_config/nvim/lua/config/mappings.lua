local wk = require("which-key")
local map = vim.keymap.set

wk.register({
	["<leader>"] = {
		b = { name = "Buffer" },
		f = { name = "File" },
		q = { name = "Quit/Session" },
		s = { name = "Search" }
	}
})

map({"n", "i"}, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "Save all & quit" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
