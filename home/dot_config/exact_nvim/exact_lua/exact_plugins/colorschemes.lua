local colors = {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		opts = {
			transparent = true,
			style = "moon",
			light_style = "moon",
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function(c)
				c.border = c.blue0
			end,
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		enabled = false,
		opts = {
			transparent = true,
			italic_comments = true,
		},
	},
	{
		"echasnovski/mini.base16",
		enabled = false,
		version = false,
	},
	{
		"uloco/bluloco.nvim",
		enabled = false,
		dependencies = { "rktjmp/lush.nvim" },
		opts = {
			transparent = true,
			style = "auto",
			italics = true,
		},
	},
	{
		"bluz71/vim-moonfly-colors",
		enabled = false,
		name = "moonfly",
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		enabled = false,
	},
	{
		"austinliuigi/smoke.nvim",
		enabled = false,
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		opts = {
			transparent_mode = true,
		},
	},
	{
		"shaunsingh/nord.nvim",
		enabled = false,
		init = function()
			vim.g.nord_disable_background = true
		end,
	},
	{
		"rose-pine/neovim",
		enabled = false,
		name = "rose-pine",
		opts = {
			variant = "dawn",
			dark_variant = "main",
			styles = {
				transparency = true,
			},
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			transparent_background = true,
			background = {
				light = "latte",
				dark = "mocha",
			},
		},
	},
}

local plugins = {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}

for _, color in pairs(colors) do
	color.priority = 1000
	color.lazy = false
	table.insert(plugins, color)
end

return plugins
