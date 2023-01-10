# Plugins and keymaps for neovim

### NJHaes - 07/01/2023

## Installed plugins

Packer -        plugin package manager
nvim-lspconfig
mason.nvim
mason-lspconfig
j-hui/fidget.nvim
folke/neodev.nvim
hrsh7th/nvim-cmp
hrsh7th/cmp-buffer",
hrsh7th/cmp-nvim-lsp",
hrsh7th/cmp-path",
hrsh7th/cmp-cmdline",
hrsh7th/cmp-nvim-lua",
# L3MON4D3/LuaSnip",
  <Tab>, <S-Tab>, C-f
saadparwaiz1/cmp_luasnip",
rafamadriz/friendly-snippets
nvim-treesitter
nvim-treesitter-textobjects
tpope/vim-fugitive
tpope/vim-repeat
tpope/vim-rhubarb
lewis6991/gitsigns.nvim
# kdheepak/lazygit
  <Ldr>lg,
nvim-lua/plenary.nvim
lervag/vimtex
latex-lsp/texlab
mhinz/neovim-remote
mhinz/vim-startify
sharkdp/fd
ggandor/leap.nvim
SirVer/ultisnips
quangnguyen30192/cmp-nvim-ultisnip
BurntSushi/ripgrep
kyazdani42/nvim-web-devicons
kylechui/nvim-surround
folke/which-key.nvim
sudormrfbin/cheatsheet.nvim
akinsho/toggleterm.nvim
rebelot/kanagawa.nvim
EdenEast/nightfox.nvim
ellisonleao/gruvbox.nvim
bluz71/vim-nightfly-colors
folke/tokyonight.nvim
catppuccin/nvim
drewtempelmeyer/palenight.vim
tanvirtin/monokai.nvim
navarasu/onedark.nvim
nvim-lualine/lualine.nvim
nanozuki/tabby.nvim
lukas-reineke/indent-blankline.nvim 
# telescope.nvim
   Insert
   C-n, C-p, C-j, C-k, C-c, <Down>, <Up>, <CR>, C-x, C-v, C-t, C-u, C-d,
   <PageUp>, <PageDown>, <Tab>, <S-Tab>, C-q, M-q, C-l, C-_>,
   Normal
   <ESC>, <CR>, C-x, C-v, C-t, <Tab>, <S-Tab>, C-q, M-q, j, k, H, M, L,
   <Down>, <Up>, gg, G, C-u, C-d, <PageUp>, <PageDown>, ?
   <Ldr>?, <Ldr><space>, <Ldr>/, <Ldr>sf, <Ldr>sh, <Ldr>sw, <Ldr>sg, <Ldr>sd,
telescope-fzf-native.vim (requires fzf)
# telescope-file-browser
  <Ldr>fb,
nvim-web-devicons
neo-tree.nvim
nvim-tree.lua
plenary.nvim
MunifTanjim/nui.nvim
# ckipp01/stylua-nvim
   <ldr>st,

## Keymaps
n <leader>tN, :tabnew
n <leader>tc, :tabclose
n <leader>tn, :tabnext
n <leader>tp, :tabprevious
n <leader>1, 1gt
n <leader>2, 2gt
n <leader>3, 3gt
n <leader>4, 4gt
n <leader>5, 5gt
n <leader>6, 6gt
n <leader>7, 7gt
n <leader>8, 8gt
n <leader>9, 9gt

v y ygv<ESC>
n <c-j> :m .+1<CR>==
n <c-k> :m .-2<CR>==
v <c-j> :m '>+1<CR>==gv=gv
v <c-k> :m '<-2<CR>==gv=gv

n <Ldr><CR> :noh<CR><ESC>

n <Ldr>zbb
n <Ldr>zb
n <leader>bn <cmd>enew<CR>
n <leader>n :bn<CR>
n <leader>p :bp<CR>

i <C-h> LEFT
i <C-j> DOWN
i <C-l> RIGHT
i <C-k> UP
c <C-h> LEFT
c <C-j> DOWN
c <C-l> RIGHT
c <C-k> UP 

n <leader><UP> :resize +5<CR>
n <leader><DOWN> :resize -5<CR>
n <leader><RIGHT> :vertical resize +5<CR>
n <leader><LEFT> :vertical resize -5<CR>
n <leader>h :wincmd h<CR>
n <leader>j :wincmd j<CR>
n <leader>l :wincmd l<CR>
n <leader>k :wincmd k<CR>

n <Ldr>cd ;lcd %:h<CR>
n <Ldr>u :PackerSync<CR>
n <Ldr>ev :vsplit init.lua
n <Ldr>sv :source init.lua

n,i <c-t> :ToggleTerm
t <C-[> <C-\\><C-n>
n ; :
n : ;

