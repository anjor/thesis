###########################################################################
# Makefile for thesis compilate
#			by Anjor Kanekar	Last modified: 10/2/14
# Based on the agk_manual Makefile by GGH.
###########################################################################

#Put everything that needs to be put into tar file into pack, including 
#  all necessary subdirectories
PACK =	Makefile thesis_avk.tex mymacros.sty thesis.cls thesis-2.cls chaps/*tex figs/* append/* avk_complete.bib 

SH =	`which sh`
CSH =	`which csh`

###########################################################################
#

all:	thesis bib 

usage:	
	echo "make usage				- shows this text"; \
	echo "make thesis					- runs thesis through LaTeX, without bib"; \
	echo "make bib					- sets up bibliography entries"; \
	echo "make pack					- makes an archive of the documentation"

thesis:	thesis_avk.tex 
	${SH} -c "pdflatex thesis_avk.tex"

clean: 
	rm -f *aux
	rm -f chaps/*aux
	rm -f append/*aux

completeclean: 
	rm -f *aux
	rm -f chaps/*aux
	rm -f append/*aux
	rm -f *bbl *blg *log *lof *toc


bib:	
	echo "Attempting to make the bibliography.....";\
	${SH} -c "bibtex	thesis_avk; pdflatex	thesis_avk; pdflatex thesis_avk"

pack:		
	tar cvf thesis`date +'%y%m%d'`.tar ${PACK} ; gzip thesis`date +'%y%m%d'`.tar
