-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
augroup tmuxsource
  au!
  autocmd BufWritePost ~/.config/tmux/tmux.conf ! tmux source "%"
augroup end

augroup chezmoi
  au!
  autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
augroup end
]])
