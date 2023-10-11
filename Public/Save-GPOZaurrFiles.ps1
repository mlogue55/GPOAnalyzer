﻿function Save-GPORevFiles {
    <#
    .SYNOPSIS
    Exports GPO XML data to files and saves it to a given path

    .DESCRIPTION
    Exports GPO XML data to files and saves it to a given path

    .PARAMETER Forest
    Target different Forest, by default current forest is used

    .PARAMETER ExcludeDomains
    Exclude domain from search, by default whole forest is scanned

    .PARAMETER IncludeDomains
    Include only specific domains, by default whole forest is scanned

    .PARAMETER ExtendedForestInformation
    Ability to provide Forest Information from another command to speed up processing

    .PARAMETER GPOPath
    Path where to save XML files from GPOReport

    .PARAMETER DeleteExisting
    Delete existing files before saving new ones

    .EXAMPLE
    Save-GPORevFiles -GPOPath 'C:\Support\GitHub\GPORev\Ignore\GPOExportEvotec' -DeleteExisting -Verbose

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [alias('ForestName')][string] $Forest,
        [string[]] $ExcludeDomains,
        [alias('Domain', 'Domains')][string[]] $IncludeDomains,
        [System.Collections.IDictionary] $ExtendedForestInformation,
        [string[]] $GPOPath,
        [switch] $DeleteExisting
    )
    if ($GPOPath) {
        if ($DeleteExisting) {
            $Test = Test-Path -LiteralPath $GPOPath
            if ($Test) {
                Write-Verbose "Save-GPORevFiles - Removing existing content in $GPOPath"
                Remove-Item -LiteralPath $GPOPath -Recurse
            }
        }
        $null = New-Item -ItemType Directory -Path $GPOPath -Force
        Write-Verbose "Save-GPORevFiles - Gathering GPO data"
        $Count = 0
        $GPOs = Get-GPORevAD -Forest $Forest -IncludeDomains $IncludeDomains -ExcludeDomains $ExcludeDomains -ExtendedForestInformation $ExtendedForestInformation
        foreach ($GPO in $GPOS) {
            $Count++
            Write-Verbose "Save-GPORevFiles - Processing GPO ($Count/$($GPOS.Count)) $($GPO.DomainName) | $($GPO.DisplayName)"
            $XMLContent = Get-GPOReport -ID $GPO.Guid -ReportType XML -Domain $GPO.DomainName
            $GPODOmainFolder = [io.path]::Combine($GPOPath, $GPO.DomainName)
            if (-not (Test-Path -Path $GPODOmainFolder)) {
                $null = New-Item -ItemType Directory -Path $GPODOmainFolder -Force
            }
            $Path = [io.path]::Combine($GPODOmainFolder, "$($GPO.Guid).xml")
            $XMLContent | Set-Content -LiteralPath $Path -Force -Encoding Unicode
        }
        $GPOListPath = [io.path]::Combine($GPOPath, "GPOList.xml")
        $GPOs | Export-Clixml -Depth 5 -Path $GPOListPath
    }
}