#!/usr/bin/sh

src=$HOME/.local/src
clip=$(xclip -selection clip -o)
link=$(echo $clip | dmenu -p "link or list ? ")

# play from list
if [ "$link" == "list" ]
then
	list=$(ls $src/*.list | dmenu -p "which list: " -l 10)
	if [ $? == 0 ]
	then
		ls $list 2> /dev/null
		if [ $? != 0 ]
		then
			exit 1
		fi
	else
		exit 1
	fi

	# add to list ?
	if [ "$(echo -e "yes\nno" | dmenu -p "add \"$clip\" to list? ")" == "yes" ]
	then
		echo -e "\n$clip" >> $list
	fi

	# final link/list
	link=$(cat $list | dmenu -p "which one? " -l 10)

	# play all
	if [ "$link" == "all" ]
   	then
		st -g 60x10 -t SCRIPT -e mpv --no-video --loop-playlist=inf --ytdl-format=140 --playlist="$list"
	else
		st -g 60x10 -t SCRIPT -e mpv --no-video --loop-file=inf --ytdl-format=140 "$link"
	fi

# fallback
else
	st -g 60x10 -t SCRIPT -e mpv --no-video --loop-file=inf --ytdl-format=140 "$link"
fi

