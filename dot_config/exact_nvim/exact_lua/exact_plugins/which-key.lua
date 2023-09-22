return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>go"] = {
          name = "octo",
          i = { name = "issues" },
          p = { name = "pr" },
          r = { name = "repo" },
          g = { name = "gist" },
        },
      },
    },
  },
}
