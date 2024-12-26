if (![bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
    Write-Error 'Please run the script as Admin!'
}

Write-Warning 'Please note: If you choose to restart the computer when prompted, remember to rerun the script once the system comes back online!'

## Install Windows Updates
# Install-Module -Name PSWindowsUpdate -Scope AllUsers -AllowClobber -Force -Confirm:$False
# Import-Module -Name PSWindowsUpdate -IgnoreRebootRequired
# Install-WindowsUpdate -AcceptAll

## Install Winget
# $URL = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
# $URL = (Invoke-WebRequest -Uri $URL).Content | ConvertFrom-Json |
# Select-Object -ExpandProperty "assets" |
# Where-Object "browser_download_url" -Match '.msixbundle' |
# Select-Object -ExpandProperty "browser_download_url"

# Invoke-WebRequest -Uri $URL -OutFile "Setup.msix" -UseBasicParsing
# Add-AppxPackage -Path "Setup.msix"
# Remove-Item "Setup.msix"

$InstallPackages = @(
    'Docker.DockerDesktop',
    '9N0DX20HK701' # Windows terminal
    'Hashicorp.Vagrant',
    'GitHub.cli',
    'Hashicorp.Terraform',
    'Neovim.Neovim',
    'GoLang.Go',
    'Python.Python.3.13',
    'XP9KHM4BK9FZ7Q', #VS Code
    '7zip.7zip',
    'JanDeDobbeleer.OhMyPosh',
    'junegunn.fzf',
    'Microsoft.PowerShell',
    'Microsoft.AzureCLI',
    'Microsoft.WSL',
    'Mozilla.Firefox',
    'OpenJS.NodeJS',
    'Notepad++.Notepad++',
    'RubyInstallerTeam.RubyWithDevKit.3.2',
    'Git.Git',
    'Pulumi.Pulumi',
    'Helm.Helm',
    'Kubernetes.kubectl',
    'Canonical.Ubuntu.2404'
)

$RestartRequired = $false
if ((Get-WindowsOptionalFeature -Online -FeatureName 'VirtualMachinePlatform').State -NE 'Enabled') { 
    Enable-WindowsOptionalFeature -FeatureName 'VirtualMachinePlatform' -Online -All -NoRestart
    $RestartRequired = $True
}
if ((Get-WindowsOptionalFeature -Online -FeatureName 'HypervisorPlatform').State -NE 'Enabled') { 
    Enable-WindowsOptionalFeature -FeatureName 'HypervisorPlatform' -Online -All -NoRestart
    $RestartRequired = $True
}
if ((Get-WindowsOptionalFeature -Online -FeatureName 'Microsoft-Windows-Subsystem-Linux').State -NE 'Enabled') { 
    Enable-WindowsOptionalFeature -FeatureName 'Microsoft-Windows-Subsystem-Linux' -Online -All -NoRestart
    $RestartRequired = $True
}

if ($RestartRequired) {
    Write-Warning 'Please note: If you choose to restart the computer, remember to RERUN the script once the system comes back online!'
    Restart-Computer -Confirm
}


$i = 0; $s = 0
foreach ($App in $InstallPackages) {
    $DoesNotExist = (winget.exe list --id $App)[-1].Contains('No installed package found')
    if ($DoesNotExist) {
        Write-Host "Installing package $App ..."
        winget.exe install --id $App --silent --force
        $i += 1
    }
    else {
        Write-Host "App $App exists, skipping!"
        $s += 1
    }
}

Write-Output "(@(& '$env:LOCALAPPDATA\Programs\oh-my-posh\bin\oh-my-posh.exe' init powershell --config='$env:LOCALAPPDATA\Programs\oh-my-posh\themes\honukai.omp.json' --print) -join '`n') | Invoke-Expression" | Out-File -Path $PROFILE -Append -Encoding utf8

Write-Host "$i/$($InstallPackages.count) Packages and $($InstallFeatures.count) were installed successfully 🙌! $s packages are already installed. Please launch a fresh PowerShell terminal 😊" -ForegroundColor Green