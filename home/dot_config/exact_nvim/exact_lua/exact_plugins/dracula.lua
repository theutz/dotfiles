return {
	"Mofiqul/dracula.nvim",
	opts = {
		transparent_bg = true,
		italic_comment = true,
		overrides = function(colors)
			return {
				NonText = { fg = colors.white },
				StatusLIne = { bg = "none" },
				WinSeparator = { fg = colors.pink },
			}
		end,
	},
}
