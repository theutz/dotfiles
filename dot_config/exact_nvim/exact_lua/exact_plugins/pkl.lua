return {
	"apple/pkl-neovim",
	lazy = true,
	ft = "pkl",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter",
			build = function(_)
				vim.cmd("TSUpdate")
			end,
		},
		"L3MON4D3/LuaSnip",
	},
	bulid = function()
		require("pkl-neovim").init()
		vim.cmd("TSInstall pkl")
	end,
	config = function()
		require("luasnip.loaders.from_snipmate").lazy_load()
		local path = require("mason-core.path")
		vim.g.pkl_neovim = {
			start_command = {
				"java",
				"-jar",
				path.concat({ vim.fn.stdpath("data"), "mason", "packages", "pkl-lsp", "pkl-lsp-0.4.0.jar" }),
			},
			pkl_cli_path = path.concat({ vim.fn.stdpath("data"), "mason", "bin", "pkl-lsp" }),
		}
	end,
}
