
"       _   _       _  _    _          ______  _____
"      | \ | |     | || |  | |   /\   |  ____|/ ____|
"      |  \| |     | || |__| |  /  \  | |__  | (___
"      | . ` | _   | ||  __  | / /\ \ |  __|  \___ \
"      | |\  || |__| || |  | |/ ____ \| |____ ____) |
"      |_| \_(_)____(_)_|  |_/_/    \_\______|_____/
"

"                                           /$$
"                                          |_/
"  /$$$$$$$   /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$
" | $$__  $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$
" | $$  \ $$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$
" | $$  | $$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$
" | $$  | $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$
" |__/  |__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/
"
"                       _
"          ( )_ __ (_)_| |_    __   _(_)_ __ ___
"          | | '_ \| |_   _|   \ \ / / | '_ ` _ \
"          | | | | | | | |   _  \ V /| | | | | | |
"          |_|_| |_|_| |_|  |_|  \_/ |_|_| |_| |_|
"
"                   Nicholas's init.vim
"                      Work machine
"                    In ~/.config/nvim
"
"                        04/08/2022
"

" Leaders
let mapleader = " "
let maplocalleader ="\\"

" Set options
set timeoutlen=500
set history=1000
set noswapfile
set backspace=2 "backspace deletes like most programs in insert mode
set noerrorbells visualbell t_vb=
augroup NoVisualBells
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=
augroup END
set belloff=all
set tabstop=2 softtabstop=2
set shiftwidth=2
set title
set laststatus=2
set expandtab
set autoindent
set smartindent
set cindent
set magic "grep-like regexp (recall :perldo for pcre)
set wildmenu
set wildmode=full
set wildignore+=*.swp,*.bak,*.aux,*.log,*.pdf,*.out,*.tmp,*.jpg,*.gif,*.png
set wildignore+=*.ico,*.pdf,*.a,*.o,*.so,*.docx,*.img,*.xlsx,*.exe,*.flv
set showmatch
set matchtime=3
"set nowrap
set wrap linebreak nolist
set nobackup
"set undodir=~/vimfiles/undodir "default is fine
set undofile
filetype plugin indent on
syntax enable
set mouse=a
set hlsearch
set incsearch
set smartcase
set spell spelllang=en_gb
"set lazyredraw " Make things faster? Useful if heavy macro use.
set encoding=utf-8
scriptencoding utf-8
set hidden "Switch buffers without saving
set ruler
set signcolumn=yes
set scrolloff=4
set showtabline=2
set termguicolors
set splitbelow
set splitright
" 'hybrid' line numbering. Relative but current line is absolute
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" incremental substitution
if has('nvim')
    set inccommand=split
endif

autocmd BufRead,BufNewFile *.tex set filetype=tex
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" set Python executable locations
let g:python3_host_prog = 'C:/Python311/python'
let g:python_host_prog = 'C:/Python27/python'

" BEGIN VIM-PLUG - automatically does filetype off
"  :PlugInstall "Installs new and updates existing plugins
"  :PlugUpgrade " updates vim-plug
"  :PlugUpdate  " updates existing plugins
"
" the following allows a list of plugins to be disabled
"let g:plugs_disabled = ['nvim-treesitter']
"function! Plug_disable#commit()
"  for name in g:plugs_disabled
"    if has_key(g:plugs, name)
"      call remove(g:plugs, name)
"    endif
"
"    let idx = index(g:plugs_order, name)
"    if idx > -1
"      call remove(g:plugs_order, idx)
"    endif
"  endfor
"endfunction

call plug#begin('~/.config/neovim-plugins')
 Plug 'neovim/nvim-lspconfig'
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'kyazdani42/nvim-tree.lua'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-repeat'
 Plug 'kylechui/nvim-surround'
 Plug 'nvim-lua/lsp-status.nvim'
" Plug 'glepnir/lspsaga.nvim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-lua/popup.nvim'
 Plug 'nvim-lua/completion-nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
 Plug 'BurntSushi/ripgrep'
 Plug 'nvim-treesitter/nvim-treesitter'
 ", {'do': ':TSUpdate'} "Update parsers
 Plug 'tree-sitter/tree-sitter-cpp'
 Plug 'nvim-treesitter/nvim-treesitter-textobjects'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'
 Plug 'SirVer/ultisnips'
 Plug 'quangnguyen30192/cmp-nvim-ultisnips'
 Plug 'lervag/vimtex'
 Plug 'latex-lsp/texlab'
 Plug 'mhinz/vim-startify'
 Plug 'rebelot/kanagawa.nvim'
 Plug 'EdenEast/nightfox.nvim'
 Plug 'ellisonleao/gruvbox.nvim'
 Plug 'bluz71/vim-nightfly-colors'
 Plug 'folke/tokyonight.nvim'
 Plug 'catppuccin/nvim'
 Plug 'drewtempelmeyer/palenight.vim'
 Plug 'tanvirtin/monokai.nvim'
 Plug 'sonph/onehalf', { 'rtp': 'vim' }
 Plug 'sharkdp/fd'
 Plug 'mhartington/formatter.nvim'
 Plug 'b3nj5m1n/kommentary'
 Plug 'ggandor/leap.nvim'
 "call plug_disable#commit()
call plug#end()

" END VIM-PLUG

" Terminal buffer
function! TerminalSettings()
  setlocal nonumber
  normal a
endfunction
augroup terminal
  autocmd!
  autocmd TermOpen * call TerminalSettings()
augroup END

" telescope and telescope-fzf-native config
lua << EOF
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
            }
        }
    }
require('telescope').load_extension('fzf')
EOF

