return {
  {
    "aserowy/tmux.nvim",
    lazy = false,
    config = function()
      require("tmux").setup()
    end,
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
