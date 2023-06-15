return {
  {
    "relastle/bluewery.vim",
    enabled = false,
  },
  {
    "cocopon/iceberg.vim",
    enabled = false,
  },
  {
    "dasupradyumna/midnight.nvim",
    enabled = false,
    lazy = true,
    priority = 1000,
  },
  {
    "sainnhe/everforest",
    enabled = false,
    config = function()
      vim.g.everforest_transparent_background = 2
      -- require("notify").setup({
      --   background_colour = "#000000",
      -- })
    end,
  },
  {
    "foxbunny/vim-amber",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    opts = {
      style = "moon",
    },
    init = function()
      vim.g.tokyonight_transparent = vim.g.transparent_enabled
      -- require("notify").setup({
      --   background_colour = "#000000",
      -- })
    end,
  },
  {
    "bluz71/vim-nightfly-colors",
    enabled = false,
    name = "nightfly",
    priority = 1000,
  },
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    keys = {
      { "<leader>ut", "<Cmd>TransparentToggle<CR>", desc = "Transparency" },
    },
  },
  {
    "cormacrelf/dark-notify",
    enabled = false,
    config = function()
      require("dark_notify").run({
        schemes = {
          dark = {
            colorscheme = "tokyonight-moon",
            background = "dark",
          },
          light = {
            colorscheme = "tokyonight-day",
            background = "light",
          },
        },
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "wave", -- wave, dragon, lotus
      })
    end,
  },
}
