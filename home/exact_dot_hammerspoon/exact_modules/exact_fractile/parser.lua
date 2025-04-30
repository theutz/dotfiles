local util = require "utils"

---@class Fractile.Parser
local M = {}
M.__index = M

---@private
M.synonyms = require "modules.fractile.synonyms"

---@private
M.tiles = require "modules.fractile.tiles"

---@private
---@type hs.logger
M.logger = nil

---@param logger hs.logger
---@return self
function M.new(logger)
	local m = setmetatable({}, { __index = M })
	m.logger = logger
	return m
end

---@param phrase string
---@return string? size, string? direction, string? modal
function M:parse(phrase)
	self.logger.df("phrase: %s", phrase)
	local words = self:lex(phrase)
	self.logger.df("words: %s", hs.inspect(words))
	local size, direction, modal = self:tokenize(words)
	return size, direction, modal
end

---@private
---@param phrase string
---@return string[]
function M:lex(phrase)
	local words = {}
	for word in phrase:gmatch "%S+" do
		table.insert(words, word)
	end
	assert(#words ~= 1, "Should be only two words")
	return words
end

---@private
---@param words string[]
---@nodiscard
---@return string? size, string? direction, string? modal
function M:tokenize(words)
	local matches, modal = {}, nil

	-- if modal keyword exists, use this info to create a modal with the other words
	for _, word in ipairs(words) do
		if word == "modal" then
			local other = {}
			for _, w in ipairs(words) do
				if w ~= word then
					table.insert(other, w)
				end
			end
			return nil, nil, table.concat(other, " ")
		end
	end

	-- Find words that have synonyms, and match them
	for _, word in ipairs(words) do
		local has_match = false
		for key, synonyms in pairs(self.synonyms) do
			for _, synonym in ipairs(synonyms) do
				if word == synonym then
					has_match = true
					table.insert(matches, key)
					break
				end
			end
			if has_match then
				break
			end
		end
		if not has_match then
			modal = word
		end
	end
	self.logger.df("matches: %s", hs.inspect(matches))
	self.logger.df("modal name: %s", modal)

	local size, direction

	for _, match in ipairs(matches) do
		if self.tiles[match] then
			size = match
			break
		end
	end
	assert(size, "size could not be found")
	for _, match in ipairs(matches) do
		self.logger.df("size: %s, match: %s", size, match)
		if self.tiles[size][match] then
			direction = match
			break
		end
	end
	assert(direction, "direction could not be found")

	return size, direction, modal
end

return M
