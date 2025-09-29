-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.foldcolumn = "2"

-- Stop annoying delays with escape key
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0

if vim.g.neovide then
	require("config.neovide")
end

vim.o.exrc = true

-- Use fish
-- vim.o.shell = "/opt/homebrew/bin/fish"

-- Use nushell
-- vim.o.shell = "/Users/michael/.local/share/mise/shims/nu"
-- vim.o.shellcmdflag = "--login --stdin --no-newline -c"
-- vim.o.shellredir = "out+err> %s"
-- vim.o.shellpipe = "| complete | update stderr { ansi strip } | tee { get stderr | save --force --raw %s } | into record"
-- vim.o.shelltemp = false
-- vim.o.shellxescape = ""
-- vim.o.shellxquote = ""
-- vim.o.shellquote = ""

vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
