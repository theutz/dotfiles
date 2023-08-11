-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
augroup chezmoiapply
  au!
  autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
augroup end

augroup chezmoiadd
  au!
  autocmd BufWritePost 
    \~/.config/tmux/tmux.conf,
    \~/.config/nvim/*,
    \~/.config/zsh/.zprofile,
    \~/.config/zsh/.zshenv,
    \~/.config/zsh/.zshrc,
    \~/.config/zsh/.zlogin,
    \~/.config/zsh/.zlogout,
    \~/.config/zsh/.zpreztorc
    \ ! chezmoi add "%"
augroup end

augroup tmuxsource
  au!
  autocmd BufWritePost ~/.config/tmux/tmux.conf ! tmux source "%"
augroup end
]])
