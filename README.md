# GPORev

Group Policy Reviwer is a PowerShell module that aims to gather information about Group Policies for analysis and adapted to a read only version from the original GPOZaurr module.
**GPORev** provides 360 degrees of information about Group Policies and their settings.

Just a single command (`Invoke-GPORev`) provides following reports:

- GPOBroken
- GPOBrokenLink
- GPOOwners
- GPOConsistency
- GPODuplicates
- GPOOrganizationalUnit
- GPOList
- GPOLinks
- GPOPassword
- GPOPermissions
- GPOPermissionsAdministrative
- GPOPermissionsRead
- GPOPermissionsRoot
- GPOPermissionsUnknown
- GPOFiles
- GPOBlockedInheritance
- GPOAnalysis
- GPOUpdates
- NetLogonOwners
- NetLogonPermissions
- SysVolLegacyFiles

But that's not all.
There are over 50 other commands available that make it even more powerful helping with day to day tasks to manage Group Policies.

To understand the usage of `Invoke-GPORev` The following blog post will give you more information on the original GPOZaurr module

- [The only command you will ever need to understand and fix your Group Policies (GPO)](https://evotec.xyz/the-only-command-you-will-ever-need-to-understand-and-fix-your-group-policies-gpo/)

## Installing

GPORev requires `RSAT` installed to provide results. If you don't have them you can install them as below. Keep in mind it also installs GUI tools so it shouldn't be installed on user workstations.

```powershell
# Windows 10 Latest
Add-WindowsCapability -Online -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0'
Add-WindowsCapability -Online -Name 'Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0'
```

Finally just install module:

```powershell
Install-Module -Name GPORev -AllowClobber -Force
```

Force and AllowClobber aren't necessary, but they do skip errors in case some appear.

## Updating

```powershell
Update-Module -Name GPORev
```

That's it. Whenever there's a new version, you run the command, and you can enjoy it. Remember that you may need to close, reopen PowerShell session if you have already used module before updating it.

**The essential thing** is if something works for you on production, keep using it till you test the new version on a test computer. I do changes that may not be big, but big enough that auto-update may break your code. For example, small rename to a parameter and your code stops working! Be responsible!