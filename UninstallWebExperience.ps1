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

winget uninstall MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');