return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>;",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Search within current buffer",
    },
    {
      "<leader>;",
      function()
        require("telescope.builtin").live_grep({ grep_open_files = true })
      end,
      desc = "Search open buffers",
    },
  },
}
