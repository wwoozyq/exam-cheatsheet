% cheatsheet.cls — High-density exam cheatsheet document class
% https://github.com/wwoozyq/exam-cheatsheet
% License: MIT
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2026/06/04 Exam cheatsheet class]

%% ============================================================
%% Key-value options
%% ============================================================
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=cs,prefix=cs@}

\DeclareStringOption[zh]{lang}       % zh | en
\DeclareStringOption[5]{cols}        % 3 | 4 | 5 | 6
\DeclareStringOption[a4]{paper}      % a4 | a3 | b5
\DeclareStringOption[6pt]{fontsize}  % 5pt - 8pt
\DeclareStringOption[classic]{scheme}% classic | ocean | forest | sunset | mono
\DeclareBoolOption[true]{landscape}  % landscape by default

\ProcessKeyvalOptions*

%% ============================================================
%% Base class
%% ============================================================
\LoadClass[8pt]{extarticle}

%% ============================================================
%% Geometry
%% ============================================================
\RequirePackage{geometry}

\def\cs@margin{4mm}
\def\cs@papername{\cs@paper paper}

% A3 gets slightly larger margin
\def\cs@paper@aiii{a3}
\ifx\cs@paper\cs@paper@aiii\def\cs@margin{5mm}\fi

\ifcs@landscape
  \geometry{paper=\cs@papername,landscape,margin=\cs@margin}
\else
  \geometry{paper=\cs@papername,margin=\cs@margin}
\fi

%% ============================================================
%% Language & Fonts
%% ============================================================
\RequirePackage{ifthen}

\newboolean{cs@iszh}
\ifthenelse{\equal{\cs@lang}{zh}}{\setboolean{cs@iszh}{true}}{\setboolean{cs@iszh}{false}}

\ifthenelse{\boolean{cs@iszh}}{%
  % Chinese: ctex handles CJK fonts automatically per platform
  \RequirePackage[UTF8,scheme=plain]{ctex}
  \RequirePackage{fontspec}
  \xeCJKDeclareCharClass{CJK}{%
    "2460->"24FF, "3000->"303F, "FF00->"FFEF, "2605->"2606, "2025->"2026}
}{%
  % English: lmodern (Latin Modern via TeX-native mechanism)
  \RequirePackage{fontspec}
  \RequirePackage{lmodern}
}

%% ============================================================
%% Core packages
%% ============================================================
\RequirePackage{multicol}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{array}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}

%% ============================================================
%% Color schemes
%% ============================================================
\def\cs@scheme@classic{classic}
\def\cs@scheme@ocean{ocean}
\def\cs@scheme@forest{forest}
\def\cs@scheme@sunset{sunset}
\def\cs@scheme@mono{mono}

% Classic (default)
\definecolor{sectioncolor}{RGB}{0,51,153}
\definecolor{conceptcolor}{RGB}{0,128,160}
\definecolor{processcolor}{RGB}{120,40,140}
\definecolor{categorycolor}{RGB}{0,120,60}
\definecolor{comparecolor}{RGB}{180,30,60}
\definecolor{importantbg}{RGB}{255,240,140}
\definecolor{codebg}{RGB}{245,245,245}
\definecolor{thmcolor}{RGB}{40,80,160}
\definecolor{warncolor}{RGB}{200,120,0}

\ifx\cs@scheme\cs@scheme@ocean
  \definecolor{sectioncolor}{RGB}{20,60,140}
  \definecolor{conceptcolor}{RGB}{0,110,140}
  \definecolor{processcolor}{RGB}{60,80,160}
  \definecolor{categorycolor}{RGB}{0,130,120}
  \definecolor{comparecolor}{RGB}{180,80,80}
  \definecolor{importantbg}{RGB}{240,235,150}
  \definecolor{codebg}{RGB}{240,248,250}
  \definecolor{thmcolor}{RGB}{20,80,140}
  \definecolor{warncolor}{RGB}{180,100,20}
\fi

