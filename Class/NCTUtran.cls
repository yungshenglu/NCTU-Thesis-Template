%----------------------------------------------------------------------
% 本文件係採用創用 "CC 姓名標示-非商業性-相同方式分享 3.0 台灣" 授權條款授權
% (https://creativecommons.org/licenses/by-nc-sa/3.0/tw/legalcode)
%
% 本授權條款允許使用者重製、散布、傳輸以及修改著作，但不得為商業目的之使用。若使
% 用者修改該著作時，僅得依本授權條款或與本授權條款類似者來散布該衍生作品。使用時
% 必須按照著作人指定的方式表彰其姓名。
%----------------------------------------------------------------------
% AUTHOR: Yung-Sheng Lu
% SOURCE: https://github.com/yungshenglu
%----------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NCTUtran}[2019/07/17 V1.0 by Yung-Sheng Lu]

%----------------------------------------------------------------------
% DOCUMENT OPTIONS DECLARATION (文件選項定義)
%----------------------------------------------------------------------

% Inherent existing options from book document class
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{book}
}

% Declare options for thesis types: (default: master)
% 	1. thesis (master)
% 	2. dissertation (phd)
\newif\ifTHESISOPTIONmaster				\THESISOPTIONmastertrue
\newif\ifTHESISOPTIONphd				\THESISOPTIONphdfalse

\DeclareOption{master}{
	\THESISOPTIONmastertrue
	\THESISOPTIONphdfalse
}
\DeclareOption{phd}{
	\THESISOPTIONmasterfalse
	\THESISOPTIONphdtrue
}

% Declare options for the language used in thesis: (default: english)
% 	1. en (English)
% 	2. zh (Chinese)
\newif\ifTHESISOPTIONen					\THESISOPTIONentrue
\newif\ifTHESISOPTIONzh					\THESISOPTIONzhfalse

\DeclareOption{en}{
	\THESISOPTIONentrue
	\THESISOPTIONzhfalse
}
\DeclareOption{zh}{
	\THESISOPTIONenfalse
	\THESISOPTIONzhtrue
}

% Declare binding option: (default: disabled)
% HINT: Depend on the mode of thesis format
% 	1. review	: disabled
%	2. draft 	: disabled
%	3. final 	: enabled
\newif\ifTHESISOPTIONbinding			\THESISOPTIONbindingfalse

\DeclareOption{binding}{
	\THESISOPTIONbindingtrue
}

% Declare options for print modes: (default: draft)
% 	1. review	: for thesis writing (hide all front matters)
%	2. draft 	: draft for defence
%	3. final 	: print version
\newif\ifTHESISOPTIONreview				\THESISOPTIONreviewfalse
\newif\ifTHESISOPTIONdraft				\THESISOPTIONdrafttrue
\newif\ifTHESISOPTIONfinal				\THESISOPTIONfinalfalse

\DeclareOption{review}{
	\THESISOPTIONreviewtrue
	\THESISOPTIONdraftfalse
	\THESISOPTIONfinalfalse
	\THESISOPTIONbindingfalse
}

\DeclareOption{draft}{
	\THESISOPTIONreviewfalse
	\THESISOPTIONdrafttrue
	\THESISOPTIONfinalfalse
	\THESISOPTIONbindingfalse
}

\DeclareOption{final}{
	\THESISOPTIONreviewfalse
	\THESISOPTIONdraftfalse
	\THESISOPTIONfinaltrue
	\THESISOPTIONbindingtrue
}

% Declare watermark option: (default: disabled)
% HINT: Depend on the mode of thesis format:
%	1. review	: never shown
%	2. draft 	: print "DRAFT" in the background
%	3. final 	: print the watermark specified by \watermark{}
\newif\ifTHESISOPTIONwatermark			\THESISOPTIONwatermarkfalse
\DeclareOption{watermark}{
	\THESISOPTIONwatermarktrue
}

% Declare options for usage: (default: print)
%	1. print	: output with cover page
%	2. upload 	: output without cover page
\newif\ifTHESISOPTIONprint				\THESISOPTIONprintfalse
\newif\ifTHESISOPTIONupload				\THESISOPTIONuploadfalse

\DeclareOption{print}{
	\THESISOPTIONprinttrue
	\THESISOPTIONuploadfalse
}
\DeclareOption{upload}{
	\THESISOPTIONprintfalse
	\THESISOPTIONuploadtrue
}

% Load basic options
\ProcessOptions
\LoadClass[a4paper, 12pt, oneside]{book}

%----------------------------------------------------------------------
% BASIC PACKAGES (引用套件)
%----------------------------------------------------------------------

