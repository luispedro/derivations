%.pdf: %.tex
	./build.sh $<

all: $(addsuffix .pdf, $(basename $(wildcard . *.tex)))

