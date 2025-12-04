# Force xelatex as the default engine
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error';
# Ensure biber is used for biblatex
$bibtex = 'biber %O %B';
# Use continuous preview if desired
# $preview_mode = 1;
