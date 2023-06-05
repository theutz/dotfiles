--
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.o.guifont = "Lexsa:h14"
  vim.o.linespace = 0
  vim.g.neovide_scale_factor = 1.2

  vim.g.neovide_transparency = 0.85
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
