% BEGIN_FOLD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clase: clase_I2C_TFGM_UHU.cls
% Autor: Jacinto Mata Vázquez
% Fecha de creación: marzo 2025
%
% Descripción:
% Clase personalizada para la elaboración de memorias de 
% TFG/TFM del Grado o Máster en Ingeniería Informática de la 
% Universidad de Huelva.
%
% Esta clase está diseñada para ser utilizada junto con la plantilla
% `principal_I2C_TFGM_UHU.tex`, e incluye configuraciones específicas 
% para portadas, márgenes, interlineado, encabezados/pies, bibliografía 
% con `biblatex`, entorno de sugerencias, títulos, y más.
%
%### Compilación recomendada
%
% Estructura modular que permite incluir capítulos y anexos 
% mediante `\input{}` o `\include{}` desde el documento principal.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END_FOLD

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{clase_I2C_TFGM_UHU}

% -------------------------------------
% Cargar clase base del documento
% `book` se adapta bien a documentos largos como TFG/TFM
% `openany` permite que los capítulos empiecen en cualquier página (no obliga a empezar en impar)
% `a4paper`, `11pt`: formato de página y tamaño de letra
% -------------------------------------
\LoadClass[a4paper,11pt,openany]{book}  

% -------------------------------------
% Paquetes requeridos
% -------------------------------------
% Codificación de entrada UTF-8
\RequirePackage[utf8]{inputenc}       
% Codificación de salida T1 (para caracteres latinos correctamente renderizados)
\RequirePackage[T1]{fontenc}    
% Soporte para español + no sangrar primer párrafo de cada sección
\RequirePackage[spanish, es-noindentfirst]{babel}  
% Espaciado entre párrafos + sangrado en otros
\RequirePackage[skip=6pt plus 2pt,indent]{parskip} 
% Configuración de márgenes
\RequirePackage{geometry}      
% Para controlar posicionamiento de figuras/tablas
\RequirePackage{float}            
 % Personalización de cabeceras y pies de página
\RequirePackage{fancyhdr} 
 % Inclusión de imágenes
\RequirePackage{graphicx}       
% Tablas con ancho ajustable (columna tipo X)
\RequirePackage{tabularx}       
% Celdas que ocupan varias filas en tablas
\RequirePackage{multirow}    
 % Tablas con estilo profesional (toprule, midrule...)
\RequirePackage{booktabs}  
% Listas personalizadas
\RequirePackage{enumitem}          
% Texto de prueba (puede eliminarse si no se usa)
\RequirePackage{lipsum}       
 % Control del interlineado (singlespacing, onehalfspacing...)
\RequirePackage{setspace}            


% -------------------------------------
% Configuración de bibliografía con biblatex
% -------------------------------------
% Citas numéricas, sin orden específico
\RequirePackage[style=numeric,sorting=none,backend=biber]{biblatex}
\addbibresource{referencias.bib} % Archivo .bib con las referencias


% -------------------------------------
% Configuración de márgenes
% -------------------------------------
\geometry{left=3cm, right=3cm, top=3cm, bottom=3cm}


% -------------------------------------
% Hipervínculos y navegación en PDF
% Debe cargarse antes de tcolorbox
% -------------------------------------
\RequirePackage[
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue,
    citecolor=blue,
    pdfstartview=FitH,
    bookmarksopen=true,
    %linktoc=all
    linktoc=page
]{hyperref}

% -------------------------------------
% Cajas decorativas (portada, etc.)
% -------------------------------------
\RequirePackage[most]{tcolorbox}


% -------------------------------------
% Entorno personalizado para mostrar sugerencias en la memoria
% -------------------------------------
\newenvironment{sugerencia}{
  \begin{tcolorbox}[colback=yellow!5,colframe=yellow!50!black,title=Sugerencia]
}{
  \end{tcolorbox}
}


% -------------------------------------
% Configuración de cabecera y pie con fancyhdr
% Permite elegir entre número en cabecera o en pie
% -------------------------------------
\newif\ifpageonfooter
% Activar si se quiere el número de página centrado en el pie
%\pageonfootertrue   
\pageonfooterfalse   % Por defecto, el número va en la cabecera

