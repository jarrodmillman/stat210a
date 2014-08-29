BUILDDIR  = _build
#BINDIR    = ../../bin
TEX2PDF  := cd $(BUILDDIR) && TEXINPUTS="..:" pdflatex -interaction=batchmode
#KNIT     := cd $(BUILDDIR) && $(BINDIR)/knitr

all: clean header 

clean:
	rm -rf $(BUILDDIR)/* *.pdf

$(BUILDDIR):
	mkdir -p $@

$(BUILDDIR)/%.pdf: %.tex
	($(TEX2PDF) $(<F) 1>/dev/null)


%: %.tex $(BUILDDIR)
	($(TEX2PDF) ../$(<F))
	($(TEX2PDF) ../$(<F))
	cp $(BUILDDIR)/$(@).pdf $(@).pdf 
