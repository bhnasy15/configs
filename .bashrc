# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

HISTFILESIZE=4444
HISTFILE=$HOME/.config/bash_history
IGNOREEOF=1
set -o vi
bind "set keymap vi"
bind "set editing-mode vi"
bind "set show-mode-in-prompt on"
bind "set vi-cmd-mode-string \"\e[2 q\""
bind "set vi-ins-mode-string \"\e[6 q\""
bind "set bell-style visible"
bind "set completion-ignore-case on"
bind -x '"\C-l": clear'


# alias
alias ls='ls -h --color=auto'
alias ll='ls -gol'
alias la='ls -A'

alias v='nvim'
alias em='emacsclient -c'
alias vf='vifm'
alias tm='tmux a || tmux'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias diff='diff --color=auto'

alias ip='ip --color=auto'

alias mount='sudo mount -o uid=$USER'
alias umount='sudo umount'

alias batc='cat /sys/class/power_supply/BAT0/capacity'
alias bats='cat /sys/class/power_supply/BAT0/status'

alias py='python3'
alias info='info --vi-keys'

alias ghci='LD_PRELOAD="" ghci'
alias feh='feh -Tdef'

# prompt
function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}
#export PS1="\[\e[1m\]\`nonzero_return\`\[\e[32m\][\[\e[m\]\W\[\e[1m\]\[\e[32m\]]\[\e[m\] \\$  "
export PS1="\[\e[91m\]\`nonzero_return\`\[\e[m\] \W \[\e[1;36m\]>>\[\e[m\] "

# completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }osc7_cwd
export LD_PRELOAD="$HOME/.local/lib/stderred/libstderred.so"

source /home/yarob/.config/broot/launcher/bash/br
