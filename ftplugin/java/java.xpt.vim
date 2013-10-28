XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate constant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables

XPTvar $TRUE          true
XPTvar $FALSE         false
XPTvar $NULL          null
XPTvar $UNDEFINED     null

XPTvar $SPfun      ''
XPTvar $SParg      ''
XPTvar $SPcmd      ' '

" (a, ** b, ** )
XPTvar $SPop       ' '

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
@`annotation^`params...{{^(`cursor^)`}}^
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

XPT tE "@Test\(expected = Clazz.class)
@Test(expected = `Clazz^.class)
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
    `__init__...{{^public `substitute(expand("%:t"), '\.java$', '', '')^ (`vars...{{^`:var:^`}}^) {
        `default assign...{{^`:defassign:^`}}^`cursor^
    }`}}^
}

XPT irunw "import org.junit.runner.RunWith
import org.junit.runner.RunWith;

XPT runw
XSET runner=Choose(['org.mockito.runners.MockitoJUnitRunner.class', 'org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests.class', 'MockitoJUnitRunner.class'])
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
    `cursor^
    `returnnull...{{^return null;`}}^
}

XPT ctler
@Controller
@RequestMapping("`path^")
XSET parent|post=CamelCase()
XSET interface|pre=Interface()
public class `substitute(expand("%:t"), '.java$', '', '')^` extends
...{{^ extends `parent^CamelCase()^^`}}^ {
    `__init__...{{^public `substitute(expand("%:t"), '\.java$', '', '')^ (`vars...{{^`:var:^`}}^) {
        `default assign...{{^`:defassign:^`}}^`cursor^
    }`}}^

    `Include:Rbody^
}

XPT dispatchmethod
@RequestMapping("/`path^")
`Include:method^

XPT Rbody
@RequestMapping(`val...{{^value="/`url^"`}}^)
public @ResponseBody
Collection<ObjectError> `method^(`ModelAttribute...{{^@ModelAttribute `}}^`Valid...{{^@Valid `}}^`:var:^, BindingResult errors) {
    Collection<ObjectError> returnval = errors.getAllErrors();
    if (!errors.hasErrors()) {
        `cursor^
    }
    return returnval;
}

XPT RB alias=Rbody

XPT ijunit
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

XPT iutil
`List...{{^import java.util.List;`ArrayList...{{^
import java.util.ArrayList;`}}^`}}^`Map...{{^
import java.util.Map;`HashMap...{{^
import java.util.HashMap;`}}^`}}^`Date...{{^
import java.util.Date;`}}^`Locale...{{^
import java.util.Locale;`}}^

XPT iu
import java.util.`clazz^;`cursor^


XPT deb
if(`log^.isDebugEnabled()) {
    `log^.debug("`first...^`first^{}`first...^", `newobject[]...{{^new Object[]{`var^`...{{^`, `var^`...^`}}^}`}}^`,var1var2...{{^`var1^, `var2^`}}^);
}


XPT var " Var var
XSET var|pre=clazz
XSET var|def=S(R('Clazz'), '^.', '\l&', '')
`Clazz^ `var^

XPT v " Var var
`:var:^`=...{{^= `cursor^`}}^;

XPT privar " private `:var:^;
private `:var:^;

XPT pv alias=privar

XPT defassign
this.`var^ = `var^;

XPT DA alias=defassign


XPT cast
`type^ `var^= (`type^) `cursor^

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

XPT N
XSET type|pre=Type
XSET type|def=S(R('instance'), '^.', '\u&', '')
`instance^ = new `type^();

XPT iweban
`requestmapping?...{{^import org.springframework.web.bind.annotation.RequestMapping;`}}^`responsebody?...{{^
import org.springframework.web.bind.annotation.ResponseBody;`}}^`ModelAttribute?...{{^
import org.springframework.web.bind.annotation.ModelAttribute;`}}^`BindingResult?...{{^
import org.springframework.validation.BindingResult;`}}^`ObjectError?...{{^
import org.springframework.validation.ObjectError;`}}^

XPT ilist
import java.util.List; `ArrayList=...{{^
import java.util.ArrayList;`}}^

XPT iwebd " import org.openqa.selenium...
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;


XPT ivalidan
import javax.validation.Valid;

XPT inotnull
import javax.validation.constraints.NotNull;

XPT ihttpm " import ...RequestMethod.GET/POST
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

XPT imodelmap
import org.springframework.ui.ModelMap;

XPT ibinderrors
XSET errors=Choose(['BindingResult', 'Errors'])
import org.springframework.validation.`errors^;

XPT iautowired " import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;

XPT ibigd
import java.math.BigDecimal;

XPT C " File/Clazz Name
XSET c=E('%:t:r')
`c^`cursor^

XPT skel
`:package:^

`:clas:^
..XPT
 

XPT bef
@Before
public void setUp(){
    `cursor^
}

XPT pmock "@Mock \rprivate Var var;
@Mock
`:pv:^

XPT try wrap=what " try .. catch (..) .. finally
XSET handler=$CL handling $CR
try {
    `what^
}` `catch...^
XSETm catch...|post
catch (`Exception^ `e^) {
    `handler^
}` `catch...^
XSETm END
`finally...{{^
finally {
    `cursor^
}`}}^


XPT cmock " Clazz clazz = context.mock\(Clazz.class\)
final `:var:^ = context.mock(`Clazz^.class);

XPT checking "context.checking\(new Expectations\(){{}})
context.checking(new Expectations{{
        oneOf(`var^ ).`method^(`cursor^);
}})

XPT we
with(equal(`cursor^));

XPT will
will(returnValue(`cursor^));

XPT irefut
import org.springframework.test.util.ReflectionTestUtils;

XPT refusetf " ReflectionTestUtils.setField
ReflectionTestUtils.setField(`target^, "`field^", `object^);

XPT ap " .append\("")
.append(`"`text?`"^`no_text?^)
`append...{{^.append(`"`text?`"^`no_text?^)
`append...^`}}^

XPT ijdi " import javax.inject
`PostConstruct...{{^import javax.annotation.PostConstruct;
`}}^`Inject...{{^import javax.inject.Inject;
`}}^`Named...{{^import javax.inject.Named;
`}}^`Singleton...{{^import javax.inject.Singleton;
`}}^

XPT STR " private static final String NAME = ""
private static final String `NAME^ = "`cursor^";

XPT inject " @Inject¬¬private Var var;
XSET instance|pre=clazz
XSET instance|def=S(R('Clazz'), '^.', '\l&', '')
@Inject
private `Clazz^ `instance^;

XPT hmap " new HashMap
Map<`String^, `Object^> `map^ = new HashMap<`String^, `Object^>();

XPT stateless " @Stateless\(name="" mappedName="")
XSET NAME=substitute(expand('%:t:r'), '^.', '\l&', '')
@Stateless(name="`NAME^", mappedName="`NAME^")

XPT resource
@Resource
`:pv:^
