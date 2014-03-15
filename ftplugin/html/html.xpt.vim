XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
      \ _common/common
      \ xml/xml

XPT script " <script type="text/javascript"...
<script type="text/javascript">
    `cursor^
</script>
..XPT

XPT ro " readonly="readonly"
readonly="readonly"

XPT html5
<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    <body>
        `cursor^
    </body>
</html>

