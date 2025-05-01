return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("vim.treesitter.query").add_predicate(
        "is-mise?",
        function(_, _, bufnr, _)
          local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
          local filename = vim.fn.fnamemodify(filepath, ":t")
          return string.match(filename, ".*mise.*%.toml$")
        end,
        { force = true, all = false }
      )
    end,
    opts = {
      ensure_installed = {
        "awk",
        "bash",
        "c",
        "css",
        "diff",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "php",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      indent = {
        enable = true,
        disable = { "yaml", "php" },
      },
    },
  },
}
