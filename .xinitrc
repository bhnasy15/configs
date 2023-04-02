#!/usr/bin/sh

# xrandr --setprovideroutputsource NVIDIA-G0
# xrandr --auto

# polkit manager
pidof lxpolkit || /usr/bin/lxpolkit &
pidof dunst || dunst &
pidof xautolock || xautolock -time 10 -locker xsecurelock \
	-notify 20 -notifier 'notify-send "Screen Lock in 20s !"' &

xsetroot -cursor_name left_ptr &

userresources=$HOME/.Xresources
[ -f "$userresources" ] && xrdb -merge "$userresources"

/usr/bin/bspwm

