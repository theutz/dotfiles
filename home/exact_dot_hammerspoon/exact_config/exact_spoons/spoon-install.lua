package.path = package.path .. ";" .. hs.configdir .. "/?.spoon/init.lua"

---@type spoon.SpoonInstall
local s = assert(hs.loadSpoon "SpoonInstall", "Error while loading SpoonInstall")

return s
