-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
augroup tmuxsource
  au!
  autocmd BufWritePost ~/.config/tmux/tmux.conf ! tmux source "%"
augroup end
]])
