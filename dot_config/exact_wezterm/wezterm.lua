-- ╭─────────╮
-- │ Startup │
-- ╰─────────╯

local w = require("wezterm")
local a = w.action
local c = {}
if w.config_builder then
	c = w.config_builder()
end
c:set_strict_mode(true)

-- ╭───────────────────────╮
-- │ Color scheme & colors │
-- ╰───────────────────────╯

local function get_appearance()
	if w.gui then
		return w.gui.get_appearance()
	end
	return "Dark"
end

local function light_dark(light, dark)
	if get_appearance():find("Dark") then
		return dark
	else
		return light
	end
end

c.color_scheme = light_dark("rose-pine-dawn", "rose-pine")
c.window_background_opacity = light_dark(0.9, 0.98)
c.bold_brightens_ansi_colors = "BrightAndBold"
c.macos_window_background_blur = 30
c.inactive_pane_hsb = {
	saturation = 1.3,
	brightness = 0.8,
}
c.text_background_opacity = 1.0
c.text_min_contrast_ratio = 1.0

-- Write system appearance to be consumed by other cli tools!
local appearance_file_path = w.home_dir .. "/.local/state/appearance"
c.set_environment_variables = {
	APPEARANCE_FILE = appearance_file_path,
}
local function write_appearance_to_disk()
	local file = io.open(appearance_file_path, "w")
	if file then
		file:write(light_dark("light", "dark"))
		file:close()
	end
end
w.on("gui-startup", write_appearance_to_disk)
w.on("window-config-reloaded", write_appearance_to_disk)

-- ╭───────╮
-- │ Fonts │
-- ╰───────╯

local font_options = {
	function ()
		c.font = w.font("RecMonoCasual Nerd Font Propo", { weight = 400 })
		c.font_size = 13
		c.line_height = c.font_size * 0.11
	end,
	function ()
		c.font = w.font("Maple Mono NF", { weight = 400 })
		c.font_size = 13
		c.line_height = c.font_size * 0.1
	end,
	function ()
		c.font = w.font("Berkeley Mono", { weight = 500 })
		c.font_size = 13
		c.line_height = c.font_size * 0.11
	end,
}
local font_option = nil or math.random(#font_options)
font_options[font_option]()

-- ╭────╮
-- │ UI │
-- ╰────╯

c.quit_when_all_windows_are_closed = false
c.window_decorations = "RESIZE"
c.adjust_window_size_when_changing_font_size = false
c.window_close_confirmation = "AlwaysPrompt"
c.window_padding = {
	top = "16px",
	bottom = "4px",
	left = "8px",
	right = "0px",
}
c.use_fancy_tab_bar = false
c.show_tab_index_in_tab_bar = true
c.tab_max_width = 120
c.hide_tab_bar_if_only_one_tab = true
c.enable_tab_bar = true
c.tab_bar_at_bottom = true

-- ╭─────────────╮
-- │ Environment │
-- ╰─────────────╯

c.default_prog = { "zsh", "-c", "nu --login" }

-- ╭────────────────╮
-- │ Text rendering │
-- ╰────────────────╯

c.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

-- ╭──────────╮
-- │ Keyboard │
-- ╰──────────╯

c.enable_kitty_keyboard = true
c.keys = {
	{ key = "C", mods = "SUPER|SHIFT", action = a.ActivateCopyMode },
	{ key = "D", mods = "SUPER|SHIFT", action = a.SplitPane({ direction = "Right" }) },
	{ key = "d", mods = "SUPER", action = a.SplitPane({ direction = "Down" }) },
	{ key = "h", mods = "SUPER", action = a.ActivatePaneDirection("Left") },
	{ key = "H", mods = "SUPER|ALT", action = a.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "SUPER", action = a.ActivatePaneDirection("Down") },
	{ key = "J", mods = "SUPER|ALT", action = a.AdjustPaneSize({ "Down", 5 }) },
	{ key = "J", mods = "SUPER|SHIFT", action = a.ScrollByPage(0.5) },
	{ key = "J", mods = "SUPER|SHIFT|ALT", action = a.ScrollToPrompt(1) },
	{ key = "k", mods = "SUPER", action = a.ActivatePaneDirection("Up") },
	{ key = "K", mods = "SUPER|ALT", action = a.AdjustPaneSize({ "Up", 5 }) },
	{ key = "K", mods = "SUPER|SHIFT", action = a.ScrollByPage(-0.5) },
	{ key = "K", mods = "SUPER|SHIFT|ALT", action = a.ScrollToPrompt(-1) },
	{ key = "l", mods = "SUPER", action = a.ActivatePaneDirection("Right") },
	{ key = "L", mods = "SUPER|ALT", action = a.AdjustPaneSize({ "Right", 5 }) },
	{ key = "n", mods = "SUPER|SHIFT", action = a.SpawnWindow },
	{ key = "o", mods = "SUPER", action = a.RotatePanes("Clockwise") },
	{ key = "O", mods = "SUPER|SHIFT", action = a.RotatePanes("CounterClockwise") },
	{ key = "t", mods = "SUPER", action = a.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "SUPER", action = a.CloseCurrentPane({ confirm = true }) },
	{ key = "W", mods = "SUPER|SHIFT", action = a.CloseCurrentTab({ confirm = true }) },
	{ key = "y", mods = "SUPER", action = a.QuickSelect },
	{ key = "z", mods = "SUPER", action = a.TogglePaneZoomState },
	{ key = "Return", mods = "ALT", action = a.DisableDefaultAssignment },
}

-- ╭─────────────╮
-- │ Status Bars │
-- ╰─────────────╯

w.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name .. " "
	end
	window:set_right_status(name or "")
end)

-- ╭──────────────────╮
-- │ Notify on reload │
-- ╰──────────────────╯

w.on("window-config-reloaded", function(window, _)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

--  _______
-- < Done! >
--  -------
--       \                    / \  //\
--        \    |\___/|      /   \//  \\
--             /0  0  \__  /    //  | \ \
--            /     /  \/_/    //   |  \  \
--            @_^_@'/   \/_   //    |   \   \
--            //_^_/     \/_ //     |    \    \
--         ( //) |        \///      |     \     \
--       ( / /) _|_ /   )  //       |      \     _\
--     ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
--   (( / / )) ,-{        _      `-.|.-~-.           .~         `.
--  (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
--  (( /// ))      `.   {            }                   /      \  \
--   (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
--              ///.----..>        \             _ -~             `.  ^-`  ^-_
--                ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
--                                                                   /.-~

return c
