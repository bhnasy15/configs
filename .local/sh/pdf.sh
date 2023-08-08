#!/bin/bash
path="$HOME/Documents/pdfs"
file=$(ls "$path"/*.pdf | dmenu -l 10 -p "choose pdf: " )

if [ $? != 0 ]
then
  exit 1
fi

zathura "$file"

