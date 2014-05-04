all: literate.tex literate.pdf

# Generate literate.tex TeX file
literate.tex: literate.w
	goweave $<

# Generate literate.go programme
literate.go: literate.w
	gotangle $<

# Compile TeX to PDF
literate.pdf: literate.tex
	# Copy over goweb macros
	cp $(GOPATH)/src/bitbucket.org/santucco/goweb/gowebmac.tex .

	# Compile to PDF
	pdflatex $<

	# Cleanup
	latexmk -c

clean:
	rm -rf *.go *.tex *.pdf *.snm *.scn *.nav

