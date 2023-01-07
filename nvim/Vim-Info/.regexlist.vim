" Saved Searches
" Source this file from vimrc.
" The following changes MySQL keywords to capitals
" Do :<C-R>=MySQLcap<CR><CR>
" <C-R> means ^R or CTRL-R, <CR> means carriage return

let MySQLcap = '%s#/\<\<select\>\|\<update\>\|\<set\>\|\<from\>\|\<where\>\|\<and\>\|\<or\>\|\<on\>\|\<join\>\|\<not\>\|\<null\>\|\<is\>\|\<using\>\|\<case\>\|\<when\>\|\<else\>\|\<if\>\|\<elsif\>\|\<end\>\|\<as\>\|\<order\>\|\<by\>\|\<asc\>\|\<desc\>\|\<limit\>\|\<with\>\|\<over\>\|\<partition\>\|\<group\>\|\<like\>\|\<left\>\|\<right\>\|\<outer\>\|\<inner\>\|\<full\>\|\<union\>\|\<all\>\|\<distinct\>\|\<coalesce\>#\U&#g'

