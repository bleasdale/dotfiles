-- Nicholas's set.lua
-- In ~/.config/nvim/lua
-- Called from ~/.config/nvim/init.lua
-- Dec 2022

-- MS Windows, Terminal -use PowerShell
local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

-- variables
local indent = 2

-- Set Python executable locations
vim.g.python3_host_prog = 'C:/Python311/python'
vim.g.python_host_prog = 'C:/Python27/python'

-- Set Options
vim.opt.timeoutlen = 500
vim.opt.history = 2000
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config").."/undo"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.title = true
vim.opt.errorbells = false
vim.opt.belloff = "all"
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.list = false
vim.opt.magic = true              -- grep-like regexp (recall :perldo for pcre)
vim.opt.showmatch = true
vim.opt.matchtime = 3
vim.opt.joinspaces = false        -- no double spaces with J join
vim.opt.wildmenu = true
vim.opt.wildmode = full
vim.opt.wildignore:append( '*.swp', '*.bak', '*.aux', '*.log', '*.pdf', '*.out', '*.tmp', '*.jpg', '*.gif', '*.png', '*.ico', '*.pdf', '*.a', '*.o', '*.so', '*.docx', '*.img', '*.xlsx', '*.exe', '*.flv' )
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.spelllang = { "en_gb" }
vim.opt.encoding = "utf-8"
vim.opt.foldenable = true
vim.opt.foldmethod = "manual"
vim.opt.hidden = true
vim.opt.ruler = true
--vim.opt.pumheight = 10            -- popup menu height
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 4
vim.opt.showtabline = 2
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.colorcolumn = "81"
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

-- Relative line numbering
vim.cmd[[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]]

local numtogGrp = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufEnter", "InsertLeave", "FocusGained", "WinEnter"},
  { pattern = "*",
    --command = "set relativenumber",  -- if callback, vim.api.nvim_buf_set_option(0,relativenumber,true) ?
    callback = function()
      vim.api.nvim_set_option('relativenumber', true)
    end,
    group = numtogGrp,
    desc = "Turn on relative line numbering when the buffer is entered.",
  }
)

vim.api.nvim_create_autocmd(
  { "BufLeave", "InsertEnter", "FocusLost", "WinLeave"},
  { pattern = "*",
    --command = "set norelativenumber",
    callback = function()
      vim.api.nvim_set_option('relativenumber', false)
    end,
    group = numtogGrp,
    desc = "Turn off relative line numbering when the buffer is exited.",
  }
)

-- Highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = yankGrp,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight yank",
}
)

-- Terminal buffer
vim.cmd[[
function! TerminalSettings()
  setlocal nonumber
  normal a
endfunction
augroup terminal
  autocmd!
  autocmd TermOpen * call TerminalSettings()
augroup END
]]

-- Change cwd to the location of the buffer in the current tabstop
vim.cmd[[
function! OnTabEnter(path)
  if isdirectory(a:path)
    let dirname = a:path
  else
    let dirname = fnamemodify(a:path, ":h")
  endif
  execute "tcd ". dirname
endfunction()

autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))
]]

-- Attempt to change above to lua - not right
-- Change cwd to the location of the buffer in the current tabstop
-- helper function -- can't work out how to change to lua yet
--function OnTabEnter(path)
--  if vim.fn.isdirectory("a:path") then
--    local dirname = a:path
--  else
--    local dirname = vim.fn.fnamemodify("a:path", ":h")
--  end
--  vim.fn.tcd(dirname)
--end

--local tabCwdEnter = vim.api.nvim_create_augroup("ChangeWkDir", { clear = true })
--vim.api.nvim_create_autocmd("ChangeCwdtoTab", {
--  group = tabCwdEnter,
--  pattern = "*",
--  callback = function()
--    OnTabEnter(vim.fn.expand("<amatch>"))
--  end,
--  desc = "Change the cwd to that of the current tab."
--}
--)
