-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

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
      disable = false,
	})

	-- friendly-snippets collection for use with LuaSnip
	use({ "rafamadriz/friendly-snippets", disable = false })

	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
    disable = false,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
    disable = false,
	})

	-- Git related plugins
	use({"tpope/vim-fugitive", disable = false, })
	use({"tpope/vim-rhubarb", disable = false, })
	use({"tpope/vim-repeat", disable = false, })
	use({"lewis6991/gitsigns.nvim", disable = false, })
	use({"kdheepak/lazygit.nvim", disable = false, })

	use({"nvim-lua/plenary.nvim", disable = false, })
	use({"lervag/vimtex", disable = false, })
	use({"latex-lsp/texlab", disable = false, })
	use({"mhinz/neovim-remote", disable = false, })
	use({"mhinz/vim-startify", disable = false, })
	use({"sharkdp/fd", disable = false, })
	use({"ggandor/leap.nvim", disable = false, })
	--  use 'SirVer/ultisnips'
	--  use 'quangnguyen30192/cmp-nvim-ultisnips'
	use({"BurntSushi/ripgrep", disable = false, })
	use({"kyazdani42/nvim-web-devicons", disable = false, })
	use({"kylechui/nvim-surround", disable = false, })
	use({"folke/which-key.nvim", disable = false, })
	use({"sudormrfbin/cheatsheet.nvim", disable = false, })
	use({"akinsho/toggleterm.nvim", disable = false, })
	-- COLOUR SCHEMES
	use({"rebelot/kanagawa.nvim", disable = false, })
	use({"EdenEast/nightfox.nvim", disable = false, })
	use({"ellisonleao/gruvbox.nvim", disable = false, })
	use({"bluz71/vim-nightfly-colors", disable = false, })
	use({"folke/tokyonight.nvim", disable = false, })
	use({"catppuccin/nvim", disable = false, })
	use({"drewtempelmeyer/palenight.vim", disable = false, })
	use({"tanvirtin/monokai.nvim", disable = false, })
	--  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
	use({"nvim-lualine/lualine.nvim", disable = false, }) -- Fancier statusline
	use({"nanozuki/tabby.nvim", disable = false, }) -- Fancier tabline
	use({"lukas-reineke/indent-blankline.nvim", disable = false, }) -- Add indentation guides even on blank lines
  use({"numToStr/Comment.nvim", disable = false, }) -- "gc" to comment visual regions/lines
	--  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
    disable = false,
  })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    cond = vim.fn.executable("make") == 1,
    disable = false,
  })

	-- Telescope-file-browser
	use({ "nvim-telescope/telescope-file-browser.nvim", disable = false, })
  use({"xiyaowong/telescope-emoji.nvim", disable = false, })   -- telescope emoji picker

	use({ "nvim-tree/nvim-tree.lua", requires = {
		"nvim-tree/nvim-web-devicons",
	  },
    tag = "nightly",
    disable = false,
  })

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
    disable = false,
	})

	-- Wrapper for the stylua formatter
	use({ "ckipp01/stylua-nvim", disable = false })
  use({ "s1n7ax/nvim-window-picker", tag = 'v1.*',
      config = function()
        require'window-picker'.setup()
      end,
      disable = false,
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
