local wk = require("which-key")
local map = vim.keymap.set

wk.register({
	["<leader>"] = {
		b = { name = "Buffer" },
		f = { name = "File" },
    g = { name = "Git" },
		q = { name = "Quit/Session" },
		s = { name = "Search" }
	}
})

map({"n", "i"}, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "Save all & quit" })

map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
