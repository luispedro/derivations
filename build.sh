#!/usr/bin/zsh

function build() {
  # This is appropriate for Ubuntu, but you might have to edit it if you get an
  # error:
  SAGE_ROOT=/usr/lib/sagemath/
  TEXINPUTS="$SAGE_ROOT/local/share/texmf//:$TEXINPUTS"
  input=$1
  mkdir -p .$input.tex_files
  cd .$input.tex_files
  TEXINPUTS=.:..:../images/:../figures/:$TEXINPUTS xelatex $input
  sage $input.sagetex.sage
  TEXINPUTS=.:..:../images/:../figures/:$TEXINPUTS xelatex $input
  TEXINPUTS=.:..:../images/:../figures/:$TEXINPUTS xelatex $input
  cp $input.pdf ..
  cd ..
}

input=`basename $1 .tex`
build $input
