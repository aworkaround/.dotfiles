# Getting Started [Launch PowerShell as Administrator]

1. Install Windows Updates

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WindowsUpdates.ps1' -OutFile "$HOME/Install-WindowsUpdates.ps1"
& "$HOME\Install-WindowsUpdates.ps1"

```

2. Install Core Apps

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WingetApps.ps1' -OutFile "$HOME/Install-WingetApps.ps1"
& "$HOME\Install-WingetApps.ps1" -AdditionalApps 'Google.Chrome', 'qBittorrent.qBittorrent'

```

3. Install WSL

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WSL.ps1' -OutFile "$HOME/Install-WSL.ps1"
& "$HOME\Install-WSL.ps1" -LinuxDistroWingetId 'Canonical.Ubuntu.2404'

```
