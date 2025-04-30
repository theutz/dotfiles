local g = hs.geometry

---@type { [string]: { [string]: hs.geometry }}
local M = {}

M.whole = {
	screen = g { 0, 0, 12, 12 },
}

M.half = {
	north = g { 0, 0, 12, 6 },
	east = g { 6, 0, 6, 12 },
	south = g { 0, 6, 12, 6 },
	west = g { 0, 0, 6, 12 },

	middle = g { 0, 3, 12, 6 },
	central = g { 3, 0, 6, 12 },
}

M.third = {
	north = g { 0, 0, 12, 4 },
	middle = g { 0, 4, 12, 4 },
	south = g { 0, 8, 12, 4 },

	east = g { 8, 0, 4, 12 },
	central = g { 4, 0, 4, 12 },
	west = g { 0, 0, 4, 12 },

	centered = g { 4, 4, 4, 4 },
}

M.two_thirds = {
	north = g { 0, 0, 12, 8 },
	east = g { 4, 0, 8, 12 },
	south = g { 0, 4, 12, 8 },
	west = g { 0, 0, 8, 12 },

	middle = g { 0, 2, 12, 8 },
	central = g { 2, 0, 8, 12 },

	centered = g { 2, 2, 8, 8 },
}

M.quarter = {
	north = g { 3, 0, 6, 6 },
	northeast = g { 6, 0, 6, 6 },

	east = g { 6, 3, 6, 6 },
	southeast = g { 6, 6, 6, 6 },

	south = g { 3, 6, 6, 6 },
	southwest = g { 0, 6, 6, 6 },

	west = g { 0, 3, 6, 6 },
	northwest = g { 0, 0, 6, 6 },

	central = g { 3, 3, 6, 6 },
}

M.sixth = {
	north = g { 4, 0, 4, 6 },

	northeast = g { 8, 0, 4, 6 },
	east = g { 8, 4, 4, 6 },
	southeast = g { 8, 6, 4, 6 },

	south = g { 4, 6, 4, 6 },

	southwest = g { 0, 6, 4, 6 },
	west = g { 0, 4, 4, 6 },
	northwest = g { 0, 0, 4, 6 },

	central = g { 4, 4, 4, 6 },
}

return M
