export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# List of plugins can be found here https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(git ansible asdf aws azure bun cp dnf docker docker-compose gh git golang helm httpie istioctl kind kubectl kubectx minikube mongocli npm nvm pep8 pip pipenv poetry pyenv ssh tmux ufw vagrant virtualenv vscode yarn)

source $ZSH/oh-my-zsh.sh

############################
###### CUSTOM CONFIG #######
############################

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
alias ks='kubectl get pods'
alias ka='kubectl get pods -A'
alias ks='kubectl get pods -o wide'
alias kla='kubectl get pods -o wide -A'
alias kal='kubectl get pods -o wide -A'

## Ctrl+Backspace Fix
bindkey '^H' backward-kill-word
bindkey '^?' backward-delete-char

clear
