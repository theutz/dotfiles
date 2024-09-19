-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local del = vim.keymap.del

del("n", "H")
del("n", "L")
set("n", "<leader>ck", "<Cmd>LspRestart<cr>", { desc = "Restart LSP" })
set("n", "<leader>wo", "<Cmd>wincmd o<cr>", { desc = "Close Other Windows" })
set("n", "<leader>ws", "<cmd>sp<cr>", { desc = "Split horizontal" })
set("n", "<leader>wv", "<cmd>vsp<cr>", { desc = "Split vertical" })
set("t", "<S-space>", "<Space>")
set("i", "<C-j>", "<Esc>o<Esc>^Di", { desc = "Create a new blank line below" })
set("i", "<S-C-j>", "<Esc>O<Esc>^Di", { desc = "Create a new blank line above" })
set(
  "n",
  "<leader>e",
  function() require("mini.files").open(vim.api.nvim_buf_get_name(0)) end,
  { desc = "Open mini.files" }
)
