local wezterm = require "wezterm"
local act = wezterm.action

local M = {}

local leader = { key = "b", mods = "CTRL", timeout_milliseconds = 3000 }

local save_most_recent_workspace = wezterm.action_callback(
	function(win) wezterm.GLOBAL.most_recent_workspace = win:active_workspace() end
)

local formatted_input_prompt = function(message, fn)
	return act.PromptInputLine {
		description = wezterm.format {
			{ Attribute = { Intensity = "Bold" } },
			{ Foreground = { AnsiColor = "Blue" } },
			{ Text = message },
		},
		action = wezterm.action_callback(fn),
	}
end

local show_full_launcher = act.ShowLauncherArgs {
	flags = "FUZZY|TABS|WORKSPACES|DOMAINS|KEY_ASSIGNMENTS|COMMANDS|LAUNCH_MENU_ITEMS",
}

local show_workspaces = act.Multiple { save_most_recent_workspace, act.ShowLauncherArgs { flags = "WORKSPACES" } }

local switch_to_most_recent_workspace = act.Multiple {
	wezterm.action_callback(function(win)
		local current = win:active_workspace()
		if wezterm.GLOBAL.most_recent_workspace then
			wezterm.mux.set_active_workspace(wezterm.GLOBAL.most_recent_workspace)
		end
		wezterm.GLOBAL.most_recent_workspace = current
	end),
}

local switch_to_next_workspace = act.Multiple { save_most_recent_workspace, act.SwitchWorkspaceRelative(1) }

local switch_to_prev_workspace = act.Multiple { save_most_recent_workspace, act.SwitchWorkspaceRelative(-1) }

local switch_to_new_workspace = formatted_input_prompt(
	"New WORKSPACE name",
	function(win, pane, line)
		win:perform_action(
			act.Multiple {
				save_most_recent_workspace,
				act.SwitchToWorkspace { name = line },
			},
			pane
		)
	end
)

local rename_tab = formatted_input_prompt("New TAB name", function(window, _, line)
	if line then window:active_tab():set_title(line) end
end)

local rename_workspace = formatted_input_prompt("New WORKSPACE name", function(window, _, line)
	if line then
		local old = window:active_workspace()
		wezterm.mux.rename_workspace(old, line)
	end
end)

local break_pane = wezterm.action_callback(function(_, pane) pane:move_to_new_tab() end)

local create_new_tab = formatted_input_prompt("New TAB name", function(win, _, line)
	local tab = win:mux_window():spawn_tab {}
	tab:set_title(line)
end)

local function smart_splits(action, key)
	local direction_keys = { h = "Left", j = "Down", k = "Up", l = "Right" }
	local mods = action == "resize" and "META" or "CTRL"
	return {
		key = key,
		mods = mods,
		action = wezterm.action_callback(function(win, pane)
			if pane:get_user_vars().IS_NVIM == "true" then
				win:perform_action({ SendKey = { key = key, mods = mods } }, pane)
			else
				if action == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

local keys = {
	smart_splits("move", "h"),
	smart_splits("move", "j"),
	smart_splits("move", "k"),
	smart_splits("move", "l"),
	smart_splits("resize", "h"),
	smart_splits("resize", "j"),
	smart_splits("resize", "k"),
	smart_splits("resize", "l"),
	{ key = " ", mods = "LEADER", action = show_full_launcher },
	{ key = "!", mods = "LEADER", action = break_pane },
	{ key = "$", mods = "LEADER", action = rename_workspace },
	{ key = "(", mods = "LEADER", action = switch_to_prev_workspace },
	{ key = ")", mods = "LEADER", action = switch_to_next_workspace },
	{ key = ",", mods = "LEADER", action = rename_tab },
	{ key = "-", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
	{ key = "<", mods = "LEADER", action = act.MoveTabRelative(-1) },
	{ key = ">", mods = "LEADER", action = act.MoveTabRelative(1) },
	{ key = "?", mods = "LEADER", action = act.PaneSelect },
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "b", mods = "LEADER|CTRL", action = act.SendKey { key = "b", mods = "CTRL" } },
	{ key = "c", mods = "LEADER", action = create_new_tab },
	{ key = "C", mods = "LEADER", action = switch_to_new_workspace },
	{ key = "d", mods = "LEADER", action = act.ScrollByPage(1) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },
	{ key = "m", mods = "LEADER", action = act.PaneSelect { mode = "SwapWithActive" } },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "o", mods = "LEADER", action = act.RotatePanes "Clockwise" },
	{ key = "o", mods = "LEADER|SHIFT", action = act.RotatePanes "CounterClockwise" },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentTab { confirm = true } },
	{ key = "s", mods = "LEADER", action = show_workspaces },
	{ key = "S", mods = "LEADER", action = switch_to_most_recent_workspace },
	{ key = "u", mods = "LEADER", action = act.ScrollByPage(-1) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "|", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
}

for i = 1, 9 do
	table.insert(keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

function M.setup(config)
	-- config.keys = keys
	-- config.leader = leader
end

return M
