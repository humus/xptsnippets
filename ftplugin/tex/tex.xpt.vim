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


XPT up " \usepackage
\usepackage{`cursor~}

XPT empty "\pagestyle{empty}
\pagestyle{empty}

XPT utabx
\usepackage{tabularx}

XPT fmt " \texttt \textbf \emph
XSET fmt=Choose(['texttt', 'textbf', 'emph'])
\\`fmt~{`cursor~}

XPT txw " \textwidth
\textwidth

XPT noindent " \\setlength{\\parindent}{0pt}
\setlength{\parindent}{0pt}

