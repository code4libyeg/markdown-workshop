---
title: Markdown and Pandoc
author: Peter Binkley
date: 16 June 2016
bork: borkitude
---

## Part 1: Markdown

## Spirit of Markdown

- John Gruber, 2004, with collaboration of Aaron Swartz
- inspired by ascii email format
- markup does not interfere with the readability of the text
- comprehensible without documentation
- [sustainable](http://programminghistorian.org/lessons/sustainable-authorship-in-plain-text-using-pandoc-and-markdown)

## Tools

- edit: any text editor; [Atom](https://atom.io/) or [Sublime Text](https://www.sublimetext.com/) are examples of Markdown-aware editor
- rendering: [Pandoc](http://pandoc.org/installing.html):

```
pandoc -o test.html -s test.md
```

## Ingredients

- punctuation marks: \- \= \> \* \+ \- \\ \[\] \(\) \_ \` \!
- blocks, separated by blank lines
- indents

- John Gruber's [Syntax Guide](https://daringfireball.net/projects/markdown/syntax)

## Basics

- Paragraphs: separated by blank lines
- ```*italics*```: *italics* 
- ```**bold**```: **bold** 

``` 
- bullet 1
- bullet 2
``` 

``` 
## Heading
```

## Links

### Link

```[Anchor](http://www.example.com)```: [Anchor](http://www.example.com)

### Image

```![Alt text](https://upload.wikimedia.org/wikipedia/commons/0/00/Escribano.jpg)```: ![Alt text](https://upload.wikimedia.org/wikipedia/commons/0/00/Escribano.jpg)

## Indents

Blockquote: use \>

> Block quote this is a block quote this is a block quote Block quote 
this is a block quote this is a block quote Block quote this is a block 
quote this is a block quote 

Code block: use tab (or four spaces)

    Code this is code
    And this is code
    So is this

## Advanced: Tables

- not part of classic Markdown
- Pandoc supports [four syntaxes](http://pandoc.org/README.html#tables)

## Simple Tables

```
  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123

Table:  Demonstration of simple table syntax.
```

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123

Table:  Demonstration of simple table syntax.

## Multiline Tables

```
-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. It, too, may span
multiple lines.
```

## (rendered)

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. It, too, may span
multiple lines.

## Metadata: YAML Block

```
---
title: Markdown and Pandoc
css: css/myslides.css
---
```
## Flavours

- no one standard, many flavours
- in the last few years, an effort toward standardization; IETF draft for text/markdown media type
- extensions: MultiMarkdown etc.
- notably: GitHub

## Embedding Other Markup

TODO Show embedding of HTML

## Part 2: Pandoc

- open-source Haskell application and library for converting markup
- begun 2006 by John MacFarlane (philosopher at UC Berkeley)
- handles "standard" Markdown and provides many extensions

## Formats

Reads (full): Markdown, CommonMark, PHP Markdown Extra, GitHub-Flavored Markdown,

Reads (partial): Textile, reStructuredText, HTML, LaTeX, MediaWiki markup, TWiki markup, Haddock markup, OPML, Emacs Org mode, DocBook, txt2tags, EPUB, ODT and Word docx

Writes: plain text, PDF (if it has LaTeX support), Markdown, CommonMark, PHP Markdown Extra, GitHub-Flavored Markdown, reStructuredText, XHTML, HTML5, LaTeX (including beamer slide shows), ConTeXt, RTF, OPML, DocBook, OpenDocument, ODT, Word docx, GNU Texinfo, MediaWiki markup, DokuWiki markup, Haddock markup, EPUB (v2 or v3), FictionBook2, Textile, groff man pages, Emacs Org mode, AsciiDoc, InDesign ICML, TEI Simple, and Slidy, Slideous, DZSlides, reveal.js or S5 HTML slide shows

## PDF and LaTeX

Just as you can embed HTML tags, so you can embed LaTeX tags:

```
\begin{flushright}
Some right-aligned text in embedded LaTeX.
\end{flushright}
```

Sample: [Markdown](latex.md) ~ [PDF](latex.pdf)

## Filters

Filters can manipulate Pandoc's "abstract syntax tree" (AST) between the parsing of the input and the rendering of the output.

Inspect AST: ```pandoc -t native ast.md```

```
Some *italic* text.
```

```
[Para [Str "Some",Space,Emph [Str "italic"],Space,Str "text."]]
```

## Example Filter in Ruby

- use [pandoc-filter](https://github.com/karaken12/pandoc-filters-ruby) gem
- install: ```gem install pandoc-filter```

```
PandocFilter.filter do |type, value, format, meta|
  if type == 'Emph'
    PandocElement.Strong(value)
  end
end
```

- Output: [unfiltered](filter/unfiltered.html) ~ [filtered](filter/filtered.html)

## Special Markup in HTML and PDF

TODO copy from union catalog to demo library card layout

## ePub

An example of an [ePub](https://www.wallandbinkley.com/rcb/works/marriage/downloads/what-is-right-with-marriage.epub) generated by Pandoc.

## Bibliography

Pandoc provides the citations extension and the pandoc-citeproc filter to generate citations and a bibliography. ([Manual](http://pandoc.org/README.html#citations))

It uses [CSL styles](https://github.com/citation-style-language/styles)

Sample: [Markdown](mappamundi/mappamundi.md) ~ [BibTex](mappamundi/mappamundi.bib) ~ [HTML](mappamundi/mappamundi.html) ~ [PDF](mappamundi/mappamundi.pdf)

Try another CSL: uncomment ```#csl: apa.csl``` in YAML

## Scholarly Markdown?

- an initiative from the sciences (originally Markdown for Science)
- adds better support for inline math, figures, etc.
- implemented in a fork of Pandoc
- See [scholarlymarkdown.com](http://scholarlymarkdown.com/) (Tim T.Y. Lin)
- [Syntax](http://scholarlymarkdown.com/Scholarly-Markdown-Guide.html)