#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/projects/.dotfiles/ --work-tree=$HOME'
alias ghci='~/.ghcup/bin/ghci-9.4.7'
alias ghc='~/.ghcup/bin/ghc-9.4.7'
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

export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Created by `pipx` on 2023-10-21 13:14:15
export PATH="$PATH:/home/hylo/.local/bin"

export STARDICT_DATA_DIR=$HOME/dicts/stardict

