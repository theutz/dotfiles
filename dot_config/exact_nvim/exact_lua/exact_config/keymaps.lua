-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file" })

-- vim.keymap.del({ "n", "x" }, "<C-h>")
-- vim.keymap.del({ "n", "x" }, "<C-j>")
-- vim.keymap.del({ "n", "x" }, "<C-k>")
-- vim.keymap.del({ "n", "x" }, "<C-l>")

vim.keymap.del({ "i" }, "<M-j>")
vim.keymap.del({ "i" }, "<M-k>")
