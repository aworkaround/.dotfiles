# INTRODUCTION

This is dotfiles repo which contains custom configs related to **Windows 11** + **UBUNTU WSL** installed on my Desktop. This can be reused using GNU Stow tool to quickly create dotfiles.

> ❗Caution: Not recommended to be used on existing configured devices. This is tested in Windows 10, 11, Ubuntu 20.04 and higher versions 🙌

<!-- markdownlint-disable MD025 -->
# GETTING STARTED

## PREREQUISITES TO BE INSTALLED / GOOD TO HAVE

1. Install Windows updates
2. Install optional updates
3. Install `Winget-AutoUpdate-aaS` package from Microsoft Store.
4. Install `PowerShell` package from Microsoft Store.

## INSTALL AND CONFIGURE WINDOWS 10 OR 11

### Install Apps **[Launch PowerShell Core as Administrator]**

```powershell
. { iwr -useb 'decr.in/pswinget' } | iex;

```

### Install WSL **[Launch Windows PowerShell as Administrator]**

```powershell
. { iwr -useb 'decr.in/pswsl' } | iex;

```

## INSTALL AND CONFIGURE UBUNTU WSL

1. Go to [my dotfiles](https://github.com/devcrypted/dotfiles.git) repo and fork it.
2. Change my repo with yours. And run below commands:

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install git -y
git clone https://github.com/devcrypted/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x installer.sh
sudo ./installer.sh

```

# 🌍 GOOD TO KNOW THINGS

## 🔁 HOW TO BACKUP DOTFILES

1. Copy Any dotfile from user home (~) to dotfiles folder. E.g. `cp ~/.zshrc ~/dotfiles/.zshrc`
2. Stow add `stow . --dotfiles --adopt`
3. CD to dotfiles directory `cd ~/dotfiles`
4. Git Add `git add .`
5. Git Commit `git commit -m 'Added .zshrc dotfile'`
6. Git Push `git push origin main`

## ⬇️ HOW TO RESTORE DOTFILES

1. Git Clone `git clone git@github.com:devcrypted/dotfiles.git -b main ~/dotfiles`
2. CD to Dotfiles `cd ~/dotfiles`
3. CAUTION: This command will replace your existing dotfiles in $HOME. Stow add `stow . --dotfiles --adopt`. Use it without `--adopt` if you're not sure.

## ℹ️ CONSIDERATIONS

- If you want to ignore any dotfile to be commited in Git, add it to `.gitignore` file.
- If you want to ignore any dotfile to become symlink by Stow, add it to `.stow-local-ignore` file.
- Don't store any secrets, keys, tokens, and SSH RSA keys to this repo for security.

## 🧪 TESTING CHANGES IN THIS REPO

- You can create your own Docker image using command `docker build -t ubuntu-custom ~/dotfiles`
- Then you can run container `docker run -d --name ubuntu1 ubuntu-custom`
- Login to container using exec `docker exec -u root -it abcd /bin/bash`
- Set password for user **ubuntu** using `passwd ubuntu`
- Exit `exit`
- Login using ubuntu user `docker exec -u ubuntu -it abcd /bin/bash`
- Clone dotfiles `git clone https://github.com/devcrypted/dotfiles.git ~/dotfiles`
- Test it by running command `chmod +x init.sh && sudo ./init.sh`
