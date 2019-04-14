%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                %
%                              szablonPG.cls                                     %
%                                                                                %
% A LaTeX2e document class for Eng/BSc/MSc thesis template                       %
%                                             Gda�sk University of Technology    %
%                                                                                %
%  (c) 2016, by Jakub Maksymiuk                                                  %
%                                                                                %
%  ---- see README.txt for more details                                          %
%                                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% let the story begins...

%--------------------------------------------------------------------
% Identification part
%--------------------------------------------------------------------

\def\fileversion{1.0}
\def\filedate{2016/02/01}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{szablonPG}[\filedate\space Version \fileversion\space by Jakub Maksymiuk]
\typeout{****}
\typeout{*}
\typeout{*  beta version of szablonPG - everything may change}
\typeout{*}
\typeout{****}

%--------------------------------------------------------------------
% Declaration of options
%--------------------------------------------------------------------

\newif\ifnostrict

\DeclareOption{strict}{\nostrictfalse }
\DeclareOption{nostrict}{\nostricttrue }
\ProcessOptions \relax

%--------------------------------------------------------------------
% basic class for this one is report class
%--------------------------------------------------------------------

\LoadClass[
  a4paper,                      % see (g1)
%   portrait,                     % see (g2), LaTeX default, no such option in report.cls
  10pt,                         % see (g4)
  oneside,                      % see (g9)
  notitlepage,                  % see (TP) !!!
  openright,                    % see (h1), this is common custom
]{report}

%--------------------------------------------------------------------
% language - polish by default
%--------------------------------------------------------------------

%TODO: 1. 2.
\RequirePackage{polski}
\RequirePackage[T1]{fontenc}
\RequirePackage[cp1250]{inputenc}       % other options: utf8, latin2

%--------------------------------------------------------------------
% basic font
%--------------------------------------------------------------------

%TODO: (g3), 3.
\usepackage{helvet}
\usepackage{mathpazo}
\renewcommand{\familydefault}{\sfdefault}

%--------------------------------------------------------------------
% baseline see(g5)
%--------------------------------------------------------------------

\linespread{1.5} % factor 1.3 gives ,,one and a half'' line spacing

%--------------------------------------------------------------------
% margins see (g6)
%--------------------------------------------------------------------

\RequirePackage[%
    margin=2.5cm,
    a4paper,
%     includeheadfoot,
    bindingoffset=1cm
]{geometry}

%--------------------------------------------------------------------
% paragraph indentation see (g8)
%--------------------------------------------------------------------

\usepackage{indentfirst}

\ifnostrict
    \setlength{\parindent}{1.5 em}
\else
    \setlength{\parindent}{1.25cm}
\fi

%--------------------------------------------------------------------
% pagination see (g10)
%--------------------------------------------------------------------

\pagenumbering{arabic}

\RequirePackage{fancyhdr}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\fontsize{9pt}{9pt}\selectfont\thepage}%
   \renewcommand{\headrulewidth}{0.0pt}
}

\pagestyle{plain}

%--------------------------------------------------------------------
% headings
%--------------------------------------------------------------------
\RequirePackage[explicit, clearempty]{titlesec}

