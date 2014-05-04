Literate Programming Talk
=========================

* **When?**	8th May 2014
* **Where?**	ETH Zürich
* **Why?**	For the course, *Case Studies*

Building
--------

To build, [goweb](https://bitbucket.org/santucco/goweb) must be installed and
setup. This can be done with the following commands assuming [`go`]
(http://golang.org/doc/install) is setup.

	go get bitbucket.org/santucco/goweb
	go install bitbucket.org/santucco/goweb/gotangle
	go install bitbucket.org/santucco/goweb/goweave

Additionally dependencies include a standard LaTeX environment with the command
`pdflatex`.

Once required dependencies are ready, run `make`.
