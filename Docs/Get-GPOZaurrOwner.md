---
external help file: GPORev-help.xml
Module Name: GPORev
online version:
schema: 2.0.0
---

# Get-GPORevOwner

## SYNOPSIS
Gets owners of GPOs from Active Directory and SYSVOL

## SYNTAX

### Default (Default)
```
Get-GPORevOwner [-IncludeSysvol] [-SkipBroken] [-Forest <String>] [-ExcludeDomains <String[]>]
 [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>]
 [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <String[]>] [<CommonParameters>]
```

### GPOName
```
Get-GPORevOwner [-GPOName <String>] [-IncludeSysvol] [-SkipBroken] [-Forest <String>]
 [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>]
 [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <String[]>] [<CommonParameters>]
```

### GPOGUID
```
Get-GPORevOwner [-GPOGuid <String>] [-IncludeSysvol] [-SkipBroken] [-Forest <String>]
 [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>]
 [-ADAdministrativeGroups <IDictionary>] [-ApprovedOwner <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Gets owners of GPOs from Active Directory and SYSVOL

## EXAMPLES

### EXAMPLE 1
```
Get-GPORevOwner -Verbose -IncludeSysvol
```

### EXAMPLE 2
```
Get-GPORevOwner -Verbose -IncludeSysvol -SkipBroken
```

## PARAMETERS

### -GPOName
Name of GPO.
By default all GPOs are returned

```yaml
Type: String
Parameter Sets: GPOName
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GPOGuid
GUID of GPO.
By default all GPOs are returned

```yaml
Type: String
Parameter Sets: GPOGUID
Aliases: GUID, GPOID

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSysvol
Includes Owner from SYSVOL as well

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipBroken
Doesn't display GPOs that have no SYSVOL content (orphaned GPOs)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Forest
Target different Forest, by default current forest is used

```yaml
Type: String
Parameter Sets: (All)
Aliases: ForestName

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeDomains
Exclude domain from search, by default whole forest is scanned

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeDomains
Include only specific domains, by default whole forest is scanned

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Domain, Domains

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExtendedForestInformation
Ability to provide Forest Information from another command to speed up processing

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ADAdministrativeGroups
Ability to provide AD Administrative Groups from another command to speed up processing

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApprovedOwner
Ability to provide different owner (non administrative that still is approved for use)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Exclusion, Exclusions

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS
