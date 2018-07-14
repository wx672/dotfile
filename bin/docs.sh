#!/bin/bash

CHROME="/usr/bin/x-www-browser"
PDFVIEWER="/usr/bin/mupdf"

abs(){
    $CHROME --app=file:///usr/share/doc/abs-guide/html/index.html &>/dev/null &
}

cdev(){
    $CHROME --app=file:///home/wx672/lecture_notes/linux/c/c_dev.html &>/dev/null &
}

ch8(){
    $PDFVIEWER ~/Books/tech/TeX/latex_doc/ch8.pdf &>/dev/null &
}

math(){
    $PDFVIEWER ~/Books/tech/TeX/latex_doc/ch8.pdf &>/dev/null &
}

symbol(){
    $PDFVIEWER ~/Books/tech/TeX/latex_doc/symbols-a4.pdf &>/dev/null &
}

playbash(){
    $CHROME --app=file:///home/wx672/lecture_notes/linux/bash/shell_basics.plain.html &>/dev/null &
}
