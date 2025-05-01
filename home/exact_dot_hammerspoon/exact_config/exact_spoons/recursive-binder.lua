local s = require "config.spoons.spoon-install"
local waitUntil = hs.timer.waitUntil

s:andUse "RecursiveBinder"

local bind = spoon.RecursiveBinder.recursiveBind

local open_in_wezterm = function(command)
	local args = { "-e", command }

	return hs.task.new("/opt/homebrew/bin/wezterm", nil, args):start()
end

hs.hotkey.bind(
	nil,
	"f13",
	bind {
		[{ {}, "s", "spotify" }] = function()
			local get_win = function()
				return hs.window.find "spotify_player"
			end

			if get_win() then
				get_win():focus()
				return
			end

			if open_in_wezterm "/opt/homebrew/bin/spotify_player" then
				waitUntil(get_win, function()
					local w = get_win()
					hs.grid.set(w, { 1, 1, 10, 10 })
					w:focus()
				end):start()
			end
		end,
	}
)

return bind
