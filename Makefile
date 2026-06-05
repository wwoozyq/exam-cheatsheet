.PHONY: all dense spacious clean

all: dense spacious

dense:
	cd zh && latexmk -xelatex dense.tex
	cd en && latexmk -xelatex dense.tex

spacious:
	cd zh && latexmk -xelatex spacious.tex
	cd en && latexmk -xelatex spacious.tex

clean:
	cd zh && latexmk -C
	cd en && latexmk -C
