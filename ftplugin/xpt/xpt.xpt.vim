XPTemplate priority=personal

XPTinclude
      \ _common/common

XPTvar $START '`'
XPTvar $END '^'
XPTvar $XPT 'XPT'
XPTvar $CLOSEP )
XPTvar $OPENP (
XPTvar $SET XSET
XPTvar $ESCAPE \


XPT end
\`$END\^

XPT start
\`$START\^


XPT it
\``var^`$END^`cursor^

XPT h alias=it

XPT cur
\`cursor`$END^`cursor^

XPT repeat " repeating template
\`...`$END^`cursor^`\``name^...`$END^

XPT rep alias=repeat

XPT repeat2
\``name^...{{`$END^`cursor^\``name^...`$END^\`}}`$END^

XPT Rep alias=repeat2

XPT expand
\``name^...{{`$END^`cursor^\`}}`$END^

XPT al " XPT alias alias=template
`$XPT^ `alias^ alias=`template^

XPT setchoose " XPT SET \`plahceholder\^=Choose\(['1', '2'..., 'n'])
`$SET^ `choose^=Choose`$OPENP^`:vimlist:^`$CLOSEP^


