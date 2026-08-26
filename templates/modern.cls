% ===========================================================================
% templates/modern.cls — Modern (sans, accent colour) résumé template.
% Owns ALL formatting. Implements the macro contract in common/resume-api.tex.
% Single-column and ATS-safe by design (see docs/adr/0004): the colour and
% sans face are decoration only — the text stays selectable and in reading order.
% ===========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modern}[2026/08/26 v1 Modern (sans, accent) resume template]
\LoadClass[11pt]{article}

\RequirePackage[margin=0.8in]{geometry}
\RequirePackage{fontspec}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage[hidelinks]{hyperref}

\setmainfont{Fira Sans}
\definecolor{accent}{HTML}{1F5EA8}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\linespread{1.05}

% Header ---------------------------------------------------------------------
\newcommand{\resumeheader}[2]{%
  {\Huge\bfseries\color{accent} #1}\par\vspace{1pt}%
  {\large #2}\par\vspace{4pt}%
}
\newcommand{\contact}[4]{%
  {\small\color{black!70} #1 \;|\; #2 \;|\; #3 \;|\; #4}\par
  \vspace{4pt}{\color{accent}\hrule height 1pt}\vspace{8pt}%
}

% Section heading ------------------------------------------------------------
\newcommand{\ressection}[1]{%
  \vspace{8pt}{\large\bfseries\color{accent}\MakeUppercase{#1}}\par
  \vspace{-2pt}{\color{accent!35}\hrule height 0.8pt}\vspace{6pt}%
}

% Entries --------------------------------------------------------------------
\newcommand{\job}[4]{%
  \vspace{4pt}{\bfseries #1} \textcolor{black!60}{--- #2}\hfill{\small\color{black!60} #4}\\%
  {\small\itshape\color{black!60} #3}\par\vspace{1pt}%
}
\newcommand{\project}[3]{%
  \vspace{4pt}{\bfseries #1}\hfill{\small\color{black!60} #2}\\%
  {\small #3}\par\vspace{1pt}%
}
\newcommand{\education}[4]{%
  \vspace{2pt}{\bfseries #1} \textcolor{black!60}{--- #2}\hfill{\small\color{black!60} #4}\\%
  {\small\itshape\color{black!60} #3}\par%
}
\newcommand{\skillgroup}[2]{%
  {\bfseries\color{accent} #1:}\ #2\par\vspace{2pt}%
}

% Bulleted achievements ------------------------------------------------------
\newlist{bullets}{itemize}{1}
\setlist[bullets]{leftmargin=1.2em,itemsep=1pt,parsep=0pt,topsep=2pt,label={\color{accent}\textbullet}}

% Contract self-check (errors if any required macro is missing) ---------------
\input{resume-api.tex}
