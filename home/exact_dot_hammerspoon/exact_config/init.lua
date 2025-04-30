local M = {}
M.__index = M

M.logger = hs.logger.new("config", "info")

---Primary entry point for loading config
function M:load()
	self.logger.i "Loading config..."
	self:pre_spoons()
	self:spoons()
	self:post_spoons()
end

---Scripts that must be run before spoons
function M:pre_spoons()
	self.logger.i "Loading pre-spoon scripts..."
	require("config.hammerspoon"):init()
	require("config.screens"):init()
	require("config.alert"):init()
	require("config.hints"):init()
	require("config.grid"):init()
end

---Load the spoons
function M:spoons()
	self.logger.i "Loading spoons..."
	require "config.spoons.spoon-install"
	require "config.spoons.url-dispatcher"
end

---Scripts to load only after spoons are loaded
function M:post_spoons()
	self.logger.i "Loading post-spoons scripts..."
	require("config.keys"):init()
	require("config.window-filters"):init():start()
end

---Scripts to run after all other setup tasks are completed
function M:deferred()
	self.logger.i "Running deferred..."
	require "config.spoons.emmylua"
end

return M
