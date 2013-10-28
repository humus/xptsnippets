XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
      \ tex/tex

XPT descs " \begin{description}
\begin{description}
    \item[`key^] `desc^^`...^
    \item[`key^] `desc^^`...^
\end{description}
`cursor^

XPT bs " \\
\textbackslash

XPT up " \usepackage
\usepackage`[`options`]^{`cursor^}

XPT empty "\pagestyle{empty}
\pagestyle{empty}

XPT utabx
\usepackage{tabularx}

XPT fmt " \texttt \textbf \emph
XSET fmt=Choose(['texttt', 'textbf', 'emph'])
\\`fmt^{`cursor^}

XPT txw " \textwidth
\textwidth

XPT noindent " \\setlength{\\parindent}{0pt}
\setlength{\parindent}{0pt}

XPT rcolumntype "{>{\raggedleft\arraybackslash}X}
\\newcolumntype{R}{>{\raggedleft\arraybackslash}X}

XPT makeat "makeatletter ... makeatother
\makeattletter
`cursor^
\makeatother

XPT cargs " \\command{}{}
\\`command^`args...{{^{`arg^}`args...^`}}^`main...{{^{
    `cursor^
}`}}^
