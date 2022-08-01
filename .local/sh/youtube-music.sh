#!/usr/bin/sh

exitIfEscaped()
{
	if [ $? != 0 ]
	then
		exit 1
	fi
}

if [ $1 == "d" ]
then
	clip=$(xclip -selection clip -o 2> /dev/null)
	link=$(echo -e "$clip" | dmenu -p "this link? ")
	exitIfEscaped
	st -g 60x10 -t SCRIPT -e youtube-dl -f 140 -o '$HOME/Downloads/%(title)s.%(ext)s' $link
	exit 0
fi
src=$HOME/.local/src
clip=$(xclip -selection clip -o 2> /dev/null)

if [ $? != 0 ]
then
	clip=""
	link="list"
else
	link=$(echo -e "$clip\nlist" | dmenu -p "link or list ? ")
	exitIfEscaped
fi

list=""

whichList()
{
	list=$(ls $src/*.list | dmenu -p "which list: " -l 10)
	exitIfEscaped
}

# play from list
if [ "$link" == "list" ]
then
	whichList
	# final link/list
	link=$(echo -e "all\n$(cat $list)" | dmenu -p "which one? " -l 10)

	exitIfEscaped

	# play all
	if [ "$link" == "all" ]
	then
		st -g 60x10 -t SCRIPT -e mpv --no-video --loop-playlist=inf --ytdl-format=140 --playlist="$list"
	else
		st -g 60x10 -t SCRIPT -e mpv --no-video --loop-file=inf --ytdl-format=140 "$link"
	fi

# fallback
else
	# add to list ?
	if [ "$(echo -e "yes\nno" | dmenu -p "add \"$clip\" to a list? ")" == "yes" ]
	then
		whichList
		echo -e "$clip" >> $list
	fi

	exitIfEscaped

	st -g 60x10 -t SCRIPT -e mpv --no-video --loop-file=inf --ytdl-format=140 "$clip"
fi

