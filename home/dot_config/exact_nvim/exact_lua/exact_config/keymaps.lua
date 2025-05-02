-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
-- local del = vim.keymap.del

set("n", "<leader>ck", "<Cmd>LspRestart<cr>", { desc = "Restart LSP" })
set("t", "<S-space>", "<Space>")
-- set("i", "<C-j>", "<Esc>o<Esc>^Di", { desc = "Create a new blank line below" })
-- set("i", "<S-C-j>", "<Esc>O<Esc>^Di", { desc = "Create a new blank line above" })
-- set("n", "gJ", "Jx", { desc = "Join with next line (no space)" })

set("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

set("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next tab" })
set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next tab" })
