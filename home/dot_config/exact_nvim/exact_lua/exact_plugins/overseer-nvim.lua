local function create_restart_command()
  vim.api.nvim_create_user_command("OverseerRestartLast", function()
    local overseer = require "overseer"
    local tasks = overseer.list_tasks { recent_first = true }
    if vim.tbl_isempty(tasks) then
      vim.notify("No tasks found", vim.log.levels.WARN)
    else
      overseer.run_action(tasks[1], "restart")
    end
  end, {})
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
      require("overseer").setup(opts)
    end,
  },
}
