% ===========================================================================
% templates/classic.cls — Classic (serif, traditional) résumé template.
% Owns ALL formatting. Implements the macro contract in common/resume-api.tex.
% Single-column and ATS-safe by design (see docs/adr/0004).
% ===========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classic}[2026/08/26 v1 Classic (serif) resume template]
\LoadClass[11pt]{article}

\RequirePackage[left=0.85in,right=0.85in,top=0.6in,bottom=0.6in]{geometry}
\RequirePackage{fontspec}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage[hidelinks]{hyperref}

\setmainfont{EB Garamond}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\linespread{1.03}

% Header ---------------------------------------------------------------------
\newcommand{\resumeheader}[2]{%
  \begingroup\centering
  {\Huge\scshape #1}\par\vspace{2pt}%
  {\large\itshape #2}\par
  \endgroup\vspace{2pt}%
}
\newcommand{\contact}[4]{%
  \begingroup\centering\small
  #1\quad\textperiodcentered\quad #2\quad\textperiodcentered\quad #3\quad\textperiodcentered\quad #4\par
  \endgroup\vspace{6pt}%
}

% Section heading ------------------------------------------------------------
\newcommand{\ressection}[1]{%
  \vspace{8pt}{\large\scshape\bfseries #1}\par\vspace{4pt}\hrule\vspace{6pt}%
}

% Entries --------------------------------------------------------------------
\newcommand{\job}[4]{%
  \vspace{4pt}{\bfseries #1}, #2\hfill{\itshape #4}\\%
  {\itshape #3}\par\vspace{1pt}%
}
\newcommand{\project}[3]{%
  \vspace{4pt}{\bfseries #1}\hfill{\itshape #2}\\%
  {\small #3}\par\vspace{1pt}%
}
\newcommand{\education}[4]{%
  \vspace{2pt}{\bfseries #1}, #2\hfill{\itshape #4}\\%
  {\itshape #3}\par%
}
\newcommand{\skillgroup}[2]{%
  {\bfseries #1:}\ #2\par\vspace{2pt}%
}

% Bulleted achievements ------------------------------------------------------
\newlist{bullets}{itemize}{1}
\setlist[bullets]{leftmargin=1.3em,itemsep=1pt,parsep=0pt,topsep=2pt,label=\textbullet}

% Contract self-check (errors if any required macro is missing) ---------------
\input{resume-api.tex}
