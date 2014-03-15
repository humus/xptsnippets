XPTemplate priority=personal

XPTinclude
      \ _common/common

XPT vimlist " ['1', '2'..., 'n']
['`one^', '`two^'`...^, '`item^'`...^]

XPT reset " let s_cpo = &cpo
let s:cpo_save = &cpo
set cpo&vim
`cursor^
let &cpo = s:cpo_save
unlet s:cpo:save
..XPT
