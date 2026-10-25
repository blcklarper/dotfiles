if status is-interactive
    fastfetch
end

set -g fish_greeting
export EDITOR=nvim
export VISUAL=nvim

set -l ssh_env_file ~/.ssh/agent_env.fish

if test -f $ssh_env_file
    source $ssh_env_file >/dev/null
end

# aliases : 
alias f="fastfetch"
alias c="clear"
alias n="nvim"
alias d="sudo nano /etc/nixos/configuration.nix"
alias r="sudo nixos-rebuild switch"
alias conf="nvim ~/.config/fish/config.fish"
alias rel="source ~/.config/fish/config.fish"
alias scripts="cd ~/Documents/scripts/"
alias gith="cd ~/Documents/scripts/github/"
alias mc="cd ~/Documents/ && appimage-run ./PrismLauncher-Linux-x86_64.appimage"

if not ssh-add -l >/dev/null 2>&1
    if not set -q SSH_AGENT_PID; or not kill -0 $SSH_AGENT_PID 2>/dev/null
        eval (ssh-agent -c) >/dev/null 2>&1
        set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -gx SSH_AGENT_PID $SSH_AGENT_PID
        echo "set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK; set -gx SSH_AGENT_PID $SSH_AGENT_PID" >$ssh_env_file
    end
    ssh-add ~/.ssh/id_ed25519_cb >/dev/null 2>&1
end
