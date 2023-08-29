-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file" })

vim.keymap.del({ "i" }, "<M-j>")
vim.keymap.del({ "i" }, "<M-k>")

local wk = require("which-key")
wk.register({
	["<leader>#"] = { name = "Fancy Comments" },
})
vim.keymap.set("n", "<leader>#a", "<cmd>.!boxes -d ada-box | boxes -d pound-cmd<cr>", { desc = "Ada Box -> Pound Cmd" })
