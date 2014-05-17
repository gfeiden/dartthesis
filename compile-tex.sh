#!/bin/bash
#
# Standard tex compilation - 2 latex run for references and conversion
# to a PDF. To execute, call the script with the document name (no 
# extension)
#   $> ./compile-tex.sh document
#
latex $1.tex
bibtex $1.tex
latex $1.tex
dvips -z -Ppdf -G0 -o $1.ps $1.dvi
ps2pdf $1.ps
