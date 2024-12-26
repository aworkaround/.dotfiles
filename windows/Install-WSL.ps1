[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $LinuxDistroWingetId = 'Canonical.Ubuntu.2404'
)

# Install Ubuntu24.04 if not installed already
$DoesNotExist = (winget.exe list --id $LinuxDistroWingetId --accept-source-agreements)[-1].Contains('No installed package found')
if ($DoesNotExist) {
    Write-Host "Installing $LinuxDistroWingetId..." -ForegroundColor Yellow
    winget install --id $LinuxDistroWingetId --silent --accept-source-agreements --accept-package-agreements
}

$RestartRequired = $false
if ((Get-WindowsOptionalFeature -Online -FeatureName 'VirtualMachinePlatform').State -NE 'Enabled') { 
    Write-Information 'Installing VirtualMachinePlatform feature...'
    Enable-WindowsOptionalFeature -FeatureName 'VirtualMachinePlatform' -Online -All -NoRestart
    $RestartRequired = $True
}
if ((Get-WindowsOptionalFeature -Online -FeatureName 'HypervisorPlatform').State -NE 'Enabled') { 
    Write-Information 'Installing HypervisorPlatform feature...'
    Enable-WindowsOptionalFeature -FeatureName 'HypervisorPlatform' -Online -All -NoRestart
    $RestartRequired = $True
}
if ((Get-WindowsOptionalFeature -Online -FeatureName 'Microsoft-Windows-Subsystem-Linux').State -NE 'Enabled') { 
    Write-Information 'Installing Microsoft-Windows-Subsystem-Linux feature...'
    Enable-WindowsOptionalFeature -FeatureName 'Microsoft-Windows-Subsystem-Linux' -Online -All -NoRestart
    $RestartRequired = $True
}

if ($RestartRequired) {
    Write-Warning 'If you choose to restart the computer, remember to RERUN the script once the system comes back online!'
    Restart-Computer -Confirm
}