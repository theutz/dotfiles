local wez = require("wezterm")
local act = wez.action

-- Setup config builder
local cfg = {}
if wez.config_builder then
	cfg = wez.config_builder()
end
cfg:set_strict_mode(true)

cfg.default_prog = { "/opt/homebrew/bin/fish" }

cfg.font = wez.font("Berkeley Mono", { weight = 400 })
cfg.font_size = 16
cfg.line_height = 1.4
cfg.bold_brightens_ansi_colors = "BrightAndBold"

cfg.hide_tab_bar_if_only_one_tab = false

cfg.quit_when_all_windows_are_closed = false

cfg.window_close_confirmation = "AlwaysPrompt"
-- config.window_decorations = "RESIZE"
cfg.adjust_window_size_when_changing_font_size = false
cfg.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

cfg.window_padding = {
	top = "16px",
	bottom = "4px",
	left = "12px",
	right = "12px",
}
cfg.command_palette_font_size = 16

-- Color scheme
local function get_appearance()
	if wez.gui then
		return wez.gui.get_appearance()
	end
	return "Dark"
end

local lights = {
	{ "Gruvbox light, hard (base16)", 0.95, 15 },
	{ "Gruvbox light, soft (base16)", 0.96, 16 },
	{ "Gruvbox light, medium (base16)", 0.95, 15 },
	{ "GruvboxLight", 0.95, 15 },
	{ "tokyonight_day", 0.95, 15 },
	{ "Bluloco Light (Gogh)", 0.95, 20 },
	{ "Ef-Cyprus", 0.85, 20 },
	{ "Ef-Deuteranopia-Light", 0.8, 10 },
	{ "Ef-Tritanopia-Light", 0.8, 10 },
	{ "Ef-Maris-Light", 0.85, 20 },
	{ "Ef-Day", 0.8, 10 },
	{ "Ef-Duo-Light", 0.8, 10 },
	{ "Ef-Frost", 0.8, 10 },
	{ "Ef-Kassio", 0.8, 10 },
	{ "Ef-Light", 0.8, 10 },
	{ "Ef-Melissa-Light", 0.8, 10 },
	{ "Ef-Trio-Light", 0.8, 10 },
	{ "Ef-Spring", 0.8, 10 },
	{ "Harmonic16 Light (base16)", 0.8, 10 },
	{ "iceberg-light", 0.8, 10 },
	{ "Ef-Summer", 0.8, 10 },
	{ "Modus-Operandi", 0.7, 10 },
	{ "Modus-Operandi-Tinted", 0.7, 10 },
	{ "Selenized Light (Gogh)", 0.8, 10 },
	{ "seoulbones_light", 0.8, 10 },
	{ "Solarized Light (Gogh)", 0.8, 10 },
	{ "Tomorrow (Gogh)", 0.8, 10 },
	{ "zenwritten_light", 0.8, 10 },
}

local darks = {
	{ "GruvboxDark", 0.85, 15 },
	{ "Gruvbox dark, hard (base16)", 0.85, 15 },
	{ "Gruvbox dark, pale (base16)", 0.85, 15 },
	{ "Gruvbox dark, medium (base16)", 0.85, 15 },
	{ "Gruvbox dark, soft (base16)", 0.85, 15 },
	{ "Woodland (base16)", 0.7, 15 },
	{ "Bim", 0.8, 10 },
	{ "Wryan", 0.8, 10 },
	{ "rose-pine-moon", 0.8, 20 },
	{ "ayu", 0.8, 10 },
	{ "Jellybeans", 0.8, 10 },
	{ "Ef-Winter", 0.8, 15 },
	{ "Ef-Autumn", 0.7, 15 },
	{ "terafox", 0.75, 14 },
	{ "Vice Dark (base16)", 0.8 },
	{ "Belafonte Night", 0.8, 15 },
	{ "Banana Blueberry", 0.7, 15 },
	{ "Argonaut", 0.8, 15 },
	{ "Adventure Time (Gogh)", 0.9, 5 },
	{ "Urple", 0.7, 5 },
	{ "wilmersdorf" },
	{ "Website (Gogh)" },
	{ "Vacuous 2 (terminal.sexy)" },
	{ "Vice Alt (base16)" },
	{ "Rasi (terminal.sexy)" },
	{ "Molokai" },
	{ "Catppuccin Mocha" },
	{ "UnderTheSea" },
}

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return darks[1]
	else
		return lights[1]
	end
end

cfg.color_scheme = scheme_for_appearance(get_appearance())[1]
cfg.window_background_opacity = scheme_for_appearance(get_appearance())[2] or 1.0
cfg.macos_window_background_blur = scheme_for_appearance(get_appearance())[3] or 0

wez.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	overrides.color_scheme = scheme_for_appearance(get_appearance())[1]
	window:set_config_overrides(overrides)
end)

-- Keybindings
cfg.enable_kitty_keyboard = true

cfg.leader = { key = "m", mods = "META", timeout_milliseconds = 1000 }
cfg.keys = {
	{
		key = "Escape",
		mods = "NONE",
		action = act({ SendString = "\x1b" }),
	},
	{
		key = "d",
		mods = "SUPER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "SUPER|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "|",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
}

local disable_defaults = {
	{ "Enter", "ALT" },
	{ "Enter", "SHIFT" },
}

for _, kp in ipairs(disable_defaults) do
	table.insert(cfg.keys, {
		key = kp[1],
		mods = kp[2],
		action = act.DisableDefaultAssignment,
	})
end

return cfg