\ifx\cs@scheme\cs@scheme@forest
  \definecolor{sectioncolor}{RGB}{40,80,40}
  \definecolor{conceptcolor}{RGB}{0,110,90}
  \definecolor{processcolor}{RGB}{120,80,40}
  \definecolor{categorycolor}{RGB}{60,110,40}
  \definecolor{comparecolor}{RGB}{160,60,30}
  \definecolor{importantbg}{RGB}{240,230,150}
  \definecolor{codebg}{RGB}{245,248,242}
  \definecolor{thmcolor}{RGB}{40,90,60}
  \definecolor{warncolor}{RGB}{180,100,20}
\fi

\ifx\cs@scheme\cs@scheme@sunset
  \definecolor{sectioncolor}{RGB}{180,60,40}
  \definecolor{conceptcolor}{RGB}{200,90,30}
  \definecolor{processcolor}{RGB}{160,40,100}
  \definecolor{categorycolor}{RGB}{180,130,40}
  \definecolor{comparecolor}{RGB}{200,40,60}
  \definecolor{importantbg}{RGB}{255,235,140}
  \definecolor{codebg}{RGB}{255,250,245}
  \definecolor{thmcolor}{RGB}{180,60,60}
  \definecolor{warncolor}{RGB}{220,100,0}
\fi

\ifx\cs@scheme\cs@scheme@mono
  \definecolor{sectioncolor}{RGB}{40,40,40}
  \definecolor{conceptcolor}{RGB}{80,80,80}
  \definecolor{processcolor}{RGB}{60,60,60}
  \definecolor{categorycolor}{RGB}{100,100,100}
  \definecolor{comparecolor}{RGB}{30,30,30}
  \definecolor{importantbg}{RGB}{230,230,230}
  \definecolor{codebg}{RGB}{240,240,240}
  \definecolor{thmcolor}{RGB}{50,50,50}
  \definecolor{warncolor}{RGB}{70,70,70}
\fi

%% ============================================================
%% Section titles
%% ============================================================
\titleformat{\section}{\fontsize{7}{8}\bfseries\color{sectioncolor}}{}{0pt}{}
\titleformat{\subsection}{\fontsize{6}{7}\bfseries\color{conceptcolor}}{}{0pt}{}
\titlespacing*{\section}{0pt}{1.5pt}{0.5pt}
\titlespacing*{\subsection}{0pt}{1pt}{0pt}

%% ============================================================
%% Lists (zero spacing)
%% ============================================================
\setlist[itemize]{leftmargin=*,nosep,topsep=0pt,parsep=0pt,itemsep=0pt,label=$\cdot$}
\setlist[enumerate]{leftmargin=*,nosep,topsep=0pt,parsep=0pt,itemsep=0pt}

%% ============================================================
%% Density optimizations
%% ============================================================
\tolerance=9999
\emergencystretch=3em
\hyphenpenalty=10000
\exhyphenpenalty=10000
\sloppy
\raggedright

\linespread{1.0}
\renewcommand{\arraystretch}{0.9}

\pagestyle{empty}
\setlength{\columnsep}{4pt}
\setlength{\columnseprule}{0.2pt}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

