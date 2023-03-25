#!/usr/bin/sh

# xrandr --setprovideroutputsource NVIDIA-G0
# xrandr --auto

export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/bin:$HOME/.cargo/bin/
export _JAVA_AWT_WM_NONREPARENTING=1
# export ZDOTDIR=$HOME/.config/zsh
export EDITOR=nvim
export TERM=alacritty
export SCRIPT=$HOME/.local/sh
export XDG_CONFIG_HOME=$HOME/.config
export CPATH=/home/yarob/.local/include

# polkit manager
pidof lxpolkit || /usr/bin/lxpolkit &
pidof dunst || dunst &
pidof xautolock || xautolock -time 10 -locker xsecurelock \
	-notify 20 -notifier 'notify-send "Screen Lock in 20s !"' &

xsetroot -cursor_name left_ptr &

userresources=$HOME/.Xresources
[ -f "$userresources" ] && xrdb -merge "$userresources"

/usr/bin/bspwm

