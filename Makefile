BUILDDIR  = _build
CODEDIR   = code
FIGDIR    = fig
#BINDIR    = ../../bin
TEX2PDF  := cd $(BUILDDIR) && TEXINPUTS="..:" pdflatex -interaction=batchmode
#KNIT     := cd $(BUILDDIR) && $(BINDIR)/knitr

all: clean header 

clean:
	rm -rf $(BUILDDIR)/* *.pdf $(CODEDIR)/*pdf $(CODEDIR)/doc_data.txt $(FIGDIR)

figs: $(FIGDIR)
	cd $(CODEDIR) && Rscript plots.r
	cd $(CODEDIR)  && pdftk Rplots.pdf  burst output "risk%01d.pdf"
	cd $(CODEDIR)  && pdfcrop risk1.pdf 
	cd $(CODEDIR)  && pdfcrop risk2.pdf 
	cd $(CODEDIR)  && pdfcrop risk3.pdf 
	cp $(CODEDIR)/risk*-crop.pdf $(FIGDIR)/.

$(BUILDDIR):
	mkdir -p $@

$(FIGDIR):
	mkdir -p $@

$(BUILDDIR)/%.pdf: %.tex
	($(TEX2PDF) $(<F) 1>/dev/null)


%: %.tex $(BUILDDIR) figs
	($(TEX2PDF) ../$(<F))
	($(TEX2PDF) ../$(<F))
	cp $(BUILDDIR)/$(@).pdf $(@).pdf 
