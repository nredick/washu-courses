\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{standard}[2026/09/28 Standard class paper template (LuaLaTeX/XeLaTeX)]

% Load base class
\LoadClass[12pt]{article}

% ---------------------------------------------------------------
% Language and fonts (compile with lualatex or xelatex)
% ---------------------------------------------------------------
\RequirePackage[english]{babel}
\RequirePackage{fontspec}

% XCharter is a Charter-family font with real small caps, so \scshape works
% (ships with TeX Live). Fallback if unavailable:
%   \setmainfont{Charter}
\setmainfont{XCharter}
% \setmainfont{Open Sans}
% \setmainfont{Times New Roman}

% ---------------------------------------------------------------
% Packages
% ---------------------------------------------------------------
\RequirePackage[letterpaper, top=1in, bottom=1in, left=1in, right=1in]{geometry}
\RequirePackage[x11names,table]{xcolor}
\RequirePackage{setspace}
\RequirePackage{siunitx}
\RequirePackage{mathtools}   % loads amsmath
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{verbatim}
\RequirePackage{bm}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
% \RequirePackage{fancyhdr}
\RequirePackage[autostyle=true]{csquotes}
\MakeOuterQuote{"}
\RequirePackage{pdflscape}
\RequirePackage{mhchem}
\RequirePackage{authoraftertitle}
\RequirePackage{xurl} % Enables line breaks anywhere in long URLs/DOIs

% Figures & tables
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[font=small,labelfont=small]{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{lineno}      % use \linenumbers in the preamble if needed

% ---------------------------------------------------------------
% Spacing
% ---------------------------------------------------------------
\doublespacing               % change to \onehalfspacing or \singlespacing
\setlength\parindent{0.5in}
% \setlength{\parskip}{0.25ex}

\setlist{nosep}
\setlist[itemize]{left=1ex}
\setlist[enumerate]{left=1ex}

% ---------------------------------------------------------------
% Sections
% ---------------------------------------------------------------
\titleformat{\section}[hang]{\scshape\Large}{\thesection}{1.5ex}{}
\titleformat{\subsection}[hang]{\scshape\large}{\thesubsection}{1.5ex}{}
\titleformat{\subsubsection}[hang]{\scshape}{\thesubsubsection}{1.5ex}{}

\titlespacing*{\section}{0pt}{2.5ex plus .5ex minus .2ex}{1.5ex}
\titlespacing*{\subsection}{0pt}{2ex plus .5ex minus .2ex}{1.5ex}
\titlespacing*{\subsubsection}{0pt}{1.5ex plus .5ex minus .2ex}{1.5ex}

% ---------------------------------------------------------------
% Header / footer: page number bottom center
% ---------------------------------------------------------------
% \pagestyle{fancy}
% \fancyhf{}
% \fancyfoot[C]{\thepage}
% \renewcommand{\headrulewidth}{0.15pt}

% ---------------------------------------------------------------
% Title block
% ---------------------------------------------------------------
\renewcommand{\maketitle}{%
  \begin{center}
    {\scshape\LARGE \MyTitle\par}\vspace{1ex}
    {\large \MyAuthor\par}
    {\MyDate\par}
  \end{center}\vspace{2ex}}

% ---------------------------------------------------------------
% Theorem-style environments (remove if unused)
% ---------------------------------------------------------------
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\theoremstyle{definition}
\newtheorem{definition}{Definition}

% ---------------------------------------------------------------
% Links (load late, before biblatex)
% ---------------------------------------------------------------
\RequirePackage[
    colorlinks=true,
    linkcolor=DodgerBlue3,
    citecolor=DodgerBlue3,
    urlcolor=DodgerBlue3
]{hyperref}

\renewenvironment{abstract}{%
  \phantomsection
  \addcontentsline{toc}{section}{\abstractname}%
  \section*{\abstractname}%
}{}

% ---------------------------------------------------------------
% Bibliography (APA author-year)
% ---------------------------------------------------------------
\RequirePackage[
    backend=biber,
    hyperref=true,
    backref=false,
    style=authoryear-comp,
    % style=nature,
    maxcitenames=2,
    mincitenames=1,
    maxbibnames=99,
    sortcites=true,
    % sorting=ynt,
    autocite=inline,
    terseinits=true,
    % abbreviate=false
]{biblatex}

\ExecuteBibliographyOptions{uniquename=false, uniquelist=false}

\defbibheading{bibliography}[\refname]{\section*{#1}}

% Bibliography cleanup (titles and pages are now kept)
\AtEveryBibitem{%
  \clearlist{location}%
  \clearlist{language}%
  \clearlist{address}%
  \clearfield{note}%
  \clearfield{month}%
  \clearfield{day}%
  \clearfield{langid}%
  \clearfield{version}%
  \ifentrytype{article}{%
    \clearfield{url}%
    \clearfield{urldate}%
    \clearfield{urlyear}%
    \clearfield{urlmonth}%
    \clearfield{eprint}%
    \clearfield{issn}%
  }{}%
}

\newcommand{\goodtilde}{\raisebox{0.5ex}{\texttildelow}}