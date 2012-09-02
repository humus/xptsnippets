XPTemplate priority=personal
XPTinclude
      \ _common/common

XPT dict " `dict^ = {...'entry': 'value'...}
XSET val|pre=
`dict^ = {`'`entry`'^: `value^`...^ \
, `'`key`'^: `val^`...^}
..XPT



