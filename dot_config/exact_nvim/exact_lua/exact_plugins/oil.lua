return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      {
        "<leader>.",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
      {
        "<leader>fe",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
