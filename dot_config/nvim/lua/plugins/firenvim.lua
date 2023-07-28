return {
  {
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    build = function()
        require("lazy").load({ plugins = "firenvim", wait = true })
        vim.fn["firenvim#install"](0)
    end,
    init = function ()
      vim.api.nvim_create_autocmd({'UIEnter'}, {
        callback = function ()
          local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
          if client ~= nil and client.name == "Firenvim" then
            vim.o.number = false
            vim.o.relativenumber = false
            vim.o.signcolumn = "no"
          end
        end
      })
    end,
    config = function()
      vim.g.firenvim_config.localSettings['.*'] = { takeover = "never" }
    end
  }
}
