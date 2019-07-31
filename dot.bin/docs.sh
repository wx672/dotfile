#!/bin/bash

BROWSER="/usr/bin/x-www-browser"
PDFVIEWER="/usr/bin/mupdf"
TIMETABLE="/home/wx672/texmf/doc/latex/swfu/timetable/timetable.pdf"

abs(){
    $BROWSER file:///usr/share/doc/abs-guide/html/index.html &>/dev/null &
}

cdev(){
    $BROWSER file:///home/wx672/lecture_notes/linux/c/c_dev.html &>/dev/null &
}

ch8(){
    $PDFVIEWER ~/texmf/doc/latex/ch8.pdf &>/dev/null &
}

math(){
    $PDFVIEWER ~/texmf/doc/latex/ch8.pdf &>/dev/null &
}

symbol(){
    $PDFVIEWER ~/texmf/doc/latex/symbols-a4.pdf &>/dev/null &
}

playbash(){
    $BROWSER file:///home/wx672/lecture_notes/linux/bash/shell_basics.plain.html &>/dev/null &
}

timetable(){
	$PDFVIEWER $TIMETABLE
}
