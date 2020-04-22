%.tex:  %.jnw
	julia --project=.. -e 'using Weave' -e 'weave("$<", doctype="texminted")'

%.pdf:	%.tex
	xelatex -shell-escape $(basename $<)
	bibtex $(basename $<)
	xelatex -shell-escape $(basename $<)
	xelatex -shell-escape $(basename $<)
	rm -f *.aux *.bcf *.blg *.log *.out *.bbl

clean:
	rm -f *.pdf *.tex *.aux *.bcf *.blg *.log *.out
