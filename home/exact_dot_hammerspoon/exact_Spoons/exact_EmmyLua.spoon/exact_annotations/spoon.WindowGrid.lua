--# selene: allow(unused_variable)
---@diagnostic disable: unused-local

-- Configure and assign hotkey for `hs.grid`
--
-- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/WindowGrid.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/WindowGrid.spoon.zip)
---@class spoon.WindowGrid
local M = {}
spoon.WindowGrid = M

-- Table containing a list of arguments to be passed to grid.setGrid(). Each element in the table is itself a table with 1-3 arguments as defined for [hs.grid.setGrid()](http://www.hammerspoon.org/docs/hs.grid.html#setGrid). Defaults to an empty list, which results in the default 3x3 grid for all screen from `hs.grid`.
M.gridGeometries = nil

-- Logger object used within the Spoon. Can be accessed to set the default log level for the messages coming from the Spoon.
M.logger = nil

-- Binds hotkeys for WindowGrid
--
-- Parameters:
--  * mapping - A table containing hotkey objifier/key details for the following items:
--   * show_grid - show the grid overlay
function M:bindHotkeys(mapping, ...) end

-- Sets the grid configuration according to `WindowGrid.gridGeometries`.
function M:start() end

