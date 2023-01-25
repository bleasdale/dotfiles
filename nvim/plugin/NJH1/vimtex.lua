-- Vimtex setup
vim.g.tex_flavor = 'latex'
vim.g.tex_conceal = ''
vim.g.vimtex_compiler_progname = 'latexmk'
vim.g.vimtex_compiler_latexmk_engines = {
  _ = '-xelatex'
}
vim.g.vimtex_view_general_viewer = 'SumatraPDF.exe'
vim.g.vimtex_view_general_options = [[--unique -reuse-instance -forward-search file:@tex @line @pdf]]

--Add the following line in Sumatra settings for inverse search:
--cmd /c start /min nvim --headless -c "PackerLoad vimtex" -c "VimtexInverseSearch %l '%f'"

--vim.g.vimtex_compiler_latexmk = {
--         'executable' : 'latexmk',
--         'options' : [
--           '-pdf',
--           '-xelatex',
--           '-verbose',
--           '-file-line-error',
--           '-synctex=1',
--           '-interaction=nonstopmode',
--         ],
--        }
--let g:vimtex_view_method = 'okular' " vimtex doesn't like Okular, in MS
--Windows at least
