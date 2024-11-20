local colors = {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(c) c.border = c.blue0 end,
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
  {
    "bluz71/vim-moonfly-colors",
    enabled = false,
    name = "moonfly",
    lazy = false,
    priority = 1000,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    enabled = false,
  },
  {
    "austinliuigi/smoke.nvim",
    enabled = false,
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      transparent_mode = true,
    },
  },
  {
    "shaunsingh/nord.nvim",
    enabled = true,
    priority = 1000,
    lazy = false,
    init = function() vim.g.nord_disable_background = true end,
  },
}

local colorscheme = "nord"

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
