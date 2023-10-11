---
external help file: GPORev-help.xml
Module Name: GPORev
online version:
schema: 2.0.0
---

# Get-GPORevSysvolDFSR

## SYNOPSIS
Gets DFSR information from the SYSVOL DFSR

## SYNTAX

```
Get-GPORevSysvolDFSR [[-Forest] <String>] [[-ExcludeDomains] <String[]>]
 [[-ExcludeDomainControllers] <String[]>] [[-IncludeDomains] <String[]>]
 [[-IncludeDomainControllers] <String[]>] [-SkipRODC] [[-ExtendedForestInformation] <IDictionary>]
 [[-SearchDFSR] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets DFSR information from the SYSVOL DFSR

## EXAMPLES

### EXAMPLE 1
```
$DFSR = Get-GPORevSysvolDFSR
```

$DFSR | Format-Table *

## PARAMETERS

### -Forest
Target different Forest, by default current forest is used

```yaml
Type: String
Parameter Sets: (All)
Aliases: ForestName

Required: False
Position: 1
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
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeDomainControllers
Exclude specific domain controllers, by default there are no exclusions, as long as VerifyDomainControllers switch is enabled.
Otherwise this parameter is ignored.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeDomainControllers
Include only specific domain controllers, by default all domain controllers are included, as long as VerifyDomainControllers switch is enabled.
Otherwise this parameter is ignored.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: DomainControllers

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipRODC
Skip Read-Only Domain Controllers.
By default all domain controllers are included.

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

### -ExtendedForestInformation
Ability to provide Forest Information from another command to speed up processing

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchDFSR
Define DFSR Share.
By default it uses SYSVOL Share

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: SYSVOL Share
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
