---
Module Name: GPORev
Module Guid: f7d4c9e4-0298-4f51-ad77-e8e3febebbde
Download Help Link: {{ Update Download Link }}
Help Version: {{ Please enter version of help manually (X.X.X.X) format }}
Locale: en-US
---

# GPORev Module
## Description
{{ Fill in the Description }}

## GPORev Cmdlets
### [Add-GPOPermission](Add-GPOPermission.md)
{{ Fill in the Synopsis }}

### [Add-GPORevPermission](Add-GPORevPermission.md)
{{ Fill in the Synopsis }}

### [Backup-GPORev](Backup-GPORev.md)
Provides Backup functionality to Group Policies

### [Clear-GPORevSysvolDFSR](Clear-GPORevSysvolDFSR.md)
{{ Fill in the Synopsis }}

### [ConvertFrom-CSExtension](ConvertFrom-CSExtension.md)
{{ Fill in the Synopsis }}

### [Export-GPORevContent](Export-GPORevContent.md)
Saves GPOs to XML or HTML files.

### [Find-CSExtension](Find-CSExtension.md)
{{ Fill in the Synopsis }}

### [Get-GPORev](Get-GPORev.md)
Gets information about all Group Policies.
Similar to what Get-GPO provides by default.

### [Get-GPORevAD](Get-GPORevAD.md)
{{ Fill in the Synopsis }}

### [Get-GPORevBackupInformation](Get-GPORevBackupInformation.md)
{{ Fill in the Synopsis }}

### [Get-GPORevBroken](Get-GPORevBroken.md)
Detects broken or otherwise damaged Group Policies

### [Get-GPORevBrokenLink](Get-GPORevBrokenLink.md)
Finds any GPO link that doesn't have a matching GPO (already removed GPO).

### [Get-GPORevDictionary](Get-GPORevDictionary.md)
{{ Fill in the Synopsis }}

### [Get-GPORevDuplicateObject](Get-GPORevDuplicateObject.md)
{{ Fill in the Synopsis }}

### [Get-GPORevFiles](Get-GPORevFiles.md)
{{ Fill in the Synopsis }}

### [Get-GPORevFilesPolicyDefinition](Get-GPORevFilesPolicyDefinition.md)
{{ Fill in the Synopsis }}

### [Get-GPORevFolders](Get-GPORevFolders.md)
{{ Fill in the Synopsis }}

### [Get-GPORevInheritance](Get-GPORevInheritance.md)
Short description

### [Get-GPORevLegacyFiles](Get-GPORevLegacyFiles.md)
{{ Fill in the Synopsis }}

### [Get-GPORevLink](Get-GPORevLink.md)
{{ Fill in the Synopsis }}

### [Get-GPORevLinkSummary](Get-GPORevLinkSummary.md)
{{ Fill in the Synopsis }}

### [Get-GPORevNetLogon](Get-GPORevNetLogon.md)
{{ Fill in the Synopsis }}

### [Get-GPORevOrganizationalUnit](Get-GPORevOrganizationalUnit.md)
{{ Fill in the Synopsis }}

### [Get-GPORevOwner](Get-GPORevOwner.md)
Gets owners of GPOs from Active Directory and SYSVOL

### [Get-GPORevPassword](Get-GPORevPassword.md)
Tries to find CPassword in Group Policies or given path and translate it to readable value

### [Get-GPORevPermission](Get-GPORevPermission.md)
{{ Fill in the Synopsis }}

### [Get-GPORevPermissionAnalysis](Get-GPORevPermissionAnalysis.md)
{{ Fill in the Synopsis }}

### [Get-GPORevPermissionConsistency](Get-GPORevPermissionConsistency.md)
{{ Fill in the Synopsis }}

### [Get-GPORevPermissionIssue](Get-GPORevPermissionIssue.md)
Detects Group Policy missing Authenticated Users permission while not having higher permissions.

### [Get-GPORevPermissionRoot](Get-GPORevPermissionRoot.md)
{{ Fill in the Synopsis }}

### [Get-GPORevPermissionSummary](Get-GPORevPermissionSummary.md)
{{ Fill in the Synopsis }}

### [Get-GPORevSysvolDFSR](Get-GPORevSysvolDFSR.md)
Gets DFSR information from the SYSVOL DFSR

### [Get-GPORevUpdates](Get-GPORevUpdates.md)
Gets the list of GPOs created or updated in the last X number of days.

### [Get-GPORevWMI](Get-GPORevWMI.md)
Get Group Policy WMI filter

### [Invoke-GPORev](Invoke-GPORev.md)
Single cmdlet that provides 360 degree overview of Group Policies in Active Directory Forest.

### [Invoke-GPORevContent](Invoke-GPORevContent.md)
{{ Fill in the Synopsis }}

### [Invoke-GPORevPermission](Invoke-GPORevPermission.md)
{{ Fill in the Synopsis }}

### [Invoke-GPORevSupport](Invoke-GPORevSupport.md)
{{ Fill in the Synopsis }}

### [New-GPORevWMI](New-GPORevWMI.md)
{{ Fill in the Synopsis }}

### [Optimize-GPORev](Optimize-GPORev.md)
Enables or disables user/computer section of group policy based on it's content.

### [Remove-GPOPermission](Remove-GPOPermission.md)
{{ Fill in the Synopsis }}

### [Remove-GPORev](Remove-GPORev.md)
{{ Fill in the Synopsis }}

### [Remove-GPORevBroken](Remove-GPORevBroken.md)
Finds and removes broken Group Policies from SYSVOL or AD or both.

### [Remove-GPORevDuplicateObject](Remove-GPORevDuplicateObject.md)
{{ Fill in the Synopsis }}

### [Remove-GPORevFolders](Remove-GPORevFolders.md)
{{ Fill in the Synopsis }}

### [Remove-GPORevLegacyFiles](Remove-GPORevLegacyFiles.md)
{{ Fill in the Synopsis }}

### [Remove-GPORevLinkEmptyOU](Remove-GPORevLinkEmptyOU.md)
{{ Fill in the Synopsis }}

### [Remove-GPORevPermission](Remove-GPORevPermission.md)
{{ Fill in the Synopsis }}

### [Remove-GPORevWMI](Remove-GPORevWMI.md)
{{ Fill in the Synopsis }}

### [Repair-GPORevBrokenLink](Repair-GPORevBrokenLink.md)
Removes any link to GPO that no longer exists.

### [Repair-GPORevNetLogonOwner](Repair-GPORevNetLogonOwner.md)
Sets new owner to each file in NetLogon share.

### [Repair-GPORevPermission](Repair-GPORevPermission.md)
{{ Fill in the Synopsis }}

### [Repair-GPORevPermissionConsistency](Repair-GPORevPermissionConsistency.md)
{{ Fill in the Synopsis }}

### [Restore-GPORev](Restore-GPORev.md)
{{ Fill in the Synopsis }}

### [Save-GPORevFiles](Save-GPORevFiles.md)
Exports GPO XML data to files and saves it to a given path

### [Set-GPOOwner](Set-GPOOwner.md)
Used within Invoke-GPORevPermission only.
Set new group policy owner.

### [Set-GPORevOwner](Set-GPORevOwner.md)
Sets GPO Owner to Domain Admins or other choosen account

### [Set-GPORevStatus](Set-GPORevStatus.md)
Enables or disables user/computer section of Group Policy.

### [Skip-GroupPolicy](Skip-GroupPolicy.md)
Used within ScriptBlocks only.
Allows to exclude Group Policy from being affected by fixes

