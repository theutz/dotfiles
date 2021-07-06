local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

-- If this file changes, re-run packer
execute "autocmd BufWritePost plugins.lua PackerSync"

return require('packer').startup(function()
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	-- Editing
	use "tpope/vim-surround"
  -- use 'tpope/vim-unimpaired'
  -- use 'tpope/vim-repeat'
  use "tpope/vim-commentary"
  -- use 'tpope/vim-eunuch'
  -- use { 'neoclide/coc.nvim', branch = 'release' }

	-- Navigation
	-- use 'christoomey/vim-tmux-navigator'

  -- User Interface
  use {
    "folke/which-key.nvim",
    opt = false,
    config = function()
      local wk = require('which-key')
      wk.setup()
      wk.register({
        b = {
          name = "Buffers",
          b = { ":ls<cr>", "List buffers" }
        }
      }, {
        prefix = "<leader>"
      })
    end
  }
end)
