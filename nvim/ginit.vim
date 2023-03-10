if exists('g:GuiLoaded')
  GuiFont! JetBrainsMono NF:13:l
  " GuiPopupmenu 0
  " GuiTabline 0
  " GuiLinespace 2
endif

" Alternatives
" CaskaydiaCove Nerd Font
" Hack Nerd Font Mono
" GoMono Nerd Font
" Iosevka Nerd Font
" JetBrainsMono Nerd Font
" JetBrainsMonoMedium Nerd Font
"

let s:fontsize = 13
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! JetBrainsMono NF:h" . s:fontsize
endfunction

" In normal mode, pressing numpad's+ increases the font
noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a


noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
