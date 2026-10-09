% Reference-inspired single-column template. All formatting stays here.
% Source Code Pro body, condensed headings, contact-first header, dark rule.
% Fonts ship with the pinned TeX Live image; no external font downloads needed.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{editorial}[2026/10/09 v1 Editorial resume template]
\LoadClass[10pt,letterpaper]{article}

\RequirePackage[left=1in,right=0.85in,top=0.5in,bottom=0.55in]{geometry}
\RequirePackage{fontspec}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{needspace}
\RequirePackage[hidelinks]{hyperref}

\setmainfont{Source Code Pro}
\newfontfamily\headingfont{Roboto Condensed}
\definecolor{body}{HTML}{555555}
\definecolor{heading}{HTML}{424242}
\definecolor{role}{HTML}{304848}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\AtBeginDocument{\color{body}\fontsize{9.5}{11.5}\selectfont\raggedright}

% Delay the name until contact() so every application keeps the same API order.
\newcommand{\resumeheader}[2]{%
  \def\editorialname{#1}%
  \def\editorialtagline{#2}%
  \hypersetup{pdftitle={#1 -- Resume},pdfauthor={#1}}%
}
\newcommand{\contact}[4]{%
  {\headingfont\fontsize{9}{11}\selectfont
    #2\par\href{mailto:#1}{#1}\par
    #3\enspace\textperiodcentered\enspace #4\par}%
  \vspace{10pt}%
  {\headingfont\fontsize{19}{23}\selectfont\color{heading}\editorialname\par}%
  {\headingfont\fontsize{10}{13}\selectfont\editorialtagline\par}%
  \vspace{10pt}{\color{heading}\hrule height 2.5pt}\vspace{10pt}%
}
\newcommand{\ressection}[1]{%
  \par\addvspace{9pt}\Needspace{5\baselineskip}%
  {\headingfont\fontsize{12}{15}\selectfont\color{heading}\MakeUppercase{#1}\par}%
  \nobreak\vspace{7pt}%
}
\newcommand{\job}[4]{%
  \par\addvspace{7pt}\Needspace{5\baselineskip}%
  {\bfseries #2}\space\textemdash\space{\itshape\color{role}#1}\par\nobreak
  \vspace{4pt}{\fontsize{9}{11}\selectfont #4\enspace\textperiodcentered\enspace #3\par}%
  \nobreak
}
\newcommand{\project}[3]{%
  \par\addvspace{9pt}\Needspace{5\baselineskip}%
  {\bfseries #1}\space\textemdash\space{\itshape\color{role}#2}\par\nobreak
  {\small #3\par}\nobreak
}
\newcommand{\education}[4]{%
  \Needspace{4\baselineskip}%
  {\bfseries #2}\space\textemdash\space{\itshape\color{role}#1}\par\nobreak
  \vspace{4pt}{\fontsize{9}{11}\selectfont #4\enspace\textperiodcentered\enspace #3\par}%
}
\newcommand{\skillgroup}[2]{%
  {\bfseries #1:}\space #2\par\vspace{2pt}%
}
\newlist{bullets}{itemize}{1}
\setlist[bullets]{leftmargin=2.5em,labelsep=0.8em,itemsep=2pt,parsep=0pt,topsep=4pt,label=\textbullet}

\input{resume-api.tex}