% For chinese typing
\usepackage[BoldFont, SlantFont, CJKchecksingle, CJKmath=true]{xeCJK}
% For font selection
\usepackage{fontspec}
% Determine currently running platform/OS
\usepackage{ifplatform}
% For indention (for Windows)
\usepackage{indentfirst}
% Double spacing and begin spacing
\usepackage{setspace}
% For the position of watermark 
\usepackage{tikz}
% For Watermark
\usepackage{eso-pic}
% For the index
\usepackage[xetex, hidelinks]{hyperref}
% For setting the maring of page
\usepackage{geometry}		
% For clearing the page number in empty even pages 
\usepackage{emptypage}
% For adding blank page after cover page and title page (two-side)
\usepackage{afterpage}
% For generating text for testing
\usepackage{lipsum}
% For using "\comment"
\usepackage{verbatim}
% For using "\bstctlcite"
\usepackage[retainorgcmds]{Class/IEEEtrantools}
% For converting arabic number to chinese number
\usepackage{Class/xCJKnumb}
% Formating titles of sectioning
\usepackage{titlesec}
% Formatting titles in ToC
\usepackage{titletoc}
% For centering ToC, LoF, and LoT
\usepackage[subfigure]{tocloft}
% For subfigure
%\usepackage{caption}
%\usepackage[labelformat=simple]{subcaption}
% Formatting the numbering of algorithm label
\usepackage[ruled, vlined]{algorithm2e}
% AMS math­e­mat­i­cal fa­cil­i­ties
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
\DeclareMathOperator{\dis}{dist}
% En­hanced sup­port for graph­ics
\usepackage{graphicx}
% Setting the path of figures
\graphicspath{{./Figures/}}
% For in­clude En­cap­su­lated PostScript
\usepackage{epsfig}
% For con­vert EPS to PDF us­ing Ghostscript
\usepackage{epstopdf}
% Im­proved in­ter­face for float­ing ob­jects
\usepackage{float}
% For multi-row table
\usepackage{multirow}
% Table style used in books
\usepackage{booktabs}
% Import PDF file
\usepackage{pdfpages}
% A generic doc­u­ment com­mand parser
\usepackage{xparse}

%---
\usepackage{psfrag}
\usepackage{subfigure}
\usepackage{type1cm}
\usepackage{threeparttable}
\usepackage{listings}
\usepackage{enumitem}
\usepackage{textcomp}
\usepackage{gensymb}
\usepackage{svg}
\floatstyle{plaintop}
\restylefloat{table}
\usepackage{dblfloatfix}
\usepackage{hhline}
\usepackage{wallpaper}
\usepackage{graphics}
\renewcommand{\baselinestretch}{1.5}

%----------------------------------------------------------------------
% PAGE FORMAT (頁面格式)
%----------------------------------------------------------------------

% Page margin
% HINT: Only valid in final mode
\ifTHESISOPTIONbinding	
	\geometry{left=3 cm, right=2 cm, top=2.5 cm, bottom=2.5 cm}
\else
	\geometry{left=2.5 cm, right=2.5 cm, top=2.5 cm, bottom=2.5 cm}
\fi

% Position of page number
\pagestyle{plain}
\setlength{\footskip}{1.5cm}

% Double spacing
\doublespacing

%----------------------------------------------------------------------
% FONT SETTING (字型設定)
%----------------------------------------------------------------------

