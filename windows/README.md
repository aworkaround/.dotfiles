# GETTING STARTED

## INSTALL AND CONFIGURE WINDOWS 10 OR 11

1. Install Apps **[Launch PowerShell as Administrator]**

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WingetApps.ps1' -OutFile "$HOME/Install-WingetApps.ps1"
& "$HOME\Install-WingetApps.ps1" -InstallCoreApps -AdditionalApps 'Google.Chrome', 'Kubernetes.kind'

```

2. Install WSL **[Launch PowerShell as Administrator]**

```powershell
iwr 'https://github.com/aworkaround/dotfiles/raw/refs/heads/main/windows/Install-WSL.ps1' -OutFile "$HOME/Install-WSL.ps1"
& "$HOME\Install-WSL.ps1"

```
