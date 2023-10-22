#!/bin/bash

export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/bin:$HOME/.cargo/bin/:$HOME/.ghcup/bin/
export EDITOR=nvim
export CPATH=/home/yarob/.local/include
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LD_PRELOAD="/home/yarob/.local/lib/stderred/libstderred.so"

startx  
#river
#Hyprland
#sway --unsupported-gpu
