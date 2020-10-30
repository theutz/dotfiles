-- Setup Spoon Install

hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
Install:updateRepo()

-- Basic Definitions

local hyper = {"ctrl", "alt", "cmd", "shift"}

-- Reload Configuration

Install:andUse('ReloadConfiguration', {
                 start = true,
                 hotkeys = {
                   reloadConfiguration = {hyper, "r" }
                 },
                 config = {
                   watch_paths = {
                     hs.configDir,
                     os.getenv("HOME") .. "/.dotfiles/home/.hammerspoon/init.lua"
                   }
                 },
})

-- Window Management

Install:andUse('WinWin', {
                 fn = function (WinWin)
                   hs.window.animationDuration = 0

                   local hammer = {"ctrl", "alt", "cmd"}
                   local moves = {
                     {"halfleft", "h"},
                     {"halfdown", "j"},
                     {"halfup", "k"},
                     {"halfright", "l"},
                     {"maximize", "return"}
                   }

                   for i = 1, #moves do
                     local move,key = table.unpack(moves[i])

                     hs.hotkey.bindSpec({hammer, key}, nil, function ()
                         WinWin:moveAndResize(move)
                     end)
                   end
                 end
})

-- Other Hotkeys to bind

local appShortcuts = {
  {"Zoom.us", "z"},
  {"Spotify", "m"},
  {"Fantastical", "f"},
  {"Google Chrome", "g"},
  {"Airmail", "a"},
  {"Emacs", "e"},
  {"TextExpander", "t"},
  {"iTerm", "i"},
  {"Slack", "s"},
  {"Dash", "d"}
}

for i = 1, #appShortcuts do
  local app,key = table.unpack(appShortcuts[i])

  hs.hotkey.bindSpec({hyper, key}, app, function ()
      hs.application.launchOrFocus(app)
  end)
end

-- Report Success!!

hs.alert.show("Configuration Reloaded!")
