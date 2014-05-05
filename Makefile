all: literate.tex literate.pdf

# Generate literate.tex TeX file
literate.tex: literate.web
	goweave $<

# Generate literate.go programme
literate.go: literate.web
	gotangle $<

# Compile TeX to PDF
literate.pdf: literate.tex
	# Copy over goweb macros
	cp $(GOPATH)/src/bitbucket.org/santucco/goweb/gowebmac.tex .

	# Compile to PDF
	pdflatex $<
	pdflatex $<

	# Cleanup
	latexmk -c

clean:
	rm -rf *.go *.tex *.pdf *.snm *.scn *.nav

