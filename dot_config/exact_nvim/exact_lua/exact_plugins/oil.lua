return {
  {
    "stevearc/oil.nvim",
    opts = {},
    keys = {
      {
        "<leader>.",
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
