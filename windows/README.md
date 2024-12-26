# Getting Started [Launch PowerShell as Administrator]

1. Install Core Apps

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WingetApps.ps1' -OutFile "$HOME/Install-WingetApps.ps1"
& "$HOME\Install-WingetApps.ps1" -AdditionalApps 'Google.Chrome', 'qBittorrent.qBittorrent' -InstallCoreApps

```

2. Install WSL

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WSL.ps1' -OutFile "$HOME/Install-WSL.ps1"
& "$HOME\Install-WSL.ps1" -LinuxDistroWingetId 'Canonical.Ubuntu.2404'

```
