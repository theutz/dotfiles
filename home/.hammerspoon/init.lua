-- Setup Spoon Install
hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
Install:updateRepo()

-- Hyper Keybindings
local hyper = {"ctrl", "alt", "cmd", "shift"}

Install:andUse('ReloadConfiguration', {
  start = true,
  hotkeys = {
    reloadConfiguration = {hyper, "r" }}
  })

-- Other Hotkeys to bind
hs.hotkey.bindSpec({hyper, "v"}, "Visual Studio Code", function ()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bindSpec({hyper, "z"}, "Zoom", function ()
  hs.application.launchOrFocus("Zoom.us")
end)

hs.hotkey.bindSpec({hyper, "s"}, "Spotify", function ()
  hs.application.launchOrFocus("Spotify")
end)

hs.hotkey.bindSpec({hyper, "c"}, "Fantastical", function ()
  hs.application.launchOrFocus("Fantastical")
end)

hs.hotkey.bindSpec({hyper, "g"}, "Google Chrome", function ()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bindSpec({hyper, "a"}, "Airmail", function ()
  hs.application.launchOrFocus("Airmail")
end)

hs.hotkey.bindSpec({hyper, "l"}, "Slack", function ()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bindSpec({hyper, "o"}, "OmniFocus", function ()
  hs.application.launchOrFocus("OmniFocus")
end)

hs.hotkey.bindSpec({hyper, "d"}, "Dash", function ()
  hs.application.launchOrFocus("Dash")
end)

hs.hotkey.bindSpec({hyper, "e"}, "TextExpander", function ()
  hs.application.launchOrFocus("TextExpander")
end)

hs.hotkey.bindSpec({hyper, "i"}, "iTerm", function ()
  hs.application.launchOrFocus("iTerm")
end)

hs.alert.show("Configuration Reloaded!")