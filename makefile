.PHONY : clean gh-pages

## TO-DO:
# rejigger things so that the gh-pages branch does not have the primary files in
# i.e. the first step in make gh-pages is to checkout the relevant files from the master branch
# ideally parsing the .tex files to figure out what the prerequisites are (does latexml do this?)

clean : 
	rm -f *.aux *.log *.bbl *.blg
	rm -f x1.png x2.png x3.png x4.png x5.png x6.png x7.png x8.png x9.png x10.png 
	rm -f HighLow.xml HighLow.pdf HighLow.html
	rm -f LaTeXML.cache

PDFFIGS = $(wildcard fig/*.pdf)
SVGFIGS = $(patsubst %.pdf,%.svg,$(PDFFIGS))
TEXFILES = HighLow.tex intro.tex methods.tex results.tex demographic-model-appendix.tex 
BIBFILES = MZpara1.bib MZpara2.bib plr-hilo.bib

gh-pages : HighLow.xhtml
	git rebase master
	rm HighLow.xhtml
	make HighLow.xhtml

HighLow.html : $(TEXFILES) $(SVGFIGS) $(BIBFILES)
	rm -f LaTeXML.cache
	latexmlc --format=html5 --javascript=LaTeXML-maybeMathjax.js --css=plr-style.css --stylesheet=xsl/LaTeXML-all-xhtml.xsl --javascript=adjust-svg.js --destination=$@ HighLow.tex

HighLow.xhtml : $(TEXFILES) $(SVGFIGS) $(BIBFILES)
	rm -f LaTeXML.cache
	latexml --destination=HighLow.xml $<
	latexmlpost --css=plr-style.css --javascript=LaTeXML-maybeMathjax.js --javascript=adjust-svg.js --stylesheet=xsl/LaTeXML-all-xhtml.xsl --destination=$@ HighLow.xml

%.xml : %.tex
	latexml --destination=$@ $<

%.xhtml : %.xml
	latexmlpost --css=plr-style.css --javascript=LaTeXML-maybeMathjax.js --javascript=adjust-svg.js --stylesheet=xsl/LaTeXML-all-xhtml.xsl --destination=$@ $<
	-cp plr-style.css $(@D)
	-cp adjust-svg.js $(@D)

HighLow.pdf : $(TEXFILES) $(PDFFIGS) $(BIBFILES)
	rm -f HighLow.aux
	pdflatex HighLow.tex
	bibtex HighLow.aux
	pdflatex HighLow.tex
	pdflatex HighLow.tex

%.svg : %.pdf
	inkscape $< --export-plain-svg=$@

%.png : %.pdf
	convert -density 300 $< -flatten $@
