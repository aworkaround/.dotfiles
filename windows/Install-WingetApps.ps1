[CmdletBinding()]
param (
    [Parameter()]
    [Alias('AppId', 'AppIds')]
    [string[]]
    $AdditionalApps = @(),
    [Parameter()]
    [Alias('InstallBaseApps')]
    [switch]
    $InstallCoreApps
)

if (![bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
    Write-Error 'Please run the script as Admin!'
}

$DeveloperTools = @(
    'GitHub.cli',
    'GoLang.Go',
    'Python.Python.3.13',
    'OpenJS.NodeJS',
    'RubyInstallerTeam.RubyWithDevKit.3.2',
    'Git.Git',
    'Neovim.Neovim',
    'Notepad++.Notepad++',
    'DEVCOM.JetBrainsMonoNerdFont',
    'junegunn.fzf',
    'Microsoft.PowerShell',
    'Microsoft.AzureCLI',
    'Canonical.Ubuntu.2404',
    'Microsoft.PowerToys'
)

$CoreApps = @(
    '9N0DX20HK701', # Windows terminal
    'XP9KHM4BK9FZ7Q', # VS Code
    'Hashicorp.Vagrant',
    '7zip.7zip',
    'Mozilla.Firefox',
    'JanDeDobbeleer.OhMyPosh'
)

$VirtualizationApps = @(
    'Docker.DockerDesktop'
    'Microsoft.WSL' # Windows Subsystem for Linux
)

$ContainerizationApps = @(
    'Kubernetes.kubectl',
    'Helm.Helm'
)

$IaCTools = @(
    'Hashicorp.Terraform',
    'Pulumi.Pulumi'
)


function Install-WingetApp {
    param (
        [string]$AppId
    )
    
    try {
        $DoesNotExist = (winget.exe list --id $AppId --accept-source-agreements)[-1].Contains('No installed package found')
        if ($DoesNotExist) {
            Write-Host "Installing $AppId..." -ForegroundColor Yellow
            winget install --id $AppId --silent --accept-source-agreements --accept-package-agreements
        }
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$AppId installed successfully!" -ForegroundColor Green
        }
        else {
            Write-Host "Failed to install $AppId" -ForegroundColor Red
        }
    }
    catch {
        Write-Host "Error installing $AppId : $_" -ForegroundColor Red
    }
}

if ($InstallCoreApps) {
    $Apps = $DeveloperTools + $CoreApps + $VirtualizationApps + $ContainerizationApps + $IaCTools + $AdditionalApps
}
else {
    $Apps = $AdditionalApps
}

foreach ($App in $Apps) {
    Install-WingetApp -AppId $App
}

Write-Host "Packages were installed. Please check the output for errors if any!" -ForegroundColor Green
