
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza'
alias grep='grep --color=auto'

eval "$(starship init bash)"
eval "$(zoxide init bash --cmd j)"

bind -x '"\C-f": ~/.local/scripts/tms.sh'
bind -x '"\C-n": ~/.local/scripts/tms.sh ~/ misc'

source /usr/share/nvm/init-nvm.sh

#ssh
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
