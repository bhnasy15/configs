#!/usr/bin/sh
exitIfEscaped()
{
	if [ $? != 0 ]
	then
		exit 1
	fi
}
path="$HOME/Documents/pdfs"
file=$(ls "$path"/*.pdf | dmenu -l 10 -p "choose pdf: " )
exitIfEscaped
zathura "$file"

