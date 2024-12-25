#!/bin/bash

echo "Please enter your GitHub Email (To be used in .gitconfig file): "
read EMAIL

echo "Please enter your GitHub Full Name (To be used in .gitconfig file): "
read FULLNAME

echo -e "\033[0;33mNo more inputs required.\033[0m"
echo -e "\033[0;33mThis script can take some time to run, please be patient.\033[0m"

apt-get update && apt-get upgrade -y
apt-get install -y ansible git

ansible-galaxy role install gantsign.oh-my-zsh

ansible-playbook .playbooks/configure-ubuntu-wsl.yaml
ansible-playbook .playbooks/install-oh-my-zsh.yaml

mv ~/.zshrc ~/.zshrc.bak -f 2> /dev/null
mv ~/.bashrc ~/.bashrc.bak -f 2> /dev/null
mv ~/.tmux.conf ~/.tmux.conf.bak -f 2> /dev/null
stow . --dotfiles --adopt

cat > ~/.gitconfig << EOF
[user]
	email = $EMAIL
	name = $FULLNAME
[init]
	defaultBranch = main
[safe]
    directory = /home/$USERNAME/dotfiles
EOF

## Cleaning clutter
rm ~/.config/nvim/.git -rf
rm .git -rf

echo "Please consider giving me a star at https://github.com/aworkaround/dotfiles.git !!"
echo "You can create your own dotfiles repo and push ~/dotfiles directory there for further customizations!"

echo ""
echo -e "\033[0;32mYour device is ready to be used now. Enjoy\033[0m"
echo ""
