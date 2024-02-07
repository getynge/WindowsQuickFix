$winID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$winPrinciple = New-Object System.Security.Principal.WindowsPrincipal($winID)
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator

if (!$winPrinciple.IsInRole($adminRole)) {
    # If script is not running as admin, re-run script as admin
    $proc = new-object System.Diagnostics.ProcessStartInfo "pwsh";
    $proc.Arguments = $MyInvocation.MyCommand.Definition;
    $proc.Verb = "runas"
    [System.Diagnostics.Process]::Start($proc)
    exit
}

Set-Service -StartupType Disabled dmwappushservice
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program" | Disable-ScheduledTask