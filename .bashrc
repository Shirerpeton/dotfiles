#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/projects/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

eval $(ssh-agent) > /dev/null

bind -x '"\C-f": ~/.local/scripts/tms.sh'
bind -x '"\C-n": ~/.local/scripts/tms.sh ~/ misc'
