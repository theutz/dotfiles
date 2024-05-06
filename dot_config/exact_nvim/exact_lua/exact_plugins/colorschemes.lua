-- vim: fdm=indent fdl=1
local colors = {
  {
    "ribru17/bamboo.nvim",
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
  },
  {
    "catppuccin/nvim",
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
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
    },
  },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_transparent_background = 0 -- 0, 1, 2
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = true,
    opts = {
      style = "moon",
      transparent = true,
      dimInactive = false,
    },
  },
  {
    "dasupradyumna/midnight.nvim",
  },
  {
    "miikanissi/modus-themes.nvim",
  },
  {
    "olimorris/onedarkpro.nvim",
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
  },
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "atlantis" -- default, shusia, andromeda, atlantis, maia, espresso
      vim.g.sonokai_better_performance = 1
    end,
  },
  {
    "ray-x/starry.nvim",
    config = function(_, opts)
      local s = require "starry"
      s.setup(opts)
      vim.g.starry_disable_background = true
    end,
  },
  {
    "projekt0n/github-nvim-theme",
  },
  {
    "folke/tokyonight.nvim",
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
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = true,
    },
  },
  {
    url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable", -- versioned tags + docs updates from main
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon",
      dark_variant = "moon",
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
