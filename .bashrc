#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/projects/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

eval "$(zoxide init bash --cmd j)"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

bind -x '"\C-f": ~/.local/scripts/tms.sh'
bind -x '"\C-n": ~/.local/scripts/tms.sh ~/ misc'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
