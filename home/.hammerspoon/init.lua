hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
Install:updateRepo()

local hyper = {"ctrl", "alt", "cmd", "shift"}

Install:andUse('ReloadConfiguration', {
  start = true,
  hotkeys = {
    reloadConfiguration = {hyper, "r" }}
  })

hs.alert.show("Configuration Reloaded!")