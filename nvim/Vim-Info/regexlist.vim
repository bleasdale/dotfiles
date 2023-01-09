" Saved Searches
" Source this file from vimrc.
" The following changes MySQL keywords to capitals
" To run do :<C-R>=MySQLcap<CR><CR>
" <C-R> means ^R or CTRL-R, <CR> means carriage return
" To save a new search:
"   :sp ~/.regexlist.vim<CR>
"   olet MyRegExName = '<C-R>/'<ESC>
"   :w<CR>
"   :so %<CR>
"   :q<CR>



let MySQLcap = '%s#/\<\<select\>\|\<update\>\|\<set\>\|\<from\>\|\<where\>\|\<and\>\|\<or\>\|\<on\>\|\<join\>\|\<not\>\|\<null\>\|\<is\>\|\<using\>\|\<case\>\|\<when\>\|\<else\>\|\<if\>\|\<elsif\>\|\<end\>\|\<as\>\|\<order\>\|\<by\>\|\<asc\>\|\<desc\>\|\<limit\>\|\<with\>\|\<over\>\|\<partition\>\|\<group\>\|\<like\>\|\<left\>\|\<right\>\|\<outer\>\|\<inner\>\|\<full\>\|\<union\>\|\<all\>\|\<distinct\>\|\<coalesce\>#\U&#g'
