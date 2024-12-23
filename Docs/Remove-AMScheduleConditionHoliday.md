---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Remove-AMScheduleConditionHoliday.md
schema: 2.0.0
---

# Remove-AMScheduleConditionHoliday

## SYNOPSIS
Removes a holiday from an Automate schedule condition using the Holidays interval.

## SYNTAX

```
Remove-AMScheduleConditionHoliday -InputObject <Object> [-Holiday] <String[]>
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove-AMScheduleConditionHoliday removes a holiday from an Automate schedule condition using the Holidays interval.

## EXAMPLES

### EXAMPLE 1
```
# Add a holiday category to schedule "On Specified Dates"
Get-AMCondition "On Specified Dates" | Remove-AMScheduleConditionHoliday -Holiday "United States"
```

## PARAMETERS

### -InputObject
The schedule condition object to remove the holiday from.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Holiday
The holiday categories to remove from the schedule.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### The following Automate object types can be modified by this function:
### Condition
## OUTPUTS

### None
## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Remove-AMScheduleConditionHoliday.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Remove-AMScheduleConditionHoliday.md)

