XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
XPTvar $TRUE          true
XPTvar $FALSE         false
XPTvar $NULL          null
XPTvar $UNDEFINED     null
" use snippet 'varFormat' to generate formatting variables
" if () ** {
" else ** {
XPTvar $BRif     ' '

" } ** else {
XPTvar $BRel     \n

" for () ** {
" while () ** {
" do ** {
XPTvar $BRloop   ' '

" struct name ** {
XPTvar $BRstc    ' '

" int fun() ** {
" class name ** {
XPTvar $BRfun    ' '
" use snippet 'varSpaces' to generate spacing variables
" int fun ** (
" class name ** (
XPTvar $SPfun      ''

" int fun( ** arg ** )
" if ( ** condition ** )
" for ( ** statement ** )
" [ ** a, b ** ]
" { ** 'k' : 'v' ** }
XPTvar $SParg      ' '

" if ** (
" while ** (
" for ** (
XPTvar $SPcmd      ' '

" a ** = ** a ** + ** 1
" (a, ** b, ** )
XPTvar $SPop       ' '

let s:dirs = split(expand('%:p:h'), '/\|\\')[2:]

fun! s:f.packageCalc()
    let candidate = join(s:dirs, '.')
    if candidate =~ '.\{-}\.src\(\(\.main\|\.test\)\.scala\.\)\?'
        return substitute(candidate, '.\{-}\.src\(\(\.main\|\.test\)\.scala\.\)\?', '', '')
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
      \ xml/xml



XPT main " def main\(args: Array[String])
def main (args: Array[String]) {
    `cursor^
}

XPT obE " object A extends B { }
object `object^` extends `parent^ {
`cursor^
}

XPT package " package Choose=com.package.name
XSET p=packageCalc()
package `p^;
..XPT

XPT cl "Class clazz
class `class^ `extends `parent^ {
    `cursor^
}

XPT trait " trait Trait
trait `trait^ `extends `parent^ {
    `cursor^
}

XPT def " def method\(args)
def `method^(`args...{{^`param^:`Type^` params...{{^
, `p^:`t^` params...^`}}^`}}^) `rettype...{{^ = `Type^`}}^ `Include:_body^

XPT _body
{
    `cursor^
}

XPT If " if \(cond) {code}
if (`cond^) {
    `actions^
}
`else...^
XSETm else...|post
else {
    `cursor^
}
XSETm END

XPT if " if \(cond) val else val
if (`cond^) `val^ else `elseval^

XPT ife " if (...) {...} else if (...) {...} else {...}
if (`cond^) {
    `actions^
}
`else...{{^`elseif...{{^else if(`cond^) {
    `actions^
}
`elseif...^`}}^else {
    `cursor^
}`}}^
..XPT

XPT try " try {} catch {} finally {}
try {
    `call^
}
`catch...^
XSETm catch...|post
catch {
    case ex: Exception =>
        `code^
}
`finally...^
XSETm END
XSETm finally...|post
finally {
    `cursor^
}
XSETm END

XPT match " match { case: Type}
`var^ match {
    case: `match^ =>
        `code^`...matchN^
    case: `match^ =>
        `code^`...matchN^`...None{{^
    case: None =>
        `cursor^`}}^
}
..XPT

XPT while " whie\(cond) {CURSOR}
while(`cond^) {
    `cursor^
}

XPT dowhile "do {CURSOR} while\(cond)
do {
    `cursor^
} while(`cond^)

XPT for " for \(...) {CURSOR}
for (`var^ <- `items^) {
    `cursor^
}

XPT fy " for
for (`var^ <- `items^) {
    yield `cursor^
}

XPT fty
for {
    `name^ <- `items^
    if `cond^
    `expr^
} yield `cursor^

XPTemplate priority=lang

XPTvar $BRif ' '
XPTvar $BRel \n
XPTvar $BRloop ' '
XPTvar $BRfun ' '

XPTinclude
    \ _common/personal
    \ java/java

XPT cake hint=Cake\ Pattern
XSET trait|def=Some
XSET derived|def=Real
trait `trait^Component {
    trait `trait^ {
        `body^
    }

    val `trait^SV('(.)', '\l\1', '')^^: `trait^
}

trait `derived^`trait^Component extends `trait^Component {

    override lazy val `trait^SV('(.)', '\l\1', '')^^ = new `trait^ {
        `body2^
    }
}

