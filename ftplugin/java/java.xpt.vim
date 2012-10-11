XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables

XPTvar $TRUE          true
XPTvar $FALSE         false
XPTvar $NULL          null
XPTvar $UNDEFINED     null

let s:dirs = split(expand('%:p:h'), '/\|\\')[2:]

fun! s:f.packageCalc()
    let candidate = join(s:dirs, '.')
    if candidate =~ '.\{-}\.src\(\(\.main\|\.test\)\.java\.\)\?'
        return substitute(candidate, '.\{-}\.src\(\(\.main\|\.test\)\.java\.\)\?', '', '')
    endif
    let returnlist = reverse(s:dirs[:])
    let index = 0
    while index < len(returnlist)
        let returnlist[index] = index == 0 ? returnlist[index] : returnlist[index] . '.' . returnlist[index - 1]
        let index += 1
    endwhile
    return reverse(returnlist)
endfunction

XPTinclude
      \ _common/common
      \ java/java

XPT package " package Choose=com.package.name
XSET p=packageCalc()
package `p^;
..XPT

XPT an " @annotation\()
@`annotation^(`cursor^)
..XPT

XPT ir " import something.class;
import `package.class^;`cursor^
..XPT

