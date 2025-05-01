return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function(_, opts)
    require("which-key").add { "<leader>a", group = "ai" }
    require("codecompanion").setup(opts)
  end,
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
        keymaps = {
          accept_change = {
            modes = { n = "ga" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "gr" },
            description = "Reject the suggested change",
          },
        },
      },
      cmd = {
        adapter = "anthropic",
      },
    },
  },
  keys = {
    {
      "<leader>ac",
      "<Cmd>CodeCompanionChat<CR>",
      desc = "Chat",
      mode = { "n", "v" },
    },
    {
      "<leader>aa",
      "<Cmd>CodeCompanionActions<CR>",
      desc = "Actions",
      mode = { "n", "v" },
    },
    {
      "<leader>ae",
      "<Cmd>CodeCompanion #buffer add explanatory comments<cr>",
      desc = "Add comments",
      mode = { "n", "v" },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
