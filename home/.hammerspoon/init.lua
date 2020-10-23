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
hs.hotkey.bindSpec({hyper, "c"}, "Visual Studio Code", function ()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bindSpec({hyper, "z"}, "Zoom", function ()
  hs.application.launchOrFocus("Zoom.us")
end)

hs.hotkey.bindSpec({hyper, "s"}, "Spotify", function ()
  hs.application.launchOrFocus("Spotify")
end)

hs.alert.show("Configuration Reloaded!")