BUILDDIR  = _build
CODEDIR   = code
FIGDIR    = _fig
STATIC    = _static
TEX2PDF   := cd $(BUILDDIR) && TEXINPUTS="../$(STATIC):" pdflatex -interaction=batchmode
BIBTEX    := cd $(BUILDDIR) && bibtex

all: clean lecture1 recitation1 

clean:
	rm -rf $(BUILDDIR)/* $(CODEDIR)/*pdf $(CODEDIR)/doc_data.txt $(FIGDIR)
	rm -rf *.{bak,pdf}

figs: $(FIGDIR)
	cd $(CODEDIR) && Rscript plots.r
	cd $(CODEDIR) && pdftk Rplots.pdf  burst output "risk%01d.pdf"
	cd $(CODEDIR) && pdfcrop risk1.pdf 
	cd $(CODEDIR) && pdfcrop risk2.pdf 
	cd $(CODEDIR) && pdfcrop risk3.pdf 
	mv $(CODEDIR)/risk*-crop.pdf $(FIGDIR)/.

$(BUILDDIR):
	mkdir -p $(@)

$(FIGDIR):
	mkdir -p $(@)

%.pdf: %.tex $(BUILDDIR) $(FIGDIR)
	cp $(<F) $(BUILDDIR)/.
	cp stat.bib $(BUILDDIR)/.
	cp $(STATIC)/*pdf $(FIGDIR)/.
	cp -a $(FIGDIR) $(BUILDDIR)/.
	($(TEX2PDF) $(<F))
	($(BIBTEX) $(*))
	($(TEX2PDF) $(<F))
	($(TEX2PDF) $(<F))
	cp $(BUILDDIR)/$(@) $(@)

lecture1: figs lecture1.pdf

recitation1: recitation1.pdf
