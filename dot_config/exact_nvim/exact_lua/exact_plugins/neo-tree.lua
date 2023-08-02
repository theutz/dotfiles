return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fe", false },
    },
    opts = {
      filesystem = {
        hijack_netrw_behavior = "disabled",
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
  },
}
