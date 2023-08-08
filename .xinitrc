#!/usr/bin/sh

# xrandr --setprovideroutputsource NVIDIA-G0
# xrandr --auto

export _JAVA_AWT_WM_NONREPARENTING=1
# export ZDOTDIR=$HOME/.config/zsh
export TERM=alacritty
export SCRIPT=$HOME/.local/sh
export XDG_CONFIG_HOME=$HOME/.config

xsetroot -cursor_name left_ptr &
xset +dpms &
xset s 360 60 &
[ -f "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources" &

pidof lxpolkit || /usr/bin/lxpolkit &
pidof dunst || dunst &
pidof xss-lock || xss-lock \
  -n "bash -c 'light -O; light -S 5; trap \"light -I\" EXIT; sleep 9999;'" \
  -- i3lock -c#000000 &

/usr/bin/i3
