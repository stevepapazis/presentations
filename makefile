# Generate your PDF
%.pdf : %.tex
		@echo '.........: xelatex running pass 1...'
		xelatex -halt-on-error $< -o $@ 2>&1 | tee errors.err
		@echo '.........: biber running...'
		biber $(basename $<) 2>&1 | tee errors.err
		@echo '.........: xelatex running pass 2...'
		xelatex -halt-on-error $< -o $@ 2>&1 | tee errors.err
		@echo '.........: xelatex running pass 3...'
		xelatex -halt-on-error $< -o $@ 2>&1 | tee errors.err
		@echo '.........: xelatex and biber run finished.'
# Clean temp files
clean :
		rm -f *.o errors.err
		rm -f *.aux *.bbl *.bcf *.blg *.log *.nav *.out *.snm *.toc *.vrb *.run.xml
		rm -f *.synctex.gz
		@echo
