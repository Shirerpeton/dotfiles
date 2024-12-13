function fish_greeting
end

function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert \cf  '~/.local/scripts/tms.sh'
    bind -M insert \cn '~/.local/scripts/tms.sh ~/ misc'
    #bind -M insert \cn 'cd (fd . -t d | fzf)'
    bind -M insert \es 'fish_commandline_prepend doas'
end

function __fish_prepend_sudo
end

function last_history_item
    echo $history[1]
end

nvm use --silent latest

if status is-interactive
    alias ls 'eza'
    #alias grep 'grep --color=auto'
    alias ks 'keepassxc-cli open ~/pswd/Passwords.kdbx'
    alias sudo "doas"

    alias jj 'j (fd . -t d | fzf)'
    alias jh 'j (fd . '/home/hylo/' -t d | fzf)'

    abbr --add sudo doas
    abbr --add d doas
    abbr --add pc --position anywhere pacman
    abbr --add n --position anywhere nvim
    abbr --add !! --position anywhere --function last_history_item
    abbr --add ddcd doas docker compose down
    abbr --add ddcdv doas docker compose down -v
    abbr --add ddcb doas docker compose build
    abbr --add ddcu doas docker compose up

    abbr --add nivm nvim

    abbr --add find fd
    abbr --add grep rg
    abbr --add curl xh


    #ssh
    set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
    set -x NODE_EXTRA_CA_CERTS "/etc/ca-certificates/trust-source/anchors/corp-ca.crt"
    ssh-add ~/.ssh/gitlab 2> /dev/null

    #source /usr/share/nvm/init-nvm.sh

    starship init fish | source
    zoxide init fish --cmd j | source
    fzf --fish | source

    # bun
    set BUN_INSTALL "$HOME/.bun"
    set PATH $BUN_INSTALL/bin:$PATH

    #pipx
    set PATH "$PATH:/home/hylo/.local/bin"

    # pnpm
    set -gx PNPM_HOME "/home/hylo/.local/share/pnpm"
    if not string match -q -- $PNPM_HOME $PATH
      set -gx PATH "$PNPM_HOME" $PATH
    end
    # pnpm end

    if uwsm check may-start &>/dev/null
        exec uwsm start hyprland.desktop
    end
end
