return {
  {
    "mikavilpas/yazi.nvim",
    enabled = false,
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>E", function() require("yazi").yazi() end, desc = "Open file explorer (root)" },
      { "<leader>e", function() require("yazi").yazi() end, desc = "Open file explorer (buffer)" },
    },
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 0.9,
      yazi_floating_window_winblend = 0,
      open_multiple_tabs = true,
    },
  },
}
