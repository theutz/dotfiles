-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local del = vim.keymap.del

local Util = require "lazyvim.util"
local open_lazydocker = function()
  Util.terminal.open(
    { "lazydocker", "-f", Util.root.get() .. "docker-compose.yml" },
    { cwd = Util.root.get(), esc_esc = false }
  )
end

del("n", "H")
del("n", "L")
set("n", "<leader>.", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search curent buffer" })
set("n", "<leader>ap", "<cmd>Copilot panel<cr>", { desc = "Copilot Panel" })
set("n", "<leader>b<", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
set("n", "<leader>b>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
set("n", "<leader>ck", "<Cmd>LspRestart<cr>", { desc = "Restart LSP" })
set("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file" })
set("n", "<leader>fS", "<cmd>wa<cr>", { desc = "Save all files" })
set("n", "<leader>gd", open_lazydocker, { desc = "LazyDocker (root dir)" })
set("n", "<leader>w_", "<Cmd>wincmd _<cr>", { desc = "Max out the height" })
set("n", "<leader>wo", "<Cmd>wincmd o<cr>", { desc = "Close Other Windows" })
set("n", "<leader>ws", "<cmd>sp<cr>", { desc = "Split horizontal" })
set("n", "<leader>wv", "<cmd>vsp<cr>", { desc = "Split vertical" })
set("t", "<S-space>", "<Space>")
set("i", "<C-j>", "<Esc>o<Esc>^Di", { desc = "Create a new blank line below" })
set("i", "<S-C-j>", "<Esc>O<Esc>^Di", { desc = "Create a new blank line above" })
