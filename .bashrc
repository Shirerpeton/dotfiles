
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza'
alias grep='grep --color=auto'
alias sudo='doas'
alias ks='keepassxc-cli open ~/pswd/Passwords.kdbx'

eval "$(starship init bash)"
eval "$(zoxide init bash --cmd j)"

bind -x '"\C-f": ~/.local/scripts/tms.sh'
bind -x '"\C-n": ~/.local/scripts/tms.sh ~/ misc'

#ssh
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Created by `pipx` on 2024-02-09 17:18:49
export PATH="$PATH:/home/hylo/.local/bin"

#nvm
source /usr/share/nvm/init-nvm.sh

# Load Angular CLI autocompletion.
source <(ng completion script)
