function fish_greeting
end

function last_history_item
  echo $history[1]
end

function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert \cf '~/.local/scripts/tms.sh'
  bind -M insert \cn '~/.local/scripts/tms.sh ~/ misc'
end

if status is-interactive
  alias ls='eza'
  alias grep='grep --color=auto'
  alias sudo='doas'
  alias ks='keepassxc-cli open ~/pswd/Passwords.kdbx'

  abbr --add sudo doas
  abbr --add n nvim
  abbr --add d doas
  abbr --add sctl --position anywhere systemctl
  abbr --add pc --position anywhere pacman
  abbr --add !! --position anywhere --function last_history_item

  set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
  set -x PATH "$PATH:/home/hylo/.local/bin"

  starship init fish | source
  zoxide init fish --cmd j | source
end
