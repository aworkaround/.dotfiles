# Getting Started [Launch PowerShell as Administrator]

1. Install Windows Updates

```powershell
.\install-windows-updates.ps1

```

2. Install Core Apps

```powershell
.\install-apps.ps1 -AdditionalApps 'Google.Chrome', 'qBittorrent.qBittorrent'

```

3. Install WSL

```powershell
.\install-wsl.ps1 -LinuxDistroWingetId 'Canonical.Ubuntu.2404'

```
