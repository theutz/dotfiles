-- Setup Spoon Install
hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
Install:updateRepo()

-- Basic Definitions

local hyper = {"ctrl", "alt", "cmd"}

-- Reload Configuration

Install:andUse('ReloadConfiguration', {
    start = true,
    config = {
        watch_paths = {
            hs.configDir,
            os.getenv("HOME") .. "/.hammerspoon/init.lua"
        }
    }
})

-- Window Management

Install:andUse('WinWin', {
    fn = function(WinWin)
        hs.window.animationDuration = 0

        local moves = {
            {"halfleft", "h"},
            {"halfdown", "j"},
            {"halfup", "k"},
            {"halfright", "l"},
            {"maximize", "return"}
        }

        hs.fnutils.map(moves, function(item)
            local move, key = table.unpack(item)

            hs.hotkey.bindSpec({{"ctrl", "alt", "cmd"}, key}, nil,
                               function() WinWin:moveAndResize(move) end)
        end)
    end
})

-- Other Hotkeys to bind

hs.hotkey.bindSpec({'', 'f20'}, function() hs.hints.windowHints() end)

-- Report Success!!

hs.alert.show("Configuration Reloaded!")
