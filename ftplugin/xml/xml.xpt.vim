XPTemplate priority=personal

XPT tag " <tag></tag>
<`tag^>`cursor^</`tag^>

XPT ta "<tag attrs="values">`cursor^</tag>"
<`tag^ `:attr:^>`cursor^</`tag^>

XPT t alias=tag

XPT T " <tag>`cursor^</tag>
<`tag^>
    `cursor^
</`tag^>
..XPT

XPT Ta "<tag attrs="values">`cursor^</tag>
<`tag^` 	...attrs{{^ `:attr:^`}}^>
    `cursor^
</`tag^>

XPT tt alias=Ta

XPT attr
`at^="`val^"`att...{{^` `attribute^="`value^"`att...^`}}^
..XPT

XPT androidC " <AndroidComponent a:orientation="" a.layout_width=""...
XSET prefix|pre=android
XSET height|pre=wrap_content
XSET width|pre=wrap_content
XSET string|pre=
<`control^ `prefix^:layout_height="`height^"
        `prefix^:layout_width="`width^"
        `prefix^:text="@string/`string^"`cursor^/>
..XPT

XPT droidattsd
XSET prefix|pre=android
XSET width|pre=fill_parent
XSET height|pre=fill_parent
`prefix^:layout_width="`width^"
`prefix^:layout_height="`height^"

XPT droidat
XSET prefix|pre=android
    `prefix^:`att^="`value^"`...^
    `prefix^:`att^="`value^"`...^
