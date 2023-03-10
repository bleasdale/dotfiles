-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

local disable_plugin = false

require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	})

	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		  requires = {
		  	"hrsh7th/cmp-buffer",
		  	"hrsh7th/cmp-nvim-lsp",
		  	"hrsh7th/cmp-path",
		  	"hrsh7th/cmp-cmdline",
		  	"hrsh7th/cmp-nvim-lua",
		  	"L3MON4D3/LuaSnip",
		  	"saadparwaiz1/cmp_luasnip",
	  	},
      disable = disable_plugin,
	})

	-- friendly-snippets collection for use with LuaSnip
	use({ "rafamadriz/friendly-snippets", disable = disable_plugin })

	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
    disable = disable_plugin,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
    disable = disable_plugin,
	})

	-- Git related plugins
	use({"tpope/vim-fugitive", disable = disable_plugin, })
	use({"tpope/vim-rhubarb", disable = disable_plugin, })
	use({"lewis6991/gitsigns.nvim", disable = disable_plugin, })
	use({"kdheepak/lazygit.nvim", disable = disable_plugin, })

	use({"tpope/vim-repeat", disable = disable_plugin, })
	use({"nvim-lua/plenary.nvim", disable = disable_plugin, })
	use({"lervag/vimtex", disable = disable_plugin, })
	use({"latex-lsp/texlab", disable = disable_plugin, })
	use({"mhinz/neovim-remote", disable = disable_plugin, })
	use({"mhinz/vim-startify", disable = disable_plugin, })
	use({"sharkdp/fd", disable = disable_plugin, })
	use({"ggandor/leap.nvim", disable = disable_plugin, })
	--  use 'SirVer/ultisnips'
	--  use 'quangnguyen30192/cmp-nvim-ultisnips'
	use({"BurntSushi/ripgrep", disable = disable_plugin, })
	use({"kyazdani42/nvim-web-devicons", disable = disable_plugin, })
	use({"kylechui/nvim-surround", disable = disable_plugin, })
	use({"folke/which-key.nvim", disable = disable_plugin, })
	use({"sudormrfbin/cheatsheet.nvim", disable = disable_plugin, })
	use({"akinsho/toggleterm.nvim", disable = disable_plugin, })
	-- COLOUR SCHEMES
	use({"rebelot/kanagawa.nvim", disable = disable_plugin, })
	use({"EdenEast/nightfox.nvim", disable = disable_plugin, })
	use({"ellisonleao/gruvbox.nvim", disable = disable_plugin, })
	use({"bluz71/vim-nightfly-colors", disable = disable_plugin, })
	use({"folke/tokyonight.nvim", disable = disable_plugin, })
	use({"catppuccin/nvim", disable = disable_plugin, })
	use({"drewtempelmeyer/palenight.vim", disable = disable_plugin, })
	use({"tanvirtin/monokai.nvim", disable = disable_plugin, })
	--  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
	use({"nvim-lualine/lualine.nvim", disable = disable_plugin, }) -- Fancier statusline
	use({"nanozuki/tabby.nvim", disable = disable_plugin, }) -- Fancier tabline
	use({"lukas-reineke/indent-blankline.nvim", disable = disable_plugin, }) -- Add indentation guides even on blank lines
  use({"numToStr/Comment.nvim", disable = disable_plugin, }) -- "gc" to comment visual regions/lines
	--  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
    disable = disable_plugin,
  })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    cond = vim.fn.executable("make") == 1,
    disable = disable_plugin,
  })

	-- Telescope-file-browser
	use({ "nvim-telescope/telescope-file-browser.nvim", disable = disable_plugin, })
  use({"xiyaowong/telescope-emoji.nvim", disable = disable_plugin, })   -- telescope emoji picker

	use({ "nvim-tree/nvim-tree.lua", requires = {
		"nvim-tree/nvim-web-devicons",
	  },
    tag = "nightly",
    disable = disable_plugin,
  })

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
    disable = disable_plugin,
	})

	-- Wrapper for the stylua formatter
	use({ "ckipp01/stylua-nvim", disable = disable_plugin })
  use({ "s1n7ax/nvim-window-picker", tag = 'v1.*',
      config = function()
        require'window-picker'.setup()
      end,
      disable = disable_plugin,
  })

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, "custom.plugins")
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require("packer").sync()
	end
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})
