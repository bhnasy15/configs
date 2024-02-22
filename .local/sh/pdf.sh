#!/bin/bash
path="$HOME/Documents/pdfs"
file=$(ls -1 "$path"/*.pdf | dmenu -i -l 10 -p "choose pdf: " )

if [ $? != 0 ]
then
  exit 1
fi

zathura "$file"

