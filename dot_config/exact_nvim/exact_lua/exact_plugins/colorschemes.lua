-- vim: fdm=indent fdl=1
local colors = {
  {
    "ribru17/bamboo.nvim",
    enabled = false,
    opts = {
      style = "multiplex",
      transparent = true,
      dim_inactive = true,
      lualine = {
        transparent = true,
      },
    },
  },
  {
    "RRethy/base16-nvim",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    opts = {
      background = {
        light = "latte",
        dark = "mocha",
      },
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    enabled = false,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
    },
  },
  {
    "sainnhe/everforest",
    enabled = false,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_transparent_background = 0 -- 0, 1, 2
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    config = true,
    opts = {
      style = "moon",
      transparent = true,
      dimInactive = false,
    },
  },
  {
    "dasupradyumna/midnight.nvim",
    enabled = false,
  },
  {
    "miikanissi/modus-themes.nvim",
    enabled = false,
  },
  {
    "olimorris/onedarkpro.nvim",
    enabled = false,
    opts = {
      options = {
        cursorline = false,
        transparency = true,
        lualine_transparency = true,
      },
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    enabled = false,
  },
  {
    "sainnhe/sonokai",
    enabled = false,
    config = function()
      vim.g.sonokai_style = "atlantis" -- default, shusia, andromeda, atlantis, maia, espresso
      vim.g.sonokai_better_performance = 1
    end,
  },
  {
    "ray-x/starry.nvim",
    enabled = false,
    config = function(_, opts)
      local s = require "starry"
      s.setup(opts)
      vim.g.starry_disable_background = true
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    opts = {
      transparent = true,
      style = "moon",
      light_style = "night",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "tiagovla/tokyodark.nvim",
    enabled = false,
    opts = {
      transparent_background = true,
    },
  },
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    enabled = false,
    branch = "stable", -- versioned tags + docs updates from main
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "main",
      dark_variant = "main",
      styles = {
        transparency = false,
      },
    },
  },
}

local colorscheme = "rose-pine"

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
  table.insert(plugins, color)
end

return plugins
