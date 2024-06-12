return {
  {
    "folke/noice.nvim",
    keys = {
      { "<leader>!", function() require("noice").cmd "dismiss" end, desc = "Dismiss all" },
    },
    opts = {
      messages = {
        view_error = "messages",
      },
    },
  },
}
