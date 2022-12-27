-- Colour scheme, font, highlighting, cursors and lines
--
vim.cmd([[ colorscheme monokai ]])
vim.opt.guicursor = "n-v-c-sm:block-blinkon0,i-ci-ve:ver25-Cursor-blinkon500-blinkoff250,r-cr-o:hor20"
vim.api.nvim_set_hl(0, "Normal", { bg = 'black' })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = 'grey10' })
vim.api.nvim_set_hl(0, "Cursor", { fg = 'yellow', bg = 'yellow' })  -- this doesn't work

--[[ vim.api.nvim_create_autocmd("ColourVal1", {
  pattern = "*",
  callback = function()
    -- vim.api.nvim_set_hl(0,"Comment", { cterm = 0, gui = 0})
    -- vim.api.nvim_set_hl(0,"Normal", { bg='black'})
  end,
  desc = "Set some colours and highlights",
}
) ]]

