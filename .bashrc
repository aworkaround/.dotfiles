# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"
eval "$(rtx activate bash)"

## GENERAL
alias tf=terraform
alias k=kubectl
alias p=poetry
alias vim=hx
alias v=hx
alias g=git
alias h=helm

## PERSONAL CONFIGS
alias workspace='cd /media/workspace'
alias projects='cd /media/workspace/projects'

## KIND
alias create-cluster='kind create cluster --name kind-main --config ~/.kind.config'
alias delete-cluster='kind delete cluster --name kind-main'
alias reset-cluster='delete-cluster && create-cluster'

## KUBERNETES
export DRC="--dry-run=client --output=yaml"
export DRS="--dry-run=server --output=yaml"
alias kgp='kubectl get pods -o wide'
alias kgn='kubectl get nodes -o wide'

clear