% chapter
\titleformat{\chapter}[hang]                    % see (h1)
{\bfseries\fontsize{12pt}{24pt}\selectfont}
{\thechapter.\quad}
{0pt}
{\MakeUppercase{#1}}
\titlespacing*{\chapter}{0pt}{0pt}{6pt}

% section
\titleformat{\section}                          % see (h2)
{\fontsize{11pt}{22pt}\selectfont\bfseries\itshape}
{\thesection.\quad}
{0pt}
{#1}
\titlespacing{\section}{0pt}{6pt}{6pt}

% subsection
\titleformat{\subsection}                       % see (h3)
{\normalfont\itshape}
{\thesubsection.\quad}
{0pt}
{#1}
\titlespacing{\subsection}{0pt}{6pt}{6pt}

%--------------------------------------------------------------------
% TOC (see (toc1)-(toc3)
%--------------------------------------------------------------------

%TODO: 6. 7. 8.

\RequirePackage{titletoc}
\renewcommand\bibname{Wykaz literatury} %Zmiana "Bibliografia" na "Wykaz literatury"
\titlecontents{chapter}
    [0em] % no indentation
    {}
    {\contentslabel[\thecontentslabel.]{2em}} % suitable only for one-digit and a comma
    {\hspace*{-1.5em}}                          % !
    {\dotfill\contentspage}

\titlecontents{section}
    [2em] % ie, 1.5em (chapter) + 0.5em
    {}
    {\contentslabel[\thecontentslabel.]{2em}}   %two digits and two dots
    {\hspace*{-2.3em}}                          % !
    {\dotfill\contentspage}

\titlecontents{subsection}
    [5em] % ie, 2em (section) + 3em
    {}
    {\contentslabel[\thecontentslabel.]{3em}}  %three digits and three dots
    {\hspace*{-2.3em}}                          % !
    {\dotfill\contentspage}
%--------------------------------------------------------------------
% enumerate and itemize see (e1), (e2)
%--------------------------------------------------------------------

%TODO 11. 12.

\RequirePackage{enumitem}

\setenumerate{
%     labelindent=0em,
%     itemindent=\indentenit,
    topsep=0pt,
    nolistsep,
    noitemsep,
%     align=left
    }
\setenumerate[1]{label=\arabic*.}   % first level 1.
\setenumerate[2]{label=\alph*)}     % second level a)

\setitemize{
%     labelindent=0em,
%     itemindent=\indentenit,
    topsep=0pt,
    noitemsep,
    nolistsep,
%     align=left
}

% \RequirePackage{textcomp} % for \textbullet and \textopenbullet only
% \setitemize[1]{label=\textbullet}   % first level \textbullet
% \setitemize[2]{label=\textopenbullet}     % second level \textopenbullet

%--------------------------------------------------------------------
% math
%--------------------------------------------------------------------

\RequirePackage{amsthm}

 
%%%%%%%% �rodowiska twierdznie� %%%%%%%%
\newtheoremstyle{SPPG_th1}% hnamei
{10pt plus5pt minus2pt}% hSpace abovei
{10pt plus3pt}% hSpace belowi
{}% hBody fonti
{}% hIndent amounti1
{\bfseries}% hTheorem head fonti
{.}% hPunctuation after theorem headi
{.5em}% hSpace after theorem headi2
{}% hTheorem head spec (can be left empty, meaning `normal')i
\theoremstyle{SPPG_th1}

\newtheorem{definicja}{Definicja}[chapter]
\newtheorem{twierdzenie}[definicja]{Twierdzenie}
\newtheorem{lemat}[definicja]{Lemat}
\newtheorem{fakt}[definicja]{Fakt}
\newtheorem{wniosek}[definicja]{Wniosek}
\newtheorem{przyklad}[definicja]{Przyk�ad}

%--------------------------------------------------------------------
% pictures
%--------------------------------------------------------------------

\RequirePackage{graphicx}
%captions should be given in smaller size than main text
\RequirePackage[font=small,labelfont=bf]{caption}
\RequirePackage{subfig}
%EOF

%---------------------- DODANE PRZEZ PS -----------------------------


\setlength{\intextsep}{0mm}		
\setlength{\textfloatsep}{0mm}


% zmiana nazwy, czcionki, marginesu i separatora dla listy figur
\renewcommand{\listfigurename}{Wykaz rysunk�w}

% zmiana nazwa, czcionki, marginesu i separatora dla listy tabel
\renewcommand{\listtablename}{Wykaz tabel}

% �eby nie by�o wd�w i sierot
\widowpenalty10000
\clubpenalty10000

% Modyfikacja podpisu rysunk�w (zmiana na Rys. X niepogrubione)
% Separator po identyfikatorze rysunku
\renewcommand{\figurename}{Rys.}
\DeclareCaptionLabelSeparator{dot}{. }
\captionsetup[figure]{justification=centering,labelfont=md} % inaczej niz w tabelach - zawsze centruj podpis
\captionsetup[figure]{labelsep=dot} % u�yj kropki jako separatora ale nie pogrubiaj


%----------------------------- DODANIE POLECE� KONFIGURACYJNYCH ------------

\usepackage[unicode=true]{hyperref}
\usepackage{float}
\usepackage{caption}
\usepackage{pdfpages}
\usepackage{multicol} % do sk�adu w dw�ch kolumnach
\usepackage{listings} % do prezentowania listingu kodu
\usepackage{color}



%----------------------Konfiguracja listing�w----------------
%------------------------------------------------------------

% Definicje kolor�w
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstdefinestyle{customc}{
  belowcaptionskip=0.9\baselineskip,
  breaklines=true,
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=3pt,                   % how far the line-numbers are from the code
  numberstyle=\footnotesize\color{mygray}, % the style that is used for the line-numbers
  xleftmargin=\parindent,
  showstringspaces=false,
  basicstyle=\normalsize\ttfamily,
  keywordstyle=\bfseries\color{green},
  commentstyle=\itshape\color{red},
  identifierstyle=\color{blue},
  stringstyle=\color{orange},
  stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
  language=C,                 % the language of the code
}

\lstdefinestyle{matlab}{
  backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or  ast arg
  basicstyle=\footnotesize,        % the size of the fonts that are used for the code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  commentstyle=\color{mygreen},    % comment style
  deletekeywords={...},            % if you want to delete keywords from the given language
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  firstnumber=1000,                % start line enumeration with line 1000
  frame=single,	                   % adds a frame around the code
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\color{blue},       % keyword style
  language=Octave,                 % the language of the code
  morekeywords={*,...},            % if you want to add more keywords to the set
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=2,                    % the step between two line-numbers. If it's 1, each line will be numbered
  stringstyle=\color{mymauve},     % string literal style
  tabsize=2,	                   % sets default tabsize to 2 spaces
  title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}