\fancyhf{} % Limpia todos los valores por defecto de cabecera y pie

% Texto en las esquinas de la cabecera
\fancyhead[LO]{\sffamily\leftmark} % Página impar: capítulo
\fancyhead[RE]{\sffamily\rightmark} % Página par: sección

\ifpageonfooter % Números de página en el pie de página y centrado
	\fancyfoot[C]{\sffamily\thepage}
\else % Números de página en las esquinas de los encabezados
	\fancyhead[RO,LE]{\sffamily\thepage}
\fi %

% Formato de marcas para capítulo y sección
\renewcommand{\chaptermark}[1]{\markboth{\textbf{\thechapter.#1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\textbf{\thesection. #1}}} 

\renewcommand{\headrulewidth}{0.6pt} % Línea debajo de la cabecera
%\renewcommand{\footrulewidth}{0.6pt} % Línea sobre el pie (si se desea)
\setlength{\headheight}{1.5\headheight} % Ajuste de altura del encabezado

% Corrige problemas con capítulos que terminan en página impar
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside
\ifodd\c@page
\else\hbox{}\thispagestyle{empty}\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother

% Cabecera y pie limpios en la primera página de cada capítulo
\newcommand{\cleanhdfirst}{% 
	\fancypagestyle{plain}{%
		\fancyhf{}%
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}
	}
}

% -------------------------------------
% Personalización de títulos de capítulos y secciones
% -------------------------------------
\usepackage{titlesec}  

\newcommand{\bigrule}{\titlerule[0.5mm]} % Línea decorativa después del título

% Formato de capítulos numerados
\titleformat{\chapter}[display]
{\filleft\bfseries\Huge\sffamily}
{
\vspace{-1.5\baselineskip}
\Large{\MakeUppercase\chaptertitlename{} \thechapter}
} 
{0mm}{}[\bigrule]

% Secciones y subsecciones
\titleformat{\section}{\sffamily\bfseries\Large}{\thesection .}{1ex}{}
\titleformat{\subsection}{\sffamily\bfseries}{\thesubsection .}{1ex}{}
\titleformat{\subsubsection}{\sffamily\bfseries}{\thesubsubsection .}{1ex}{}

% Capítulos sin número (como Resumen, Abstract, Bibliografía...)
\titleformat{name=\chapter,numberless}[block]
  {\sffamily\Huge\bfseries\filleft}
  {}
  {0pt}
  {\vspace*{0\baselineskip}}[\bigrule]

  \titlespacing*{name=\chapter,numberless}
  {0pt}              % sangría izquierda
  {-3\baselineskip}  % espacio antes del título (ajústalo a tu gusto)
  {2\baselineskip}   % espacio después del título


% Espaciado antes y después de secciones
\titlespacing*{\section}
  {0pt}                             % sin sangría izquierda
  {1.6\baselineskip plus 2pt}       % espacio ANTES del título
  {0.5\baselineskip plus 2pt}       % espacio DESPUÉS del título

\titlespacing*{\subsection}
  {0pt}
  {1.6\baselineskip plus 2pt}
  {0.5\baselineskip plus 2pt}

\titlespacing*{\subsubsection}
  {0pt}
  {1.6\baselineskip plus 2pt}
  {0.5\baselineskip plus 2pt}
% -------------------------


%% -------------------------------------
% Traducción de nombres al español (después de cargar babel)
% -------------------------------------
\AtBeginDocument{
  \renewcommand{\tablename}{Tabla}
  \renewcommand{\listtablename}{Índice de Tablas}
  \renewcommand{\listfigurename}{Índice de Figuras}
}


% -------------------------------------
% Entornos personalizados para el Resumen y el Abstract
% Se crean como capítulos no numerados con entrada en el índice
% -------------------------------------
\newenvironment{resumen}{
  \phantomsection
  \addcontentsline{toc}{chapter}{Resumen}
  \chapter*{Resumen}
  \thispagestyle{plain}
}{
  \bigskip
}


\newenvironment{abstract}{
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  \chapter*{Abstract}
}{
  \bigskip
}


\endinput
