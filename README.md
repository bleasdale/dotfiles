# Bleasdale/dotfiles
---

TODO: symlink `~/.<files>` and include in this Repo

# neovim - .config/nvim
## With many thanks to the excellent documentation from neovim, plugin authors and a multitude of other people's configs.

**Use at your own risk.**  
This is my Windows 11 config.  
It works reasonably well, but is a w.i.p.  
Beware, the keymaps need a major overhaul, they are not sensible at the moment. There are even a few clashes, that is, the same map defined more than once.  
I frequently use Vim for LaTeX editing, I'm not happy with my Vimtex - Texlab - Snippets interaction. Needs considerable 'refactoring'.  

TODO:
- Overhaul keymaps. Especially maps with `<Leader><FirstKey><SecondKey>` where `<Leader><FirstKey>` is defined.
  (slows down as vim waits to see if the second key will be pressed.)
- Merge selected friendly-snippets into my own snippets files.
- Convert Ultisnips, vscode loaded snippets to luasnips and merge into my own snippets files.
- Rationalise Vimtex & TeXlab mappings & snippets.
- Merge with my Linux/BSD set up.
- Add lazy loading.

