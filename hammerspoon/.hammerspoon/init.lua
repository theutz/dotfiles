--
-- Setup alert styles
--
alertStyles = {
  fillColor = hs.drawing.color.x11['slateblue'],
  strokeColor = hs.drawing.color.x11['slateblue'],
  strokeWidth = 0,
  radius = 10,
  textFont = 'FuraCode Nerd Font'
}

for key, val in pairs(alertStyles) do
  hs.alert.defaultStyle[key] = val
end

--
-- Setup Spoons
--
s = hs.loadSpoon("SpoonInstall")
hyper = {"cmd", "alt", "ctrl"}

s:andUse("ReloadConfiguration", {
           start = true,
           config = { watch_paths = { hs.configdir .. '/init.lua' }},
           hotkeys = { reloadConfiguration = {hyper, "d"}}
})

s:andUse("FnMate")

s:andUse("FadeLogo", {
           start = true,
           config = {
             run_time = 2,
             image_alpha = 0.9,
             fade_in_time = 2,
             fade_out_time = 0.1
           }
})

