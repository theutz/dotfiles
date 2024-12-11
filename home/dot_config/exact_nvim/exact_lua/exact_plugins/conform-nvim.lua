return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter", "rustywind" },
        html = { "prettierd", "rustywind" },
        htmlhugo = { "prettierd", "rustywind" },
        javascript = { "prettierd" },
        lua = { "stylua" },
        php = { "pint" },
        zsh = { "shfmt" },
        ruby = { "rubocop" },
      },
    },
  },
}
