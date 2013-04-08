XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
      \ _common/common
      \ xml/xml

XPT target " <target name="target"></target>
<target name="`target^">
`cursor^
</target>


XPT expandable
if `cond^
    `pass^
`_else...{{^else
    `passit^
`_else...^`}}^
end


