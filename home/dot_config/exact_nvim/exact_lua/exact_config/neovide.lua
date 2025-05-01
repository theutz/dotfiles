vim.o.linespace = 16
vim.o.guifont = "Berkeley Mono:h" .. vim.o.linespace

local padding = 20
vim.g.neovide_padding_top = padding
vim.g.neovide_padding_bottom = padding
vim.g.neovide_padding_left = padding
vim.g.neovide_padding_right = padding

local opacity = 0.85
vim.g.neovide_opacity = 1.0
vim.g.neovide_normal_opacity = opacity

vim.g.neovide_window_blurred = true
vim.g.neovide_input_macos_option_key_is_meta = "both"
vim.g.neovide_cursor_animation_length = 0.03
vim.g.neovide_cursor_trail_size = 0.85
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_theme = "auto"
