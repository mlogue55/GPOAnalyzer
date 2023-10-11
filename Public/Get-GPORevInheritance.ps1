﻿function Get-GPORevInheritance {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER IncludeBlockedObjects
    Include OU's with blocked inheritance. Default disabled

    .PARAMETER OnlyBlockedInheritance
    Show only OU's with blocked inheritance

    .PARAMETER IncludeExcludedObjects
    Show excluded objets. Default disabled

    .PARAMETER Exclusions
    Provide exclusions for OU's approved by IT. You can provide OU by canonical name or distinguishedName

    .PARAMETER Forest
    Target different Forest, by default current forest is used

    .PARAMETER ExcludeDomains
    Exclude domain from search, by default whole forest is scanned

    .PARAMETER IncludeDomains
    Include only specific domains, by default whole forest is scanned

    .PARAMETER ExtendedForestInformation
    Ability to provide Forest Information from another command to speed up processing

    .EXAMPLE
    $Objects = Get-GPORevInheritance -IncludeBlockedObjects -IncludeExcludedObjects -OnlyBlockedInheritance -Exclusions $ExcludedOU
    $Objects | Format-Table

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [switch] $IncludeBlockedObjects,
        [switch] $OnlyBlockedInheritance,
        [switch] $IncludeExcludedObjects,
        [switch] $IncludeGroupPoliciesForBlockedObjects,
        [string[]] $Exclusions,

        [alias('ForestName')][string] $Forest,
        [string[]] $ExcludeDomains,
        [alias('Domain', 'Domains')][string[]] $IncludeDomains,
        [System.Collections.IDictionary] $ExtendedForestInformation
    )
    Begin {
        $ExclusionsCache = @{}
        $ForestInformation = Get-WinADForestDetails -Extended -Forest $Forest -IncludeDomains $IncludeDomains -ExcludeDomains $ExcludeDomains -ExtendedForestInformation $ExtendedForestInformation
        foreach ($Exclusion in $Exclusions) {
            $ExclusionsCache[$Exclusion] = $true
        }
    }
    Process {
        foreach ($Domain in $ForestInformation.Domains) {
            $OrganizationalUnits = Get-ADOrganizationalUnit -Filter * -Properties gpOptions, canonicalName -Server $ForestInformation['QueryServers'][$Domain]['HostName'][0]
            foreach ($OU in $OrganizationalUnits) {
                $InheritanceInformation = [Ordered] @{
                    CanonicalName      = $OU.canonicalName
                    BlockedInheritance = if ($OU.gpOptions -eq 1) { $true } else { $false }
                    Exclude            = $false
                    DomainName         = ConvertFrom-DistinguishedName -ToDomainCN -DistinguishedName $OU.DistinguishedName
                }
                if ($InheritanceInformation.BlockedInheritance -and $IncludeGroupPoliciesForBlockedObjects.IsPresent) {
                    try {
                        $GPInheritance = Get-GPInheritance -Target $OU.distinguishedName -ErrorAction Stop
                    } catch {
                        Write-Warning -Message "Get-GPORevInheritance - Can't get GPInheritance for $($OU.distinguishedName). Error: $($_.Exception.Message)"
                        continue
                    }
                    $ActiveGroupPolicies = foreach ($GPO in $GPInheritance.InheritedGpoLinks) {
                        [PSCustomObject] @{
                            OrganizationalUnit   = $OU.canonicalName
                            DisplayName          = $GPO.DisplayName
                            DomainName           = $GPO.GpoDomainName
                            LinkedDirectly       = if ($OU.DistinguishedName -eq $GPO.Target) { $true } else { $false }
                            GPOID                = $GPO.GPOID
                            Enabled              = $GPO.Enabled
                            Enforced             = $GPO.Enforced
                            Order                = $GPO.Order
                            LinkedTo             = $GPO.Target
                            OrganizationalUnitDN = $OU.DistinguishedName
                        }
                    }
                } else {
                    $ActiveGroupPolicies = $null
                }
                if ($Exclusions) {
                    if ($ExclusionsCache[$OU.canonicalName]) {
                        $InheritanceInformation['Exclude'] = $true
                    } elseif ($ExclusionsCache[$OU.DistinguishedName]) {
                        $InheritanceInformation['Exclude'] = $true
                    }
                }
                if (-not $IncludeExcludedObjects -and $InheritanceInformation['Exclude']) {
                    continue
                }
                if (-not $IncludeBlockedObjects) {
                    if ($OnlyBlockedInheritance) {
                        if ($InheritanceInformation.BlockedInheritance -eq $true) {
                            [PSCustomObject] $InheritanceInformation
                        }
                    } else {
                        [PSCustomObject] $InheritanceInformation
                    }
                } else {
                    if ($InheritanceInformation) {
                        if ($InheritanceInformation.BlockedInheritance -eq $true) {
                            $InheritanceInformation['UsersCount'] = $null
                            $InheritanceInformation['ComputersCount'] = $null
                            [Array] $InheritanceInformation['Users'] = (Get-ADUser -SearchBase $OU.DistinguishedName -Server $ForestInformation['QueryServers'][$Domain]['HostName'][0] -Filter *).SamAccountName
                            [Array] $InheritanceInformation['Computers'] = (Get-ADComputer -SearchBase $OU.DistinguishedName -Server $ForestInformation['QueryServers'][$Domain]['HostName'][0] -Filter *).SamAccountName
                            $InheritanceInformation['UsersCount'] = $InheritanceInformation['Users'].Count
                            $InheritanceInformation['ComputersCount'] = $InheritanceInformation['Computers'].Count
                        } else {
                            $InheritanceInformation['UsersCount'] = $null
                            $InheritanceInformation['ComputersCount'] = $null
                            $InheritanceInformation['Users'] = $null
                            $InheritanceInformation['Computers'] = $null
                        }
                    }
                    $InheritanceInformation['DistinguishedName'] = $OU.DistinguishedName
                    $InheritanceInformation['GroupPolicies'] = $ActiveGroupPolicies
                    if ($OnlyBlockedInheritance) {
                        if ($InheritanceInformation.BlockedInheritance -eq $true) {
                            [PSCustomObject] $InheritanceInformation
                        }
                    } else {
                        [PSCustomObject] $InheritanceInformation
                    }
                }
            }
        }
    }
}