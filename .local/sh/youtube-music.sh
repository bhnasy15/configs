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
	#clip=$(xclip -selection clip -o 2> /dev/null)
	clip=$(wl-paste)
	link=$(echo -e "$clip" | bemenu -p "this link? ")
	exitIfEscaped
	$TERM -t SCRIPT -e yt-dlp -f 140 -o '$HOME/Downloads/%(title)s.%(ext)s' $link
	exit 0
fi
src=$HOME/.local/src
#clip=$(xclip -selection clip -o 2> /dev/null)
clip=$(wl-paste)

if [ $? != 0 ]
then
	clip="null"
	link="list"
else
	link=$(echo -e "$clip\nlist" | bemenu -p "link or list ? ")
	exitIfEscaped
fi

list=""

whichList()
{
	list=$(ls $src/*.list | bemenu -p "which list: " -l 10)
	exitIfEscaped
}

# play from list
if [ "$link" == "list" ]
then
	whichList
	# final link/list
	link=$(echo -e "all\n$(cat $list)" | bemenu -p "which one? " -l 10)

	exitIfEscaped

	# play all
	if [ "$link" == "all" ]
	then
		$TERM -t SCRIPT -e mpv --no-video --loop-playlist=inf --ytdl-format=140 --playlist="$list"
	else
		$TERM -t SCRIPT -e mpv --no-video --loop-file=inf --ytdl-format=140 "$link"
	fi

# fallback
else
	# add to list ?
	if [ "$(echo -e "yes\nno" | bemenu -p "add \"$clip\" to a list? ")" == "yes" ]
	then
		whichList
		echo -e "$clip" >> $list
	fi

	exitIfEscaped

	$TERM -t SCRIPT -e mpv --no-video --loop-file=inf --ytdl-format=140 "$clip"
fi

