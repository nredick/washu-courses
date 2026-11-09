% \NeedsTeXFormat{LaTeX2e}
\ProvidesClass{draft}

% Load base class
\LoadClass[12pt]{article}

% babel for language support
\RequirePackage[english]{babel}
% \RequirePackage[TS1, T1]{fontenc}
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
% \setmainfont{STIXTwoText}
\setmainfont{XCharter}

% Font
% \RequirePackage{charter} % final font
% \RequirePackage[default]{opensans} % for editing

% Packages
\RequirePackage[letterpaper, top=1in, bottom=1in, left=0.5in, right=0.5in]{geometry}
\RequirePackage[x11names,table]{xcolor} % For color names
\RequirePackage{xparse} % For defining new commands
\RequirePackage{setspace} % For line spacing
\RequirePackage{siunitx} % For consistent typesetting of SI units
\RequirePackage{mathtools} % Enhancements to amsmath
\RequirePackage{amsthm} % For theorem environments
\RequirePackage{theorem} % Additional theorem environment options
\RequirePackage{verbatim} % For verbatim text
\RequirePackage{amssymb} % Additional math symbols
\RequirePackage{amsmath} % Advanced math typesetting
\RequirePackage{textcomp} % Additional text symbols
\RequirePackage{gensymb} % For generic symbols like degrees
\RequirePackage{bm} % Bold math symbols
\RequirePackage{enumitem} % For customizing lists
\RequirePackage{titlesec} % For customizing section titles
\RequirePackage{fancyhdr} % For custom headers and footers
\usepackage[autostyle]{csquotes} % For context-sensitive quotes
\MakeOuterQuote{"}
% \RequirePackage[document]{ragged2e} % For text alignment
% \RequirePackage[figuresright]{rotating} % For rotating figures and tables
\RequirePackage{pdflscape}
\RequirePackage{mhchem}

% Figures
\RequirePackage{graphicx} % For including graphics
\RequirePackage{float} % For controlling figure placement
\RequirePackage[font=small,labelfont=small]{caption} % For customizing captions
\RequirePackage{subcaption} % For subfigures
\RequirePackage{booktabs} % For tables
\RequirePackage{multirow} % For tables
\RequirePackage{lineno} % For line numbers

% Section formatting
\titleformat{\section}[hang]{\scshape\large\bfseries}{\thesection}{1.5ex}{}
\titleformat{\subsection}[hang]{\scshape\bfseries}{\thesubsection}{1.5ex}{}
\titleformat{\subsubsection}[hang]{\scshape\bfseries}{\thesubsubsection}{1.5ex}{}
% \titleformat{\subsection}[runin]{\scshape\bfseries}{\thesubsection}{1ex}{}
% \titleformat{\subsubsection}[runin]{\scshape\itshape}{\thesubsubsection}{1ex}{}

%% reduced space after section titles
\titlespacing*{\section}{0pt}{0pt}{1ex}
\titlespacing*{\subsection}{0pt}{0pt}{0.75ex}
\titlespacing*{\subsubsection}{0pt}{0pt}{0.25ex}

% Line/paragraph spacing
\setlength\parindent{0.25in} % paragraph indentation
% \setlength{\RaggedRightParindent}{\parindent} % For proper indentation when using ragged right
\setlength{\parskip}{1ex} % Spacing between paragraphs

% Less space in lists
% \setlist{nosep} % No extra space in lists
\setlist[itemize]{left=2em}
\setlist[enumerate]{left=2em}

\RequirePackage[
    colorlinks=true,
    linkcolor=DodgerBlue3, % !!used to be black
    citecolor=DodgerBlue3,
    urlcolor=DodgerBlue3
]{hyperref}

\RequirePackage[
    backend=biber,
    hyperref=true,
    backref=false,
    style=authoryear-comp,    % Standard Author-Year format for Earth Sciences
    maxcitenames=2,      % Truncates to "et al." for 3 or more authors
    mincitenames=1,      % Keeps only the first author before "et al."
    maxbibnames=99,      % Show all authors in the actual bibliography list
    dashed=false,        % Don't replace repeated author names with a dash in the bibliography
    sortcites=true,      % Automatically sorts inside individual \cite commands
    % sorting=ydnt,
    ]{biblatex}


\ExecuteBibliographyOptions{uniquename=false, uniquelist=false}

% Bibliography cleanup
% \AtEveryBibitem{
%   \clearlist{address}
%   \clearfield{date}
%   \clearfield{eprint}
% %   \clearfield{isbn}
% %   \clearfield{issn}
%   \clearlist{location}
%   \clearfield{month}
%   \clearfield{series}
%   \clearfield{url}
%   \clearfield{urldate}
%   \clearfield{urlyear}
%   \clearfield{urlmonth}
%   \clearfield{note}
%   \clearfield{language}
% }

% Advanced Bibliography Cleanup for Earth Sciences
% Comprehensive Earth Sciences Bibliography Cleanup
\AtEveryBibitem{
  \clearfield{day}         % <-- Add this to catch daily stamps
  \clearfield{issue}
  \clearfield{langid}
  \clearfield{month}      % FIXES: (10, 2024) and (30, 2006)
  \clearfield{note}
  \clearlist{address}
  \clearlist{language}   % FIXES: The lang tags
  \clearlist{location}

  % Fixes the URL clutter: Removes URLs ONLY for published journal articles
  % Leaves URLs active for datasets/manuals (like Bangerth's Zenodo & Faccenda's Github)
  \ifentrytype{article}{
    \clearfield{url}
    \clearfield{urldate}
    \clearfield{urlyear}
    \clearfield{urlmonth}
    \clearfield{eprint}
    \clearfield{issn}     % Optional: Removes ISSN numbers to save space
  }{}

  \ifentrytype{incollection}{
    \clearfield{url}
    \clearfield{urldate}
    \clearfield{urlyear}
    \clearfield{urlmonth}
    \clearfield{eprint}
    % \clearfield{issn}     % Optional: Removes ISSN numbers to save space
  }{}

    \ifentrytype{book}{
    \clearfield{url}
    \clearfield{urldate}
    \clearfield{urlyear}
    \clearfield{urlmonth}
    \clearfield{eprint}
    % \clearfield{issn}     % Optional: Removes ISSN numbers to save space
  }{}

    \ifentrytype{inbook}{
    \clearfield{url}
    \clearfield{urldate}
    \clearfield{urlyear}
    \clearfield{urlmonth}
    \clearfield{eprint}
    % \clearfield{issn}     % Optional: Removes ISSN numbers to save space
  }{}
}

% suppress the annoying hbox overfull warning
\hfuzz=11in

% fix the higlighting of the citations
% \DeclareCiteCommand{\autocite}
%   {\usebibmacro{prenote}\bibopenparen}
%   {\bibhyperref{\printnames{labelname}\addcomma\space\printfield{labelyear}}}
%   {\addsemicolon\space}
%   {\bibcloseparen\usebibmacro{postnote}}

% % ? should this have a semicolon?
% \DeclareCiteCommand{\textcite}
%   {\usebibmacro{prenote}}
%   {\bibhyperref{\printnames{labelname}\space(\printfield{labelyear})}}
%   {\addsemicolon\space}
%   {\usebibmacro{postnote}}

% \DeclareCiteCommand{\parencite}
%   {\usebibmacro{prenote}\bibopenparen}
%   {\bibhyperref{\printnames{labelname}\addcomma\space\printfield{labelyear}}}
%   {\addsemicolon\space}
%   {\bibcloseparen\usebibmacro{postnote}}

\newcommand{\goodtilde}{\raisebox{0.5ex}{\texttildelow}}
