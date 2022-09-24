
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

set -o vi
bind "set keymap vi"
bind "set editing-mode vi"
bind "set bell-style visible"
bind "set completion-ignore-case on"
# alias
alias ls='ls -h --color=auto'
alias ll='ls -gol'
alias la='ls -A'

alias nv='neovide'
alias vim='nvim'
alias vi='vim'
alias vfm='vifmrun'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias mount='sudo mount -o uid=$USER'
alias umount='sudo umount'
alias batc='cat /sys/class/power_supply/BAT0/capacity'
alias bats='cat /sys/class/power_supply/BAT0/status'

# binding
bind -x '"\C-l": clear'

# prompt
function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}
#export PS1="\[\e[1m\]\`nonzero_return\`\[\e[32m\][\[\e[m\]\W\[\e[1m\]\[\e[32m\]]\[\e[m\] \\$  "
export PS1="\[\e[91m\]\`nonzero_return\`\[\e[m\] \W \[\e[1;32m\]>>\[\e[m\] "


# completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# color code
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

