local wezterm = require("wezterm")

-- Setup config builder
local c = {}
if wezterm.config_builder then
	c = wezterm.config_builder()
end
c:set_strict_mode(true)

c.default_prog = { "zsh", "-c", "/opt/homebrew/bin/nu" }
c.macos_window_background_blur = 20
c.font = wezterm.font("BlexMono Nerd Font Mono", { weight = 500 })
c.font_size = 14
c.line_height = 1.2
c.bold_brightens_ansi_colors = "BrightAndBold"
c.window_close_confirmation = "NeverPrompt"
c.quit_when_all_windows_are_closed = true
c.window_decorations = "RESIZE"
c.adjust_window_size_when_changing_font_size = false
local padding = "18px"
c.window_padding = {
	top = padding,
	bottom = "0",
	left = padding,
	right = padding,
}
c.hide_tab_bar_if_only_one_tab = true
c.tab_bar_at_bottom = true
c.use_fancy_tab_bar = false
c.tab_max_width = 80
c.show_tab_index_in_tab_bar = true
c.command_palette_font_size = 18

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "rose-pine"
	else
		return "rose-pine-dawn"
	end
end

c.color_scheme = scheme_for_appearance(get_appearance())

return c
