---@class Windowr
local obj = {}

---@public
obj.name = "Windowr"

---@public
obj.author = "Michael Utz <michael@theutz.com>"

---@public
obj.version = "0.0.0"

---@public
obj.license = "MIT"

---@public
obj.homepage = "https://theutz.com"

---@private
obj.logger = hs.logger.new(obj.name)

---@private
obj.mods = { "ctrl", "alt", "cmd" }

---@private
obj.gridSize = hs.geometry.size(12, 12) or {}

---@private
obj.gridMargin = hs.geometry.size(16, 16) or {}

---@private
obj.grid = hs.grid.setGrid(obj.gridSize).setMargins(obj.gridMargin)

---@private
obj.tiles = {}

---@private
obj.current_tile = 1

---@public
obj.defaultHotkeys = {
	centerOnScreen = "space",
	centralize = "c",
	fullscreen = "return",
	hide = "d",
	maxHeight = "y",
	maximizeAllWindows = "o",
	maxWidth = "x",
	moveToBottom = "s",
	moveToLeft = "a",
	moveToRight = "d",
	moveToTop = "w",
	focusWindowEast = "l",
	focusWindowWest = "h",
	focusWindowNorth = "k",
	focusWindowSouth = "j",
	nextScreen = "]",
	nextWindow = "0",
	northeast = "i",
	northwest = "u",
	prevScreen = "[",
	prevWindow = "9",
	quit = "q",
	southeast = "m",
	southwest = "n",
	tileAllWindows = "e",
	unhideAll = "a",
	tidy = "t",
}

obj.sizes = {
	centralize = {
		"1,1 10x10",
		"2,1 8x10",
		"2,2 8x8",
		"3,2 6x8",
		"3,3 6x6",
		"4,3 4x6",
		"4,4 4x4",
		"0,0 12x12",
	},
	fullscreen = { "0,0 12x12" },
	moveToBottom = { "0,6 12x6", "4,6 4x6" },
	moveToLeft = { "0,0 8x12", "0,0 6x12", "0,0 4x12" },
	moveToRight = { "4,0 8x12", "6,0 6x12", "8,0 4x12" },
	moveToTop = { "0,0 12x6", "4,0 4x6" },
	northeast = { "6,0 6x6", "8,0 4x6", "10,0 2x6" },
	northwest = { "0,0 6x6", "0,0 4x6", "0,0 2x6" },
	southeast = { "6,6 6x6", "8,6 4x6", "10,6 2x6" },
	southwest = { "0,6 6x6", "0,6 4x6", "0,6 2x6" },
}

---@private
obj.watcher = nil

---@private
obj.hidden_apps = {}

---@private
obj.tiling_is_on = false

function obj:init()
	hs.window.animationDuration = 0
	hs.grid.setGrid(self.gridSize).setMargins(self.gridMargin)
	hs.grid.ui.textSize = 20
	obj.watcher =
		hs.application.watcher.new(hs.fnutils.partial(self.onAppChange, self))
end

function obj:bindHotkeys(map)
	local def = {}

	-- Create functions for the grid cyclers
	for name, _ in pairs(self.sizes) do
		self[name] = function()
			self.tiling_is_on = false
			self:cycleThroughGrids(self.sizes[name])
		end
	end

	for name, key in pairs(map) do
		map[name] = { self.mods, key }
		def[name] = hs.fnutils.partial(self[name], self)
	end

	hs.spoons.bindHotkeysToSpec(def, map)
end

function obj:start()
	self.watcher:start()
end

function obj:stop()
	self.watcher:stop()
end

function obj:focusWindowEast()
	local win = hs.window.focusedWindow()
	win:focusWindowEast()
end

function obj:focusWindowWest()
	local win = hs.window.focusedWindow()
	win:focusWindowWest()
end

function obj:focusWindowSouth()
	local win = hs.window.focusedWindow()
	win:focusWindowSouth()
end

function obj:focusWindowNorth()
	local win = hs.window.focusedWindow()
	win:focusWindowNorth()
end

---@param name string
---@param eventType any
---@param app hs.application
function obj:onAppChange(name, eventType, app)
	---@diagnostic disable-next-line: param-type-mismatch
	self.logger.vf("app event: %s, %d", name, eventType)

	local w = hs.application.watcher
	local shouldSnapshot = { w.launched, w.terminated, w.hidden, w.unhidden }

	if self.tiling_is_on then
		if hs.fnutils.contains(shouldSnapshot, eventType) then
			---@diagnostic disable-next-line: param-type-mismatch
			self.logger.df("app should snapshot: %s, %d", name, eventType)
			self:saveWindowOrder()
		end

		if eventType == w.activated then
			---@diagnostic disable-next-line: param-type-mismatch
			self.logger.df("app activated: %s", app)
			self.current_tile =
				hs.fnutils.indexOf(self.tiles, app:focusedWindow())
		end
	end

	if eventType == w.hidden then
		table.insert(self.hidden_apps, app)
	end

	if eventType == w.unhidden then
		local index = hs.fnutils.indexOf(self.hidden_apps, app)
		table.remove(self.hidden_apps, index)
	end
end

---@param sizes string[]
function obj:cycleThroughGrids(sizes)
	local win = hs.window.frontmostWindow()
	local current_grid = hs.grid.get(win)

	local grids = {}

	for _, dimension in ipairs(sizes) do
		table.insert(grids, hs.geometry:new(dimension))
	end

	local new_grid = grids[1]

	for index, grid in ipairs(grids) do
		if current_grid and current_grid:equals(grid) then
			new_grid = grids[index + 1] or grids[1]
		end
	end

	self:withAxHotfix(function(w)
		hs.grid.set(w, new_grid)
	end)(win)
end

