return {
	{
		"mason-org/mason.nvim",
		-- ISSUE: Breaking changes with lazyvim
		-- https://github.com/mason-org/mason-lspconfig.nvim/issues/545
		version = "1.11.0",
		opts = {
			ensure_installed = {
				"actionlint",
				"antlers-language-server",
				"bash-language-server",
				"blade-formatter",
				"emmet-ls",
				"html-lsp",
				"intelephense",
				"nginx-language-server",
				"php-debug-adapter",
				"phpstan",
				"pint",
				"prettierd",
				"rustywind",
				"tailwindcss-language-server",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- ISSUE: Breaking changes with lazyvim
		-- https://github.com/mason-org/mason-lspconfig.nvim/issues/545
		version = "1.32.0",
	},
}
