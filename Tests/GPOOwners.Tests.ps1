Describe 'GPO Owners Management - Simple' {
    BeforeAll {
        # just in case some tests failed before and added user stays
        Import-Module $PSScriptRoot\..\*.psd1 -Force

    }
    It 'Get-GPORevOwner - Should return proper data' {
        $GPOs = Get-GPORevOwner -IncludeSysvol
        $GPOs.Count | Should -BeGreaterThan 5
        $GPOs[0].PSObject.Properties.Name | Should -Be @(
            'DisplayName', 'DomainName',
            'GUID', 'Owner', 'OwnerSID',
            'OwnerType', 'SysvolOwner', 'SysvolSid',
            'SysvolType', 'SysvolPath', 'IsOwnerConsistent',
            'IsOwnerAdministrative', 'SysvolExists', 'DistinguishedName'
        )
    }
    It 'Set-GPORevOwner - Should set proper data' {
        Set-GPORevOwner -GPOName 'TEST | GPORev Permissions Testing' -Verbose -Principal 'przemyslaw.klys' -WhatIf:$false -Force
    }
    It 'Get-GPORevOwner - Should return proper data for one GPO' {
        $GPOs = Get-GPORevOwner -IncludeSysvol -GPOName 'TEST | GPORev Permissions Testing'
        $GPOs.SysvolOwner | Should -Be 'EVOTEC\przemyslaw.klys'
        $GPOs.SysvolType | Should -Be 'NotAdministrative'
        $GPOs.Owner | Should -Be 'EVOTEC\przemyslaw.klys'
        $GPOs.OwnerType | Should -Be 'NotAdministrative'
        $GPOS.IsOwnerConsistent | Should -Be $true
        $GPOS.IsOwnerAdministrative | Should -Be $false
    }
    It 'Set-GPORevOwner - Should set proper data' {
        Set-GPORevOwner -GPOName 'TEST | GPORev Permissions Testing' -Verbose
    }
    It 'Get-GPORevOwner - Should return proper data for one GPO (Domain Admins)' {
        $GPOs = Get-GPORevOwner -IncludeSysvol -GPOName 'TEST | GPORev Permissions Testing'
        $GPOs.SysvolOwner | Should -Be 'EVOTEC\Domain Admins'
        $GPOs.SysvolType | Should -Be 'Administrative'
        $GPOs.Owner | Should -Be 'EVOTEC\Domain Admins'
        $GPOs.OwnerType | Should -Be 'Administrative'
        $GPOS.IsOwnerConsistent | Should -Be $true
        $GPOS.IsOwnerAdministrative | Should -Be $true
    }
}