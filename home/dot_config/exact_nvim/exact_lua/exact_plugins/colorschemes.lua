local colors = {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    enabled = false,
    opts = {
      transparent = true,
      style = "moon",
      light_style = "moon",
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
    name = "bluloco",
    opts = {
      transparent = true,
      style = "auto",
      italics = true,
    },
  },
  {
    "bluz71/vim-moonfly-colors",
    enabled = false,
    name = "moonfly",
  },
  {
    "austinliuigi/smoke.nvim",
    enabled = false,
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    opts = {
      transparent_mode = true,
      dim_inactive = false,
    },
  },
  {
    "shaunsingh/nord.nvim",
    enabled = false,
    init = function() vim.g.nord_disable_background = true end,
  },
  {
    "rose-pine/neovim",
    enabled = true,
    name = "rose-pine",
    opts = {
      variant = "auto",
      styles = {
        transparency = true,
      },
    },
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      background = {
        light = "latte",
        dark = "mocha",
      },
    },
  },
}

local function get_enabled_scheme_name()
  local enabled = {}

  for _, plugin in ipairs(colors) do
    if plugin.enabled then
      local _, repo = plugin[1]:match "([^/]+)/([^/]+)"
      local name = plugin.name or repo:gsub("%.nvim$", "")
      table.insert(enabled, name)
    end
  end

  if #enabled > 1 then
    return "tokyonight"
  else
    return enabled[1]
  end
end

local plugins = {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = get_enabled_scheme_name(),
    },
  },
}

for _, color in pairs(colors) do
  color.priority = 1000
  color.lazy = false
  table.insert(plugins, color)
end

return plugins
