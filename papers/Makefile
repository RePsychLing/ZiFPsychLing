
%.md: %.jmd
	julia --project=.. -e "using Weave" -e "weave(\"$<\", doctype=\"pandoc\")"

%.tex:	%.md
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block+smart -w latex --no-highlight --pdf-engine=xelatex --template=jss.latex --natbib -o $@ $<

%.pdf:	%.tex
	pdflatex $(basename $<)
	bibtex $(basename $<)
	pdflatex $(basename $<)
	pdflatex $(basename $<)
	rm -f *.aux *.bcf *.blg *.log *.out *.bbl

clean:
	rm -f *.pdf *.tex *.aux *.bcf *.blg *.log *.out
	
reknit:
	rm -f *.md