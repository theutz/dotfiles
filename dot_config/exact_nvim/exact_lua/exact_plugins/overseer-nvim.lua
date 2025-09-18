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

local function run_action(action)
	return function()
		local sidebar = require("overseer.task_list.sidebar").get()
		sidebar:run_action(action)
	end
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
			{
				"<leader>ov",
				"<Cmd>OverseerQuickAction open vsplit<cr>",
				desc = "Open last output in vertical split",
			},
			{
				"<leader>ox",
				"<Cmd>OverseerQuickAction open hsplit<cr>",
				desc = "Open last output in horizontal split",
			},
			{
				"<leader>o<tab>",
				"<Cmd>OverseerQuickAction open tab<cr>",
				desc = "Open last output in new tab",
			},
		},
		opts = {
			bundles = {
				autostart_on_load = false,
			},
			task_list = {
				bindings = {
					["r"] = run_action("restart"),
					["s"] = run_action("start"),
					["S"] = run_action("stop"),
				},
			},
		},
		config = function(_, opts)
			create_restart_command()
			require("overseer").setup(opts)
		end,
	},
}
