---
external help file: GPORev-help.xml
Module Name: GPORev
online version:
schema: 2.0.0
---

# Get-GPORevPermissionConsistency

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### Type (Default)
```
Get-GPORevPermissionConsistency [-Type <String[]>] [-Forest <String>] [-ExcludeDomains <String[]>]
 [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-IncludeGPOObject]
 [-VerifyInheritance] [<CommonParameters>]
```

### GPOName
```
Get-GPORevPermissionConsistency [-GPOName <String>] [-Forest <String>] [-ExcludeDomains <String[]>]
 [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-IncludeGPOObject]
 [-VerifyInheritance] [<CommonParameters>]
```

### GPOGUID
```
Get-GPORevPermissionConsistency [-GPOGuid <String>] [-Forest <String>] [-ExcludeDomains <String[]>]
 [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-IncludeGPOObject]
 [-VerifyInheritance] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ExcludeDomains
{{ Fill ExcludeDomains Description }}

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

### -ExtendedForestInformation
{{ Fill ExtendedForestInformation Description }}

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

### -Forest
{{ Fill Forest Description }}

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

### -GPOGuid
{{ Fill GPOGuid Description }}

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

### -GPOName
{{ Fill GPOName Description }}

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

### -IncludeDomains
{{ Fill IncludeDomains Description }}

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

### -IncludeGPOObject
{{ Fill IncludeGPOObject Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
{{ Fill Type Description }}

```yaml
Type: String[]
Parameter Sets: Type
Aliases:
Accepted values: Consistent, Inconsistent, All

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VerifyInheritance
{{ Fill VerifyInheritance Description }}

```yaml
Type: SwitchParameter
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

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
