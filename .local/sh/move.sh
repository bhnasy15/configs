#!/usr/bin/sh
exitIfEscaped()
{
	if [ $? != 0 ]
	then
		exit 1
	fi
}

what=$(echo -e "nodes to desktop\ndesktop to monitor" | dmenu -p "move what? ")

if [ "$what" == "desktop to monitor" ]
then
	monitor=$(bspc query -M --names | dmenu -p "which monitor?")
	exitIfEscaped
	bspc desktop -m $monitor --follow

elif [ "$what" == "nodes to desktop" ]
then
	desktop=$(bspc query -D --names -d .\!occupied | dmenu -p "which desktop?")
	exitIfEscaped
	bspc node any.local.!hidden -d $desktop --follow
fi

