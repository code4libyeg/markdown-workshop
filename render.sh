#!/bin/sh
pandoc -t revealjs -s slides.md -o slides/slides.html
pandoc -s slides.md -o slides/slides.pdf

# embedded markup example
pandoc -s embedded.md -o slides/embedded.html
pandoc -s embedded.md -o slides/embedded.pdf

# catalog card example
pandoc -s catalog.md -o slides/catalog.html
pandoc -s catalog.md -o slides/catalog.pdf
./preprocess.rb catalog.md | pandoc -o slides/preprocessed-catalog.pdf
cp catalog.css slides/ 

# bibliography example
pandoc --filter pandoc-citeproc -s mappamundi.md -o slides/mappamundi/mappamundi.html 
pandoc --filter pandoc-citeproc -s mappamundi.md -o slides/mappamundi/mappamundi.pdf 

# filter example
pandoc --filter italics2bold.rb -s ast.md -o slides/filter/filtered.html 
pandoc -s ast.md -o slides/filter/unfiltered.html

# custom template example
pandoc --template=custom.latex custom.md -o slides/custom.pdf