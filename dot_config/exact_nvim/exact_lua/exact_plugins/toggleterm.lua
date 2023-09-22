return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<C-_>]],
    },
    event = "VeryLazy",
    init = function()
      require("which-key").register({
        ["<leader>t"] = { name = "terminal", mode = { "n", "v" } },
      })
    end,
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<leader>t1", "<cmd>ToggleTerm 1<cr>", desc = "Toggle Terminal 1" },
      { "<leader>t2", "<cmd>ToggleTerm 2<cr>", desc = "Toggle Terminal 2" },
      { "<leader>t3", "<cmd>ToggleTerm 3<cr>", desc = "Toggle Terminal 3" },
      { "<leader>t4", "<cmd>ToggleTerm 4<cr>", desc = "Toggle Terminal 4" },
      { "<leader>t5", "<cmd>ToggleTerm 5<cr>", desc = "Toggle Terminal 5" },
      { "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },
      { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select terminal" },
      { "<leader>tl", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send current line to terminal" },
      {
        "<leader>tV",
        "<cmd>ToggleTermSendVisualSelection<cr>",
        desc = "Send current visual selection to terminal",
        mode = "v",
      },
      {
        "<leader>tv",
        "<cmd>ToggleTermSendVisualLines<cr>",
        desc = "Send all visually selected to terminal",
        mode = "v",
      },
    },
  },
}
