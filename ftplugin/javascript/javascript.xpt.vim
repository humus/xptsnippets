XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
      \ _common/common
XPTvar $SParg      ''
XPTvar $SPcmd      ' '
XPTvar $SPop       ' '

XPT options
{`
    "`entry`"^: `value^`entries...{{^`   entry...{{^`,
    "`key`"^: `value^`   entry...^`}}^
`}}^}


