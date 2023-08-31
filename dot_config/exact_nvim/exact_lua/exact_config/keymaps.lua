-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del({ "i" }, "<M-j>")
vim.keymap.del({ "i" }, "<M-k>")

require("which-key").register({
  ["<leader>#"] = { name = "Fancy Comments" },
})

vim.keymap.set("n", "<leader>fs", "<cmd>write<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>fS", "<cmd>writeall<cr>", { desc = "Save all files" })
vim.keymap.set("n", "<leader>qQ", "<cmd>xall<cr>", { desc = "Save all files and quit" })

vim.keymap.set("n", "<leader>#a", ":.!boxes -d ada-box | boxes -d pound-cmt<cr>", { desc = "Ada Box -> Pound Cmt" })
