XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
    \ _common/common
    \ html/html

XPT decorator_title
<decorator:title default="&iexcl;Sin t&iacute;tulo!" />

XPT decorator
XSET element=Choose(['head', 'body'])
<decorator:`element^ />

XPT cpath
${pageContext.request.contextPath}

XPT tlibcore
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

XPT tlibformat
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>

XPT tlibfn
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

XPT tlibdecorator
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

XPT tlibpage
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

XPT springtlib
XSET prefix=Choose(['s', 'spring'])
<%@ taglib prefix="`prefix^" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

XPT tlibfmt
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

