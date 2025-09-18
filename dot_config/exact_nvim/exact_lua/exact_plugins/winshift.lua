return {
  {
    "sindrets/winshift.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>wm", "<Cmd>WinShift<cr>", desc = "Move window" },
      { "<leader>ww", "<Cmd>WinShift swap<cr>", desc = "Swap window" },
      { "<C-M-h>", "<Cmd>WinShift left<cr>", desc = "Shift window left" },
      { "<C-M-j>", "<Cmd>WinShift down<cr>", desc = "Shift window down" },
      { "<C-M-k>", "<Cmd>WinShift up<cr>", desc = "Shift window up" },
      { "<C-M-l>", "<Cmd>WinShift right<cr>", desc = "Shift window right" },
    },
  },
}
