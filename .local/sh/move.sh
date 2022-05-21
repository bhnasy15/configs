#!/usr/bin/sh

what=$(echo -e "desktop to monitor\nnodes to desktop" | dmenu -p "move what? ")

if [ "$what" == "desktop to monitor" ]
then
	monitor=$(bspc query -M --names | dmenu -p "which monitor?")
	bspc desktop -m $monitor --follow
fi

if [ "$what" == "nodes to desktop" ]
then
	desktop=$(bspc query -D --names -d .\!occupied | dmenu -p "which desktop?")
	bspc node any.local.!hidden -d $desktop --follow
fi

