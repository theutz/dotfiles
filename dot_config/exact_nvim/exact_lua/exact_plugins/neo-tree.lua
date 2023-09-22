return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
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
