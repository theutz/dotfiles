local wezterm = require "wezterm"

local M = {}

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then return title end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

local function get_domain_title(tab_info)
	local domain = tab_info.active_pane.domain_name or ""
	return domain
end

function M.apply_to_config(cfg)
	cfg.use_fancy_tab_bar = true
	cfg.show_tab_index_in_tab_bar = true
	cfg.tab_max_width = 120

	cfg.hide_tab_bar_if_only_one_tab = false
	cfg.quit_when_all_windows_are_closed = true
	-- cfg.window_decorations = "RESIZE"
	cfg.adjust_window_size_when_changing_font_size = false
	cfg.window_close_confirmation = "AlwaysPrompt"
	cfg.window_padding = {
		top = "16px",
		bottom = "4px",
		left = "12px",
		right = "12px",
	}
	cfg.command_palette_font_size = 16
	-- cfg.colors = cfg.colors or {}
	-- cfg.colors.tab_bar = cfg.colors.tab_bar
	-- 	or {
	-- 		background = "#000000",
	-- 		new_tab = {
	-- 			bg_color = "#000000",
	-- 			fg_color = "#ffffff",
	-- 		},
	-- 	}

	-- wezterm.on(
	-- 	"format-tab-title",
	-- 	function(tab, tabs, panes, config, hover, max_width)
	-- 		local title = tab_title(tab)
	--
	-- 		if tab.is_active then
	-- 			return {
	-- 				{ Background = { Color = "Black" } },
	-- 				{ Foreground = { AnsiColor = "Black" } },
	-- 				{
	-- 					Text = " "
	-- 						.. wezterm.nerdfonts.ple_lower_right_triangle,
	-- 				},
	-- 				{ Background = { AnsiColor = "Black" } },
	-- 				{ Foreground = { AnsiColor = "White" } },
	-- 				{ Text = " " .. title .. " " },
	-- 				{ Background = { Color = "Black" } },
	-- 				{ Foreground = { AnsiColor = "Black" } },
	-- 				{ Text = wezterm.nerdfonts.ple_lower_left_triangle .. " " },
	-- 			}
	-- 		end
	--
	-- 		return {
	-- 			{ Background = { Color = "Black" } },
	-- 			{ Foreground = { AnsiColor = "Blue" } },
	-- 			{ Text = wezterm.nerdfonts.ple_lower_right_triangle },
	-- 			{ Background = { AnsiColor = "Blue" } },
	-- 			{ Foreground = { AnsiColor = "Black" } },
	-- 			{ Text = " " .. title .. " " },
	-- 			{ Background = { Color = "Black" } },
	-- 			{ Foreground = { AnsiColor = "Blue" } },
	-- 			{ Text = wezterm.nerdfonts.ple_lower_left_triangle .. " " },
	-- 		}
	-- 	end
	-- )
end

local function with_icon(icon, text)
	local i = wezterm.nerdfonts[icon]
		or wezterm.nerdfonts[icon:gsub("^nf%-", ""):gsub("%-", "_")]
		or icon
	if i then i = i .. "  " end
	return " " .. i .. text .. " "
end

-- wezterm.on("update-status", function(win, pane)
-- local muxw = win:mux_window() or {}
--
-- local ok, domain = pcall(muxw.get_domain, muxw)
-- if not ok then domain = "default" end
--
-- win:set_right_status(wezterm.format {
-- 	{ Foreground = { AnsiColor = "Green" } },
-- 	{ Background = { Color = "Black" } },
-- 	{ Text = " " .. wezterm.nerdfonts.ple_left_half_circle_thick },
-- 	{ Foreground = { AnsiColor = "Black" } },
-- 	{ Background = { AnsiColor = "Green" } },
-- 	{
-- 		Text = with_icon("md_window_closed_variant", muxw:get_title()),
-- 	},
-- 	{ Foreground = { AnsiColor = "Green" } },
-- 	{ Background = { Color = "Black" } },
-- 	{ Text = wezterm.nerdfonts.ple_right_half_circle_thick .. " " },
--
-- 	{ Background = { Color = "Black" } },
-- 	{ Foreground = { AnsiColor = "Olive" } },
-- 	{ Text = " " .. wezterm.nerdfonts.ple_left_half_circle_thick },
-- 	{ Foreground = { AnsiColor = "Black" } },
-- 	{ Background = { AnsiColor = "Olive" } },
-- 	{
-- 		Text = with_icon("nf-md-space_invaders", muxw:get_workspace()),
-- 	},
-- 	{ Background = { Color = "Black" } },
-- 	{ Foreground = { AnsiColor = "Olive" } },
-- 	{ Text = wezterm.nerdfonts.ple_right_half_circle_thick .. " " },
--
-- 	{ Background = { Color = "Black" } },
-- 	{ Foreground = { AnsiColor = "Aqua" } },
-- 	{ Text = " " .. wezterm.nerdfonts.ple_left_half_circle_thick },
-- 	{ Foreground = { AnsiColor = "Black" } },
-- 	{ Background = { AnsiColor = "Aqua" } },
-- 	{ Text = with_icon("md_castle", domain) .. " " },
-- })
-- end)

return M
