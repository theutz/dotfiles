local s = require "config.spoons.spoon-install"
local waitUntil = hs.timer.waitUntil

s:andUse "RecursiveBinder"

local bind = spoon.RecursiveBinder.recursiveBind

local function wezterm_start(command)
	local args = { "-e" }
	if command then
		table.insert(args, command)
	end
	return hs.task.new("/opt/homebrew/bin/wezterm", nil, args):start()
end

local function wezterm()
	hs.application.open "WezTerm"
end

local function spotify_player()
	local function window()
		return hs.window.find "spotify_player"
	end

	if window() then
		window():focus()
		return
	end

	if wezterm_start "/opt/homebrew/bin/spotify_player" then
		waitUntil(window, function()
			local w = window()
			w:focus()
			hs.grid.set(w, { 1, 1, 10, 10 }, "Built%-in")
		end):start()
	end
end

local function ticker()
	local function window()
		return hs.window.find "tickrs"
	end

	if window() then
		window():focus()
		return
	end

	if wezterm_start "/opt/homebrew/bin/tickrs" then
		waitUntil(window, function()
			local w = window()
			w:focus()
			hs.grid.set(w, { 1, 1, 10, 10 }, "Built%-in")
		end)
	end
end

hs.hotkey.bind(
	nil,
	"f13",
	bind {
		[{ {}, "w", "wezterm" }] = wezterm,
		[{ {}, "s", "spotify player" }] = spotify_player,
		[{ {}, "t", "ticker" }] = ticker,
	}
)
