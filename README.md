# Windows Quick Fix
A collection of registry files and powershell scripts I can run to quickly fix things that annoy me about windows 11.

Useful for when reinstalling windows or when windows does it's occasional undoing of user settings.

# What each file does
* DisableNewContextMenu.reg - disables the windows 11 right click menu with the dynamic icons and restores the one from windows 10 and older
* DisableTelemetry.reg - sets the registry value that is supposed to disable telemetry altogether
* DisableTelemetrySvcs.ps1 - disables the tasks and services that report telemetry, just to be sure (run with right click then run in powershell)
* DisableWebSearch.reg - disables showing web results in the start menu when searching
* UninstallWebExperience.ps1 - removes the windows widget menu

All of the files ending in .reg won't take effect until you restart your computer

Notes:

* UninstallWebExperience.ps1 needs to be re-run every time the microsoft store updates stuff, probably also has to be rerun when updating windows but I have not confirmed this