-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

set("n", "<leader>ck", "<Cmd>LspRestart<cr>", { desc = "Restart LSP" })
set("t", "<S-space>", "<Space>")
set("n", "<leader>e", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open mini.files" })
