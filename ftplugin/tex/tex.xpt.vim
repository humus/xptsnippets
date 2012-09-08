XPTemplate priority=personal mark=`~

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
      \ tex/tex

XPT descs " \begin{description}
\begin{description}
    \item[`key~] `desc~~`...~
    \item[`key~] `desc~~`...~
\end{description}
`cursor~


