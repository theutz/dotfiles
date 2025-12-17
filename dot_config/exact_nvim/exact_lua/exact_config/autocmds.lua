-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local expand = vim.fn.expand

autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.njk",
	desc = "Set nunjucks filetype",
	group = augroup("nunjucks", { clear = true }),
	callback = function()
		vim.bo.filetype = "htmldjango"
	end,
})

autocmd({ "BufWritePost" }, {
	pattern = {
		expand("~") .. "/.tmux.conf",
		expand("~") .. "/.config/tmux/tmux.conf",
	},
	desc = "source tmux config files after writing",
	group = augroup("tmuxsource", { clear = true }),
	command = [[! tmux source-file "%"]],
})

-- autocmd({ "BufWritePost" }, {
--   pattern = { expand "~" .. "/.config/aerospace/aerospace.toml" },
--   desc = "reload aerospace config",
--   group = augroup("aerospaceconfig", { clear = true }),
--   command = [[! noti -t aerospace -m 'Config reloaded' aerospace reload-config ]],
-- })

autocmd({ "BufNewFile", "BufRead" }, {
	pattern = {
		"*.zsh",
		expand("~") .. "/.z{log{in,out},zsh{rc,env},pr{ofile,eztorc},aliases}",
		expand("~") .. "/.zprezto/runcoms/*",
		expand("~") .. "/.zprezto/*/functions/*",
	},
	desc = "set filetype for zsh files",
	group = augroup("zshfiles", { clear = true }),
	callback = function()
		if vim.bo.filetype == "markdown" then
			return
		end

		if vim.bo.filetype == "oil" then
			return
		end

		vim.bo.filetype = "zsh"
	end,
})

autocmd({ "BufNewFile", "BufRead" }, {
	pattern = {
		"*.antlers.html",
		"*.antlers.php",
	},
	desc = "set filetype for antlers templates",
	group = augroup("antlers", { clear = true }),
	callback = function()
		vim.bo.filetype = "antlers.html"
	end,
})

autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.play.yaml", "*.play.yml" },
	desc = "set filetype for ansible plays",
	group = augroup("ansible plays", { clear = true }),
	callback = function()
		vim.bo.filetype = "yaml.ansible"
	end,
})

vim.treesitter.language.register("html", "antlers")
vim.treesitter.language.register("php", "antlers")
vim.treesitter.language.register("bash", "zsh")

autocmd({ "BufEnter" }, {
	pattern = "*.css",
	desc = "remove dash from iskeyword",
	group = augroup("css-text-objects", { clear = true }),
	callback = function()
		vim.opt_local.iskeyword:remove("-")
	end,
})

autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.tfvars",
	desc = "set filetype for terraform variables files",
	group = augroup("terraform_vars", { clear = true }),
	callback = function()
		vim.bo.filetype = "terraform"
	end,
})

autocmd("FileType", {
	group = augroup("dapfloat", { clear = true }),
	pattern = "dap-float",
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close!<cr>", { buffer = true, silent = true })
	end,
})

autocmd("FileType", {
	group = augroup("markdown", { clear = true }),
	pattern = "markdown",
	callback = function()
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "nvim_treesitter#foldexpr()"
		vim.cmd([[ norm zx
    norm zR ]])
	end,
})

autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("terraform", { clear = true }),
	pattern = "*.tf",
	callback = function(o)
		vim.bo[o.buf].tabstop = 2
		vim.bo[o.buf].softtabstop = 2
		vim.bo[o.buf].shiftwidth = 2
		vim.bo[o.buf].expandtab = true
	end,
})

autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("caddy", { clear = true }),
	pattern = "*Caddyfile*",
	command = "set filetype=caddy",
})

local function get_cwd_as_name()
	local dir = vim.fn.getcwd(0)
	return dir:gsub("[^A-Za-z0-9]", "_")
end
