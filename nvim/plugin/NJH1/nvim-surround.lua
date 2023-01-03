-- nvim-surround.lua Configuration
--

require('nvim-surround').setup({
  -- Configuration here
  surrounds = { -- my attempt at maths, better in vimtex or snippet
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
