#!/usr/bin/sh

# xrandr --setprovideroutputsource NVIDIA-G0
# xrandr --auto

export PATH=$PATH:$HOME/.local/share/bin:$HOME/.cargo/bin/
export _JAVA_AWT_WM_NONREPARENTING=1
export ZDOTDIR=$HOME/.config/zsh
export EDITOR=nvim
export TERM=alacritty
export SCRIPT=$HOME/.local/sh
export XDG_CONFIG_HOME=$HOME/.config

# polkit manager
#exec dbus-update-activation-environment --all
exec /usr/bin/lxpolkit &
exec xsetroot -cursor_name left_ptr &

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

