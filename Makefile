.PHONY : clean

all : Response1.pdf HighLow.pdf

HighLow.pdf : HighLow.tex HighLow.bbl methods.tex results.tex discussion.tex intro.tex
	pdflatex $(basename $<)
	pdflatex $(basename $<)

HighLow.bbl : HighLow.tex MZpara1.bib MZpara2.bib plr-hilo.bib
	pdflatex $(basename $<)
	bibtex $(basename $<)

Response1.pdf : Response1.tex
	pdflatex $(basename $<)
	pdflatex $(basename $<)

clean : 
	-rm *.aux *.log *.out *.bbl *.blg
