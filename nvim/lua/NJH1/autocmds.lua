-- autocmds.lua

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Relative line numbering
vim.cmd[[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]]

local numtogGrp = augroup("NumberToggle", { clear = true })
autocmd(
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

autocmd(
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
local yankGrp = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = yankGrp,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 500, on_visual = true, on_macro = true })
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

-- Could move this function into a separate utils.lua file
--- Set window title
function _G.set_title()
    local file = vim.fn.expand("%:p:t")
    local cwd = vim.fn.split(vim.fn.expand("%:p:h"):gsub("/", "\\"), "\\")

    local present, utils = pcall(require, "user.plugins.config.heirline.utils")
    if not present then
        return
    end

    if file ~= "" and not utils.buffer_is_plugin() then
        vim.opt.titlestring = cwd[#cwd] .. "/" .. file
    else
        vim.opt.titlestring = "Neovim"
    end
end

local group = augroup("on_bufenter", { clear = true })
autocmd("BufEnter", {
    command = [[silent! lcd %:p:h]],
    desc = "Set the parent directory of the current file as cwd.",
    group = group,
    pattern = "*.*",
})
autocmd("BufEnter", {
    callback = function()
        set_title()
    end,
    desc = "Set application window title.",
    group = group,
    pattern = "*",
})
autocmd("BufEnter", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
    desc = "After pressing <Enter> in insert mode, and on 'o' or 'O', disable inserting comment leader.",
    group = group,
    pattern = "*",
})

-- -- Change cwd to the location of the buffer in the current tabstop
-- vim.cmd[[
-- function! OnTabEnter(path)
--   if isdirectory(a:path)
--     let dirname = a:path
--   else
--     let dirname = fnamemodify(a:path, ":h")
--   endif
--   execute "tcd ". dirname
-- endfunction()
--
-- autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))
-- ]]

