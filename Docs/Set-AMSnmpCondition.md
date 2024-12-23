---
external help file: AutomatePS-help.xml
Module Name: AutomatePS
online version: https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Set-AMSnmpCondition.md
schema: 2.0.0
---

# Set-AMSnmpCondition

## SYNOPSIS
Sets properties of an Automate SNMP condition.

## SYNTAX

```
Set-AMSnmpCondition [-InputObject] <Object> [[-IPStart] <String>] [[-IPEnd] <String>] [[-Community] <String>]
 [[-Enterprise] <String>] [[-GenericType] <AMSnmpGenericType>] [-OIDStringNotation] [-TimetickStringNotation]
 [-AcceptUnathenticatedTrap] [-Wait] [[-Timeout] <Int32>] [[-TimeoutUnit] <AMTimeMeasure>]
 [[-TriggerAfter] <Int32>] [[-Notes] <String>] [[-CompletionState] <AMCompletionState>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Set-AMSnmpCondition modifies an existing SNMP condition.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -InputObject
The condition to modify.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IPStart
The starting IP address to filter SNMP requests from.
Use "Any" for any IP address (default).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPEnd
The ending IP address to filter SNMP requests from.
Use "Any" for any IP address (default).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Community
Specifies whether the condition will start the task when a trap is received from a device from any community (default) or only devices within a specific community.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Enterprise
Specifies whether the condition will start the task when a trap is received from any Enterprise OID device (default) or only devices within a specific Enterprise OID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GenericType
Specifies that the condition will filter out traps that are not intended for a specific generic type and act on traps received only from a specific generic type.

```yaml
Type: AMSnmpGenericType
Parameter Sets: (All)
Aliases:
Accepted values: Any, ColdStart, WarmStart, LinkDown, LinkUp, AuthenticationFailure, EGPNeighborLoss, EnterpriseSpecific

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OIDStringNotation
If specified, IODs will be entered as string notations.

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

### -TimetickStringNotation
If specified, timetick values will be entered as string notations.

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

### -AcceptUnathenticatedTrap
If specified, version 3 traps will be accepted.

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

### -Wait
Wait for the condition, or evaluate immediately.

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

### -Timeout
If wait is specified, the amount of time before the condition times out.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TimeoutUnit
The unit for Timeout (Seconds by default).

```yaml
Type: AMTimeMeasure
Parameter Sets: (All)
Aliases:
Accepted values: Seconds, Minutes, Hours, Days, Milliseconds

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TriggerAfter
The number of times the condition should occur before the trigger fires.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Notes
The new notes to set on the object.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CompletionState
The completion state (staging level) to set on the object.

```yaml
Type: AMCompletionState
Parameter Sets: (All)
Aliases:
Accepted values: InDevelopment, Testing, Production, Archive

Required: False
Position: 11
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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Set-AMSnmpCondition.md](https://github.com/AutomatePS/AutomatePS/blob/master/Docs/Set-AMSnmpCondition.md)

