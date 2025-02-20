return {
  {
    "mrjones2014/smart-splits.nvim",
    enabled = true,
    lazy = false,
    opts = {
      at_edge = "wrap",
      disable_multiplexer_nav_when_zoomed = true,
    },
    keys = {
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Focus left window" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Focus down window" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Focus up window" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Focus right window" },
      { "<C-\\>", function() require("smart-splits").move_cursor_previous() end, desc = "Focus previous window" },
      { "<A-H>", function() require("smart-splits").resize_left() end, desc = "Resize window left" },
      { "<A-J>", function() require("smart-splits").resize_down() end, desc = "Resize window down" },
      { "<A-K>", function() require("smart-splits").resize_up() end, desc = "Resize window up" },
      { "<A-L>", function() require("smart-splits").resize_right() end, desc = "Resize window right" },
    },
  },
}
