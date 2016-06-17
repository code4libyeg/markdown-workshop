#!/bin/sh
pandoc -o slides/slides.html -t revealjs -s slides.md
pandoc -o slides/slides.pdf -s slides.md

# embedded markup example
pandoc -o slides/embedded.html -s embedded.md
pandoc -o slides/embedded.pdf -s embedded.md

# catalog card example
pandoc -o slides/catalog.html -s catalog.md
pandoc -o slides/catalog.pdf -s catalog.md
./preprocess.rb catalog.md | pandoc -o slides/preprocessed-catalog.pdf
cp catalog.css slides/

# bibliography example
pandoc --filter pandoc-citeproc -o slides/mappamundi/mappamundi.html -s mappamundi.md
pandoc --filter pandoc-citeproc -o slides/mappamundi/mappamundi.pdf -s mappamundi.md

# filter example
pandoc --filter italics2bold.rb -o slides/filter/filtered.html -s ast.md
pandoc -o slides/filter/unfiltered.html -s ast.md

# custom template example
 pandoc -o slides/custom.pdf --template=custom.latex custom.md