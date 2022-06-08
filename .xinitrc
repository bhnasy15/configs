#!/bin/sh

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

export PATH=$PATH:$HOME/.local/share/bin
export _JAVA_AWT_WM_NONREPARENTING=1
export ZDOTDIR=$HOME/.config/zsh
export EDITOR=nvim
export TERM=st
export SCRIPT=$HOME/.local/sh
export XDG_CONFIG_HOME=$HOME/.config

# polkit manager
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# merge in defaults and keymaps

userresources=$HOME/.Xresources
[ -f "$userresources" ] && xrdb -merge "$userresources"

# usermodmap=$HOME/.Xmodmap
# [ -f "$usermodmap" ] && xmodmap "$usermodmap"

# scripts-path=<path>
# if [ -d $scripts-path ] ; then
 # for f in $scripts-path/?*.sh ; do
  # [ -x "$f" ] && . "$f"
 # done
 # unset f
# fi

/usr/bin/bspwm

