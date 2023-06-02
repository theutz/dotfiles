return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
      require("oil").setup({
        keymaps = {
          ["<C-s>"] = "actions.select_split",
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-l>"] = false,
          ["<C-m>"] = "actions.refresh",
        },
      })
    end,
    keys = {
      { "<leader>fe", "<cmd>Oil<cr>", desc = "File explorer" },
    },
  },
}
