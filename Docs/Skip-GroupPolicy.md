---
external help file: GPORev-help.xml
Module Name: GPORev
online version:
schema: 2.0.0
---

# Skip-GroupPolicy

## SYNOPSIS
Used within ScriptBlocks only.
Allows to exclude Group Policy from being affected by fixes

## SYNTAX

### Name (Default)
```
Skip-GroupPolicy [-Name <String>] [-DomaiName <String>] [<CommonParameters>]
```

### Guid
```
Skip-GroupPolicy [-GUID <String>] [-DomaiName <String>] [<CommonParameters>]
```

## DESCRIPTION
Used within ScriptBlocks only.
Allows to exclude Group Policy from being affected by fixes.
Only some commands support it.
The goal is to support all cmdlets.

## EXAMPLES

### EXAMPLE 1
```
Optimize-GPORev -All -WhatIf -Verbose -LimitProcessing 2 {
```

Skip-GroupPolicy -Name 'TEST | Drive Mapping 1'
    Skip-GroupPolicy -Name 'TEST | Drive Mapping 2'
}

### EXAMPLE 2
```
Remove-GPORev -Type Empty, Unlinked -BackupPath "$Env:UserProfile\Desktop\GPO" -BackupDated -LimitProcessing 2 -Verbose -WhatIf {
```

Skip-GroupPolicy -Name 'TEST | Drive Mapping 1'
    Skip-GroupPolicy -Name 'TEST | Drive Mapping 2' -DomaiName 'ad.evotec.pl'
}

## PARAMETERS

### -Name
Define Group Policy Name to skip

```yaml
Type: String
Parameter Sets: Name
Aliases: GpoName, DisplayName

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GUID
{{ Fill GUID Description }}

```yaml
Type: String
Parameter Sets: Guid
Aliases: ID

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DomaiName
Define DomainName where Group Policy is located.
Otherwise each domain will be checked and skipped if found with same name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

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
