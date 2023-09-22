return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      view_options = {
        show_hidden = true,
      },
      columns = {
        "icon",
        "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["q"] = "actions.close",
        ["gr"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
      use_default_keymaps = false,
    },
    keys = {
      {
        "<leader>.",
        function()
          require("oil").open_float()
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
