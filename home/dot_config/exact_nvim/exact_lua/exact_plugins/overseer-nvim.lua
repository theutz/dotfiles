local function create_restart_command()
	vim.api.nvim_create_user_command("OverseerRestartLast", function()
		local overseer = require("overseer")
		local tasks = overseer.list_tasks({ recent_first = true })
		if vim.tbl_isempty(tasks) then
			vim.notify("No tasks found", vim.log.levels.WARN)
		else
			overseer.run_action(tasks[1], "restart")
		end
	end, {})
end

local function get_cwd_as_name()
	local dir = vim.fn.getcwd(0)
	return dir:gsub("[^A-Za-z0-9]", "_")
end

return {
	{
		"stevearc/overseer.nvim",
		keys = {
			{ "<leader>ol", "<Cmd>OverseerLoadBundle<cr>", desc = "Load bundle" },
			{ "<leader>os", "<Cmd>OverseerSaveBundle<cr>", desc = "Save bundle" },
			{
				"<leader>or",
				"<Cmd>OverseerRestartLast<cr>",
				desc = "Restart last task",
			},
			{
				"<leader>of",
				"<Cmd>OverseerQuickAction open float<cr>",
				desc = "Open last output in float",
			},
			{
				"<leader>oe",
				"<Cmd>OverseerQuickAction edit<cr>",
				desc = "Edit most recent overseer task",
			},
		},
		-- ISSUE:: Won't work unless [this is accepted](https://github.com/stevearc/overseer.nvim/pull/417)
		-- opts = {
		--   task_list = {
		--     bindings = {
		--       ["r"] = "Restart",
		--     },
		--   },
		-- },
		config = function(_, opts)
			create_restart_command()
			local overseer = require("overseer")
			overseer.setup(opts)

			vim.api.nvim_create_autocmd("User", {
				desc = "Save overseer.nvim tasks on persistence.nvim session save",
				pattern = "PersistenceSavePre",
				callback = function()
					overseer.save_task_bundle(get_cwd_as_name(), nil, { on_conflict = "overwrite" })
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				desc = "Remove all previous overseer.nvim tasks on persistence.nvim session load",
				pattern = "PersistenceLoadPre",
				callback = function()
					for _, task in ipairs(overseer.list_tasks({})) do
						task:dispose(true)
					end
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				desc = "Load overseer.nvim tasks on persistence.nvim session load",
				pattern = "PersistenceLoadPost",
				callback = function()
					overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
				end,
			})
		end,
	},
}
