-- vim: fdm=indent
---@diagnostic disable: unused-local

local tokyonight = {
	"folke/tokyonight.nvim",
	name = "tokyonight",
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
}

local cyberdream = {
	"scottmckendry/cyberdream.nvim",
	opts = {
		transparent = true,
		italic_comments = true,
	},
}

local base16 = {
	"echasnovski/mini.base16",
	version = false,
}

local bluloco = {
	"uloco/bluloco.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	name = "bluloco",
	opts = {
		transparent = true,
		style = "auto",
		italics = true,
	},
}

local moonfly = {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
}

local smoke = {
	"austinliuigi/smoke.nvim",
}

local gruvbox = {

	"ellisonleao/gruvbox.nvim",
	opts = {
		transparent_mode = true,
		dim_inactive = false,
	},
}

local nord = {
	"shaunsingh/nord.nvim",
	init = function()
		vim.g.nord_disable_background = true
	end,
}

local rose_pine = {

	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
		variant = "dawn",
		dark_variant = "main",
		styles = {
			transparency = true,
		},
	},
}

local catpuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		transparent_background = true,
		background = {
			light = "latte",
			dark = "mocha",
		},
	},
}

local dracula = {
	"Mofiqul/dracula.nvim",
	scheme_name = "dracula",
	opts = {
		transparent_bg = true,
		italic_comment = true,
	},
}

local function get_scheme_name(scheme)
	local _, repo = scheme[1]:match("([^/]+)/([^/]+)")
	local name = scheme.name or repo:gsub("%.nvim$", "")
	return name
end

local function high_priority(scheme)
	scheme.priority = 1000
	scheme.lazy = false
	return scheme
end

local active = dracula

return {
	high_priority(active),
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = get_scheme_name(active),
		},
	},
}
