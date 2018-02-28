#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

EXTENSION=pdf

if [ "$1" == "word" ]; then
  EXTENSION=docx
fi

pandoc -s -S --bibliography $DIR/biblio.yaml --filter pandoc-citeproc --csl $DIR/ieee.csl $DIR/paper.md -o $DIR/mywell_paper."$EXTENSION" || exit 1
open $DIR/mywell_paper."$EXTENSION"
