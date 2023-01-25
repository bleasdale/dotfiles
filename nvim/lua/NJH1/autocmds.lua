-- autocmds.lua


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
    vim.highlight.on_yank({higroup = "Visual", timeout = 500, on_visual = true, on_macro = true })
  end,
  desc = "Highlight selection on yank",
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
