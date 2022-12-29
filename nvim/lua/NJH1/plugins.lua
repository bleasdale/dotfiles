-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    --requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
      },
  }

  -- friendly-snippets collection for use with LuaSnip
  use { "rafamadriz/friendly-snippets" }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-repeat'
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'lervag/vimtex'
  use 'latex-lsp/texlab'
  use 'mhinz/neovim-remote'
  use 'mhinz/vim-startify'
  use 'sharkdp/fd'
  use 'ggandor/leap.nvim'
--  use 'SirVer/ultisnips'
--  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'BurntSushi/ripgrep'
  use 'kyazdani42/nvim-web-devicons'
  use 'kylechui/nvim-surround'
  use { "folke/which-key.nvim",
    config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    }
  end
  }
  -- COLOUR SCHEMES
  use 'rebelot/kanagawa.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'bluz71/vim-nightfly-colors'
  use 'folke/tokyonight.nvim'
  use 'catppuccin/nvim'
  use 'drewtempelmeyer/palenight.vim'
  use 'tanvirtin/monokai.nvim'
--  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'nanozuki/tabby.nvim' -- Fancier tabline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
--  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
--  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Telescope-file-browser
  use { 'nvim-telescope/telescope-file-browser.nvim' }

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
