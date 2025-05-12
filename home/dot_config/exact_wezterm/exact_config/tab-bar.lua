local wezterm = require "wezterm"

local M = {}

local function ansi(index)
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

local function bg(index) return { Background = ansi(index) } end

local function fg(index) return { Foreground = ansi(index) } end

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
		active_titlebar_bg = color("ansi", 0),
		inactive_titlebar_bg = color("brights", 0),
	}

	wezterm.on("update-status", M.update_status)
	wezterm.on("format-tab-title", M.format_tab_title)
end

function M.format_tab_title(tab, tabs, panes, config, hover, max_width)
	local bg_color = 8
	local fg_color = 4
	local index = tab.tab_index + 1

	if hover then
		bg_color = 5
		fg_color = 0
	elseif tab.is_active then
		bg_color = 4
		fg_color = 0
	end

	local title = " " .. index .. ": " .. M.tab_title(tab) .. " "

	return {
		bg(bg_color),
		fg(fg_color),
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
	local ws = win:mux_window():get_workspace()
	local fg_color = 6
	local bg_color = 0
	local text_color = 0
	if not win:is_focused() then
		fg_color = 0
		bg_color = 8
		text_color = 7
	end
	return wezterm.format {
		fg(fg_color),
		bg(bg_color),
		{ Text = wezterm.nerdfonts.ple_left_half_circle_thick },
		bg(fg_color),
		fg(text_color),
		{ Text = wezterm.nerdfonts.cod_layers .. " " .. ws .. " " },
		fg(fg_color),
		bg(bg_color),
		{ Text = wezterm.nerdfonts.pl_left_hard_divider },
	}
end

function M.right_status(win, pane)
	local domain = pane:get_domain_name()
	local fg_color = 6
	local bg_color = 0
	local text_color = 0
	if not win:is_focused() then
		fg_color = 0
		bg_color = 8
		text_color = 7
	end
	return wezterm.format {
		fg(fg_color),
		bg(bg_color),
		{ Text = wezterm.nerdfonts.pl_right_hard_divider },
		bg(fg_color),
		fg(text_color),
		{ Text = " " .. wezterm.nerdfonts.cod_archive .. " " .. domain },
		fg(fg_color),
		bg(bg_color),
		{ Text = wezterm.nerdfonts.ple_right_half_circle_thick },
	}
end

return M
