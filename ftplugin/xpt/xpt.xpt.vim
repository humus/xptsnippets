XPTemplate priority=personal

XPTinclude
      \ _common/common

XPTvar $START '\`'
XPTvar $END '\^'
XPTvar $XPT 'XPT'
XPTvar $CLOSEP )
XPTvar $OPENP (
XPTvar $SET XSET

XPT end
\`$END\^

XPT start
\`$START\^


XPT it
`$START^`var^`$END^`cursor^

XPT h alias=it

XPT cur
`$START^cursor`$END^`cursor^

XPT repeat " repeating template
`$START^`name^...`$END^`cursor^`$START^`name^...`$END^

XPT rep alias=repeat

XPT repeat2 "repeating template 2
`$START^`name^...{{`$END^`cursor^`$START^`name^...`$END^`$START^}}`$END^

XPT Rep alias=repeat2

XPT expand
`$START^`name^...{{`$END^`cursor^`$START^}}`$END^

XPT al " XPT alias alias=template
`$XPT^ `alias^ alias=`template^

XPT setchoose " XPT SET \`plahceholder\^=Choose\(['1', '2'..., 'n'])
`$SET^ `choose^=Choose`$OPENP^`:vimlist:^`$CLOSEP^

XPT setdef
`$SET^ `choose^|def=`def^