function obj:maxWidth()
	self.tiling_is_on = false
	self:withAxHotfix(function(win)
		local winGrid = hs.grid.get(win)
		assert(winGrid)

		local screenGrid = hs.grid.getGrid(win:screen())
		assert(screenGrid)

		winGrid.x = 0
		winGrid.w = screenGrid.w

		hs.grid.set(win, winGrid)
	end)(hs.window.frontmostWindow())
end

function obj:maxHeight()
	self.tiling_is_on = false
	self:withAxHotfix(function(win)
		local winGrid = hs.grid.get(win)
		assert(winGrid)

		local screenGrid = hs.grid.getGrid(win:screen())
		assert(screenGrid)

		winGrid.y = 0
		winGrid.h = screenGrid.h

		hs.grid.set(win, winGrid)
	end)(hs.window.frontmostWindow())
end

function obj:saveWindowOrder()
	self.tiles = {}
	local win = hs.window.frontmostWindow()

	local activeScreen = win:screen()
	for i, w in ipairs(hs.window.orderedWindows()) do
		if w:screen() == activeScreen then
			table.insert(self.tiles, w)
			if win == w then
				self.current_tile = i
			end
		end
	end
end

function obj:getCurrentTile()
	return self.tiles[self.current_tile]
end

function obj:hide()
	if #self.tiles > 0 then
		table.remove(self.tiles, self.current_tile)
		self.current_tile = self.current_tile + 1
	end
	local app = hs.window.frontmostWindow():application()
	if app ~= nil then
		app:hide()
	end
	hs.timer.doAfter(0.2, hs.fnutils.partial(self.tileAllWindows, self, true))
end

function obj:quit()
	if #self.tiles > 0 then
		table.remove(self.tiles, self.current_tile)
		self.current_tile = self.current_tile + 1
	end
	local app = hs.window.frontmostWindow():application()
	if app ~= nil then
		app:kill()
	end
	hs.timer.doAfter(0.2, hs.fnutils.partial(self.tileAllWindows, self, true))
end

function obj:nextWindow()
	local index
	if self.current_tile >= #self.tiles then
		index = 1
	else
		index = self.current_tile + 1
	end
	local win = self.tiles[index]
	if win == nil then
		self:saveWindowOrder()
		return self:nextWindow()
	end
	win:focus()
	self.current_tile = index
end

function obj:prevWindow()
	local index
	if self.current_tile <= 1 then
		index = #self.tiles
	else
		index = self.current_tile - 1
	end
	local win = self.tiles[index]
	if win == nil then
		self:saveWindowOrder()
		return self:prevWindow()
	end
	win:focus()
	self.current_tile = index
end

function obj:maximizeAllWindows()
	self.tiling_is_on = false
	for _, win in ipairs(hs.window.orderedWindows()) do
		if win:screen() == hs.window.frontmostWindow():screen() then
			self:withAxHotfix(function(w)
				hs.grid.maximizeWindow(w)
			end)(win)
		end
	end
end

function obj:tileAllWindows(skipReset)
	self.tiling_is_on = true
	if not skipReset then
		self:saveWindowOrder()
	end
	local rows = math.floor(math.sqrt(#self.tiles))
	local columns = math.ceil(math.sqrt(#self.tiles))
	if rows * columns < #self.tiles then
		rows = rows + 1
	end

	local i = 1
	for row = 1, rows do
		for column = 1, columns do
			local win = self.tiles[i]
			if win ~= nil then
				local cell =
					hs.geometry.new({ h = 12 / rows, w = 12 / columns })
				cell.x = (column - 1) * cell.w
				cell.y = (row - 1) * cell.h
				self:withAxHotfix(function()
					win:move(hs.grid.getCell(cell, win:screen()))
					hs.grid.snap(win)
				end)(win)
			end
			i = i + 1
		end
	end
end

function obj:centerOnScreen()
	local win = hs.window.frontmostWindow()
	self:withAxHotfix(function(w)
		w:centerOnScreen(nil, true)
		hs.grid.snap(w)
	end)(win)
end

function obj:nextScreen()
	local win = hs.window.frontmostWindow()
	self:withAxHotfix(function(w)
		local grid = hs.grid.get(w)
		local noResize = true
		local ensureInScreenBounds = false
		w:moveOneScreenEast(noResize, ensureInScreenBounds)
		hs.grid.set(w, grid)
	end)(win)
end

function obj:prevScreen()
	local win = hs.window.frontmostWindow()
	self:withAxHotfix(function(w)
		local grid = hs.grid.get(w)
		local noResize = true
		local ensureInScreenBounds = false
		w:moveOneScreenWest(noResize, ensureInScreenBounds)
		hs.grid.set(w, grid)
	end)(win)
end

function obj:unhideAll()
	for _, app in ipairs(self.hidden_apps) do
		app:unhide()
	end
	hs.timer.doAfter(0.5, hs.fnutils.partial(self.tileAllWindows, self))
end

function obj:tidy()
	for _, win in ipairs(hs.window.visibleWindows()) do
		self:withAxHotfix(function(w)
			hs.grid.snap(win)
		end)(win)
	end
end

function obj.axHotfix(win)
	if not win then
		win = hs.window.frontmostWindow()
	end

	local axApp = hs.axuielement.applicationElement(win:application()) or {}
	local wasEnhanced = axApp.AXEnhancedUserInterface
	if wasEnhanced then
		axApp.AXEnhancedUserInterface = false
	end

	return function()
		if wasEnhanced then
			axApp.AXEnhancedUserInterface = true
		end
	end
end

function obj:withAxHotfix(fn, position)
	if not position then
		position = 1
	end
	return function(...)
		local args = { ... }
		local revert = self.axHotfix(args[position])
		fn(...)
		revert()
	end
end

return obj
