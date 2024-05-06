local wezterm = require "wezterm"

local M = {}

function M.setup(config)
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.tab_max_width = 80
	config.show_tab_index_in_tab_bar = true

	wezterm.on("update-right-status", M.updateRightStatus)
end

function M.updateRightStatus(window, pane)
	local window_title = window:active_workspace()
	if window_title then
		window_title = wezterm.format {
			{ Background = { AnsiColor = "White" } },
			{ Text = " " },
			{ Foreground = { AnsiColor = "Black" } },
			{ Attribute = { Intensity = "Bold" } },
			{ Attribute = { Italic = true } },
			{ Text = window_title },
			{ Attribute = { Italic = true } },
			{ Text = " " .. wezterm.nerdfonts.oct_star .. " " },
		}
	else
		window_title = ""
	end

	local key_table = window:active_key_table()
	if key_table then
		key_table = key_table
			:gsub("(%a)(%a+)", function(first, rest) return first:upper() .. rest:lower() end)
			:gsub("_", " ")
		key_table = wezterm.format {
			{ Attribute = { Intensity = "Bold" } },
			{ Background = { AnsiColor = "Red" } },
			{ Foreground = { AnsiColor = "Black" } },
			{ Text = " " .. key_table .. " " },
		}
	else
		key_table = ""
	end

	local leader_is_active = window:leader_is_active()
	if leader_is_active then
		leader_is_active = wezterm.format {
			{ Attribute = { Intensity = "Bold" } },
			{ Background = { Color = "maroon" } },
			{ Foreground = { Color = "white" } },
			{ Text = " " },
			{ Attribute = { Underline = "Double" } },
			{ Text = "LEADER" },
			{ Attribute = { Underline = "None" } },
			{ Text = " " },
		}
	else
		leader_is_active = ""
	end

	local segments = { leader_is_active, key_table, window_title }
	local strings = {}
	for _, segment in ipairs(segments) do
		if segment ~= nil then table.insert(strings, segment) end
	end

	local output = table.concat(strings)
	window:set_right_status(output)
end

return M
