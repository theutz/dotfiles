-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local wk = require("which-key")

-- ?

-- <C-?>

-- <M-?>
vim.keymap.del({ "n", "i", "v" }, "<M-j>")
vim.keymap.del({ "n", "i", "v" }, "<M-k>")

-- ]?/[?
vim.keymap.set("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- <leader>f?
vim.keymap.del({ "n" }, "<leader>ft")
vim.keymap.del({ "n" }, "<leader>fT")
vim.keymap.set("n", "<leader>fs", "<Cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>fS", "<Cmd>wa<CR>", { desc = "Save all files" })

-- <leader>o?
wk.register({
  ["<leader>o"] = { name = "open" },
})
vim.keymap.set("n", "<leader>ot", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>oT", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })

-- <leader>t?
wk.register({
  ["<leader>t"] = { name = "tmux" },
})

-- <leader>w?
vim.keymap.set("n", "<leader>wv", ":wincmd v<cr>", { desc = "Split window right" })
vim.keymap.set("n", "<leader>ws", ":wincmd s<cr>", { desc = "Split window down" })

-- <leader><tab>?
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprev<cr>", { desc = "Previous tab" })