%% ============================================================
%% Semantic highlight commands
%% ============================================================
\newcommand{\concept}[1]{{\bfseries\color{conceptcolor}#1}}
\newcommand{\process}[1]{{\bfseries\color{processcolor}#1}}
\newcommand{\category}[1]{{\bfseries\color{categorycolor}#1}}
\newcommand{\compare}[1]{{\bfseries\color{comparecolor}#1}}
\newcommand{\important}[1]{{\bfseries\color{sectioncolor}#1}}

%% ============================================================
%% Environments
%% ============================================================

% cmpbox — comparison/contrast (left red bar)
\newtcolorbox{cmpbox}[1][]{%
  enhanced,breakable,
  colback=white,frame hidden,boxrule=0pt,sharp corners,
  borderline west={0.8pt}{0pt}{comparecolor},
  left=4pt,right=2pt,top=0.5pt,bottom=0.5pt,
  before skip=1pt,after skip=1pt,
  before upper={\textbf{\color{comparecolor}\footnotesize#1}\par\vspace{0.5pt}}
}

% thmbox — theorem/formula (left blue bar)
\newtcolorbox{thmbox}[1][]{%
  enhanced,breakable,
  colback=white,frame hidden,boxrule=0pt,sharp corners,
  borderline west={0.8pt}{0pt}{thmcolor},
  left=4pt,right=2pt,top=0.5pt,bottom=0.5pt,
  before skip=1pt,after skip=1pt,
  before upper={\textbf{\color{thmcolor}\footnotesize#1}\par\vspace{0.5pt}}
}

% warnbox — warning/pitfall (left orange bar)
\newtcolorbox{warnbox}[1][]{%
  enhanced,breakable,
  colback=white,frame hidden,boxrule=0pt,sharp corners,
  borderline west={0.8pt}{0pt}{warncolor},
  left=4pt,right=2pt,top=0.5pt,bottom=0.5pt,
  before skip=1pt,after skip=1pt,
  before upper={\textbf{\color{warncolor}\footnotesize#1}\par\vspace{0.5pt}}
}

% codebox — code/pseudocode (gray background)
\newtcolorbox{codebox}[1][]{%
  enhanced,breakable,
  colback=codebg,frame hidden,boxrule=0pt,sharp corners,
  left=3pt,right=2pt,top=1pt,bottom=1pt,
  before skip=1pt,after skip=1pt,
  fontupper=\fontsize{5}{6}\selectfont\ttfamily,
  before upper={\ifthenelse{\equal{#1}{}}{}{\textnormal{\textbf{\footnotesize#1}}\par\vspace{0.5pt}}}
}

% formula — must-memorize formula (yellow highlight)
\newtcolorbox{formula}[1][]{%
  enhanced,breakable,
  colback=importantbg,frame hidden,boxrule=0pt,sharp corners,
  left=3pt,right=2pt,top=1pt,bottom=1pt,
  before skip=1pt,after skip=1pt,
  before upper={\ifthenelse{\equal{#1}{}}{}{\textbf{\footnotesize#1}\par\vspace{0.5pt}}}
}

%% ============================================================
%% Abbreviation macros (language-dependent)
%% ============================================================
\ifthenelse{\boolean{cs@iszh}}{%
  % Chinese abbreviations
  \newcommand{\dn}{定义}
  \newcommand{\thm}{定理}
  \newcommand{\prf}{证}
  \newcommand{\eg}{例}
  \newcommand{\nb}{注}
  \renewcommand{\iff}{\ensuremath{\Leftrightarrow}}
  \newcommand{\imp}{\ensuremath{\Rightarrow}}
  \newcommand{\bcs}{\ensuremath{\because}}
  \renewcommand{\so}{\ensuremath{\therefore}}
}{%
  % English abbreviations
  \newcommand{\defn}{Def.}
  \newcommand{\thm}{Thm.}
  \newcommand{\prf}{Pf.}
  \newcommand{\eg}{e.g.}
  \newcommand{\nb}{N.B.}
  \renewcommand{\iff}{\ensuremath{\Leftrightarrow}}
  \newcommand{\imp}{\ensuremath{\Rightarrow}}
  \newcommand{\bcs}{\ensuremath{\because}}
  \renewcommand{\so}{\ensuremath{\therefore}}
}

%% ============================================================
%% Document start helper
%% ============================================================
\newlength{\cs@basesize}
\newlength{\cs@baselineskip}
\setlength{\cs@basesize}{\cs@fontsize}
\setlength{\cs@baselineskip}{\dimexpr\cs@basesize*115/100\relax}

\newcommand{\startcols}{%
  \fontsize{\cs@basesize}{\cs@baselineskip}\selectfont
  \begin{multicols*}{\cs@cols}
}
\newcommand{\stopcols}{\end{multicols*}}

\endinput
