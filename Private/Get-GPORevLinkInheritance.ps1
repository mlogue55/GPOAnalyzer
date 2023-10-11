function Get-GPORevLinkInheritance {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER ADObject
    Parameter description

    .PARAMETER Filter
    Parameter description

    .PARAMETER SearchBase
    Parameter description

    .PARAMETER SearchScope
    Parameter description

    .PARAMETER Linked
    Parameter description

    .PARAMETER Limited
    Parameter description

    .PARAMETER SkipDuplicates
    Parameter description

    .PARAMETER GPOCache
    Parameter description

    .PARAMETER Forest
    Target different Forest, by default current forest is used

    .PARAMETER ExcludeDomains
    Exclude domain from search, by default whole forest is scanned

    .PARAMETER IncludeDomains
    Include only specific domains, by default whole forest is scanned

    .PARAMETER ExtendedForestInformation
    Parameter description

    .PARAMETER AsHashTable
    Parameter description

    .PARAMETER Summary
    Parameter description

    .EXAMPLE
    $Output = Get-GPORevLinkInheritance -Summary
    $Output | Format-Table

    $Output[5]

    $Output[5].Links | Format-Table
    $Output[5].LinksObjects | Format-Table

    .NOTES
    This is based on Get-GPInheritance which isn't ideal and doesn't support sites. Get-GPORevLink is better. Leaving in case I need it later on for private use only.
    #>
    [cmdletbinding(DefaultParameterSetName = 'All')]
    param(
        [parameter(ParameterSetName = 'ADObject', ValueFromPipeline, ValueFromPipelineByPropertyName, Mandatory)][Microsoft.ActiveDirectory.Management.ADObject[]] $ADObject,
        # weirdly enough site doesn't really work this way unless you give it 'CN=Configuration,DC=ad,DC=evotec,DC=xyz' as SearchBase
        [parameter(ParameterSetName = 'Filter')][string] $Filter = "(objectClass -eq 'organizationalUnit' -or objectClass -eq 'domainDNS' -or objectClass -eq 'site')",
        [parameter(ParameterSetName = 'Filter')][string] $SearchBase,
        [parameter(ParameterSetName = 'Filter')][Microsoft.ActiveDirectory.Management.ADSearchScope] $SearchScope,

        [parameter(ParameterSetName = 'Linked', Mandatory)][validateset('Root', 'DomainControllers', 'OrganizationalUnit')][string[]] $Linked,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [switch] $Limited,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [switch] $SkipDuplicates,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [System.Collections.IDictionary] $GPOCache,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [alias('ForestName')][string] $Forest,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [string[]] $ExcludeDomains,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [alias('Domain', 'Domains')][string[]] $IncludeDomains,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [System.Collections.IDictionary] $ExtendedForestInformation,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [switch] $AsHashTable,

        [parameter(ParameterSetName = 'Filter')]
        [parameter(ParameterSetName = 'ADObject')]
        [parameter(ParameterSetName = 'Linked')]
        [switch] $Summary
    )
    Begin {
        $CacheReturnedGPOs = [ordered] @{}
        $ForestInformation = Get-WinADForestDetails -Extended -Forest $Forest -IncludeDomains $IncludeDomains -ExcludeDomains $ExcludeDomains -ExtendedForestInformation $ExtendedForestInformation
        if (-not $GPOCache -and -not $Limited) {
            $GPOCache = @{ }
            # While initially we used $ForestInformation.Domains but the thing is GPOs can be linked to other domains so we need to get them all so we can use cache of it later on even if we're processing just one domain
            # That's why we use $ForestInformation.Forest.Domains instead
            foreach ($Domain in $ForestInformation.Forest.Domains) {
                if ($ForestInformation['QueryServers'][$Domain]) {
                    $QueryServer = $ForestInformation['QueryServers'][$Domain]['HostName'][0]
                    Get-GPO -All -DomainName $Domain -Server $QueryServer | ForEach-Object {
                        $GPOCache["$Domain$($_.ID.Guid)"] = $_
                    }
                } else {
                    Write-Warning -Message "Get-GPORevLinkInheritance - Couldn't get query server for $Domain. Skipped."
                }
            }
        }
    }
    Process {
        if (-not $Filter -and -not $Linked) {
            # We choose ALL, except SITE which is not supported gor Get-GPInheritance
            # that's why it's better to use Get-GPORevLink
            #$Linked = 'Root', 'DomainControllers', 'Site', 'OrganizationalUnit'
        }
        $getGPOPrivInheritanceLoopSplat = @{
            Linked            = $Linked
            ForestInformation = $ForestInformation
            CacheReturnedGPOs = $CacheReturnedGPOs
            SearchScope       = $SearchScope
            SearchBase        = $SearchBase
            ADObject          = $ADObject
            Filter            = $Filter
        }
        Remove-EmptyValue -Hashtable $getGPOPrivInheritanceLoopSplat -Recursive

        # we need to use nested functions to support pipeline output and as hashtable and reporting that returns single value
        if ($AsHashTable -or $Summary) {
            $HashTable = [ordered] @{}
            $SummaryHashtable = [ordered] @{}
            $Links = Get-GPOPrivInheritanceLoop @getGPOPrivInheritanceLoopSplat
            foreach ($Link in $Links) {
                $Key = -join ($Link.DomainName, $Link.GUID)
                if (-not $HashTable[$Key]) {
                    $HashTable[$Key] = [System.Collections.Generic.List[PSCustomObject]]::new()
                }
                $HashTable[$Key].Add($Link)
            }
            foreach ($Key in $HashTable.Keys) {
                [Array] $Link = $HashTable[$Key]
                $EnabledLinks = $Link.Enabled.Where( { $_ -eq $true }, 'split')
                if ($EnabledLinks[0].Count -gt 0) {
                    $IsLinked = $true
                } else {
                    $IsLinked = $false
                }
                $SummaryLink = [PSCustomObject] @{
                    DisplayName        = $Link[0].DisplayName
                    DomainName         = $Link[0].DomainName
                    GUID               = $Link[0].GUID
                    Linked             = $IsLinked
                    LinksCount         = $Link.Count
                    LinksEnabledCount  = $EnabledLinks[0].Count
                    LinksDisabledCount = $EnabledLinks[1].Count
                    Links              = $Link.Target
                    LinksObjects       = $Link
                }
                $SummaryHashtable[$Key] = $SummaryLink
            }
            if ($AsHashTable -and $Summary) {
                $SummaryHashtable
            } elseif ($AsHashTable) {
                $HashTable
            } elseif ($Summary) {
                $SummaryHashtable.Values
            }
        } else {
            Get-GPOPrivInheritanceLoop @getGPOPrivInheritanceLoopSplat
        }
    }
    End {

    }
}