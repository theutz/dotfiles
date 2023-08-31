return {
  {
    "aserowy/tmux.nvim",
    enabled = false,
    module = "tmux",
    -- config = function()
    --   require("tmux").setup()
    -- end,
    opts = {
      copy_sync = {
        enable = false,
      },
    },
    keys = {
      {
        "<C-h>",
        function()
          require("tmux").move_left()
        end,
      },
      {
        "<C-j>",
        function()
          require("tmux").move_down()
        end,
      },
      {
        "<C-k>",
        function()
          require("tmux").move_up()
        end,
      },
      {
        "<C-l>",
        function()
          require("tmux").move_right()
        end,
      },
    },
  },
}
