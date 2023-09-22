-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-j>", "<esc>o<esc>kO<esc>ji", { desc = "Make room" })

-- ToggleTerm over native LazyVim float_term
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<C-_>")
vim.keymap.set("n", "<C-_>", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm" })
