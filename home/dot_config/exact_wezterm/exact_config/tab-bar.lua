local wezterm = require "wezterm"

local M = {}

function ansi(index)
	local c = {
		"Black",
		"Maroon",
		"Green",
		"Olive",
		"Navy",
		"Purple",
		"Teal",
		"Silver",
		"Grey",
		"Red",
		"Lime",
		"Yellow",
		"Blue",
		"Fuchsia",
		"Aqua",
		"White",
	}
	return { AnsiColor = c[index + 1] }
end

function M.apply_to_config(config)
	local color = require "util.color"(config)

	config.use_fancy_tab_bar = true
	-- config.show_tab_index_in_tab_bar = true
	config.tab_max_width = 120
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_bar_at_bottom = false

	config.window_frame = {
		font = config.font,
		font_size = 14,
		active_titlebar_bg = color "selection_bg",
		inactive_titlebar_bg = color "background",
	}

	wezterm.on("update-status", M.update_status)
	wezterm.on("format-tab-title", M.format_tab_title)
end

function M.format_tab_title(tab, tabs, panes, config, hover, max_width)
	local title = M.tab_title(tab)
	return {
		{ Text = title },
	}
end

function M.tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then return title end
	return tab_info.active_pane.title
end

function M.update_status(win, pane)
	win:set_left_status(M.left_status(win, pane))
	win:set_right_status(M.right_status(win, pane))
end

function M.left_status(win, pane)
	return wezterm.format {
		{ Background = ansi(0) },
		{ Text = " blue " },
	}
end

function M.right_status(win, pane)
	return wezterm.format {
		{ Background = ansi(1) },
		{ Text = " meh " },
		{ Background = ansi(1) },
	}
end

return M
