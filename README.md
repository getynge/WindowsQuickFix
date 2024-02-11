# Windows Quick Fix
A collection of registry files and powershell scripts I can run to quickly disable windows features/settings that cannot be managed
via graphical settings menus.

# What each file does
* unstable/DisableDynamicTick.ps1 - disables kernel dynamic tick (see why section)
* unstable/EnableDynamicTick.ps1 - enables kernel dynamic tick (this is enabled by default and therefore is only used to revert the above script)
* DisableModernStandby.reg - disables s0 low power idle (modern standby)
* DisableNewContextMenu.reg - disables the windows 11 right click menu with the dynamic icons and restores the one from windows 10 and older
* DisableTelemetry.reg - sets the registry value that is supposed to disable telemetry altogether
* DisableTelemetrySvcs.ps1 - disables the tasks and services that report telemetry, just to be sure (run with right click then run in powershell)
* DisableWebSearch.reg - disables showing web results in the start menu when searching
* UninstallWebExperience.ps1 - removes the windows widget menu

All of the files ending in .reg won't take effect until you restart your computer.

The unstable folder contains fixes that fix issues on some systems, but cause more issues on others, use them at your own risk.

# Why each fix exists
## Disable Dynamic Tick
WARNING: may cause blue screens/significant performance drops instead of performance boosts

In some hardware/driver configurations dynamic tick can cause stuttering in video games on otherwise high performance systems.
It is worth trying to disable game mode first as this can also cause stuttering, and this fix may also require game mode be disabled anyway depending on the system.
Do not use this fix if you do not experience stuttering, due to the potential issues with applying this fix.

## Enable Dynamic Tick 
As mentioned in the prior section disabling dynamic tick can sometimes cause issues, use this to revert the changes if issues occur.

NOTE: If you ran this to fix bluescreen/config issues, you may have to fix minor configuration problems after reboot. In my case I had to reinstall my user-installed fonts and set my display refresh rate back to 240hz after the reboot reset it to 60hz.

## Disable Modern Standby
Modern standby consumes more power than normal standby. The upside is that modern standby can be used to help keep a system up to date, but the downside
of that use case specifically is that sometimes laptops will consume significant power while in backpacks and such due to issues with how modern standby handles
power disconnects. Many times I have put my laptop in my backpack only to take it out with a near dead battery and a hot chasis an hour later.

## Disable New Context Menu
The new context menu has fewer features than the old context menu, application extensions still typically go in the old context menu,
reaching the old context menu is an extra step, and I personally find that the icons on the new context menu reduce rather than raise usability.

## Disable Telemetry
Windows collects data as part of gathering the information necessary to fix bugs and improve operating system features.
There is no way to disable telemetry entirely using settings, while the required telemetry is probably fine I still like having the option of being able to disable it completely.

## Disable Web Search
The start menu search function can retrieve results incredibly quickly, this process is slowed down dramatically when retrieving web results, not to mention the fact they introduce visual clutter.

## Uninstall Web Experience Pack
I like the idea of widgets but I don't like the news being a mandatory part of the view so I just throw away the whole thing.

# Additional Fixes
## Disable Game Mode
On some systems Game Mode will cause a slight increase in peak performance but will also increase stuttering, especially in VR applications, it may be worthwhile to disable game mode to see if it helps with stuttering issues if you have them.

# Notes

* UninstallWebExperience.ps1 needs to be re-run every time the microsoft store updates stuff, probably also has to be rerun when updating windows but I have not confirmed this.
* Windows sometimes reverts registry entries to their original values during system updates and such, it may be wise to periodically re-run these scripts.