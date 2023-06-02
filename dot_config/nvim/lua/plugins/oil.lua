return {
  {
    "stevearc/oil.nvim",
    name = "oil",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    keys = {
      {
        "<leader>fo",
        function()
          require("oil").open()
        end,
        desc = "Oil",
      },
    },
  },
}
