@{
    AliasesToExport      = @('Get-GPORevSysvol', 'Get-GPORevFilesPolicyDefinitions', 'Show-GPORev', 'Show-GPO', 'Find-GPO')
    Author               = 'Original Author - Przemyslaw Klys; Modified to Read only commands - Matt Logue'
    CmdletsToExport      = @()
    CompanyName          = ''
    CompatiblePSEditions = @('Desktop')
    Copyright            = '(c) 2011 - 2023 Przemyslaw Klys @ Evotec. All rights reserved.'
    Description          = 'Group Policy Rev is a PowerShell module that aims to gather information about Group Policies.  Forked from GPOZaurr Module as a read only version.'
    FunctionsToExport    = @('Backup-GPORev', 'ConvertFrom-CSExtension', 'Export-GPORevContent', 'Find-CSExtension', 'Get-GPORev', 'Get-GPORevAD', 'Get-GPORevBackupInformation', 'Get-GPORevBroken', 'Get-GPORevBrokenLink', 'Get-GPORevDictionary', 'Get-GPORevDuplicateObject', 'Get-GPORevFiles', 'Get-GPORevFilesPolicyDefinition', 'Get-GPORevFolders', 'Get-GPORevInheritance', 'Get-GPORevLegacyFiles', 'Get-GPORevLink', 'Get-GPORevLinkSummary', 'Get-GPORevNetLogon', 'Get-GPORevOrganizationalUnit', 'Get-GPORevOwner', 'Get-GPORevPassword', 'Get-GPORevPermission', 'Get-GPORevPermissionAnalysis', 'Get-GPORevPermissionConsistency', 'Get-GPORevPermissionIssue', 'Get-GPORevPermissionRoot', 'Get-GPORevPermissionSummary', 'Get-GPORevRedirect', 'Get-GPORevSysvolDFSR', 'Get-GPORevUpdates', 'Get-GPORevWMI', 'Invoke-GPORev', 'Invoke-GPORevContent', 'Invoke-GPORevPermission', 'Invoke-GPORevSupport', 'New-GPORevWMI', 'Optimize-GPORev', 'Skip-GroupPolicy')
    GUID                 = '7f761ac3-d5c4-4f6c-b855-cdd0023b9c17'
    ModuleVersion        = '0.1.0'
    PowerShellVersion    = '5.1'
    PrivateData          = @{
        PSData = @{
            ExternalModuleDependencies = @('CimCmdlets', 'Microsoft.PowerShell.Management', 'Microsoft.PowerShell.Utility', 'Microsoft.PowerShell.Security')
            ProjectUri                 = 'https://github.com/mlogue55/GPOAnalyzer'
            Tags                       = @('Windows', 'ActiveDirectory', 'GPO', 'GroupPolicy')
        }
    }
    RequiredModules      = @(@{
            Guid          = '0b0ba5c5-ec85-4c2b-a718-874e55a8bc3f'
            ModuleName    = 'PSWriteColor'
            ModuleVersion = '1.0.1'
        }, @{
            Guid          = 'ee272aa8-baaa-4edf-9f45-b6d6f7d844fe'
            ModuleName    = 'PSSharedGoods'
            ModuleVersion = '0.0.266'
        }, @{
            Guid          = '9fc9fd61-7f11-4f4b-a527-084086f1905f'
            ModuleName    = 'ADEssentials'
            ModuleVersion = '0.0.165'
        }, @{
            Guid          = 'a7bdf640-f5cb-4acf-9de0-365b322d245c'
            ModuleName    = 'PSWriteHTML'
            ModuleVersion = '1.8.0'
        }, 'CimCmdlets', 'Microsoft.PowerShell.Management', 'Microsoft.PowerShell.Utility', 'Microsoft.PowerShell.Security')
    RootModule           = 'GPORev.psm1'
}