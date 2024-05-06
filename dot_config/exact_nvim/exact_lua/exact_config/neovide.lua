vim.o.linespace = 0

local padding = 20
vim.g.neovide_padding_top = padding
vim.g.neovide_padding_bottom = padding
vim.g.neovide_padding_left = padding
vim.g.neovide_padding_right = padding

if vim.o.background == "light" then
  vim.g.neovide_transparency = 0.93
  vim.g.neovide_window_blurred = false
elseif vim.o.background == "dark" then
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_window_blurred = true
end

vim.g.neovide_input_macos_alt_is_meta = true

vim.g.neovide_cursor_animation_length = 0.03
vim.g.neovide_cursor_trail_size = 0.85

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_theme = "auto"
