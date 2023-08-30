return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    name = "octo",
    config = true,
    keys = {
      {
        "<leader>goil",
        "<cmd>Octo issue list<cr>",
        desc = "List Issues",
      },
      {
        "<leader>gois",
        ":Octo issue search ",
        desc = "Search issues",
      },
      {
        "<leader>gopl",
        "<Cmd>Octo pr list<cr>",
        desc = "List PRs",
      },
      {
        "<leader>gopc",
        "<Cmd>Octo pr create<cr>",
        desc = "Create PR",
      },
      {
        "<leader>gorl",
        "<cmd>Octo repo list<cr>",
        desc = "List Repos",
      },
      {
        "<leader>gogl",
        "<cmd>Octo gist list<cr>",
        desc = "List gists",
      },
    },
  },
}
