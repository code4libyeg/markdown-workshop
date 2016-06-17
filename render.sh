#!/bin/sh
pandoc -o slides/slides.html -t revealjs -s slides.md

# latex example
pandoc -o slides/latex.pdf -s latex.md
cp latex.md slides/

# bibliography example
pandoc --filter pandoc-citeproc -o slides/mappamundi/mappamundi.html -s mappamundi.md
pandoc --filter pandoc-citeproc -o slides/mappamundi/mappamundi.pdf -s mappamundi.md
cp mappamundi* slides/mappamundi/

# filter example
pandoc --filter italics2bold.rb -o slides/filter/filtered.html -s ast.md
pandoc -o slides/filter/unfiltered.html -s ast.md