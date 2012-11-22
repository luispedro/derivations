#!/usr/bin/zsh

function build() {
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
