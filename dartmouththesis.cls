%% dartmouththesis.cls
%% version 0.1  --  2014 May 15
%%
%% author: Gregory A. Feiden
%%   date: 2014 May 15
%%
%% License: Beerware (revision 42)                                    
%%          ----------------------                                    
%%          Gregory Feiden wrote this file. As long as you retain     
%%          this notice you can do whatever you want with this code.  
%%          If we meet some day and you think this code is worth it,  
%%          you can buy me a beer in return.                          
%%
%%
%% Package options
%%
%%     [artsci]  ::  meets requirements for College of Arts & Sciences
%%     [links]   ::  invoke hyperref with default blue link coloring
%%     [code]    ::  allow for importation of code directly from a file
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dartmouththesis}[2014/05/15 Dartmouth College Thesis class]
%\newcommand\darthesis@ver{0.1 -- 2014/05/15}

%% Build thesis upon "report" class
\LoadClass[12pt]{report}

%% Package Dependencies
%%   Page formatting
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage{lscape}
%%   Math packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
%%   Figure handling
\RequirePackage{graphicx}
\RequirePackage{epsfig}
\RequirePackage{pslatex}
%%   Table handling
\RequirePackage{longtable}
%%   Captions
\RequirePackage[labelfont=bf]{caption}
%%   Bibliography 
\RequirePackage{natbib}

%%   Extra features
\RequirePackage{hyperref}
\RequirePackage{listings}

\DeclareOption{links}{
    \hypersetup{bookmarks  = true,
                colorlinks = true,
                linkcolor  = blue,
                citecolor  = blue,
                urlcolor   = blue}
    \urlstyle{same}
}
\DeclareOption{code}{
    \lstset{
        frame=tb,
        aboveskip=3mm,
        belowskip=3mm,
        showstringspaces=false,
        columns=flexible,
        basicstyle={\small\ttfamily},
        numbers=none,
        numberstyle=\tiny\color{Gray},
        keywordstyle=\color{Maroon},
        commentstyle=\color{MidnightBlue},
        stringstyle=\color{Magenta},
        breaklines=true,
        breakatwhitespace=true
        tabsize=4
    }
}

%%   Arts & Sciences Formatting (circa 2013)
\DeclareOption{artsci}{
    \geometry{left=1.5in, right=1in, top=1in, bottom=1in}
    \captionsetup[table]{textfont=sc, labelsep=newline, labelformat=simple, justification=centering}
    \captionsetup[figure]{textfont=normalfont, labelsep=colon, labelformat=simple}
    \renewcommand{\thefigure}{\thechapter.\arabic{figure}}
    \renewcommand{\thetable}{\thechapter.\arabic{table}}
    \doublespacing
    \pagestyle{plain}
    \citestyle{aa}
}

\ExecuteOptions{artsci,code}
\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Generate command to make thesis title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\fieldofstudy}[1]{\gdef\@fieldofstudy{#1}}
\newcommand{\location}[1]{\gdef\@location{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\actingdean}[1]{\gdef\@actingdean{#1}}
\newcommand{\committee}[4]{\gdef\@chair{#1}\gdef\@internalB{#2}\gdef\@internalC{#3}\gdef\@external{#4}}
\newcommand\maketitlepage{
    \thispagestyle{empty}

    \begin{center}
        {\MakeUppercase{\textbf{\@title}}} \\ 
        A Thesis                           \\
        Submitted to the Faculty           \\
        in partial fulfillment of the requirements for the \\
        degree of                          \\
        \@degree                           \\
        in                                 \\
        \@fieldofstudy                     \\
        by                                 \\
        \@author                           \\       
        {\MakeUppercase \@institute}       \\ 
        {\@location}                       \\
        \today                             \\
        \vspace{\baselineskip}             
    \end{center}
    
    \vspace*{\fill}
    
    \begin{minipage}[b]{\linewidth}
        
        \begin{flushright}
            \begin{minipage}[b]{0.45\linewidth}
                \begin{center}
                    Examining Committee:
                \end{center}
                \vspace{0.5in}
                \hrule \vspace{0.1in}
                \@chair\ (Chair)     \\ \vspace{0.3in}
                \hrule \vspace{0.1in}
                \@internalB\         \\ \vspace{0.3in}
                \hrule \vspace{0.1in}
                \@internalC\         \\ \vspace{0.3in}
                \hrule \vspace{0.1in} 
                \@external\
            \end{minipage}
        \end{flushright}

        \begin{flushleft}
            \vspace*{-0.44in}
            \singlespacing
            \begin{minipage}[b]{0.45\linewidth}
                \hrule \vspace{0.1in}
                \@actingdean \\
                Dean of Graduate Studies
            \end{minipage}
        \end{flushleft}

    \end{minipage}
    \newpage
}