%%% ENGLISH %%%
% Main font for English
\newcommand{\mainfont}[1]{
	\ifx &#1&
		\setmainfont[Ligatures=TeX]{Times New Roman}
	\else
		\setmainfont[Ligatures=TeX]{#1}
	\fi
}

% "Sans-serif" font for English
\newcommand{\sansfont}[1]{
	\ifx &#1&
		\setsansfont[Ligatures=TeX]{Arial}
	\else
		\setsansfont[Ligatures=TeX]{#1}
	\fi
}

%%% CHINESE %%%
% Main (serif) font for Chinese
\newcommand{\mainfontzh}[1]{
	\ifx &#1&
		\ifwindows		% Windows
			\setCJKmainfont{DFKai-SB}			% 標楷體
		\else\iflinux	% Linux
			\setCJKmainfont{AR PL UKai TW}		% AR PL 中楷
		\else\ifmacosx	% MacOS X
			\setCJKmainfont{Kaiti TC Regular}	% 楷體-繁
		\else			% '-shell-escape' is not set, using Windows fonts as default
			\setCJKmainfont{DFKai-SB}
		\fi \fi \fi
	\else
		\setCJKmainfont{#1}
	\fi
}

% Sans-serif font for Chinese
\newcommand{\sansfontzh}[1]{
	\ifx &#1&
		\ifwindows		% Windows
			\setCJKsansfont{PMingLiU}			% 新細明體
		\else\iflinux	% Linux
			\setCJKsansfont{AR PL UMing TW}		% AR PL 明體
		\else\ifmacosx	% MacOS X
			\setCJKsansfont{LiSong Pro}			% 儷宋 Pro (明體)
		\else			% '-shell-escape' is not set, using Windows fonts as default
			\setCJKsansfont{PMingLiU}
		\fi \fi \fi
	\else
		\setCJKsansfont{#1}
	\fi
}

% Enable line break for chinese
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

%----------------------------------------------------------------------
% MACROS (巨集)
%----------------------------------------------------------------------

% English title of thesis/dissertation
\def\enTitle#1{\gdef\@enTitle{#1}}
% Chinese title of thesis/dissertation
\def\zhTitle#1{\gdef\@zhTitle{#1}}
% English keywords of thesis/dissertation
\def\enKeywords#1{\gdef\@enKeywords{#1}}
% Chinese keywords of thesis/dissertation
\def\zhKeywords#1{\gdef\@zhKeywords{#1}}
% The year and month the completed thesis is submitted in English
\def\enDegreeYear#1{\gdef\@enDegreeYear{#1}}
\def\enDegreeMonth#1{\gdef\@enDegreeMonth{#1}}
% The year and month the completed thesis is submitted in Chinese
\def\zhDegreeYear#1{\gdef\@zhDegreeYear{#1}}
% The full (unabbreviated) name of the degree
\def\enDegree#1{\gdef\@enDegree{#1}}
% The name of your degree's field (e.g. Psychology, Computer Science)
\def\enField#1{\gdef\@enField{#1}}
% The type of thesis in English
\def\enThesisType#1{\gdef\@enThesisType{#1}}
% The type of thesis in Chinese
\def\zhThesisType#1{\gdef\@zhThesisType{#1}}
% The name of the institute in English
\def\enInstName#1{\gdef\@enInstName{#1}}
% The name of the institute in Chinese
\def\zhInstName#1{\gdef\@zhInstName{#1}}
% The name of college in English
\def\enCollegeName#1{\gdef\@enCollegeName{#1}}
% The name of college in Chinese
\def\zhCollegeName#1{\gdef\@zhCollegeName{#1}}
% The name of university in English
\def\enUnivName#1{\gdef\@enUnivName{#1}}
% The name of university in Chinese
\def\zhUnivName#1{\gdef\@zhUnivName{#1}}
% The location of university
\def\enLocation#1{\gdef\@enLocation{#1}}
% The name of student in English
\def\enStudentName#1{\gdef\@enStudentName{#1}}
% The name of student in Chinese
\def\zhStudentName#1{\gdef\@zhStudentName{#1}}
% The email of student
\def\studentEmail#1{\gdef\@studentEmail{#1}}
% The name of advisor in English
\def\enAdvisorName#1{\gdef\@enAdvisorName{#1}}
% The name of advisor in Chinese
\def\zhAdvisorName#1{\gdef\@zhAdvisorName{#1}}
% The email of advisor
\def\advisorEmail#1{\gdef\@advisorEmail{#1}}
% The name of co-advisor A in English
\def\enCoadvisorNameA#1{\gdef\@enCoadvisorNameA{#1}}
% The name of co-advisor A in Chinese
\def\zhCoadvisorNameA#1{\gdef\@zhCoadvisorNameA{#1}}
% The email of co-advisor A the advisor
\def\coadvisorEmailA#1{\gdef\@coadvisorEmailA{#1}}
% The name of co-advisor B in English
\def\enCoadvisorNameB#1{\gdef\@enCoadvisorNameB{#1}}
% The name of co-advisor B in Chinese
\def\zhCoadvisorNameB#1{\gdef\@zhCoadvisorNameB{#1}}
% The email of co-advisor B
\def\coadvisorEmailB#1{\gdef\@coadvisorEmailB{#1}}
% The path to watermark
\def\watermark#1{\gdef\@watermark{#1}}
% Title of Acknowledgement
\def\ackTitle#1{\gdef\@ackTitle{#1}}
% Title of Table of Contents
\def\tocTitle#1{\gdef\@tocTitle{#1}}
% Title of List of Figures
\def\lofTitle#1{\gdef\@lofTitle{#1}}
% Title of List of Tables (Comment out if unnecessary)
\def\lotTitle#1{\gdef\@lotTitle{#1}}
% Title of List of Bibliography
\def\bibTitle#1{\gdef\@bibTitle{#1}}
% Title of Curriculum Vitae
\def\cvTitle#1{\gdef\@cvTitle{#1}}
% Title of List of Publications
\def\lopTitle#1{\gdef\@lopTitle{#1}}
% Number of frontpages reserved for authorization and certification
\def\reservedFrontPages#1{\gdef\@reservedFrontPages{#1}}

%----------------------------------------------------------------------
% DEFAULT VALUES FOR MACROS (預設巨集參數值)
%----------------------------------------------------------------------

% Define macros related to degree
\ifTHESISOPTIONmaster
	\enThesisType{Thesis}
	\zhThesisType{碩士論文}
	\enDegree{Master}
	% HINT: Authorization + Chinese Certification
	\reservedFrontPages{2}
\else
	\enThesisType{Dissertation}
	\zhThesisType{博士論文}
	\enDegree{Doctor of Philosophy}
	% HINT: Authorization + Chinese Certification + Englush Certification
	\reservedFrontPages{3}
\fi

% Define language-related macros for front pages and back pages
\ifTHESISOPTIONzh
	\ackTitle{誌謝}
	\tocTitle{目\UTF{9304}}
	\lofTitle{圖目\UTF{9304}}
	\lotTitle{表目\UTF{9304}}
	\bibTitle{參考文獻}
	\cvTitle{自傳}
	\lopTitle{著作目\UTF{9304}}
\else
	\ackTitle{Acknowledgement}
	\tocTitle{Table of Contents}
	\lofTitle{List of Figures}
	% List of Tables (Comment out if unnecessary)
	\lotTitle{List of Tables}
	\ifTHESISOPTIONmaster
		\bibTitle{References}
	\else
		\bibTitle{Bibliography}
	\fi
	% HINT: PhD only
	\ifTHESISOPTIONphd				
		\cvTitle{Curriculum Vitae}
		\lopTitle{List of Publications}
	\fi
\fi

%----------------------------------------------------------------------
% TABLE OF CONTENTS / LIST OF FIGURES / LIST OF TABLES (目錄頁)
%----------------------------------------------------------------------

% Place the titles of ToC, LoF, and LoT to center and set the font of the titles
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\Huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\Huge\bfseries}
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\renewcommand{\cftloftitlefont}{\hspace*{\fill}\Huge\bfseries}
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}

% Set the language used in ToC, LoF, and LoT
\ifTHESISOPTIONzh
	\renewcommand{\contentsname}{\makebox[3em][s]{\@tocTitle}}
	\renewcommand{\listfigurename}{\makebox[4em][s]{\@lofTitle}}
	\renewcommand{\listtablename}{\makebox[4em][s]{\@lotTitle}}
	\renewcommand{\tablename}{表}
	\renewcommand{\figurename}{圖}
\else
	\renewcommand{\contentsname}{\@tocTitle}
	\renewcommand{\listfigurename}{\@lofTitle}
	\renewcommand{\listtablename}{\@lotTitle}
\fi

% Set the chapter numbering to Chinese number in ToC
\ifTHESISOPTIONzh
	\titlecontents{chapter}[0pt]{}
	{\bfseries\xCJKnumber{\thecontentslabel}、\hspace{0.5em}}{}
	{\cftdotfill{\cftdotsep}\contentspage}
\else
	% Format the chapter numbering in ToC when using English
	\titlecontents{chapter}[0pt]{}
	% Fix the chapter number within a box no matter it has 1 or 2 digits
	{\bfseries\makebox[1em][l]{\thecontentslabel}\hspace{0.25em}}{}
	{\cftdotfill{\cftdotsep}\contentspage}
\fi

% Adjust the position of the title of ToC, LoF, and LoT
\renewcommand\cftbeforetoctitleskip{-0.5cm}
\renewcommand\cftbeforeloftitleskip{-0.5cm}
\renewcommand\cftbeforelottitleskip{-0.5cm}

% A wraper to generate toc, lof, and lot
\def\maketocs{
	\ifTHESISOPTIONreview \else
		% Table of Contents
		\cleardoublepage
		\phantomsection
		\addcontentsline{toc}{chapter}{\textbf{\@tocTitle}}
		\tableofcontents
		% List of Figures
		\cleardoublepage
		\phantomsection
		\addcontentsline{toc}{chapter}{\textbf{\@lofTitle}}
		\listoffigures
		% List of Tables (Comment out if unnecessary)
		\cleardoublepage
		\phantomsection
		\addcontentsline{toc}{chapter}{\textbf{\@lotTitle}}
		\listoftables
	\fi
}

%----------------------------------------------------------------------
% CHAPTERS (章節內容)
%----------------------------------------------------------------------

% Set the position of chapter label and title
\ifTHESISOPTIONzh
	\titleformat{\chapter}[block]				% (place label and title body at the same line)
	{\centering\Huge\bfseries}
	{\xCJKnumber{\thechapter}、\hspace{0.5em}}	% (X、 ...)
	{0em}{}
\else
	\titleformat{\chapter}[display]				% (title body is placed at second line)
	{\centering\Huge\bfseries}
	{\chaptertitlename\ \thechapter}
	{0em}{}
% The following is the original chapter title format and label numbering style
% suggested by NCTU Thesis Format. But, such an English chapter title format is
% too ugly. Not mentioning that I need to number chapter label in Roman style,
% but use arabic style in section label, i.e. doing something like this:
%		 (chapter) II. Related Work
%		 (section)		 2.1 brabra
% Besides, generally, Roman style numbering is reserved for 'parts' in a book.
% Therefore, I made my own way. :)
%
%	\titleformat{\chapter}[block]% (place label and title body at the same line)
%	{\centering\Huge\bfseries}
%	{\Roman{chapter}.\hspace{0.5em}}
%	{0em}{}
\fi

% Set the spacing before and after chapter label/title
%	{type}{left}{before seperation}{after seperation}
\titlespacing*{\chapter}{0em}{-40pt}{*6}

%----------------------------------------------------------------------
% WATERMARK (浮水印)
%----------------------------------------------------------------------

% Set the source of watermark
\newcommand\BackgroundPicture{
	\ifTHESISOPTIONwatermark
		% For draft mode, print "DRAFT"
		\ifTHESISOPTIONdraft
			\setlength{\@tempdimb}{.5\paperwidth}
			\setlength{\@tempdimc}{.5\paperheight}
			\setlength{\unitlength}{1pt}
			\put(\strip@pt\@tempdimb,\strip@pt\@tempdimc){
			\makebox(0,0){\rotatebox{45}{\textcolor[gray]{0.75}
				{\fontsize{6cm}{6cm}\selectfont{DRAFT}}}}
			}
		\fi
		% HINT: For final mode, print the watermark specified by \watermark{}
		\ifTHESISOPTIONfinal
			\begin{tikzpicture}
				\node[minimum width=\paperwidth, minimum height=\paperheight, opacity=0.75]
					{\includegraphics[width=0.75\textwidth]{\@watermark}};
			\end{tikzpicture}
		\fi
	\fi
}

% Update \cleardoublepage to handle watermark
% 	\chapter{} implicity calls \cleardoublepage first, then starts to print chapter title and contents
\let\oldcleardoublepage\cleardoublepage
\renewcommand{\cleardoublepage}{
	% Remove watermark if previous page is a blank even page in twoside mode.
	\newpage
	\ClearShipoutPicture
	\oldcleardoublepage
	% Add watermark
	\AddToShipoutPicture{\BackgroundPicture}
}

%----------------------------------------------------------------------
% COMMANDS
%----------------------------------------------------------------------

% Change to uppercase of roman number
\newcommand{\RNum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

% Change margin of a period
%% \changemargin
\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
%% \endchangemargin
\let\endchangemargin=\endlist 

% Covert 'A' to 1, 'B' to 2, ...
% TODO:
% 	This is a workaround to show '附\UTF{9304}一' in the chapter label but 'A.1' in the
% section label of an appendix, rather than showing '1.1', which conflicts with
% the section label of a regular chapter. Hope someone can fix this in a smarter
% way.
\DeclareRobustCommand{\xCJKalphatozhnum}[1]{
	\ifnum \strcmp{#1}{A} = 0 一 \else
	\ifnum \strcmp{#1}{B} = 0 二 \else
	\ifnum \strcmp{#1}{C} = 0 三 \else
	\ifnum \strcmp{#1}{D} = 0 四 \else
	\ifnum \strcmp{#1}{E} = 0 五 \else
	\ifnum \strcmp{#1}{F} = 0 六 \else
	\ifnum \strcmp{#1}{G} = 0 七 \else
	\ifnum \strcmp{#1}{H} = 0 八 \else
	\ifnum \strcmp{#1}{I} = 0 九 \else
	\ifnum \strcmp{#1}{J} = 0 十 \else
	\ifnum \strcmp{#1}{K} = 0 十一 \else
	\ifnum \strcmp{#1}{L} = 0 十二 \else
	\ifnum \strcmp{#1}{M} = 0 十三 \else
	\ifnum \strcmp{#1}{N} = 0 十四 \else
	\ifnum \strcmp{#1}{O} = 0 十五 \else
	\ifnum \strcmp{#1}{P} = 0 十六 \else
	\ifnum \strcmp{#1}{Q} = 0 十七 \else
	\ifnum \strcmp{#1}{R} = 0 十八 \else
	\ifnum \strcmp{#1}{S} = 0 十九 \else
	\ifnum \strcmp{#1}{T} = 0 二十 \else 零
	\fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi \fi
}

%----------------------------------------------------------------------
% BIBLIPGRAPHY (參考書目)
%----------------------------------------------------------------------

% A wraper to add Bibliography to "Table of Contents"
\newcommand{\addBibToContents}{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{\@bibTitle}}
}

% Configure the name of References/Bibliography
\renewcommand{\bibname}{
	\makebox[5.5em][s]{\@bibTitle}
}

%----------------------------------------------------------------------
% ALGORITHMS (演算法)
%----------------------------------------------------------------------

% Change the numbering style of algorithms to [chapter].[algorithm]
% HINT: You need to use "\caption" before "\label"
%		\renewcommand{\thealgorithm}{\arabic{chapter}.\arabic{algorithm}}

%----------------------------------------------------------------------
% APPENDICIES (附錄)
%----------------------------------------------------------------------

% A wraper to reset the style of appendicies when 'zh' option is set
\newcommand{\addAppxToContents}{
	% Hide section, subsection from ToC
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
	\ifTHESISOPTIONzh
		% Set appendix numbering to Chiese style in ToC
		\titlecontents{chapter}[0pt]{}
		{\bfseries 附\UTF{9304}\xCJKalphatozhnum{\thecontentslabel}\quad}
		{}{\cftdotfill{\cftdotsep}\contentspage}

		% Set appendix title to Chinese style
		\titleformat{\chapter}[block]						% (place label and title body at the same line)
		{\centering\Huge\bfseries}
		{附\UTF{9304}\xCJKalphatozhnum{\thechapter}\quad}	% (X、 ...)
		{0em}{}
	\else
		% Format appendix title shown in ToC
		\titlecontents{chapter}[0pt]{}
		{\bfseries \appendixname\hspace{0.5em}\thecontentslabel\hspace{0.5em}}
		{}{\cftdotfill{\cftdotsep}\contentspage}
	\fi
}

%----------------------------------------------------------------------
% FIGURES (圖)
%----------------------------------------------------------------------

% Changing the format of subcaption for reference
\renewcommand\thesubfigure{ (\alph{subfigure})}

%----------------------------------------------------------------------
% CHINESE ACKNOWLEDGEMENT SIGNATURE (中文誌謝署名)
%----------------------------------------------------------------------

\def\zhAckSignature{
	\begin{flushright}
		\@zhStudentName \ 誌於 \\
		{{\@zhUnivName}{\@zhInstName}} \\
		\@zhDegreeYear
	\end{flushright}
}

%----------------------------------------------------------------------
% ENGLISH ACKNOWLEDGEMENT SIGNATURE (英文誌謝署名)
%----------------------------------------------------------------------

\def\enAckSignature{
	\begin{flushleft}
		\textbf{\@enStudentName} \\
		{{\@enInstName}, {\@enUnivName}} \\
		{{\@enDegreeMonth} {\@enDegreeYear}}
	\end{flushleft}
}

%----------------------------------------------------------------------
% CHINESE ABSTRACT KEYWORDS (中文摘要關鍵字)
%----------------------------------------------------------------------

\def\zhAbsKeywords{
	\begin{flushleft}
		{關鍵字：\textbf{\@zhKeywords}}
	\end{flushleft}
}

%----------------------------------------------------------------------
% ENGLISH ABSTRACT KEYWORDS (英文摘要關鍵字)
%----------------------------------------------------------------------

\def\enAbsKeywords{
	\begin{flushleft}
		{Keywords: \textbf{\@enKeywords}}
	\end{flushleft}
}

%----------------------------------------------------------------------
% COVER PAGE (封面頁)
%----------------------------------------------------------------------

\def\coverPage{
	\thispagestyle{empty}
	% University, institute, and title
	\begin{center}
		% University
		\fontsize{40}{40}{\makebox[10cm][s]{\@zhUnivName}} \\
		\vspace{1.5\baselineskip}
		% Institute
		\fontsize{28}{28}{\makebox[1.333\width][s]{\textbf{\@zhInstName}}} \\
		\vspace{1.5\baselineskip}
		% Thesis type
		\fontsize{24}{24}{\makebox[4.5cm][s]{\textbf{\@zhThesisType}}} \\
		\ifTHESISOPTIONdraft
			\vspace{1.5\baselineskip}
			\makebox[2cm][s]{\textbf{初稿}} \\
		\fi
		\vfill
		\singlespacing
		% Chinese title
		\LARGE{\@zhTitle} \\
		\vspace{0.75\baselineskip}
		% English title
		\LARGE{\@enTitle} \\
		\vfill
	\end{center}
	% Author & advisors
	\begin{flushleft}
		\singlespacing
		\LARGE
		\begin{tabular}{crll}
			% Author
			&\LARGE{\makebox[4em][s]{研究生}：}&{\@zhStudentName}&\vspace{1em} \\
			% Advisor
			&{指導教授：}&{\@zhAdvisorName}&{博士} \\
			% Co-advisor A
			\ifx \@zhCoadvisorNameA \@empty \else
				&&{\@zhCoadvisorNameA}&{博士} \\
			\fi
			% Co-advisor B
			\ifx \@zhCoadvisorNameB \@empty \else
				&&{\@zhCoadvisorNameB}&{博士} \\
			\fi
		\end{tabular}
	\end{flushleft}
	\vspace{1in}
	\vfill
	% Submission date in Chinese
	\begin{center}
		\makebox[2.5\width][s]{\large\@zhDegreeYear} \\
	\end{center}
}

%----------------------------------------------------------------------
% START PAGE (起始頁)
%----------------------------------------------------------------------

\def\startPage{
	\cleardoublepage
	\thispagestyle{empty}
	% University, institute, and title
	\begin{center}
		% University
		\fontsize{40}{40}{\makebox[10cm][s]{\@zhUnivName}} \\
		\vspace{1.5\baselineskip}
		% Institute
		\fontsize{28}{28}{\makebox[1.333\width][s]{\textbf{\@zhInstName}}} \\
		\vspace{1.5\baselineskip}
		% Thesis/Dissertation type
		\fontsize{24}{24}{\makebox[4.5cm][s]{\textbf{\@zhThesisType}}} \\
		\ifTHESISOPTIONdraft
			\vspace{1.5\baselineskip}
			\makebox[2cm][s]{\textbf{初稿}} \\
		\fi
		\vfill
		\singlespacing
		% Chinese title
		\LARGE{\@zhTitle} \\
		\vspace{0.75\baselineskip}
		% English title
		\LARGE{\@enTitle} \\
		\vfill
	\end{center}
	% Author & advisors
	\begin{flushleft}
		\singlespacing
		\LARGE
		\begin{tabular}{crll}
			% Author
			&\LARGE{\makebox[4em][s]{研究生}：}&{\@zhStudentName}&\vspace{1em} \\
			% Advisor
			&{指導教授：}&{\@zhAdvisorName}&{博士} \\
			% Co-advisor A
			\ifx \@zhCoadvisorNameA \@empty \else
				&&{\@zhCoadvisorNameA}&{博士} \\
			\fi
			% Co-advisor B
			\ifx \@zhCoadvisorNameB \@empty \else
				&&{\@zhCoadvisorNameB}&{博士} \\
			\fi
		\end{tabular}
	\end{flushleft}
	\vspace{1in}
	\vfill
	% Submission date in Chinese
	\begin{center}
		\makebox[2.5\width][s]{\large\@zhDegreeYear} \\
	\end{center}
}

%----------------------------------------------------------------------
% TITLE PAGE (標題頁)
%----------------------------------------------------------------------

\def\titlePage{
	\cleardoublepage
	\thispagestyle{empty}
	% Chinese and English titles
	\begin{center}
		\singlespacing\Large
		\@zhTitle \\
		\vspace{0.25\baselineskip}
		\@enTitle \\
		\vspace{0.25\baselineskip}
	\end{center}
	% Student name and advisor name in Chinese and English
	\begin{flushleft}
		\singlespacing
		\setlength{\tabcolsep}{0.25em}
		% Chinese name
		\begin{tabular}{rl}
			\large{\makebox[4em][s]{研究生}：}&\large{\@zhStudentName}\vspace{0.5em} \\
			\large{指導教授：}&{\large{\@zhAdvisorName}} \\
			\ifx \@zhCoadvisorNameA \@empty \else
				&{\large{\@zhCoadvisorNameA}} \\
			\fi
			\ifx \@zhCoadvisorNameB \@empty \else
				&{\large{\@zhCoadvisorNameB}} \\
			\fi
		\end{tabular}
		\hfill
		% English name
		\begin{tabular}{rl}
			\large{Student:}&{\large{\@enStudentName}}\vspace{0.5em} \\
			\large{Advisor:}&{\large{\@enAdvisorName}} \\
			\ifx \@enCoadvisorNameA \@empty \else
				&{\large{\@enCoadvisorNameA}} \\
			\fi
			\ifx \@enCoadvisorNameB \@empty \else
				&{\large{\@enCoadvisorNameB}} \\
			\fi
		\end{tabular}
	\end{flushleft}
	\vfill
	% University & institute & thesis type in Chinese
	\begin{center}
		\makebox[2\width][s]{\large\@zhUnivName} \\
		\makebox[1.33\width][s]{\large\@zhInstName} \\
		\ifTHESISOPTIONdraft
			\makebox[1.33\width][s]{\large\@zhThesisType 初稿} \\
		\else
			\makebox[1.33\width][s]{\large\@zhThesisType} \\
		\fi
		\vfill
		% Submission description in English
		\ifTHESISOPTIONdraft
			\centerline{{A \@enThesisType\ Draft}}
		\else
			\centerline{{A \@enThesisType}}
		\fi
		Submitted to {\@enInstName} \\
		\@enCollegeName \\
		\@enUnivName \\
		in partial fulfilment of the requirements \\
		for the Degree of \\
		\@enDegree \\
		in \\
		\vspace{0.5\baselineskip}
		\@enField \\
		\vspace{\baselineskip}
		\vfill
		% Submission date and location
		{{\@enDegreeMonth} {\@enDegreeYear}} \\
		\vspace{0.25\baselineskip}
		\@enLocation \\
		\vfill
		\makebox[1.75\width][s]{\normalsize\@zhDegreeYear}
	\end{center}
}

%----------------------------------------------------------------------
% COPYRIGHT PAGE (版權頁)
%----------------------------------------------------------------------

\def\copyrightPage{
	\cleardoublepage
	\thispagestyle{empty}
	\rule[0pt]{0pt}{0pt} \\
	\vspace{2.5in}
	\rule[0pt]{0pt}{0pt} \\
	\begin{center}
		\copyright {\@enDegreeYear} - {\@enStudentName} \\
		\vspace{0.5\baselineskip}
		All rights reserved. \\
	\end{center}
}

%----------------------------------------------------------------------
% CHINESE CERTIFICATION (中文論文審定書)
%----------------------------------------------------------------------

\def\zhCertPage{
	\cleardoublepage
	\ClearShipoutPicture		% HINT: Remove watermark in this page
	\thispagestyle{empty}
	\phantomsection
}

%----------------------------------------------------------------------
% ENGLISH CERTIFICATION PAGE (英文論文審定書)
%----------------------------------------------------------------------

\def\enCertPage{
	\cleardoublepage
	\ClearShipoutPicture		% HINT: Remove watermark in this page
	\thispagestyle{empty}
	\phantomsection
}

%----------------------------------------------------------------------
% AUTHORIZATION PAGE (授權書)
%----------------------------------------------------------------------

\def\zhAuthPage{
	\cleardoublepage
	\ClearShipoutPicture		% HINT: Remove watermark in this page
	\thispagestyle{empty}
	\phantomsection
}

%----------------------------------------------------------------------
% \maketitle REDEFINITION (重訂標題格式)
%----------------------------------------------------------------------

\def\maketitle{{
	\ifTHESISOPTIONreview \else
		% Cover page (封面頁)
		% HINT: Only for final mode
		\ifTHESISOPTIONprint
			\coverPage
		\fi

		% Start page (起始頁)
		\startPage

		% Title page (標題頁)
		\titlePage

		% Copyright page (版權頁)
		% HINT: Only for final mode
		\ifTHESISOPTIONfinal
			\copyrightPage
		\fi

		% Chinese certification page (中文論文審定書)
		\zhCertPage

		% English certification page (英文論文審定書) [PhD only]
		%\enCertPage

		% Authorization page (授權書)
		\zhAuthPage
	\fi
}}

%----------------------------------------------------------------------
% CHINESE ABSTRACT (中文摘要)
%----------------------------------------------------------------------

% Page layout of Chinese abstract
\def\zhAbsPage{
	\cleardoublepage
	% HINT: Reserve front pages for authentication page and certification page in final mode
	\ifTHESISOPTIONfinal
		\setcounter{page}{\the\numexpr\@reservedFrontPages+\arabic{page}\relax}
	\fi
	% Set page numbering to 'roman' (i, ii, iii, ...)
	\frontmatter
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{摘要}}
	\begin{center}
		\singlespacing
		% Thesis title
		{\Large \bf \@zhTitle} \\
		\vspace{\baselineskip}
		% Author and advisors
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr}
			\setlength{\tabcolsep}{0.25em}
			% Author
			\begin{tabular}{rl}
				\large{學生：}&{\large{\@zhStudentName}} \\
			\end{tabular}&
			\setlength{\tabcolsep}{0.25em}
			\begin{tabular}{rlc}
				% Advisor
				\large{指導教授：}&{\large{\@zhAdvisorName}}&{\large{博士}} \\
				% Co-advisor A
				\ifx \@zhCoadvisorNameA \@empty \else
					&{\large{\@zhCoadvisorNameA}}&{\large{博士}} \\
				\fi
				% Co-advisor B
				\ifx \@zhCoadvisorNameB \@empty \else
					&{\large{\@zhCoadvisorNameB}}&{\large{博士}} \\
				\fi
			\end{tabular} \\
		\end{tabular*} \\
		% Institute and university name
		\vspace{0.5\baselineskip}
		\large{\@zhUnivName\hspace{1ex}\@zhInstName} \\
		\vspace{\baselineskip}
		% Abstract title
		\Large{\textbf{摘\qquad 要}} \\
	\end{center}
}

% New environment for Chinese Abstract
\newenvironment{zhAbstract}{
	\ifTHESISOPTIONreview \else
		\zhAbsPage
		% Start a new paragraph and force the first line being indented
		\par
	\fi
	% Ignore input tex in review mode
	\ifTHESISOPTIONreview
		\comment
	\fi	
} {
	\ifTHESISOPTIONreview
		\endcomment
	\fi
}

%----------------------------------------------------------------------
% ENGLISH ABSTRACT (英文摘要)
%----------------------------------------------------------------------

% Page layout of English abstract
\def\enAbsPage{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{Abstract}}
	\begin{center}
		\singlespacing
		% Thesis title
		{\Large \bf \@enTitle} \\
		\vspace{\baselineskip}
		% Author and advisors
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr}
			\setlength{\tabcolsep}{0.25em}
			% Author
			\begin{tabular}{rl}
				\large{Student:}&{\large{\@enStudentName}} \\
			\end{tabular}&
			\setlength{\tabcolsep}{0.25em}
			\begin{tabular}{rl}
				% Advisor
				\large{Advisor:}&{\large{Dr. \@enAdvisorName}} \\
				% Co-advisor A
				\ifx \@enCoadvisorNameA \@empty \else
					&{\large{Dr. \@enCoadvisorNameA}} \\
				\fi
				% Co-advisor B
				\ifx \@enCoadvisorNameB \@empty \else
					&{\large{Dr. \@enCoadvisorNameB}} \\
				\fi
			\end{tabular} \\
		\end{tabular*} \\
		% Institue and university name
		\vspace{0.5\baselineskip}
		\large{\@enInstName} \\
		\large{\@enUnivName} \\
		\vspace{\baselineskip}
		% Abstract title
		\Large{\textbf{Abstract}} \\
	\end{center}
}

% New environment for English abstract
\newenvironment{enAbstract}{
	\ifTHESISOPTIONreview \else
		\enAbsPage
		% Start a new paragraph and force the first line being indented
		\par
	\fi
	% Ignore input tex in review mode
	\ifTHESISOPTIONreview
		\comment
	\fi	
} {
	\ifTHESISOPTIONreview
		\endcomment
	\fi
}

%----------------------------------------------------------------------
% ACKNOWLEDGEMENT (誌謝)
%----------------------------------------------------------------------

\def\ackPage{
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{\@ackTitle}}
	\begin{center}
		\ifTHESISOPTIONzh
			{\LARGE \bf \makebox[3em][s]{\@ackTitle}} \\
		\else
			{\LARGE \bf \@ackTitle} \\
		\fi
	\end{center}
}

\newenvironment{acknowledgement}{
	\ifTHESISOPTIONfinal
		\ackPage
		% Start a new paragraph and force the first line being indented
		\par
	\fi
	% Ignore input tex if not in final mode
	\ifTHESISOPTIONfinal \else \comment \fi
} {
	\ifTHESISOPTIONfinal \else \endcomment \fi
}

%----------------------------------------------------------------------
% DEDICATION (題獻頁) [PhD only]
%----------------------------------------------------------------------

\newenvironment{dedication}{
	\ifTHESISOPTIONfinal
		\ifTHESISOPTIONphd
			\cleardoublepage
			\thispagestyle{empty}
			\vspace*{6.6cm}
			\begin{center}
		\fi 
	\fi
	% Ignore input tex if not in the final mode of a PhD dissertation
	\ifTHESISOPTIONfinal
		\ifTHESISOPTIONphd \else
			\comment
		\fi
	\else
		\comment
	\fi
} {
	\ifTHESISOPTIONfinal
		\ifTHESISOPTIONphd \else
			\endcomment
		\fi
	\else
		\endcomment
	\fi
	\ifTHESISOPTIONfinal
		\ifTHESISOPTIONphd
			\end{center}
		\fi
	\fi
}

%----------------------------------------------------------------------
% CURRICULUM VITAE (作者簡歷) [PhD only]
%----------------------------------------------------------------------
	
\newenvironment{vita}{
	% HINT: Only be compiled in the draft or final mode of a PhD dissertation
	\ifTHESISOPTIONreview
		\comment
	\else
		\ifTHESISOPTIONphd \else
			\comment
		\fi
	\fi
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{\@cvTitle}}
	\ifTHESISOPTIONzh
		\chapter*{\makebox[3em][s]{\@cvTitle}}
	\else
		\chapter*{\@cvTitle}
	\fi
} {
	\ifTHESISOPTIONreview
		\endcomment
	\else
		\ifTHESISOPTIONphd \else
			\endcomment
		\fi
	\fi
}

%----------------------------------------------------------------------
% PUBLICATIONS (著作列表) [PhD only]
%----------------------------------------------------------------------

\newenvironment{publications}{
	% HINT: Only be compiled in the draft or final mode of a PhD dissertation
	\ifTHESISOPTIONreview
		\comment
	\else
		\ifTHESISOPTIONphd \else
			\comment
		\fi
	\fi
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{\@lopTitle}}
	\ifTHESISOPTIONzh
		\chapter*{\makebox[5.5em][s]{\@lopTitle}}
	\else
		\chapter*{\@lopTitle}
	\fi
} {
	\ifTHESISOPTIONreview
		\endcomment
	\else
		\ifTHESISOPTIONphd \else
			\endcomment
		\fi
	\fi
}

\endinput
