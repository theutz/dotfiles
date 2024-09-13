-- vim: fdm=indent fdl=1
local colors = {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    enabled = false,
    opts = {
      transparent = true,
      italic_comments = true,
    },
  },
  {
    "echasnovski/mini.base16",
    enabled = false,
    version = false,
  },
  {
    "uloco/bluloco.nvim",
    enabled = false,
    dependencies = { "rktjmp/lush.nvim" },
    opts = {
      transparent = true,
      style = "dark",
      italics = true,
    },
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
}

local colorscheme = "moonfly"

local plugins = {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },
}

for _, color in pairs(colors) do
  color.priority = 1000
  color.lazy = false
  table.insert(plugins, color)
end

return plugins
