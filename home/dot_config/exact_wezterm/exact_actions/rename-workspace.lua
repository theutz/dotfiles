local w = require "wezterm"
local a = w.action

return a.PromptInputLine {
	description = "Enter new name for workspace",
	action = w.action_callback(function(_, _, line)
		if line then
			w.mux.rename_workspace(w.mux.get_active_workspace(), line)
		end
	end),
}
