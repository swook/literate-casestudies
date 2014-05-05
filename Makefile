all: literate.tex literate.pdf literate.py

# Generate literate.tex TeX file
literate.tex: literate.web
	noweave -n $< > $@
	mv $@ tmp
	tail -n +2 tmp > $@
	rm tmp

# Generate literate.go programme
literate.py: literate.web
	notangle $< > $@

# Compile TeX to PDF
literate.pdf: literate.tex
	# Compile to PDF
	pdflatex $<
	pdflatex $<

	# Cleanup
	latexmk -c

clean:
	rm -rf *.py *.tex *.pdf *.snm *.scn *.nav

