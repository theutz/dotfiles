hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
Install:updateRepo()

local hammer = {"ctrl", "alt", "cmd"}

Install:andUse('ReloadConfiguration', {
  start = true,
  hotkeys = {
    reloadConfiguration = {hammer, "r" }}
  })
