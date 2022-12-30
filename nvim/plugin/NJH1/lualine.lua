-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  requires = { 'kyazidani42/nvim-web-devicons', opt = true },
  options = {
    icons_enabled = true,
    theme = 'papercolor_light',
    --component_separators = '|',
    --section_separators = '',
  },
}
