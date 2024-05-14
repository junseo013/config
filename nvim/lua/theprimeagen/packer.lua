-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- fuzzy finder nvim plugin
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- color scheme
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  use('folke/tokyonight.nvim')
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  -- file explorer
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons') -- optional, file icon

  -- language syntax parser
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- access parsertree directly
  use('nvim-treesitter/playground')

  -- copilot
  use('github/copilot.vim')
  
  --
  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  -- lsp 
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  -- format
  --use('kdheepak/JuliaFormatter.vim')

  -- gui related plugins
  use('vim-airline/vim-airline')
  use('vim-airline/vim-airline-themes')


  --autocomplete
  --use('CmdlineComplete')

  -- highlighting
  use('yggdroot/indentline')
  use('andymass/vim-matchup')
  use('machakann/vim-highlightedyank')

  -- ctags jumping
  use('universal-ctags/ctags')

  -- using system clipboard
  -- use('christoomey/vim-system-copy')

  use('sakshamgupta05/vim-todo-highlight')

  -- todo comments
  use{
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup{}
    end
  }

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
