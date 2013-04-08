XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
      \ _common/common


XPT start " @startuml @enduml
@startuml
    `cursor^
@enduml

XPT a " activity
--> "`cursor^"

XPT o " (*)
(*)

XPT if " --> if "`cond?^" then ... else ... end if
--> if "`cond?^" then
    `cursor^
else
endif

XPT bars
===`name^===
===`End^`name^===

XPT p " partition
partition `partition^
    `cursor^
end partition
..XPT

XPT n " note position ... end note
XSET position=Choose(['right', 'bottom', 'left', 'top'])
note `position^
    `cursor^
end note
