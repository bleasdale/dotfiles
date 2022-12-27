
" vainglorious header for Startify!
let g:njhascii = [
            \'███╗   ██╗        ██╗   ██╗  ██╗ █████╗ ███████╗███████╗',
            \'████╗  ██║        ██║   ██║  ██║██╔══██╗██╔════╝██╔════╝',
            \'██╔██╗ ██║        ██║   ███████║███████║█████╗  ███████╗',
            \'██║╚██╗██║   ██   ██║   ██╔══██║██╔══██║██╔══╝  ╚════██║',
            \'██║ ╚████║██╗╚█████╔╝██╗██║  ██║██║  ██║███████╗███████║',
            \'╚═╝  ╚═══╝╚═╝ ╚════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝',
            \'',
            \]
let g:startify_custom_header = 'startify#pad(g:njhascii + startify#fortune#boxed())'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   Current Dir '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_bookmarks = [
          \ { 'v': '~/.config/nvim/init.lua' },
          \ { 'm': 'C:\Users\njhae\Documents\JIS-sync\JIS-MathsChallenge\WeeklyPuzzle\current.tex' },
          \ ]

