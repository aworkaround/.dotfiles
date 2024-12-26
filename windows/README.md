# Getting Started

1. Install Core Apps [Launch PowerShell **CORE** as Administrator]

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WingetApps.ps1' -OutFile "$HOME/Install-WingetApps.ps1"
& "$HOME\Install-WingetApps.ps1" -AdditionalApps 'Google.Chrome', 'qBittorrent.qBittorrent' -InstallCoreApps

```

1. Install WSL [Launch **Windows PowerShell** as Administrator]

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WSL.ps1' -OutFile "$HOME/Install-WSL.ps1"
& "$HOME\Install-WSL.ps1"

```
