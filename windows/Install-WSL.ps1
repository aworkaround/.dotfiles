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
    pwsh.exe -c "winget install --id $LinuxDistroWingetId --silent --accept-source-agreements --accept-package-agreements"
}

function Install-WindowsFeature ($Feature) {
    if ((Get-WindowsOptionalFeature -Online -FeatureName $Feature).State -NE 'Enabled') { 
        Write-Information "Installing $Feature feature..."
        Enable-WindowsOptionalFeature -FeatureName $Feature -Online -All -NoRestart
        Write-Host "Feature $Feature installed!" -ForegroundColor Green
    }
    else {
        Write-Host "Feature $Feature is already installed!" -ForegroundColor Blue
    }
}

$Features = @(
    'HypervisorPlatform',
    'Microsoft-Windows-Subsystem-Linux',
    'VirtualMachinePlatform'
)

$Features | ForEach-Object { Install-WindowsFeature -Feature $_ }