" nvim-surround
lua << EOF
require('nvim-surround').setup({
  -- Configuration here
  surrounds = {
    -- LaTeX inline maths environment
    ["m"] = {
      move_cursor = false,
      add = { "\\(", "\\)" },
      delete = "(\\%()().-(\\%))()",
      change = {
        target = "($)().-($)()",
        replacement = {"\\(", "\\)"},
      },
    },
    -- LaTeX display maths environment
    ["M"] = {
    add = { "\\[", "\\]" },
      delete = "(\\%[)().-(\\%])()",
      change = {
        target = "($$)().-($$)()",
        replacement = {"\\[", "\\]"},
      }
    }
  }
})
EOF

" Test for above: 34   $564$   \[x=6\]  $$543$$ $$ x^{2} &= -1 $$

" NvimTree setup
lua << EOF
require("nvim-tree").setup{
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    width=47,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
  },
  },
  filters = {
    dotfiles = false,
  },
}
EOF
" End of NvimTree setup

"colorscheme kanagawa
highlight Comment cterm=NONE gui=NONE
highlight normal guibg=black
set colorcolumn=81
highlight ColorColumn ctermbg=0 guibg=grey10
highlight iCursor guifg=white guibg=yellow
set guicursor+=i:ver25-iCursor
highlight Cursor guifg=blue guibg=GreenYellow
set cursorline
highlight Visual cterm=reverse ctermbg=NONE ctermfg=NONE guibg=grey30
highlight CursorLine cterm=NONE ctermfg=240 guifg=fg guibg=grey10

" vainglorious header for Startify!
let g:njhascii = [
            \'███╗   ██╗        ██╗   ██╗  ██╗ █████╗ ███████╗███████╗',
            \'████╗  ██║        ██║   ██║  ██║██╔══██╗██╔════╝██╔════╝',
            \'██╔██╗ ██║        ██║   ███████║███████║█████╗  ███████╗',
            \'██║╚██╗██║   ██   ██║   ██╔══██║██╔══██║██╔══╝  ╚════██║',
            \'██║ ╚████║██╗╚█████╔╝██╗██║  ██║██║  ██║███████╗███████║',
            \'╚═╝  ╚═══╝╚═╝ ╚════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝',
            \'',
            \]
let g:startify_custom_header = 'startify#pad(g:njhascii + startify#fortune#boxed())'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   Current Dir '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_bookmarks = [
          \ { 'v': '~/.config/nvim/init.vim' },
          \ { 'm': 'C:\Users\njhae\Documents\JIS-sync\JIS-MathsChallenge\WeeklyPuzzle\current.tex' },
          \ ]

" Lualine setup
" slanted-gaps doesn't work properly, different font required?
lua << END
  require('lualine').setup {
    options = { theme = 'papercolor_light' }
  }
END

" lspconfig setup
lua << EOF
  local nvim_lsp = require('lspconfig')
  nvim_lsp.tsserver.setup {}
EOF

" nvim-cmp setup
set completeopt=menu,menuone,noselect
lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['texlab'].setup {
    capabilities = capabilities
  }
EOF

" Ultisnips setup
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='c-k>'

" completion-nvim setup
autocmd BufEnter * lua require'completion'.on_attach()
lua require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}
let g:completion_enable_snippet='UltiSnips'

" lspsaga setup
"lua << EOF
"  local saga = require('lspsaga')
"  saga.init_lsp_saga {
"    error_sign = '',
"    warn_sign = '',
"    hint_sign = '',
"    infor_sign = '',
"    border_style = "round",
"  }
"EOF

" Tree_sitter setup
"lua << EOF
"  require 'nvim-treesitter.configs'.setup {
"      ensure_installed = "all", -- one of "all", "maintained"
"      highlight = {
"          enable = true,
"          },
"      }
"EOF

" Vimtex setup
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-pdf',
        \   '-xelatex',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
"let g:vimtex_view_method = 'okular' " vimtex doesn't like Okular, in MS
"Windows at least
let g:vimtex_view_general_viewer = 'C:\Users\njhae\AppData\Local\SumatraPDF\SumatraPDF.exe'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
"let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" texlab setup
lua require('lspconfig').texlab.setup{}

" formatter setup
"nnoremap <silent> <leader>f :Format<CR>
"nnoremap <silent> <leader>F :FormatWrite<CR>
lua << EOF
-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format and FormatWrite commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
EOF

" leap.nvim
lua require('leap').add_default_mappings()

" vim.vim-surround
" For LaTeX
" char2nr converts the string to a value, e.g., Q -> 81
" autocmd FileType tex let b:surround_{char2nr("Q")} = "\\( \r \\)'"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """""""""""""""""""         Keymaps          """"""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>h :wincmd h<CR> " means <leader>h moves the curser to the window to the right
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <leader>n :bn<CR> " means \n moves to the next buffer. Current must be saved
nnoremap <leader>p :bp<CR> " previous buffer
nnoremap <silent> <leader>ev :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>
nnoremap ; :
nnoremap : ;
inoremap <silent> <S-Insert> <C-R>+

" A lua function to delete the current buffer without closing the window
lua require('delete_buffer_not_window')
" normal kill
nnoremap <leader>zb <Cmd>lua buf_kill(0)<CR>
" force kill
nnoremap <leader>zbb <Cmd>lua buf_kill(0, true)<CR>

" tab stuff. The SyncTree causes NerdTree to follow the location of the buffer
noremap <leader>tN :tabnew<CR> :call SyncTree()<CR>
noremap <leader>tc :tabclose<CR> :call SyncTree()<CR>
noremap <leader>tn :tabnext<CR>
noremap <leader>tp :tabprevious<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Telescope mappings
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" nvim-tree mappings
nnoremap <leader>tt :NvimTreeToggle<CR>

nnoremap <leader><CR> :noh<CR><CR>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
tnoremap <ESC> <C-\><C-n>:q!<CR>
