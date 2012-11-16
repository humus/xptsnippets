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

fun! s:f.CamelCase(...) "{{{
  let str = a:0 == 0 ? self.V() : a:1
  let r = substitute(substitute(str, "[\/ _]", ' ', 'g'), '\<.', '\u&', 'g')
  return substitute(r, " ", '', 'g')
endfunction "}}}

fun! s:f.CamelCase2(...) "{{{
  let str = a:0 == 0 ? self.V() : a:1
  let r = substitute(substitute(str, "[\/ _]", ' ', 'g'), '\<.', '\u&', 'g')
  return substitute(substitute(r, " ", '', 'g'), '^.', '\l&', '')
endfunction "}}}

fun! s:f.PackageCalc()
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

fun! s:f.Interface(...)
    let basestr = expand('%:t:r')
    if basestr =~ 'Impl$'
        return substitute(basestr, 'Impl', '', '')
    endif
    return 'interfase'
endfunction

XPTinclude
      \ _common/common
      \ java/java

XPT package " package Choose=com.package.name
package `:p:^`more?^;
..XPT

XPT p
XSET p=PackageCalc()
`p^

XPT an " @annotation\()
@`annotation^(`cursor^)
..XPT

XPT ir " import something.class;
import `package.class^;`cursor^
..XPT

XPT ptest " @org.junit.Test\rpublic void testmethod\()
@org.junit.Test
`Include:_test^

XPT test " @Test\rpublicvoid testmethod\()
@Test
`Include:_test^

XPT _test " public void test...\() {\r}
public void test`method^CamelCase()^^() {
    `cursor^
}

XPT clas "public class Clazz ..extends ..implements"
XSET parent|post=CamelCase()
XSET interface|pre=Interface()
public class `substitute(expand("%:t"), '.java$', '', '')^` extends
...{{^ extends `parent^CamelCase()^^`}}^` implements
...{{^ implements `interface^`}}^ {
    `cursor^
}

XPT irunw "import org.junit.runner.RunWith
import org.junit.runner.RunWith;

XPT runw
XSET runner=Choose(['org.mockito.runners.MockitoJUnitRunner.class', 'org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests.class'])
@RunWith(`runner^)`cursor^

XPT imockito " import Mockito.Mock
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

XPT imockfn "import Mockito.when|anyXXX
XSET fn=Choose(['isA', 'when', 'anyString', 'anyLong', 'anyInt'])
import static org.mockito.Mockito.`fn^;

XPT iassert " import Assert.assertXXX
XSET chose=Choose(['assertTrue', 'assertFalse', 'assertEquals'])
import static org.junit.Assert.`fn^;

XPT rw
XSET runner=Choose(['MockitoJUnitRunner.class', 'AbstractTransactionalJUnit4SpringContextTests.class'])
@RunWith(`runner^)`cursor^

XPT method
public `String^ `method^CamelCase2()^^(){
    `returnnull...{{^return null;`}}^`cursor^
}

XPT imvcspring
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

XPT ctler
@Controller
@RequestMapping("`path^")
`Include:clas^

XPT dispatchmethod
@RequestMapping("/`path^")
`Include:method^

XPT ijunit
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

XPT deb
if(`log^.isDebugEnabled()) {
    `log^.debug("`first...^`first^{}`first...^", `newobject[]...{{^new Object[]{`var^`...{{^`, `var^`...^`}}^}`}}^`,var1var2...{{^`var1^, `var2^`}}^);
}


XPT var " Var var
XSET var|pre=clazz
XSET var|def=S(R('Clazz'), '^.', '\l&', '')
`Clazz^ `var^`cursor^

XPT privar " private `:var:^;
private `:var:^;

XPT defassign
this.`var^ = `var^;

XPT log " Logger log = \(LoggerFactory\|Logger\).getLogger\(Clazz.class\)
XSET logfactory=Choose(['LoggerFactory', 'Logger'])
private static final Logger log = `logfactory^.getLogger(`expand("%:t:r")^.class);

XPT ilog " import org.slf4j.LoggerFactory,Logger
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

XPT itsb " import ...ToStringBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

XPT reftostr " reflectionToString
ToStringBuilder.reflectionToString(`cursor^);

XPT istereotype
XSET stereotype=Choose(['Service', 'Repository', 'Component', 'Controller'])
import org.springframework.stereotype.`stereotype^

XPT n
XSET instance|pre=clazz
XSET instance|def=S(R('Clazz'), '^.', '\l&', '')
`Clazz^ `instance^ = new `Clazz^();

XPT iweban
XSET at=Choose(['ResponseBody', 'RequestMapping', 'ModelAttribute', 'RequestParam'])
import org.springframework.web.bind.annotation.`at^;

XPT ivalidan
import javax.validation.Valid;

XPT inotnull
import javax.validation.constraints.NotNull;

XPT ihttpm " import ...RequestMethod.GET/POST
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

XPT iautowired " import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;

