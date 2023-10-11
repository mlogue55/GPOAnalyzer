---
external help file: GPORev-help.xml
Module Name: GPORev
online version:
schema: 2.0.0
---

# Save-GPORevFiles

## SYNOPSIS
Exports GPO XML data to files and saves it to a given path

## SYNTAX

```
Save-GPORevFiles [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>]
 [[-ExtendedForestInformation] <IDictionary>] [[-GPOPath] <String[]>] [-DeleteExisting] [<CommonParameters>]
```

## DESCRIPTION
Exports GPO XML data to files and saves it to a given path

## EXAMPLES

### EXAMPLE 1
```
Save-GPORevFiles -GPOPath 'C:\Support\GitHub\GPORev\Ignore\GPOExportEvotec' -DeleteExisting -Verbose
```

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

### -IncludeDomains
Include only specific domains, by default whole forest is scanned

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Domain, Domains

Required: False
Position: 3
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
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GPOPath
Path where to save XML files from GPOReport

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DeleteExisting
Delete existing files before saving new ones

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS
