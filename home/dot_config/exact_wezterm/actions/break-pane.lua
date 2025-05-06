local w = require "wezterm"

return w.action_callback(function(_, pane)
	pane:move_to_new_tab()
	pane:activate()
end)
