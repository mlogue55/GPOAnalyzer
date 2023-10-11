﻿function Get-GPORevPassword {
    <#
    .SYNOPSIS
    Tries to find CPassword in Group Policies or given path and translate it to readable value

    .DESCRIPTION
    Tries to find CPassword in Group Policies or given path and translate it to readable value

    .PARAMETER Forest
    Target different Forest, by default current forest is used

    .PARAMETER ExcludeDomains
    Exclude domain from search, by default whole forest is scanned

    .PARAMETER IncludeDomains
    Include only specific domains, by default whole forest is scanned

    .PARAMETER ExtendedForestInformation
    Ability to provide Forest Information from another command to speed up processing

    .PARAMETER GPOPath
    Path where Group Policy content is located or where backup is located

    .EXAMPLE
    Get-GPORevPassword -GPOPath 'C:\Users\przemyslaw.klys\Desktop\GPOExport_2020.10.12'

    .EXAMPLE
    Get-GPORevPassword

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [alias('ForestName')][string] $Forest,
        [string[]] $ExcludeDomains,
        [alias('Domain', 'Domains')][string[]] $IncludeDomains,
        [System.Collections.IDictionary] $ExtendedForestInformation,
        [string[]] $GPOPath
    )
    if ($GPOPath) {
        foreach ($Path in $GPOPath) {
            $Items = Get-ChildItem -LiteralPath $Path -Recurse -Filter *.xml -ErrorAction SilentlyContinue -ErrorVariable err
            $Output = foreach ($XMLFileName in $Items) {
                $Password = Find-GPOPassword -Path $XMLFileName.FullName
                if ($Password) {
                    if ($XMLFileName.FullName -match '{\w{8}-\w{4}-\w{4}-\w{4}-\w{12}}') {
                        $GPOGUID = $matches[0]
                    }
                    [PSCustomObject] @{
                        RootPath     = $Path
                        PasswordFile = $XMLFileName.FullName
                        GUID         = $GPOGUID
                        Password     = $Password
                    }
                }
            }
        }
    } else {
        $ForestInformation = Get-WinADForestDetails -Forest $Forest -IncludeDomains $IncludeDomains -ExcludeDomains $ExcludeDomains -ExtendedForestInformation $ExtendedForestInformation
        foreach ($Domain in $ForestInformation.Domains) {
            $Path = -join ('\\', $Domain, '\SYSVOL\', $Domain, '\Policies')
            #Extract the all XML files in the Folder
            $Items = Get-ChildItem -LiteralPath $Path -Recurse -Filter *.xml -ErrorAction SilentlyContinue -ErrorVariable err
            $Output = foreach ($XMLFileName in $Items) {
                $Password = Find-GPOPassword -Path $XMLFileName.FullName
                if ($Password) {
                    # match regex
                    if ($XMLFileName.FullName -match '{\w{8}-\w{4}-\w{4}-\w{4}-\w{12}}') {
                        $GPOGUID = $matches[0]
                        $GPO = Get-GPORevAD -GPOGuid $GPOGUID -IncludeDomains $Domain
                        [PSCustomObject] @{
                            DisplayName  = $GPO.DisplayName
                            DomainName   = $GPO.DomainName
                            GUID         = $GPO.GUID
                            PasswordFile = $XMLFileName.FullName
                            Password     = $Password
                            Created      = $GPO.Created
                            Modified     = $GPO.Modified
                            Description  = $GPO.Description
                        }
                    } else {
                        [PSCustomObject] @{
                            DisplayName  = ''
                            DomainName   = ''
                            GUID         = ''
                            PasswordFile = $XMLFileName.FullName
                            Password     = $Password
                            Created      = ''
                            Modified     = ''
                            Description  = ''
                        }
                    }
                }
            }
            foreach ($e in $err) {
                Write-Warning "Get-GPORevPassword - $($e.Exception.Message) ($($e.CategoryInfo.Reason))"
            }
            $Output
        }
    }
}