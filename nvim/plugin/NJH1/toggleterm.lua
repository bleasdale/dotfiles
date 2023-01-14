require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 12
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false, -- this option takes priority over highlights specified
  shading_factor = 2, -- the %age by which to lighten the terminal background, default: -30
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "horizontal", -- vertical | horizontal | window | float
  close_on_exit = true,
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  highlights = {
  -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      guibg = "#053354",
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      guifg = "#F4F06D",
      guibg = "#0047AB",
    },
  },
  float_opts = {
    border = "curved", -- single | double | shadow | curved | ...
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}


