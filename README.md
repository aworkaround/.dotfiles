# INTRODUCTION

This is dotfiles repo which contains custom configs related to my **UBUNTU WSL** installed on my Windows Desktop. This can be reused using GNU Stow tool to quickly create dotfiles.

# Getting Started

## Install and configure Windows 10 or 11 Apps

> ℹ️ You can find more packages at [winget.run](https://winget.run) and can copy the command to install them 🙌

```powershell
Invoke-WebRequest -Uri 'https://kamal.today/win-packages' -OutFile "$HOME/InstallWindowsPrograms.ps1"
Powershell.exe -ExecutionPolicy Bypass -File "$HOME/InstallWindowsPrograms.ps1"
```

## Install and configure Ubuntu WSL

> ❗Caution: Not recommended to be used on existing configured devices. This is tested in Ubuntu 20.04 and higher versions 🙌

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install git -y
git clone  ~/dotfiles
cd ~/dotfiles
chmod +x init.sh
sudo ./init.sh
```

# 🌍 Good to Know Things!

## 🔁 How to Backup (Add to GIT and Stow)

1. Copy Any dotfile from user home (~) to dotfiles folder. E.g. `cp ~/.zshrc ~/dotfiles/.zshrc`
2. Stow add `stow . --dotfiles --adopt`
3. CD to dotfiles directory `cd ~/dotfiles`
4. Git Add `git add .`
5. Git Commit `git commit -m 'Added .zshrc dotfile'`
6. Git Push `git push origin main`

## ⬇️ How to Restore

1. Git Clone `git clone git@github.com:aworkaround/dotfiles.git -b main ~/dotfiles`
2. CD to Dotfiles `cd ~/dotfiles`
3. CAUTION: This command will replace your existing dotfiles in $HOME. Stow add `stow . --dotfiles --adopt`. Use it without `--adopt` if you're not sure.

## ℹ️ Considerations

- If you want to ignore any dotfile to be commited in Git, add it to `.gitignore` file.
- If you want to ignore any dotfile to become symlink by Stow, add it to `.stow-local-ignore` file.
- Don't store any secrets, keys, tokens, and SSH RSA keys to this repo for security.

## 🧪 Testing

- You can create your own Docker image using command `docker build -t ubuntu-custom ~/dotfiles`
- Then you can run container `docker run -d --name ubuntu1 ubuntu-custom`
- Login to container using exec `docker exec -u root -it abcd /bin/bash`
- Set password for user **ubuntu** using `passwd ubuntu`
- Exit `exit`
- Login using ubuntu user `docker exec -u ubuntu -it abcd /bin/bash`
- Clone dotfiles `git clone https://github.com/aworkaround/dotfiles.git ~/dotfiles`
- Test it by running command `chmod +x init.sh && sudo ./init.sh`
