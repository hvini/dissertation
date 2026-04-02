\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufscar}

\DeclareOption{tesedr}{
\def\@tipotrabalho{Ph.D. qualifying exam}
\def\@worktype{Ph.D. Thesis}
\def\@nivelPos{Ph.D.}
\def\@niveltrabalho{Ph.D. thesis}
}

\DeclareOption{qualidr}{
\def\@tipotrabalho{Qualificação de doutorado}
\def\@worktype{Ph.D. Thesis}
\def\@nivelPos{Ph.D.}
\def\@niveltrabalho{Ph.D. thesis}
}

\DeclareOption{dissertmst}{
\def\@tipotrabalho{Master's thesis}
\def\@worktype{Master Thesis}
\def\@nivelPos{Master}
\def\@niveltrabalho{master thesis}
}

\DeclareOption{qualimst}{
\def\@tipotrabalho{Master's thesis proposal defense}
\def\@worktype{Master Thesis}
\def\@nivelPos{Master}
\def\@niveltrabalho{master thesis}
}

\ProcessOptions\relax

\LoadClass[a4paper,12pt,twoside,openright]{abntex2}

\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[alf,abnt-emphasize=bf,abnt-repeated-author-omit=yes,abnt-year-extra-label=yes]{abntex2cite}	% Citações padrão ABNT 
\RequirePackage{color}
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{pdfpages}
\RequirePackage{calc,graphicx}
\RequirePackage{etoolbox}
\RequirePackage{algorithm,algorithmic}
\RequirePackage{nomencl}


\counterwithout{equation}{chapter}
\setsecnumdepth{subsubsection}
\settocdepth{subsection}

\newsubfloat{figure}


\definecolor{blue}{RGB}{41,5,195}

\hypersetup{
    	pdfsubject={\imprimirpreambulo},
		pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
	    pdfproducer={LaTeX with abnTeX2},
    	colorlinks=true,
    	linkcolor=black,
    	citecolor=black,
    	filecolor=magenta, 
		urlcolor=black,
		bookmarksdepth=4
}
% ---
\newcommand{\rev}[1]{\textcolor{red}{[#1]}}
\renewcommand{\labelitemi}{\ding{111}}

\providecommand{\imprimirtitulo}{}
\newcommand{\@engtitle}{}
\renewcommand{\titulo}[2]{\title{#1}\renewcommand{\imprimirtitulo}{#1} \renewcommand{\@engtitle}{#2}}

\newcommand{\@authorbib}{}
\providecommand{\imprimirautor}{}
\renewcommand{\autor}[2]{\author{#1}\renewcommand{\imprimirautor}{#1} \renewcommand{\@authorbib}{#2}}

\renewcommand{\maketitle}{%
	\imprimircapa
	\imprimirfolhaderosto{}
}

\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{120mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}

\newcommand{\@universidade}{}
\newcommand{\@universidadesigla}{}
\newcommand{\universidade}[2]{\renewcommand{\@universidade}{#1}\renewcommand{\@universidadesigla}{#2}}

\newcommand{\@centro}{}
\newcommand{\@centrosigla}{}
\newcommand{\centro}[2]{\renewcommand{\@centro}{#1}\renewcommand{\@centrosigla}{#2}}

\newcommand{\@departamento}{}
\newcommand{\@departamentosigla}{}
\newcommand{\departamento}[2]{\renewcommand{\@departamento}{#1}\renewcommand{\@departamentosigla}{#2}}

\newcommand{\@programa}{}
\newcommand{\@programasigla}{}
\newcommand{\programa}[2]{\renewcommand{\@programa}{#1}\renewcommand{\@programasigla}{#2}}

\newcommand{\@curso}{}
\newcommand{\curso}[1]{\renewcommand{\@curso}{#1}}


\instituicao
{%
	\@universidade~--- \@universidadesigla
	\par
	\@centro~--- \@centrosigla
	\par
	\@departamento~--- \@departamentosigla
	\par
	\@programa~--- \@programasigla
}

\preambulo{
    \@tipotrabalho~presented to the~\@programa~at the~\@centro~of \@universidade, as part of the requirements for obtaining the title of \@nivelPos~in \@curso.
}

\renewcommand{\imprimircapa}{%
	\thispagestyle{empty}
	\noindent
  	\begin{capa}%
    	\center
    	\parbox[b]{\textwidth}
	{
		\centering
		\vbox to \titlepagewinvoffset
		{
			\scshape\imprimirinstituicao
			\vfill
			\@formataautorcapa
			\@formatatitulocapa
		}
	}
	
	\vfill
  	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}
    
  	\end{capa}
}

\def\@formataautorcapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
				{\Large\textbf{\imprimirautor}}
      		\vspace*{\fill}
    		}
   	}

}

\def\@formatatitulocapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
      			{\Large{\textbf{\imprimirtitulo}}\par}
			\vspace*{\fill}
    		}
   	}

}

\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\title{#1}\renewcommand{\imprimirareaconcentracao}{Concentration area: #1}}

\makeatletter

\renewcommand{\folhaderostocontent}{


\newlength{\tampar}
\setlength{\tampar}{0.5\textwidth}
\newlength{\tamconcetracao}
\settowidth{\tamconcetracao}{\imprimirareaconcentracao}
\newlength{\tamorientador}
\settowidth{\tamorientador}{\imprimirorientadorRotulo~\imprimirorientador}
\newlength{\tamcoorientador}
\settowidth{\tamcoorientador}{\imprimircoorientadorRotulo~\imprimircoorientador}

\ifthenelse{\lengthtest{\tamconcetracao > \tampar}}{\setlength{\tampar}{\the\tamconcetracao}}{}
\ifthenelse{\lengthtest{\tamorientador>\tampar}}{\setlength{\tampar}{\the\tamorientador}}{}
\ifthenelse{\lengthtest{\tamcoorientador>\tampar}}{\setlength{\tampar}{\the\tamcoorientador}}{}


  \begin{center}

	
    \@formataautorcapa

    \@formatatitulocapa

    \abntex@ifnotempty{\imprimirpreambulo}
    {%
  		\hspace*{\fill}
  		\makebox[\tampar][l]
  		{%
    			\parbox[b]{\tampar}
    			{
    				\imprimirpreambulo\\
    				\par\imprimirareaconcentracao\\

    {\imprimirorientadorRotulo~\imprimirorientador\par}
    \abntex@ifnotempty{\imprimircoorientador}{%
       {\imprimircoorientadorRotulo~\imprimircoorientador}%
    }%
    			}
    		}
    		\vfill
    }%

  	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}
	{
	}
  \end{center}
}

\newcommand{\imprimirdedicatoria}[1]{
	\begin{dedicatoria}
   		\vspace*{\fill}
   		\centering
   		\noindent
   		\textit{#1}
   		\vspace*{\fill}
	\end{dedicatoria}
}

\newcommand{\imprimiragradecimentos}[1]{
	\begin{agradecimentos}
		#1
	\end{agradecimentos}
}

\newcommand{\imprimirepigrafe}[1]{
\begin{epigrafe}
    \vspace*{\fill}
	\begin{flushright}
		\textit{#1}
	\end{flushright}
\end{epigrafe}
}

\newcommand{\listailustracoes}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}

\newcommand{\listatabelas}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}

\newcommand{\listasiglas}[1]{
	\thispagestyle{empty}
	\pagestyle{empty}
	\pdfbookmark[0]{List of acronyms}{List of acronyms} 
	\chapter*{List of acronyms}
	\input{#1}
	\cleardoublepage
}

\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{List of algorithms}
\newcommand{\cftalgorithmname}{\algorithmname\space} 
\newcommand{\listaalgoritmos}{
	\pdfbookmark[0]{\listalgorithmname}{loa}
	\thispagestyle{empty}
	\pagestyle{empty}
	\listofalgorithms
	\cleardoublepage
}

\renewcommand{\nompreamble}{\thispagestyle{empty}}
\renewcommand\nomname{List of symbols}
\newcommand{\listasimbolos}{
	\thispagestyle{empty}
	\pagestyle{empty}
	\makenomenclature
	\pdfbookmark[0]{\nomname}{los}
	\printnomenclature
	\cleardoublepage
}

\renewcommand{\contentsname}{Table of Contents}
\newcommand{\sumario}{%
	\chapter*{\contentsname}
	\pdfbookmark[0]{\contentsname}{toc}
	\thispagestyle{empty}
	\pagestyle{empty}
	\@starttoc{toc}
	\cleardoublepage}

\renewenvironment{resumo}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Resumo}\par%
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Palavras-chave:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}

\renewenvironment{abstract}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Abstract}\par%
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Keywords:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}

\makepagestyle{ufscarchaplast}
\makeevenhead{ufscarchaplast}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{ufscarchaplast}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{ufscarchaplast}{\textwidth}{\normalrulethickness}


\makepagestyle{ufscarpartlast}
\makeoddhead{ufscarpartlast}{}{}{\ABNTEXfontereduzida\thepage}
\makeevenhead{ufscarpartlast}{\ABNTEXfontereduzida\thepage}{}{}


\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 


\renewcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}
  \aliaspagestyle{cleared}{ufscarchaplast}
  \aliaspagestyle{part}{ufscarchaplast}
  \nouppercaseheads
}

\renewcommand{\postextual}{
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}
  \aliaspagestyle{cleared}{ufscarchaplast}
  \aliaspagestyle{part}{ufscarpartlast}
\aliaspagestyle{afterpart}{ufscarpartlast}

}
\renewcommand{\backmatter}{\postextual}

\chapterstyle{ger}

\renewcommand*{\figureautorefname}{Figure}
\renewcommand*\footnoteautorefname{Footnote}%
\renewcommand*\itemautorefname{Item}%
\renewcommand*\tableautorefname{Table}%
\renewcommand*\partautorefname{Part}%
\renewcommand*\appendixautorefname{Appendix}%
\renewcommand*\chapterautorefname{Chapter}%
\renewcommand*\sectionautorefname{Section}%
\renewcommand*\subsectionautorefname{Subsection}%
\renewcommand*\subsubsectionautorefname{Subsection}%
\renewcommand*\paragraphautorefname{Paragraph}%
\renewcommand*\subparagraphautorefname{Subparagraph}%
\renewcommand*\FancyVerbLineautorefname{Line}%
\renewcommand*\theoremautorefname{Theorem}%
\renewcommand*\pageautorefname{Page}%
\renewcommand*\equationautorefname{Equation}%

\renewcommand{\ABNTEXchapterfont}{\huge\bfseries}

\tipotrabalho{\@tipotrabalho}