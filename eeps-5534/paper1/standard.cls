% \NeedsTeXFormat{LaTeX2e}
\ProvidesClass{standard}

% Load base class
\LoadClass[11pt]{article}

% babel for language support
\RequirePackage[english]{babel}

% Font setup for LuaLaTeX / XeLaTeX
\RequirePackage{fontspec}
\setmainfont{Arial}

% Packages
\RequirePackage[letterpaper, top=1in, bottom=1in, left=1in, right=1in]{geometry}
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
% \RequirePackage{gensymb} % For generic symbols like degrees
\RequirePackage{bm} % Bold math symbols
\RequirePackage{enumitem} % For customizing lists
\RequirePackage{titlesec} % For customizing section titles
\RequirePackage{fancyhdr} % For custom headers and footers
\RequirePackage{csquotes} % For context-sensitive quotes
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
% \titleformat{\section}[hang]{\scshape\large\bfseries}{\thesection}{1.5ex}{}
% \titleformat{\subsection}[hang]{\scshape\bfseries}{\thesubsection}{1.5ex}{}
% \titleformat{\subsubsection}[hang]{\scshape\bfseries}{\thesubsubsection}{1.5ex}{}

% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before-code>}
\titleformat{\section}[runin]{\bfseries\fontsize{11}{14}\selectfont}{\thesection}{1em}{}
\titleformat{\subsection}[runin]{\bfseries\fontsize{11}{14}\selectfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[runin]{\bfseries\fontsize{11}{14}\selectfont}{\thesubsubsection}{1em}{}

%% reduced space after section titles
\titlespacing*{\section}{0pt}{0pt}{1.5ex}
\titlespacing*{\subsection}{0pt}{0pt}{1.5ex}
\titlespacing*{\subsubsection}{0pt}{0pt}{1.5ex}

% Line/paragraph spacing
\setlength\parindent{0.25in} % paragraph indentation
% \setlength{\RaggedRightParindent}{\parindent} % For proper indentation when using ragged right
\setlength{\parskip}{0.5ex} % Spacing between paragraphs

% Less space in lists
\setlist{nosep} % No extra space in lists
\setlist[itemize]{left=1ex}
\setlist[enumerate]{left=1ex}

\RequirePackage[
    colorlinks=true,
    linkcolor=black, % !!used to be black
    citecolor=black,
    urlcolor=black
]{hyperref}

\RequirePackage[
    backend=biber,
    hyperref=true,
    backref=false,
    style=nature,    % authoryear-comp = Standard Author-Year format for Earth Sciences
    maxcitenames=2,      % Truncates to "et al." for 3 or more authors
    mincitenames=1,      % Keeps only the first author before "et al."
    maxbibnames=2,
    % dashed=false,        % Don't replace repeated author names with a dash in the bibliography
    sortcites=true,      % Automatically sorts inside individual \cite commands
    autocite=superscript,
    % sorting=ydnt,
    terseinits=true, % Removes extra periods from author initials
    abbreviate=true  % Abbreviates terms like "edition", "volume", etc.
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

% Remove all vertical gaps between bibliography entries
\AtBeginBibliography{%
  \setlength{\itemsep}{0pt}%
%   \setlength{\parsep}{0pt}%
%   \setlength{\parskip}{0pt}%
}

% Advanced Bibliography Cleanup for Earth Sciences
% Comprehensive Earth Sciences Bibliography Cleanup
\AtEveryBibitem{
  \clearlist{location}
  \clearlist{language}   % FIXES: The random ". en." and ". English." tags
  \clearlist{address}
  \clearfield{note}
  \clearfield{month}      % FIXES: (10, 2024) and (30, 2006)
  \clearfield{langid}
  \clearfield{issue}
  \clearfield{title}
  \clearfield{day}
  \clearfield{pages}
  \clearfield{url}
  \clearfield{version}

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
