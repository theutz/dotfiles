return {
  "olimorris/codecompanion.nvim",
  init = {
    require("which-key").add { "<leader>a", group = "ai" },
  },
  config = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
      },
      cmd = {
        adapter = "anthropic",
      },
    },
  },
  keys = {
    { "<leader>ac", "<Cmd>CodeCompanionChat<CR>", desc = "Chat (Code Companion)" },
    { "<leader>aa", "<Cmd>CodeCompanionActions<CR>", desc = "Actions (Code Companion)" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
