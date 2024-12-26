# Install Windows Updates
$Response = Read-Host "Computer can be rebooted. Are you sure to run updates? [y/N]]"
if ($Response -EQ 'y') {
    Install-Module -Name PSWindowsUpdate -Scope AllUsers -AllowClobber -Force -Confirm:$False
    Import-Module -Name PSWindowsUpdate
    Install-WindowsUpdate -AcceptAll -IgnoreRebootRequired
}
else {
    Write-Host 'Updates skipped!'
}
