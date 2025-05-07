local wezterm = require "wezterm"
local a = wezterm.action

local M = {}

---@type { [string]: any[] }
M.key_tables = {
	move_tab = {
		{ key = ">", mods = nil, action = a.MoveTabRelative(1) },
		{ key = "<", mods = nil, action = a.MoveTabRelative(-1) },
	},
	scroll_mode = {
		{
			mods = nil,
			key = "u",
			action = a.ScrollByPage(-0.5),
		},
		{
			mods = nil,
			key = "d",
			action = a.ScrollByPage(0.5),
		},
		{
			mods = nil,
			key = "Escape",
			action = a.ClearKeyTableStack,
		},
		{
			mods = nil,
			key = "q",
			action = a.ClearKeyTableStack,
		},
	},
}

M.keys = {
	{
		{ { "LEADER|SHIFT", "!" } },
		require "actions.break-pane",
	},
	{
		{ { "LEADER", "c" }, { "SUPER", "n" }, { "SUPER", "t" } },
		a.SpawnTab "CurrentPaneDomain",
	},
	{
		{ { "CTRL|SHIFT", "l" } },
		a.ShowDebugOverlay,
	},
	{
		{ { "LEADER", "e" } },
		a.CharSelect,
	},
	{
		{ { "SUPER", "=" } },
		a.IncreaseFontSize,
	},
	{
		{ { "SUPER", "-" } },
		a.DecreaseFontSize,
	},
	{
		{ { "SUPER", "0" } },
		a.ResetFontSize,
	},
	{
		{ { "LEADER", ">" } },
		a.Multiple {
			a.MoveTabRelative(1),
			a.ActivateKeyTable {
				name = "move_tab",
				timeout_milliseconds = 500,
			},
		},
	},
	{
		{ { "LEADER", "<" } },
		a.Multiple {
			a.MoveTabRelative(-1),
			a.ActivateKeyTable {
				name = "move_tab",
				timeout_milliseconds = 500,
			},
		},
	},
	{
		{ { "SUPER|SHIFT", "}" }, { "LEADER", "n" } },
		a.ActivateTabRelative(1),
	},
	{
		{ { "SUPER|SHIFT", "{" }, { "LEADER", "p" } },
		a.ActivateTabRelative(-1),
	},
	{
		{ { "SUPER", "w" }, { "LEADER", "x" } },
		a.CloseCurrentPane { confirm = true },
	},
	{
		{ { "LEADER", "q" } },
		a.PaneSelect { mode = "Activate", show_pane_ids = true },
	},
	{
		{ { "LEADER|SHIFT", "Q" } },
		a.PaneSelect { mode = "SwapWithActiveKeepFocus" },
	},
	{
		{ { "LEADER", "o" } },
		a.RotatePanes "Clockwise",
	},
	{
		{ { "LEADER|SHIFT", "O" } },
		a.RotatePanes "CounterClockwise",
	},
	{
		{ { "LEADER", "s" }, { "LEADER", "-" } },
		a.SplitPane { direction = "Down", size = { Percent = 30 } },
	},
	{
		{ { "LEADER|SHIFT", "S" }, { "SUPER|SHIFT", "d" } },
		a.SplitPane { direction = "Down", size = { Percent = 50 } },
	},
	{
		{ { "LEADER", "v" }, { "LEADER", "|" } },
		a.SplitPane { direction = "Right", size = { Percent = 30 } },
	},
	{
		{ { "LEADER|SHIFT", "V" }, { "SUPER", "d" } },
		a.SplitPane { direction = "Right", size = { Percent = 50 } },
	},
	{
		{ { "ALT", "Enter" }, { "SHIFT", "Enter" } },
		a.DisableDefaultAssignment,
	},
	{
		{ { "SUPER", "c" } },
		a.CopyTo "Clipboard",
	},
	{
		{ { "SUPER", "v" } },
		a.PasteFrom "Clipboard",
	},
	{
		{ { "SUPER|SHIFT", "P" }, { "CTRL|SHIFT", "P" }, { "LEADER", ":" } },
		a.ActivateCommandPalette,
	},
	{
		{ { "SUPER", "q" } },
		a.QuitApplication,
	},
	{
		{ { "LEADER", "z" } },
		a.TogglePaneZoomState,
	},
	{
		{ { "LEADER|SHIFT", "S" } },
		a.ShowTabNavigator,
	},
	{
		{ { "LEADER", "[" } },
		a.ActivateKeyTable {
			name = "scroll_mode",
			replace_current = true,
			one_shot = false,
			prevent_fallback = true,
		},
	},
	{
		{ { "LEADER", "h" } },
		a.ActivatePaneDirection "Left",
	},
	{
		{ { "LEADER", "j" } },
		a.ActivatePaneDirection "Down",
	},
	{
		{ { "LEADER", "k" } },
		a.ActivatePaneDirection "Up",
	},
	{
		{ { "LEADER", "l" } },
		a.ActivatePaneDirection "Right",
	},
	{
		{ { "SUPER|SHIFT", "n" } },
		a.SpawnWindow,
	},
	{
		{ { "CTRL|SHIFT", "Space" }, { "SUPER|SHIFT", "Space" } },
		a.QuickSelect,
	},
	{
		{ { "CTRL|SHIFT", "x" }, { "SUPER|SHIFT", "x" } },
		a.ActivateCopyMode,
	},
	{
		{ { "LEADER", "1" } },
		a.ActivateTab(0),
	},
	{
		{ { "LEADER", "2" } },
		a.ActivateTab(1),
	},
	{
		{ { "LEADER", "3" } },
		a.ActivateTab(2),
	},
	{
		{ { "LEADER", "4" } },
		a.ActivateTab(3),
	},
	{
		{ { "LEADER", "5" } },
		a.ActivateTab(4),
	},
	{
		{ { "LEADER", "6" } },
		a.ActivateTab(5),
	},
	{
		{ { "LEADER", "7" } },
		a.ActivateTab(6),
	},
	{
		{ { "LEADER", "8" } },
		a.ActivateTab(7),
	},
	{
		{ { "LEADER", "9" } },
		a.ActivateTab(-1),
	},
	{
		{ { "LEADER", ")" } },
		a.ActivateWindowRelative(1),
	},
	{
		{ { "LEADER", "(" } },
		a.ActivateWindowRelative(-1),
	},
	{
		{ { "LEADER", "g" }, { "SUPER", "g" } },
		a.ShowLauncherArgs { flags = "WORKSPACES|DOMAINS|FUZZY" },
	},
	{
		{ { "SUPER", "p" } },
		a.ShowLauncherArgs { flags = "LAUNCH_MENU_ITEMS|FUZZY" },
	},
	{
		{ { "SUPER", "r" } },
		a.ReloadConfiguration,
	},
	{
		{ { "LEADER|SHIFT", "$" } },
		require "actions.rename-workspace",
	},
	{
		{ { "LEADER", "," } },
		a.PromptInputLine {
			description = "Rename window...",
			action = wezterm.action_callback(function(win, pane, line)
				if line then win:mux_window():set_title(line) end
			end),
		},
	},
}

function M.apply_to_config(cfg)
	M.cfg = cfg
	M.cfg.keys = M.cfg.keys or {}
	M.cfg.key_tables = M.cfg.key_tables or {}

	M.apply_misc_settings()
	M.apply_keys()
	M.apply_key_tables()
end

function M.apply_keys()
	for _, v in ipairs(M.keys) do
		local specs, action = table.unpack(v)
		for _, spec in ipairs(specs) do
			local mods, key = table.unpack(spec)
			table.insert(
				M.cfg.keys,
				{ mods = mods, key = key, action = action }
			)
		end
	end
end

function M.apply_misc_settings()
	M.cfg.disable_default_key_bindings = true
	M.cfg.enable_kitty_keyboard = true
	M.cfg.leader = {
		key = "m",
		mods = "META",
		timeout_milliseconds = 2000,
	}
end

function M.apply_key_tables()
	for k, v in pairs(M.key_tables) do
		M.cfg.key_tables[k] = v
	end
end

return M
