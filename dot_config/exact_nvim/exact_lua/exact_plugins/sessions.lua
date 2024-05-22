return {
  { "folke/persistence.nvim", enabled = false },
  {
    "olimorris/persisted.nvim",
    lazy = false,
    config = true,
    opts = {
      use_git_branch = true,
      autosave = true,
      autoload = true,
    },
    keys = {
      { "<leader>qs", "<cmd>SessionLoad<cr>", desc = "Restore Session" },
      { "<leader>ql", "<cmd>SessionLoadLast<cr>", desc = "Restore Last Session" },
      { "<leader>qd", "<cmd>SessionStop<cr>", desc = "Don't Save Current Session" },
    },
  },
}